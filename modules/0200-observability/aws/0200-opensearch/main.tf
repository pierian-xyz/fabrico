#---------------------------------------------------------------
# Provision OpenSearch and Allow Access
#---------------------------------------------------------------

resource "aws_security_group" "es" {
  name   = "${var.vpc_id}-opensearch-${local.stack_name}"
  vpc_id = var.vpc_id

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [var.vpc_cidr_block]
  }
}

resource "aws_iam_service_linked_role" "es" {
  aws_service_name = "es.amazonaws.com"
}


resource "aws_opensearch_domain" "opensearch" {
  domain_name         = local.stack_name
  enginengine_version = "OpenSearch_2.3"

  cluster_config {
    instance_type          = "m6g.large.search"
    zone_awareness_enabled = true

    zone_awareness_config {
      availability_zone_count = 3
    }
  }

  node_to_node_encryption {
    enabled = true
  }

  domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  encrypt_at_rest {
    enabled = true
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }

  vpc_options {
    subnet_ids         = var.vpc_private_subnets
    security_group_ids = [aws_security_group.opensearch_access.id]
  }

  auto_tune_options {
    desired_state = "ENABLED"
  }

  advanced_options = {
    "override_main_response_version" = "true"
  }

  depends_on = [
    aws_iam_service_linked_role.opensearch
  ]

  tags = local.tags
}

resource "aws_iam_service_linked_role" "opensearch" {
  count            = var.create_iam_service_linked_role == true ? 1 : 0
  aws_service_name = "es.amazonaws.com"
}

resource "aws_elasticsearch_domain_policy" "opensearch_access_policy" {
  domain_name     = aws_elasticsearch_domain.opensearch.domain_name
  access_policies = data.aws_iam_policy_document.opensearch_access_policy.json
}

resource "aws_security_group" "opensearch_access" {
  vpc_id      = var.vpc_id
  description = "OpenSearch access"

  ingress {
    description = "host access to OpenSearch"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    self        = true
  }

  ingress {
    description = "allow instances in the VPC (like EKS) to communicate with OpenSearch"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    cidr_blocks = [var.vpc_cidr_block]
  }

  egress {
    description = "Allow all outbound access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-vpc-no-public-egress-sgr
  }

  tags = local.tags
}
