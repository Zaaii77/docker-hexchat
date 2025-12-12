FROM debian:latest

RUN apt update
RUN apt install hexchat -y


CMD ["hexchat"]
