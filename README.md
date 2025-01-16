# User Manual

This Docker image wraps around JavaFoil so people don't have to install it and Java locally. 

## Installation
- [Docker](https://www.docker.com/products/docker-desktop) installed and running
- [Docker Compose](https://docs.docker.com/compose/install/) installed

## Usage
### Start
Mac/Linux/Windows (WSL): 
    - ./run_container.sh
    - docker compose -f docker/docker-compose.yaml up --build

### Security
Create a folder called "secrets" (if it doesn't already exist) and create a file named "xpra_password.txt". Whatever is placed in this file will be the password to access the environment.