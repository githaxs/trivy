#!/usr/bin/env bash
set -e

task() {
    echo "Running Trivy"

    trivy --quiet config --exit-code 1 .
}
