# 🚀 Go App - Kubernetes Production Environment

This project defines a **production-ready Kubernetes deployment** for a Go web application connected to a **MySQL 8.0** database.  
It includes manifests for deployment, database persistence, secrets, ingress, and resource quotas within the `mado` namespace.

## 📂 Project Structure

```
project_files/
├── backend_deployment.yaml       # Go app Deployment manifest
├── backend_service.yaml          # Go app Service manifest
├── database_statfulset.yaml      # MySQL StatefulSet manifest
├── db-pv.yaml                    # Persistent Volume for database
├── db-secret.yaml                # Secrets for database and app
├── db-service.yaml               # MySQL Service manifest
├── ingress-service.yaml          # NGINX ingress configuration
└── ns-mado-quota.yaml            # Resource Quota for namespace 'mado'
```

## ⚙️ Components Overview

### 🧩 1. Backend (Go Application)
**File:** `backend_deployment.yaml`  
- Deploys 3 replicas of the Go application (`mad3o/myapp-go`).  
- Uses `ClusterIP` service on port **8000**.  
- Mounts database password from a Kubernetes Secret (`mysql-secret-app`).

```bash
kubectl apply -f backend_deployment.yaml
kubectl apply -f backend_service.yaml
```

### 🗄️ 2. Database (MySQL 8.0)
**Files:**  
- `database_statfulset.yaml`  
- `db-pv.yaml`  
- `db-service.yaml`  
- `db-secret.yaml`

**Features:**
- Persistent storage using `hostPath` and `PersistentVolumeClaim`
- Root password and database name stored in secrets
- Exposed internally using `ClusterIP` on port **3306**

```bash
kubectl apply -f db-pv.yaml
kubectl apply -f db-secret.yaml
kubectl apply -f database_statfulset.yaml
kubectl apply -f db-service.yaml
```

### 🔐 3. Secrets
**File:** `db-secret.yaml`  
Contains:
- `MYSQL_ROOT_PASSWORD` and `MYSQL_DATABASE` for MySQL  
- `db-password` for Go app connection

```bash
kubectl get secrets -n mado
kubectl describe secret mysql-secret-db -n mado
```

### 🌐 4. Ingress
**File:** `ingress-service.yaml`  
Provides access to the Go app through NGINX Ingress Controller.

- Domain: `example.com`  
- Routes `/` to `go-app-service:8000`

```bash
kubectl apply -f ingress-service.yaml
```

Make sure an **NGINX Ingress Controller** is installed:
```bash
kubectl get pods -n ingress-nginx
```

### 🧭 5. Namespace and Resource Quota
**File:** `ns-mado-quota.yaml`  
Defines resource limits and quotas for the `mado` namespace:
- Max 10 Pods, 5 Services, 2 StatefulSets, and 4 Secrets
- CPU limit: 4 cores
- Memory limit: 8Gi
- Storage: 20Gi

```bash
kubectl apply -f ns-mado-quota.yaml
```

## 🧪 Deployment Steps

```bash
# 1. Create Namespace
kubectl create namespace mado

# 2. Apply Resource Quota
kubectl apply -f ns-mado-quota.yaml

# 3. Deploy Database
kubectl apply -f db-pv.yaml
kubectl apply -f db-secret.yaml
kubectl apply -f database_statfulset.yaml
kubectl apply -f db-service.yaml

# 4. Deploy Go Application
kubectl apply -f backend_deployment.yaml
kubectl apply -f backend_service.yaml

# 5. Setup Ingress
kubectl apply -f ingress-service.yaml
```

## 🧍‍♂️ Verification

```bash
kubectl get pods -n mado
kubectl get svc -n mado
kubectl get ingress -n mado
kubectl describe pod <pod-name> -n mado
```

Then open in browser:
```
http://example.com
```

## 🧰 Troubleshooting

- **Pod CrashLoopBackOff**
  - Check logs:  
    ```bash
    kubectl logs <pod-name> -n mado
    ```
  - Ensure the secret names match in your deployment.

- **Database connection error**
  - Verify service name `db` is resolvable:  
    ```bash
    kubectl exec -it <app-pod> -n mado -- nslookup db
    ```

## 🧾 Notes
- This setup assumes an existing **NGINX Ingress Controller**.
- The `hostPath` volume (`/mnt/mysql-data`) is for local testing — replace with a managed storage class in production (e.g. AWS EBS, GCP PD, Azure Disk).
- The `example.com` domain should point to your cluster’s Ingress IP.

## ✨ Author
**Mohamed Abouseada**  
DevOps Engineer | Kubernetes & Cloud Enthusiast
