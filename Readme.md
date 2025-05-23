# 🚀 Setup

This project is a Dockerized Application Development.

---

## ⚙️ Docker Build with Bake

Using **Bake** lets you pass the complete build definition for all services and orchestrate the build execution in the most efficient way.

### 🟢 To enable Bake temporarily:

Run Compose with the `COMPOSE_BAKE=true` environment variable:

```bash
COMPOSE_BAKE=true docker compose build            //For individual case

🔧 To enable Bake as the default builder: Edit your Docker config file:
//Bake config added for faster build process.

nano $HOME/.docker/config.json

{
  "auths": {},
  "credHelpers": {},
  "currentContext": "default",
  "plugins": {
    "compose": {
      "build": "bake"
    }
  },
  "proxies": {
    "default": {}
  },
  "stackOrchestrator": "swarm"
}

//End

🧑‍💻 Author

Sajo
🔗 GitHub @sajo13
