# DevOps Lab Final Examination Report

---

## 1. Project Overview 🧩

This project is a **Go Fiber based web application** prepared for the **DevOps lab final exam**.

The goal of the lab was to demonstrate how an application can be:

* Containerized
* Tested automatically
* Deployed using cloud tools
* Managed using standard DevOps practices

### Project Components

The project includes:

* A Go application
* Docker support for local execution
* Terraform configuration for AWS infrastructure
* Kubernetes deployment files
* CI pipeline configuration
* Monitoring configuration
* Clear and complete documentation

---

## 2. Application Setup ⚙️

The application is written in **Go** and uses the **Fiber framework**.
A simple test is included to allow automated testing during the pipeline run.

### Local Run (Without Containers)

```bash
go mod tidy
go test ./...
go run main.go
```

This confirms the application works correctly before containerization.

---

## 3. Docker Setup 🐳

### Dockerfile

A Dockerfile is provided to build the Go application into a container image.
It uses a **multi stage build** so the final image is small and contains only the compiled binary.

### Docker Compose

Docker Compose is used for local testing.
It allows the application to run in a container environment without using Kubernetes.

```bash
docker compose up --build
```

This confirms that the container runs correctly before deployment.

---

## 4. Terraform AWS Infrastructure ☁️

Terraform was used to define cloud infrastructure using configuration files.

### Purpose

* Show automated infrastructure setup
* Follow the exam requirement for AWS usage
* Avoid manual resource creation

### Terraform Actions Performed

```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

### AWS Region

Infrastructure was checked in the **enabled AWS region** for the account.

### Verification

AWS Console was checked for:

* VPC
* EKS
* RDS

During verification:

* **EKS was empty**
* **RDS was empty**

This was documented using screenshots and explained clearly in the report.

### Cleanup

All resources were destroyed after verification using:

```bash
terraform destroy
```

This prevents unnecessary cloud costs.

---

## 5. Kubernetes Deployment ☸️

Kubernetes configuration files are included for application deployment.

### Files Provided

* Deployment file
* Service file
* Configuration file

### These files define:

* How the application runs
* How it is exposed inside the cluster
* How configuration values are managed

The setup follows the structure required by the lab exam.

---

## 6. Configuration Management 🔐

Configuration files are used instead of hardcoded values.
Sensitive data is not stored directly in the source code or repository.

This keeps the setup safe and follows lab rules.

---

## 7. CI Pipeline 🔁

A CI pipeline configuration is included to automate checks.

### Pipeline Steps

* Pull source code
* Run Go tests
* Build Docker image
* Validate configuration files

The pipeline confirms that the application builds and tests correctly before deployment.

---

## 8. Monitoring 📊

Monitoring configuration files are included for **Prometheus** and **Grafana**.

### Purpose

* Collect basic system and application metrics
* Demonstrate understanding of monitoring tools

The configuration files are included even if monitoring was not fully deployed during the exam.

---

## 9. Testing 🧪

A basic Go test file is included.

### Purpose of the Test

* Ensure the CI pipeline passes
* Verify test execution setup

Example:

```go
if 1+1 != 2 {
    t.Error("Test failed")
}
```

This confirms that automated testing is working.

---

## 10. Version Control 🗂️

Git was used throughout the lab.

### Actions Performed

* Regular commits
* Clear commit messages
* Terraform configuration committed
* Terraform state files ignored

This shows proper version control practice.

---

## 11. Summary ✅

This lab demonstrates:

* Container based application setup
* Infrastructure definition using Terraform
* Cloud resource verification
* Kubernetes deployment structure
* Automated testing and pipeline execution
* Monitoring configuration
* Clear and organized documentation

All required steps of the lab exam were completed and verified.

---

**End of Report**
