FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=interactive

# Install dependencies for building nginx + rtmp
RUN apt-get update && apt-get install -y \
    build-essential \
    libpcre3 libpcre3-dev \
    libssl-dev \
    zlib1g zlib1g-dev \
    wget unzip git \
    && rm -rf /var/lib/apt/lists/*

# Download nginx and the rtmp module source
WORKDIR /tmp
RUN wget http://nginx.org/download/nginx-1.25.5.tar.gz && \
    tar -zxvf nginx-1.25.5.tar.gz && \
    git clone https://github.com/arut/nginx-rtmp-module.git

# Build nginx with rtmp module
WORKDIR /tmp/nginx-1.25.5
RUN ./configure --prefix=/opt/nginx \
    --add-module=/tmp/nginx-rtmp-module \
    --with-http_ssl_module && \
    make && make install

# Create directories and config
RUN mkdir -p /opt/nginx/conf /opt/nginx/logs /opt/nginx/html

# Add nginx configuration
COPY nginx.conf /opt/nginx/conf/nginx.conf

# Expose HTTP (80) and RTMP (1935) ports
EXPOSE 80 1935

# Start nginx in foreground
CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]
