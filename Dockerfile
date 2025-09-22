FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
# Descarga Velocity 3.4.0-SNAPSHOT (build #535)
RUN wget -O velocity.jar https://api.papermc.io/v2/projects/velocity/versions/3.4.0-SNAPSHOT/builds/535/downloads/velocity-3.4.0-SNAPSHOT-535.jar
# Copia config.toml
COPY config.toml ./
RUN mkdir plugins
# Descarga plugins ViaVersion, ViaBackwards y ViaRewind
RUN wget -O plugins/ViaVersion.jar https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/5.4.2/PAPER/ViaVersion-5.4.2.jar && \
    wget -O plugins/ViaBackwards.jar https://hangarcdn.papermc.io/plugins/ViaVersion/ViaBackwards/versions/5.4.2/PAPER/ViaBackwards-5.4.2.jar && \
    wget -O plugins/ViaRewind.jar https://github.com/ViaVersion/ViaRewind/releases/download/4.0.9/ViaRewind-4.0.9.jar
EXPOSE 26666
CMD ["java", "-Xms256M", "-Xmx512M", "-jar", "velocity.jar"]
