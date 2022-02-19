FROM public.ecr.aws/lambda/python:3.8 as deps

ARG GITHUB_TOKEN

RUN yum install -y git tar

RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.23.0
RUN trivy --help

COPY requirements.txt .
RUN python3.8 -m pip install -r requirements.txt

COPY . .

# Command can be overwritten by providing a different command in the template directly.
CMD ["handler.lambda_handler"]
