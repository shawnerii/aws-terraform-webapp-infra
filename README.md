# 🚀 AWS Terraform Web Application Deployment

## Overview

This project showcases a complete Infrastructure as Code (IaC) deployment using **Terraform** to provision a secure, scalable, and highly available **Node.js web application** on **AWS**. It includes networking, compute, load balancing, database provisioning, and performance testing, all automated through Terraform.

---

## 🛠 Technologies Used

- Terraform
- AWS EC2
- AWS Application Load Balancer (ALB)
- AWS RDS (MySQL)
- AWS Auto Scaling Group
- AWS Secrets Manager
- AWS Cloud9
- Node.js on Ubuntu

---

## 📐 Architecture Overview

Internet
│
▼
[ Application Load Balancer ]
│
▼
[ Auto Scaling Group of EC2 Instances ]
│
▼
[ RDS MySQL Database (Private Subnet) ]

- VPC with public/private subnets across two AZs
- ALB for HTTP traffic routing
- EC2 instances with launch template and user_data setup
- RDS MySQL database in private subnets
- Auto Scaling policy based on CPU utilization
- Secrets Manager for secure credential handling
- Cloud9 environment for CLI-based management and testing

---

## 🔐 Security Groups Summary

| Component | Rule | Purpose |
|----------|------|---------|
| **ALB** | Allow TCP 80 from 0.0.0.0/0 | Public HTTP access to app |
| **Web EC2** | Allow TCP 80 from ALB | Accept traffic only through ALB |
|           | Allow TCP 22 from 0.0.0.0/0 | SSH for development/testing (should be restricted in production) |
|           | Allow TCP 80 from 0.0.0.0/0 | Temporary for direct testing, removable |
| **RDS** | Allow TCP 3306 from EC2 SG | App-to-database communication |
|         | Allow TCP 3306 from Cloud9 SG | Manual testing via MySQL CLI |

---

## 📊 Performance Test

Command used:
```bash
loadtest --rps 1000 -c 500 -k http://<alb-dns>

Results:
	•	✅ 10,000 requests completed
	•	⚡ Mean latency: 1.7 ms
	•	🕐 Max request time: 25 ms
	•	❌ 0 errors

💰 Cost Estimation

Estimated monthly cost based on AWS Pricing Calculator:
	•	EC2 (t3.micro, 2 instances): ~$16.46
	•	RDS MySQL (db.t3.micro, 20GB): ~$54.86
	•	ALB: ~$16.66
Total: ≈ $87.98/month (on-demand, 24/7 usage)