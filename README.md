# 🚀 DEPI-Grad-Project: Production-Ready Full-Stack Deployment

## A Collaborative Capstone in Modern Software Delivery & Observability

[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Mostafa13mo/DEPI-Grad-Project)](https://github.com/Mostafa13mo/DEPI-Grad-Project)
[![GitHub contributors](https://img.shields.io/github/contributors/Mostafa13mo/DEPI-Grad-Project)](https://github.com/Mostafa13mo/DEPI-Grad-Project/graphs/contributors)
[![Project Status](https://img.shields.io/badge/Status-Completed-success)](#)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

---

### 🌟 Project Vision

This project is the capstone of our DevOps journey, demonstrating a fully automated, resilient, and observable deployment solution for a multi-service web application. It serves as a comprehensive proof-of-concept for deploying to a **production-grade Kubernetes cluster**, integrating **Infrastructure-as-Code (IaC)** for repeatability and an end-to-end **Observability Stack** for operational excellence.

---

## ✨ Application Architecture (The What)

The application adheres to a decoupled, microservice-inspired architecture designed for cloud-native deployment:

* **Frontend:** A modern, responsive Single-Page Application (SPA) built with **Vue.js**.
* **Backend:** A RESTful API service providing business logic and data access.
* **Data Layer:** A containerized database ensuring reliable persistence.
* **Encapsulation:** The entire stack is containerized using **Docker** for environment parity.

---

## 🛠️ DevOps & Infrastructure Overview (The How)

The core value of this repository lies in its comprehensive CI/CD pipeline and IaC implementation, designed for **maximum automation and monitoring.**

### 1. End-to-End CI/CD Pipeline

The `Jenkinsfile` orchestrates a declarative, multi-stage pipeline that ensures code quality and automated delivery:

| Stage | Tooling & Focus | Description |
| :--- | :--- | :--- |
| **I. Provision** | **Terraform** | Idempotently provisions the target cloud infrastructure and the foundational Kubernetes cluster. |
| **II. Build** | `Docker` | Compiles source code and packages `frontend` and `backend` into optimized **Docker Images**. |
| **III. Test & Scan** | *(Unit/Integration/Security Tools)* | Executes comprehensive tests and security vulnerability scans (`SAST/DAST`). |
| **IV. Push** | `Container Registry` | Tags validated images and pushes them to a secure, private registry. |
| **V. Deploy** | **Ansible / K8s** | Applies Kubernetes manifests to deploy the new application version, including the full Observability Stack, to the target environment. |

### 2. Infrastructure as Code (IaC)

We employ a dual-layered IaC strategy for robust environment management:

| Layer | Tool | Purpose |
| :--- | :--- | :--- |
| **Infrastructure Provisioning** | **Terraform** | Manages the lifecycle of cloud resources (VMs, VPCs, K8s Cluster, Networking). |
| **Configuration Management** | **Ansible** | Handles pre/post-deployment tasks and cluster configuration updates outside of K8s manifests. |

### 3. Integrated Observability Stack

A crucial component for production readiness, enabling proactive performance management:

* **Metrics Collection:** **Prometheus** scrapes application and infrastructure metrics (CPU, memory, latency, requests) from exposed K8s endpoints.
* **Visualization & Alerting:** **Grafana** provides dynamic dashboards for real-time visualization of Prometheus data and manages alert routing.

---

## ⚙️ Technology Stack

This project leverages a modern and powerful set of tools across all layers.

| Category | Tool | Purpose |
| :--- | :--- | :--- |
| **Frontend** | `Vue.js`, `JavaScript` | Modern, responsive user interface. |
| **Backend** | *(API Service)* | Decoupled microservice architecture (RESTful). |
| **Database** | *(Data Store)* | Containerized relational or NoSQL database. |
| **IaC** | `Terraform` | Cloud infrastructure provisioning. |
| **CI/CD** | `Jenkins`, `Shell Script` | Automated pipeline orchestration and task scripting. |
| **Containerization** | `Docker`, `Docker Compose` | Packaging, isolation, and local setup. |
| **Orchestration** | `Kubernetes (K8s)` | Production deployment, scaling, and self-healing. |
| **Configuration Mgmt** | `Ansible` | Automation of system configuration. |
| **Monitoring** | `Prometheus`, `Grafana` | Metrics collection, visualization, and alerting. |

---

## 🚀 Getting Started

These instructions detail how to get the project running, from local development to full Kubernetes deployment.

### Prerequisites

You need the following software installed:
* [Docker](https://www.docker.com/get-started)
* [Docker Compose](https://docs.docker.com/compose/install/)
* (For full deployment) `kubectl`, `ansible`, and `terraform`.

### Local Deployment (Docker Compose)

For rapid development and testing:

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/Mostafa13mo/DEPI-Grad-Project.git](https://github.com/Mostafa13mo/DEPI-Grad-Project.git)
    cd DEPI-Grad-Project
    ```

2.  **Launch the application:**
    ```bash
    ./run.sh up
    # This script handles image building and starting containers via docker-compose
    ```

3.  The application will be available at `http://localhost:[PORT]`.

### Production Deployment (IaC Pipeline)

To deploy the full stack, including the monitoring services, to a cloud environment:

1.  **I. Provision Infrastructure:**
    ```bash
    cd terraform/
    terraform init
    terraform apply
    # Creates the Kubernetes cluster and required cloud resources.
    ```

2.  **II. Deploy Application & Observability:**
    ```bash
    cd ../ansible-playbook
    ansible-playbook deploy.yml -i inventory/production
    # Applies K8s manifests for the application, Prometheus, and Grafana.
    ```

---

## 📂 Repository Structure

| Directory/File | Description |
| :--- | :--- |
| `frontend/` | Source code and Dockerfile for the Vue.js web client. |
| `backend/` | Source code and Dockerfile for the API service. |
| `database/` | Configuration files (e.g., schemas) for the data store. |
| `terraform/` | **Terraform** configurations for cloud infrastructure provisioning. |
| `ansible-playbook/` | **Ansible** playbooks for cluster configuration and deployment execution. |
| `k8s/` | **Kubernetes Manifests** (Deployments, Services, Ingress, Monitoring components). |
| `Jenkinsfile` | **CI/CD Pipeline** definition for Jenkins. |
| `docker-compose.yml` | Multi-container setup for local development. |
| `run.sh` | Shell script to automate common local tasks. |

---

## 🤝 Contributors

This project was a collaborative effort by a team of five DevOps Engineers:

* **Mohamed Essam** (Team Leader)
* **Mostafa Mohamed**
* **Youssef Adel**
* **Baraa Elsayed**
* **Amro Khaled**

---

## 📜 License

Distributed under the **MIT License**. See `LICENSE` for more information.

---

**⭐ If this project helped you, please give it a star!**
