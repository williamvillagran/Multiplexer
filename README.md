## Multiplexer

### Setup Docker
This current Dockerfile that is included solely supprts NGINX and NGINX-RTMP module. We are exposing port 80 & 1935


Run the following command to build the image:
```bash
docker build -t nginx-rtmp . 
```

Run the following command to run the image:
```bash
docker run -d -p 8080:80 -p 1935:1935 --name my-rtmp nginx-rtmp
```


