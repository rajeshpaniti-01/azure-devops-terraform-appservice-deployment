Express App Deployment Documentation

1.	Project Overview
This project demonstrates:
•	Application deployment using Azure DevOps CICD pipelines.
•	Infrastructure provisioning using Terraform pipelines.
•	Hosting Node.js application on Azure app service.
•	Automated testing using Jest and Supertest.

		   GitHub
                      │
                      ▼
		Azure DevOps
          	      │
       ┌──────────────┴──────────────┐
       │			     |
       ▼ 			     ▼
Application CI/CD 		Terraform Pipeline
│ 				     │
▼ 				     ▼
Azure App Service 		Azure Infrastructure
│
▼
Express.js Application

2.	Application overview
•	This is a simple web application that shows application health status and some information about this DevOps project.
•	The application consists of Express.js backend and a simple HTML, CSS and JS frontend. 
•	Express.js serves application routes, front end. It also handles HTTP requests.
•	Jest and Supertest are used to perform automated testing of Express application endpoints. During CI execution, HTTP requests are sent to the application, and responses are validated to ensure expected functionality before deployment.


Git Repository
│
├── Nodejs-App
│ ├── src
│ ├── public
│ ├── tests
│ └── Azure DevOps Pipelines
│
└── terraform
├── main.tf
├── variables.tf
└── provider.tf

3.	Infrastructure Provisioning
Initially Azure resources were created manually.
Then Terraform import was used to bring existing resources under Terraform management.
Benefits: 
•	Drift detection
•	Repeatable deployments
•	Easier environment recreation

Terraform workflow steps are:
terraform init
terraform validate
terraform plan
terraform apply

Infrastructure Pipeline
The purpose of this pipeline is to automate infrastructure changes.
Infrastructure lifecycle

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

Validate stage:
terraform init
terraform validate
Checks:
•	Syntax
•	Provider configuration
•	Resource definitions
Plan Stage:
terraform plan
Its purpose is to show infrastructure changes before deployment.
Manual Approval Stage
Its purpose is to act as a security check point before deployment. The pipeline will only proceed to apply stage after approval.
Apply Stage
terraform apply
Its purpose is to Provision or update Azure resources.

4.	CI Pipeline
Purpose of the CI Pipeline is to:
•	Validate application code
•	Run automated tests
•	Package deployable artifact
Pipeline flow:
Developer Pushes Code
│
▼
Install Node.js
│
▼
npm ci		- Install dependencies
│
▼
npm test	- Run tests
│
▼
Create Artifact	
│
▼
Publish Artifact
Important Observation: This CI pipeline does not contain build stage because the   application is plain JavaScript Express.js. Application starts directly using:
 node src/app.js

5.	CD Pipeline
Purpose of the CD pipeline is to deploy application artifacts to Azure App Service.
The CD pipeline also involves an approval process without which the pipeline can’t execute.
Pipeline flow:
Download Artifact
│
▼
Azure Web App Deploy
│
▼
Azure App Service

6.	End to End Flow Summary
1. Developer commits code
│
▼
2. CI Pipeline runs
├── npm ci
├── npm test
└── publish artifact
│
▼
3. Approval
│
▼
4. CD Pipeline deploys artifact
│
▼
5. Azure App Service Hosts Express application
│
▼
6. Users access application

7.	Technology stack 

Application
• Node.js
• Express.js
• HTML
• CSS
• JavaScript

Testing
• Jest
• Supertest

Infrastructure
• Terraform

Cloud
• Azure App Service
• Azure Resource Group
• Azure App Service Plan

DevOps
• Azure DevOps
• Azure Repos
• Azure Pipelines


