# 🧩 Go Application Deployment – QA & Production Environments

## 🧠 Overview
This repository provides two complete deployment environments for a **Go-based REST API** connected to a **MySQL database** — one for **Quality Assurance (QA)** testing using **Docker Compose**, and another for **Production** deployment using **Kubernetes**.  

The goal is to demonstrate how a software project evolves from a simple local test setup to a scalable, production-grade architecture.

---

## 🏗️ Environments Overview

| Environment | Purpose | Technology Stack |
|--------------|----------|------------------|
| **QA Environment** | For integration & functionality testing before production release. | Docker Compose, Nginx, Go, MySQL |
| **Production Environment** | For scalable, cloud-native deployment. | Kubernetes, Ingress, Secrets, ResourceQuota |

---

## 📁 Repository Structure

```
project_files/
├── compose-QA-enviroment/                # Docker Compose setup for QA testing
│   ├── docker-compose.yml
│   ├── backend/
│   ├── nginx/
│   ├── db_password.txt
│   └── README.md                         # QA environment documentation
│
└── kubernetes-production-environment/    # Kubernetes setup for production
    ├── backend_deployment.yaml
    ├── backend_service.yaml
    ├── database_statfulset.yaml
    ├── db-pv.yaml
    ├── db-secret.yaml
    ├── db-service.yaml
    ├── ingress-service.yaml
    ├── ns-mado-quota.yaml
    └── README.md                         # Production environment documentation
```

---

## 🚀 How to Use This Repository

### 🧪 Option 1: Run the **QA Environment** (for testing)
Use this setup if you want to test the Go app locally with SSL and MySQL integration before deploying to Kubernetes.

#### Steps:
1. Navigate to the QA folder:
   ```bash
   cd project_files/compose-QA-enviroment
   ```
2. Follow the setup guide in:
   ```
   README.md
   ```
3. Access the app:
   ```
   https://localhost:6000
   ```

This environment is ideal for **functional testing**, **debugging**, and **continuous integration pipelines**.

---

### ☁️ Option 2: Deploy the **Production Environment**
Use this setup to deploy the same Go application to a **Kubernetes cluster** with persistence, secrets, and ingress configuration.

#### Steps:
1. Navigate to the Kubernetes folder:
   ```bash
   cd project_files/kubernetes-production-environment
   ```
2. Apply all manifests:
   ```bash
   kubectl apply -f .
   ```
3. Verify deployment:
   ```bash
   kubectl get all -n mado
   ```
4. Access the application at:
   ```
   http://example.com
   ```

This environment is meant for **scalable, production-ready** deployments with resource limits and isolation.

---

## 🧰 Key Features

- 🔁 **Consistent Application Logic** — same Go backend across QA and Production  
- 🧱 **Containerized Architecture** — portable setup for all environments  
- 🔐 **Secrets Management** — secure credential handling in both environments  
- 📦 **Persistent Storage** — data durability ensured for MySQL  
- 🌐 **Nginx & Ingress** — unified entry point with SSL and routing  
- 🧩 **Separation of Concerns** — isolated environments with clear responsibilities  

---

## 🧾 Notes
- The QA setup is designed for **local or CI environments**.  
- The Production setup assumes:
  - A running **Kubernetes cluster**
  - An installed **NGINX Ingress Controller**
  - A valid **domain name** (e.g., `example.com`)

---

## 👤 Author
**Mohamed Ahmed Abouseada**  
DevOps Engineer | Cloud & Kubernetes Enthusiast  
📧 [mohamedmohamedahmed172@gmail.com](mailto:mohamedmohamedahmed172@gmail.com)  
💼 [LinkedIn](https://www.linkedin.com/in/mohamed-abouseada-393a86275/)  
💻 [GitHub](https://github.com/mohamed-abouseada121)

---

⭐ **Tip:**  
Start with the QA environment to validate functionality.  
Once tests pass, move to the Production environment for real-world deployment.
