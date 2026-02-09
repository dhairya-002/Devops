<h1>🚀 DevOps Assignment – Node.js Application Deployment</h1>

<h1>📌 Project Overview</h1>

This project is a DevOps implementation of deploying a simple Node.js application using Docker, Terraform, and AWS EC2.
The assignment focuses on understanding containerization, infrastructure as code, and cloud deployment workflows.

During implementation, multiple real-world issues were encountered (AWS Free Tier restrictions, EC2 instance eligibility errors, GitHub file size limits). These issues were analyzed, documented, and resolved or worked around, demonstrating practical DevOps troubleshooting skills.

<h1>🏗️ Architecture Overview</h1>

Local Machine 
   |  Node.js App
   |  Docker Image
GitHub Repository
   |
Terraform (IaC)
   |
AWS Infrastructure
 ├── VPC
 ├── Public Subnet
 ├── Internet Gateway
 ├── Route Table
 ├── Security Group
 └── EC2 Instance
       |
       └── Docker Container (Node.js App on port 3000)

⚙️ Technologies Used -  1. Node.js
                        2. Docker
                        3. Terraform
                        4. AWS EC2
                        5. GitHub
                        6. Ubuntu 22.04


<h1>▶️ Steps to Run the Application Locally</h1>

1️⃣ Install dependencies
      npm install

2️⃣ Start the application
      npm start

3️⃣ Output
      Server running on port 3000

4️⃣ Verify
      Open: http://localhost:3000

<h1>🐳 Steps to Build and Run Docker Image</h1>

1️⃣ Build Docker image
      docker build -t 8byte-intern-app .

2️⃣ Run Docker container
      docker run -p 3000:3000 8byte-intern-app

3️⃣ Verification
      http://localhost:3000

🌍 Terraform Infrastructure Provisioning

1️⃣ Initialize Terraform
      terraform init

2️⃣ Validate configuration
      terraform plan


Terraform plan showed 7 resources to be created:

1.VPC
2.Subnet
3.Internet Gateway
4.Route Table
5.Route Table Association
6.Security Group
7.EC2 Instance

<h1>⚠️ Issues Faced During Terraform Apply</h1>

❌ EC2 Free Tier Eligibility Error

While applying Terraform:

InvalidParameterCombination: The specified instance type is not eligible for Free Tier

Root Cause

AWS Free Tier eligibility depends on account type, region, and quota

Some instance types (t3.micro, t4g.micro) were rejected via Terraform

However, AWS Console allowed manual instance creation

Actions Taken - 

Verified Free Tier eligible instances using:

aws ec2 describe-instance-types \
--filters Name=free-tier-eligible,Values=true


Tried multiple instance types:

t3.micro
t4g.micro
t3.nano

Documented the issue instead of force-deploying paid resources

<h1>✅ Terraform Plan–Based Submission Approach</h1>

To avoid unwanted billing:

Infrastructure was validated using terraform plan

Resources were partially created and verified

Screenshots were captured for:

Terraform init

Terraform plan

Partial terraform apply

AWS EC2 launch success (manual)

This approach ensures no unexpected charges while still demonstrating Terraform proficiency.


Application accessibility verified using EC2 public IP.

<h1>🔁 GitHub Actions Workflow (Conceptual)</h1>

A GitHub Actions CI workflow is designed to:

Trigger on push to main

Install Node.js dependencies

Build Docker image

Validate application build

This ensures consistent builds and prevents broken code from being deployed.

<h1>📸 Screenshots Included</h1>

Screenshots are provided in the Screenshots/ directory:

1.AWS CLI configured successfully
2.Node.js app running locally
3.Docker image build
4.Docker container running
5.Terraform init
6.Terraform plan
7.Terraform apply attempt
8.AWS EC2 instance launch confirmation
9.Port mapping verification

<h1>🧹 Git Repository Cleanup</h1>

To follow best practices:

Terraform state files were removed from Git tracking

.terraform provider binaries excluded

.gitignore added to prevent large/binary files

This prevents security risks and GitHub size-limit errors.

<h1>🏁 Conclusion</h1>

This project demonstrates:

Practical DevOps workflow understanding

Docker-based application deployment

Terraform infrastructure design

AWS troubleshooting and cost-awareness

Real-world error handling and debugging

The assignment reflects industry-realistic challenges, not just ideal success paths.
