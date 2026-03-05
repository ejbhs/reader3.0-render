FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    ttyd \
    openjdk-17-jre-headless \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY public/reader-pro-3.2.14.jar ./

EXPOSE 8080
EXPOSE 7681
FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    openjdk-17-jre-headless \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY public/reader-pro-3.2.14.jar ./

EXPOSE 8080
ENV PORT=8080

CMD java -jar reader-pro-3.2.14.jar --server.port=$PORT --server.servlet.context-path=/reading/
