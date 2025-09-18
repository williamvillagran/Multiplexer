## Multiplexer

### Setup Docker
This current Dockerfile that is included solely supports NGINX and NGINX-RTMP module. We are exposing port 80 & 1935.

Currently, there are two ways to configure this. Use docker-compose OR manually build the image and run it.

#### Docker-Compose
* Run the following command to build and ***START*** the container
```bash
docker compose up -d
```
* Run the following command to ***STOP*** the container
```bash
docker compose down
```
#### Manually build image and run container
* Run the following command to build the image:
```bash
docker build -t nginx-rtmp . 
```
* Run the following command to run the image:
```bash
docker run -d -p 8080:80 -p 1935:1935 --name my-rtmp nginx-rtmp
```



