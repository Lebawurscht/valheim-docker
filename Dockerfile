FROM steamcmd/steamcmd

RUN mkdir -p /root/.config/unity3d/IronGate/Valheim/

RUN steamcmd +login anonymous +force_install_dir /home/valheim/server +app_update 896660 validate +quit

WORKDIR /home/valheim/server

ADD entrypoint.sh entrypoint.sh

EXPOSE 2456/udp
EXPOSE 2456/tcp
EXPOSE 2457/udp
EXPOSE 2457/tcp
EXPOSE 2458/udp
EXPOSE 2458/tcp

VOLUME ["/root/.config/unity3d/IronGate/Valheim/"]

ENV SERVER_NAME="Valheim Docker"
ENV SERVER_PASSWORD="secret"
ENV SERVER_WORLD="Valheim"
ENV SERVER_PORT=2456
ENV SERVER_PUBLIC=1

ENTRYPOINT ["/bin/bash" , "entrypoint.sh"]
