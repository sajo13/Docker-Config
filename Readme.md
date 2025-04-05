# 🚀 Laravel + MySQL Docker Setup

This project is a Dockerized Laravel application using MySQL and Apache with a custom virtual host.

---


## 🚨 Important: Do NOT Use the Main Branch!

> ⚠️ **The `main` branch is NOT intended for Docker setup.**  
> It contains the Tips and Tricks Docker configuration.

---

## 📦 Features

- Laravel (latest)
- MySQL (with user-based access)
- Apache with custom `vhost.conf`
- Docker-based development
- Shell script (`entrypoint.sh`) for bootstrapping

---

## 🐳 Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/sajo13/Docker-Config/tree/laravel-11
cd laravel-11


2️⃣ Set Up the Environment File

The .env file is already included and configured.

You can review and update it if needed. Here’s a sample:

APP_NAME=Laravel
APP_ENV=local
APP_KEY=base64:generated-key-here
APP_DEBUG=true
APP_URL=http://localhost

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=myDb
DB_USERNAME=user
DB_PASSWORD=test

LOG_CHANNEL=stack

    ✅ Copy or update values as needed before building the app.

3️⃣ Build and Start the Containers

docker-compose up -d --build

This will:

    Build Docker images

    Start Laravel, MySQL, and Apache containers

    Mount the app volume

🌐 Access the Application

Once the containers are running, open your browser and go to:

🔗 http://localhost

    Ensure port 80 is free on your system.

🛠 Access MySQL CLI

To enter the MySQL container and use the CLI:

docker exec -it <mysql-container-name> bash

Then:

mysql -u user -p
# Password: test

To find the container name:

docker ps

🧩 File Breakdown
📁 .env

Environment variables used by Laravel and MySQL.
📄 Dockerfile

Builds the PHP + Apache container and installs Laravel dependencies.
📄 docker-compose.yml

Manages the app and database services using volumes, ports, and environment variables.
📄 entrypoint.sh

Startup script that can run Laravel migrations or permission fixes.
📄 vhost.conf

Apache virtual host setup used to point /public as the web root:

<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /var/www/html/public
    <Directory /var/www/html/public>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>

🧹 Useful Docker Commands

Rebuild everything from scratch (⚠️ removes volumes):

docker-compose down -v
docker-compose up -d --build

Run Laravel Artisan commands:

docker exec -it <app-container-name> php artisan migrate
docker exec -it <app-container-name> php artisan tinker

🐞 Troubleshooting

    Port already in use:
    Stop local web servers (like Apache or NGINX) using port 80.

    MySQL error:
    Make sure your .env uses DB_HOST=mysql, not 127.0.0.1.

    File permission issues:
    Use chown or configure the entrypoint.sh to handle folder permissions.

🧑‍💻 Author

Sajo
🔗 [GitHub@sajo13](https://github.com/sajo13)
