# 🚀 React App Docker Setup

This guide helps you containerize and run your React app(Node JS Runtime) using Docker — no Docker Compose needed.

---

## 🚨 Important: Do NOT Use the Main Branch!

> ⚠️ **The `main` branch is NOT intended for Docker setup.**  
> It contains the Tips and Tricks Docker configuration.

---

## 📦 Features

- **React with Vite:** Fast, modern frontend setup for instant development and optimized builds.
- **Node.js Runtime:** Uses lightweight `node:alpine` for building and serving static content.
- **Multi-Stage Docker Build:** Optimized Dockerfile separates build and runtime phases for smaller image size.
- **Static File Server:** Uses `serve` to efficiently deliver production-ready assets.
- **Environment Port Config:** Supports dynamic port assignment with `ENV PORT`.
- **Alpine Base Image:** Minimal and secure by default, with optional bash support.
- **No Docker Compose Required:** Simple `docker build` + `docker run` workflow for ease of use.


## ⚙️ Build the App

Build the Docker image using the `Dockerfile`:

```bash
docker build -t react-side-bar .

🐳 1. Run the Docker Container in Background

Start your app in detached mode:

docker run -d -p 3000:3000 --name react-sidebar react-side-bar

    -d → Run in the background

    --name react-sidebar → Optional name for easy reference

Visit http://localhost:3000 to see your app in action.
🔍 2. Access Files Inside the Running Container

To open a shell into the running container:

docker exec -it react-sidebar sh

From there, you can navigate and inspect files:

ls
cd dist
cat index.html

🛑 3. Stop and Remove the Container

To stop and remove the container:

docker stop react-sidebar
docker rm react-sidebar

🧼 Bonus: Clean Up Unused Docker Resources

Remove all stopped containers:

docker container prune

Remove dangling/unused images:

docker image prune

💻 Portainer Users — Using Bash

If you're accessing the container through Portainer and see this error:

OCI runtime exec failed: exec: "bash": executable file not found

It’s because Alpine doesn't come with bash. Instead:
✔️ Use sh instead of bash

docker exec -it react-sidebar sh

Or install bash inside the container:

apk add --no-cache bash

Alternatively, update your Dockerfile:

RUN apk add --no-cache bash

👨‍💻 Author

Sajo
🔗 GitHub @sajo13