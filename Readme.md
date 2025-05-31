## Docker Task Manager API

Welcome to my Docker Task Manager API project! Diving into Go, Docker, and API development, and this is my attempt to build something cool that works like a "Windows Task Manager" for Docker containers. This project lets you list, start, stop, and monitor Docker containers, tracking their CPU and memory usage, all stored in a PostgreSQL database. It's been a fun (and sometimes challenging!) learning journey, and I hope this README helps you try it out or learn from it.

## Tech Stack

- Go: Backend API logic
- Gin: HTTP framework for routing
- GORM: ORM for PostgreSQL interactions
- PostgreSQL: Database for storing container and metric data
- Docker SDK: To interact with Docker Continers
- Docker Compose: For running the app and database

## How to Run it

### 1.Clone the Repo

```bash
git clone https://github.com/Namanv0509/docker-task-manager.git
```
### 2.Resolve Dependencies

```bash
go mod tidy
```

### 3.Start Docker Compose

```bash
docker compose up --build
```
- This builds and starts the API (localhost:8080) and PostgreSQL (localhost:5434).

### 4.Apply Database Migrations

```bash
migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5434/taskdb?sslmode=disable" up
```

### 5.Test the API
- Create containers ( test or already existsing )

- List COntainers:
```bash
curl http://localhost:8080/containers
```
-Get Metrics:
```bash
curl http://localhost:8080/containers/<ContainerID>/metrics
```
-Stop/Start Container:
```bash
curl -X POST http://localhost:8080/containers/<ContainerID>/stop
curl -X POST http://localhost:8080/containers/<ContainerID>/start
```
-Visualize Metrics

```bash
while true; do curl -s http://localhost:8080/containers | jq '.[] | "\(.Name): CPU=\(.Metrics[0].CPUUsage)% Mem=\(.Metrics[0].MemoryUsage)MB"'; sleep 5; done
```

## Contributing
I'm new to this, so any feedback or contributions are welcome! Feel free to open issues or PRs to improve the project.
Probably will be helpful if we can scale it together as an API first arch using it for automation and scripting.


