#!/usr/bin/env bash
set -e

run_task() {

    if [ "$EVENT" == "push" ]; then
        if [ -z "$AWS_REGION" ] || [ -z "$AWS_ACCOUNT_ID" ]; then
            echo "AWS_REGION or AWS_ACCOUNT_ID are not set. Cannot report results to AWS Security Hub."
        else
            echo "Running Trivy"
            trivy config --format template --template "@/var/task/src/report.tpl" -o report.asff .

            # This is a hacky workaround for a known issue with Trivy.
            # https://github.com/aquasecurity/trivy/issues/2023#issuecomment-1157747952
            jq '.Findings' > report.json
            aws securityhub batch-import-findings --findings file://report.json
        fi

    else
        echo '```'
        trivy --cache-dir /tmp/trivy/ --quiet config --exit-code 1 .
        status=$?
        echo '```'

        exit $status
    fi
}
