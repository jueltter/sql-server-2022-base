FROM mcr.microsoft.com/mssql/server:2022-latest

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

# passwd config
RUN --mount=type=secret,id=mssql_password \
    MSSQL_PASSWORD=$(cat /run/secrets/mssql_password) \
    && echo "mssql:${MSSQL_PASSWORD}" | chpasswd 

# create home directory for mssql user
RUN mkdir -p /home/mssql \
    && chown mssql:mssql /home/mssql \
    && chmod 700 /home/mssql

# set timezone
ENV TZ="America/Guayaquil"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22 1433

ENTRYPOINT ["/entrypoint.sh"]