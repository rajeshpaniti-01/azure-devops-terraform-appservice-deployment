# Azure DevOps Terraform App Service Deployment

This project demonstrates end-to-end application delivery on Azure using **Terraform**, **Azure DevOps CI/CD pipelines**, and **Azure App Service**. The solution provisions infrastructure using Infrastructure as Code (IaC) and automates application deployment through CI/CD workflows.

## Project Overview

This project showcases:

- Automated application deployment using Azure DevOps CI/CD pipelines
- Infrastructure provisioning and management using Terraform
- Hosting a Node.js Express application on Azure App Service
- Automated testing using Jest and Supertest
- Infrastructure as Code (IaC) practices for repeatable deployments

---

## Live Demo

The application is deployed and accessible through Azure App Service:

🔗 https://express-app-cicd-app-service-dph2bwdnaua5cra2.centralindia-01.azurewebsites.net

This deployment is fully automated using Azure DevOps CI/CD pipelines.


### High-Level Architecture

```text
                    Developer
                        │
                        ▼
                  Git Repository
                        │
                        ▼
                  Azure DevOps
                        │
         ┌──────────────┴──────────────┐
         │                             │
         ▼                             ▼
   Application CI/CD          Terraform Pipeline
         │                             │
         ▼                             ▼
 Azure App Service          Azure Infrastructure
         │
         ▼
 Express.js Application
```

---

# Application Overview

The application is a simple web application that displays:

- Application health status
- Basic project information
- Deployment verification details

## Application Components

### Backend

- Node.js
- Express.js

Responsibilities:

- Serve application routes
- Handle HTTP requests
- Serve frontend assets

### Frontend

- HTML
- CSS
- JavaScript

Located in:

```text
public/
├── index.html
├── style.css
└── app.js
```

## Automated Testing

This project uses:

- Jest
- Supertest

Testing is performed during CI execution to validate application functionality before deployment.

### Test Workflow

```text
Jest
 │
 ▼
Supertest
 │
 ▼
Express Application
 │
 ▼
Validate Responses
```

Tests are located in:

```text
tests/
└── app.test.js
```

---

# Repository Structure

```text
Express-App-Deployment/
│
├── Nodejs-App/
│   ├── src/
│   ├── public/
│   ├── tests/
│   ├── package.json
│   ├── azure-pipelines.yml
│   └── azure-pipelines-cd.yml
│
└── terraform/
    ├── main.tf
    ├── variables.tf
    └── provider.tf
```

---

# Infrastructure Provisioning

Infrastructure is managed using Terraform.

## Initial Setup

Azure resources were initially provisioned manually through the Azure Portal.

Terraform import was then used to bring existing resources under Terraform state management.

### Benefits

- Infrastructure version control
- Drift detection
- Repeatable deployments
- Easier environment recreation
- Reduced manual configuration effort

## Terraform Workflow

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

---

# Infrastructure CI/CD Pipeline

The purpose of this pipeline is to automate infrastructure changes in Azure.

## Infrastructure Lifecycle

```text
Terraform Code
      │
      ▼
Terraform Pipeline
      │
      ├── Validate
      ├── Plan
      ├── Approval
      └── Apply
      │
      ▼
Azure Resources Updated
```

### Validate Stage

Commands:

```bash
terraform init
terraform validate
```

Checks:

- Terraform syntax
- Provider configuration
- Resource definitions

### Plan Stage

Command:

```bash
terraform plan
```

Purpose:

- Preview infrastructure changes before deployment
- Detect unintended modifications

### Approval Stage

Purpose:

- Manual security checkpoint
- Prevent unintended infrastructure changes
- Require human validation before deployment

### Apply Stage

Command:

```bash
terraform apply
```

Purpose:

- Provision new resources
- Update existing infrastructure

---

# Application CI Pipeline

The CI pipeline ensures that application code is validated and tested before deployment.

## CI Pipeline Objectives

- Validate source code
- Install dependencies
- Execute automated tests
- Create deployment artifacts
- Publish build artifacts

## Pipeline Workflow

```text
Developer Pushes Code
        │
        ▼
Install Node.js
        │
        ▼
npm ci
(Install Dependencies)
        │
        ▼
npm test
(Run Tests)
        │
        ▼
Create Artifact
        │
        ▼
Publish Artifact
```

### Important Note

This application does **not require a build stage**.

The application is implemented using plain JavaScript and Express.js and runs directly using:

```bash
node src/app.js
```

Unlike TypeScript or frontend frameworks such as React or Angular, no compilation or bundling step is required.

---

# Application CD Pipeline

The CD pipeline deploys application artifacts to Azure App Service.

An approval gate is implemented before deployment to provide an additional control mechanism.

## Pipeline Workflow

```text
Download Artifact
        │
        ▼
Approval
        │
        ▼
Azure Web App Deploy
        │
        ▼
Azure App Service
```

---

# End-to-End Workflow

```text
Developer Commit
        │
        ▼
CI Pipeline
├── npm ci
├── npm test
└── Publish Artifact
        │
        ▼
Approval
        │
        ▼
CD Pipeline
        │
        ▼
Azure App Service
        │
        ▼
Users Access Application
```

---

# Technology Stack

## Application

- Node.js
- Express.js
- HTML
- CSS
- JavaScript

## Testing

- Jest
- Supertest

## Infrastructure as Code

- Terraform

## Cloud Platform

- Azure App Service
- Azure App Service Plan
- Azure Resource Group

## DevOps

- Azure DevOps
- Azure Repos
- Azure Pipelines
- CI/CD

---

# Key Learnings

This project provided hands-on experience with:

- Infrastructure as Code (IaC) using Terraform
- Terraform import and state management
- Azure App Service deployments
- Azure DevOps CI/CD pipelines
- Automated testing with Jest and Supertest
- Artifact creation and deployment
- Approval gates in deployment workflows
- End-to-end application delivery on Azure

---

# Challenges Faced

- Importing manually created Azure resources into Terraform state.
- Understanding Terraform state management and resource tracking.
- Configuring Azure DevOps Service Connections for Terraform authentication.
- Designing separate CI and CD pipelines for application deployments.
- Implementing manual approval gates for infrastructure and application changes.
- Troubleshooting Azure Bastion connectivity issues and NSG rules.
- Managing version control across application and infrastructure repositories.

---

# Future Improvements

Potential enhancements include:

- Remote Terraform backend using Azure Storage Account
- Multi-environment deployments (Dev/Test/Prod)
- Terraform modules for reusable infrastructure components
- Deployment slots for blue-green deployment
- Azure Application Insights integration
- Security scanning within CI pipelines
- Automated rollback strategies
- Containerization with Docker
- Deployment to Azure Kubernetes Service (AKS)

---

# Author

**Rajesh Paniti**

DevOps and Cloud Engineering enthusiast focused on Azure, Terraform, Linux, CI/CD, and Infrastructure Automation.
