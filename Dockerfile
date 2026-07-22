ARG MSSQL_PASSWORD=Password1234#

FROM mcr.microsoft.com/mssql/server:2022-latest

ARG MSSQL_PASSWORD
ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && apt-get install -y \
    gosu \
    openssh-server

#RUN apt-get install -y \
#    zip

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# sshd config
RUN mkdir -p /var/run/sshd \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN echo "mssql:${MSSQL_PASSWORD}" | chpasswd

ENV TZ="America/Guayaquil"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22 1433

ENTRYPOINT ["/entrypoint.sh"]