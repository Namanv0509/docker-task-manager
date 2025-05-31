CREATE TABLE containers (
         id BIGSERIAL PRIMARY KEY,
         container_id VARCHAR(64) UNIQUE NOT NULL,
         name VARCHAR(100) NOT NULL,
         image VARCHAR(255),
         status VARCHAR(50),
         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
     );
     CREATE TABLE metrics (
         id BIGSERIAL PRIMARY KEY,
         container_id BIGINT REFERENCES containers(id),
         cpu_usage DOUBLE PRECISION,
         memory_usage DOUBLE PRECISION,
         timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
     );