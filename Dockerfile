FROM golang:1.23

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download
RUN go mod tidy

COPY . .

RUN go build -o docker-task-manager

CMD ["./docker-task-manager"]
