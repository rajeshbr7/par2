
FROM selenium/standalone-chrome:latest

USER root

RUN apt-get update && apt-get install -y maven \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY pom.xml .
COPY src ./src
COPY webpage ./webpage
COPY testng.xml .

CMD ["mvn", "clean", "test"]
