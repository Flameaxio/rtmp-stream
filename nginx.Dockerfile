# Launch with docker run -d -p 1935:1935 --name rtmp-nginx rtmp-nginx

FROM tiangolo/nginx-rtmp

COPY nginx.conf /etc/nginx/nginx.conf