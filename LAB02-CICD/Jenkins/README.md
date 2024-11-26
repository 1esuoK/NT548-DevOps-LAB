# E-Commerce Web Application using MERN Stack and Microservices Architecture

## Description
This is a web application for an e-commerce store that sells games. It is built using the MERN stack and Microservices Architecture. It has a user interface for the customers to view the products and add them to their cart. The application is built using the Microservices Architecture, where each service is a separate Node.js application.

## Before go to next step
Please clone only Jenkins folder to another repository to run isolated pipeline, DO NOT clone this repository

## Usage

### Init Jenkins Master-Slave server and SonarQube server by Terraform
1. Go to terraform folder and run terraform command below:
```bash
# At root Jenkins folder
cd terraform/jenkins
terraform init
terraform plan
terraform apply
cd ../sonarqube/
terraform init
terraform plan
terraform apply
```
3 server will be created: Jenkins-Master, Jenkins-Slave, SonarQube
2. Run the following command to start the application:
```bash
npm run dev
```
3. Open the following URL in your browser:
```bash
http://localhost:<port_no>/
```

4. Or you can use docker-compose to run the application:
```bash
docker-compose up
```
5. Show the running containers:
```bash
docker ps
```
6. Get the container ip address:
```bash
docker inspect <container_id> | grep "IPAddress"
```
7. Open the following URL in your browser:
```bash
http://<container_ip_address>:<port_no>/
```
8. To run the frontend application, run the following command:
```bash
cd frontend
npm install
npm run dev
```
9. Open the following URL in your browser:
```bash
http://localhost:5173/
```
## Products json file
- [Products json file](https://github.com/Andrewaziz99/E-Commerce_Web_Application/blob/main/products.json)

## Technologies
- [React vite](https://vitejs.dev/)
- [Node.js](https://nodejs.org/en/)
- [Express](https://expressjs.com/)
- [MongoDB](https://www.mongodb.com/)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Microservices Architecture]()

## Contributers 
- [Thomas Maged](https://github.com/Thomas-Maged)
- [Maximous Atef](https://github.com/Maxiatef)
- [Kirollos Nessim](https://github.com/KirollosNessem)
- [Ramez Hesham](https://github.com/RamezHesham)
- [Yara Wael](https://github.com/yara880)
- [Nourhane Amir](https://github.com/NourhaneAmir)