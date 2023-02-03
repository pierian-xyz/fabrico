# Observability Modules

This directory contains modules for observability to be created outside of kubernetes cluster directly utilizing AWS maanged services. The cloud provider independent specification for observability can be found at [../SPEC](../SPEC/README.md).


The modules in this folder are:

- [0100-prometheus](0100-prometheus/README.md) - This module creates a AWS Managed Prometheus workspace.
- [0200-opensearch](0200-opensearch/README.md) - This module creates a AWS Managed OpenSearch domain.
- [0300-grafana](0200-grafana/README.md) - This module creates a AWS Managed Grafana workspace.
