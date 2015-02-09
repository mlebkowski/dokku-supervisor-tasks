FROM dockerfile/supervisor:fc011b55496f
MAINTAINER "Maciej Łebkowski <m.lebkowski@gmail.com>"

RUN apt-get update && apt-get install docker.io -y
RUN bash -c 'echo -e "[inet_http_server]\nport = :9001" >> /etc/supervisor/supervisord.conf'

VOLUME ["/etc/supervisor/conf.d", "/var/log/supervisor"]

EXPOSE 9001
