# Launch with docker run -d -p 1935:1935 -p 80:80 --name rtmp-nginx rtmp-nginx

FROM tiangolo/nginx-rtmp

# For thumbnails
RUN apt-get update && apt-get install -y ffmpeg
RUN mkdir -p /www/var/recs
RUN mkdir -p /www/var/thumbnails

COPY nginx.conf /etc/nginx/nginx.conf
RUN addgroup --gid 1024 group
RUN usermod -a -G group root
RUN chown -R root:group /www
RUN chmod -R o+x /www
