FROM alpine

RUN apk update && apk upgrade && apk add openssh-server
RUN cd /etc/ssh && ssh-keygen -A

RUN adduser -D -s /bin/sh ohno && echo "ohno:ohno" | chpasswd ohno
RUN echo "Oh no, my binaries!" > /etc/motd
RUN echo "PasswordAuthentication no" >> /etc/ssh/ssdh_config
RUN echo "cd /" > /home/ohno/.profile

COPY entrypoint.sh /.simulator/entrypoint
CMD /.simulator/entrypoint
EXPOSE 22

COPY .id_ed25519.pub /home/ohno/.ssh/authorized_keys
