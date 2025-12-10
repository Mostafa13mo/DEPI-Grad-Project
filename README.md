# 🚀 DEPI-Grad-Project: Production-Ready Full-Stack Deployment

## A Collaborative Capstone in Modern Software Delivery

[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Mostafa13mo/DEPI-Grad-Project)](https://github.com/Mostafa13mo/DEPI-Grad-Project)
[![GitHub contributors](https://img.shields.io/github/contributors/Mostafa13mo/DEPI-Grad-Project)](https://github.com/Mostafa13mo/DEPI-Grad-Project/graphs/contributors)
[![Project Status](https://img.shields.io/badge/Status-Completed-success)](#)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

This repository encapsulates a complete full-stack web application, developed and delivered by a team of five DevOps Engineers. This project's core mission was to establish a resilient, scalable, and fully automated deployment pipeline using industry-leading tools. It serves as a proof-of-concept for deploying a multi-service application to a production-grade Kubernetes cluster, complete with **Infrastructure-as-Code** and a robust **Observability Stack**.

---

## ✨ Key Features (Application)

While the core value of this repository is its infrastructure and deployment model, the application itself is a robust, decoupled system:

* **Decoupled Architecture:** Separate **Frontend (Vue.js)** and **Backend (RESTful API)** services.
* **Persistent Data Layer:** A dedicated, containerized database service ensures data integrity.
* **Containerized Environment:** Full application stack managed using **Docker** for consistency across environments.
* **Scalability-Focused:** Designed for horizontal scaling using **Kubernetes** orchestration.

---

## 🛠️ DevOps & Architecture Overview

The true power of this project lies in its comprehensive CI/CD pipeline, infrastructure-as-code (IaC), and integrated observability. The setup is designed for **maximum automation, repeatability, and end-to-end monitoring.**

### 1. CI/CD Pipeline 


[Image of CI/CD Pipeline Workflow Diagram]


The `Jenkinsfile` defines a declarative, multi-stage pipeline that automates the entire software delivery lifecycle:

| Stage | Tooling & Purpose |
| :--- | :--- |
| **Provision** | Uses **Terraform** to spin up and configure the target cloud infrastructure (e.g., the Kubernetes cluster). |
| **Build** | Compiles the `frontend` and `backend` codebases and packages them into **Docker Images**. |
| **Test** | Executes unit, integration, and security scans on the application code. |
| **Push** | Pushes the validated application images to a private **Container Registry**. |
| **Deploy** | Uses **Ansible** and **Kubernetes** manifests to deploy the new application version and the **Observability Stack** to the target environment. |

### 2. Deployment Topology and IaC

The deployment model leverages Infrastructure as Code (IaC) for both the cloud resources and the cluster configuration:

* **Infrastructure Provisioning:** Managed by **Terraform**, ensuring the Kubernetes cluster and networking are provisioned in an idempotent and repeatable manner.
* **Production Environment:** Highly available and scalable deployment orchestrated by **Kubernetes (K8s)**, defined in the `k8s/` directory.

### 3. Observability Stack

A complete monitoring solution is integrated into the Kubernetes cluster deployment:

* **Metrics Collection:** **Prometheus** scrapes application and infrastructure metrics from exposed endpoints.
* **Visualization & Alerting:** **Grafana** provides rich dashboards for visualizing the Prometheus data, enabling real-time performance tracking and proactive alerting.

---

## ⚙️ Technology Stack

This project leverages a powerful and popular set of tools for both application development and infrastructure management.

### Application Stack
| Layer | Technology | Description |
| :--- | :--- | :--- |
| **Frontend** | `Vue.js`, `JavaScript` | Modern, responsive user interface. |
| **Backend** | *(API Service)* | Microservice architecture, serving data via RESTful endpoints. |
| **Database** | *(Data Store)* | Containerized relational or NoSQL database for persistent data. |

### DevOps, IaC, & Infrastructure
| Category | Tool | Purpose |
| :--- | :--- | :--- |
| **Infrastructure-as-Code** | `Terraform` | Provisioning and managing the underlying cloud infrastructure (e.g., K8s cluster). |
| **CI/CD** | `Jenkins` (via `Jenkinsfile`) | Automated pipeline orchestration. |
| **Containerization** | `Docker`, `Docker Compose` | Packaging, isolation, and local environment setup. |
| **Orchestration** | `Kubernetes (K8s)` | Production deployment, scaling, and self-healing. |
| **Configuration Mgmt** | `Ansible` (via `ansible-playbook`) | Automating provisioning and configuration within the cluster. |
| **Observability** | `Prometheus`, `Grafana` | Comprehensive metrics collection, visualization, and alerting. |

---

## 🚀 Getting Started

These instructions will get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You need the following software installed on your machine:
* [Docker](https://www.docker.com/get-started)
* [Docker Compose](https://docs.docker.com/compose/install/)
* **Optional for Full Deployment:** `kubectl`, `ansible`, and `terraform`.

### Local Deployment (Docker Compose)

The fastest way to launch the entire application locally is using the `docker-compose.yml` file:

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/Mostafa13mo/DEPI-Grad-Project.git](https://github.com/Mostafa13mo/DEPI-Grad-Project.git)
    cd DEPI-Grad-Project
    ```

2.  **Run the local setup script:**
    ```bash
    ./run.sh up
    # This script handles building images and starting containers
    ```

3.  The application will be accessible at `http://localhost:[PORT]` (Check the `docker-compose.yml` for the exact port).

### Production Deployment (Terraform & Ansible)

To deploy to a live Kubernetes cluster using the full pipeline:

1.  **Provision Infrastructure (Terraform):**
    ```bash
    cd terraform/
    terraform init
    terraform apply
    # This creates the necessary cloud infrastructure and K8s cluster.
    ```

2.  **Deploy Application & Observability (Ansible/K8s):**
    ```bash
    cd ../ansible-playbook
    ansible-playbook deploy.yml -i inventory/production
    # This playbook applies K8s manifests for the application, Prometheus, and Grafana.
    ```

---

## 📂 Repository Structure

| Directory/File | Description |
| :--- | :--- |
| `frontend/` | Source code and Dockerfile for the Vue.js web client. |
| `backend/` | Source code and Dockerfile for the API service. |
| `database/` | Configuration files (e.g., schemas, initial data) for the data store. |
| `terraform/` | **Infrastructure-as-Code** for provisioning the cloud and Kubernetes cluster. |
| `ansible-playbook/` | Configuration Management and orchestration of the deployment process. |
| `k8s/` | **Kubernetes Manifests** for the application, Prometheus, and Grafana components. |
| `Jenkinsfile` | **CI/CD Pipeline** definition for Jenkins. |
| `docker-compose.yml` | Defines the multi-container setup for local development. |
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

**⭐ Show your support!** Give a star if this project was helpful!
