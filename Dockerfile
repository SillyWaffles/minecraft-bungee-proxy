FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
RUN wget -O velocity.jar https://api.papermc.io/v2/projects/velocity/versions/3.4.0-SNAPSHOT/builds/535/downloads/velocity-3.4.0-SNAPSHOT-535.jar
COPY config.toml ./
RUN mkdir plugins
RUN wget -O plugins/ViaVersion.jar https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/5.4.2/PAPER/ViaVersion-5.4.2.jar && \
    wget -O plugins/ViaBackwards.jar https://hangarcdn.papermc.io/plugins/ViaVersion/ViaBackwards/versions/5.4.2/PAPER/ViaBackwards-5.4.2.jar && \
    wget -O plugins/ViaRewind.jar https://github.com/ViaVersion/ViaRewind/releases/download/4.0.9/ViaRewind-4.0.9.jar
EXPOSE 25565
EXPOSE 8080
RUN echo '#!/bin/sh\npython3 -m http.server 8080 &' > start.sh && chmod +x start.sh
CMD ["sh", "start.sh", "&", "java", "-Xms256M", "-Xmx512M", "-jar", "velocity.jar"]
