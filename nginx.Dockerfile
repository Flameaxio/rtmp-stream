# Launch with docker run -d -p 1935:1935 -p 80:80 --name rtmp-nginx rtmp-nginx

FROM tiangolo/nginx-rtmp

COPY nginx.conf /etc/nginx/nginx.conf
RUN addgroup --gid 1024 group
RUN usermod -a -G group root
