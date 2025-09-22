FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY waterfall.jar config.yml ./
RUN mkdir plugins
EXPOSE 26666 443
CMD ["java", "-Xms256M", "-Xmx512M", "-jar", "waterfall.jar"]
