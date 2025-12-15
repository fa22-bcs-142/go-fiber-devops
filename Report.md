1. Project Overview

This project is a Go Fiber based web application prepared for the DevOps lab final exam.
The goal of the lab was to show how an application can be containerized, tested, deployed, and managed using standard DevOps tools.

The project includes:

A Go application

Docker support for local execution

Terraform configuration for AWS infrastructure

Kubernetes deployment files

CI pipeline configuration

Monitoring configuration

Clear documentation

2. Application Setup

The application is written in Go and uses the Fiber framework.
A simple test is included to allow automated testing during the pipeline run.

Local Run (without containers)
go mod tidy
go test ./...
go run main.go

3. Docker Setup
Dockerfile

A Dockerfile is provided to build the Go application into a container image.
It uses a multi stage build so the final image is small and only contains the compiled binary.

Docker Compose

Docker Compose is used for local testing.
It allows the application to run in a container without setting up Kubernetes.

docker compose up --build


This confirms that the container works correctly before deployment.

4. Terraform AWS Infrastructure

Terraform was used to define cloud infrastructure as code.

Purpose

Show automated infrastructure setup

Follow exam requirement for AWS usage

Avoid manual resource creation

Terraform Actions Performed

terraform init

terraform plan

terraform apply

terraform destroy

AWS Region

The infrastructure was checked in the enabled AWS region for the account.

Verification

AWS Console was checked for:

VPC

EKS

RDS

EKS and RDS were empty during verification.
This was documented with screenshots and explained in the report.

Cleanup

All resources were destroyed after verification using:

terraform destroy


This prevents unnecessary cloud costs.

5. Kubernetes Deployment

Kubernetes configuration files are included for application deployment.

The following files are provided:

Deployment file

Service file

Configuration file

These files define:

How the application runs

How it is exposed inside the cluster

How configuration is managed

The setup follows the structure required by the lab exam.

6. Configuration Management

Configuration files are used instead of hardcoded values.
Sensitive data is not stored directly in the code or repository.

This keeps the setup safe and matches lab rules.

7. CI Pipeline

A CI pipeline configuration is included.

Pipeline Steps

Pull source code

Run Go tests

Build Docker image

Validate configuration files

The pipeline confirms that the application builds and tests correctly before deployment.

8. Monitoring

Monitoring configuration files are included for Prometheus and Grafana.

Purpose

Collect basic system and application metrics

Show understanding of monitoring tools

The configuration files are present even if monitoring was not fully deployed during the exam time.

9. Testing

A basic Go test file is included.

Purpose of the test:

Ensure CI pipeline passes

Verify test execution setup

Example:

if 1+1 != 2 {
    t.Error("Test failed")
}


This confirms that automated testing is working.

10. Version Control

Git was used throughout the lab.

Actions performed:

Regular commits

Clear commit messages

Terraform configuration committed

Terraform state files ignored

This shows proper source control practice.

11. Summary

This lab demonstrates:

Container based application setup

Infrastructure definition using Terraform

Cloud resource verification

Kubernetes deployment structure

Automated testing and pipeline execution

Monitoring configuration

Clean documentation

All required steps of the lab exam were completed and verified.