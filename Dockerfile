FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /workspace

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src src
RUN mvn package -DskipTests

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

RUN addgroup -S quarkus && adduser -S quarkus -G quarkus
USER quarkus

COPY --from=build --chown=quarkus:quarkus /workspace/target/quarkus-app/lib/ /app/lib/
COPY --from=build --chown=quarkus:quarkus /workspace/target/quarkus-app/*.jar /app/
COPY --from=build --chown=quarkus:quarkus /workspace/target/quarkus-app/app/ /app/app/
COPY --from=build --chown=quarkus:quarkus /workspace/target/quarkus-app/quarkus/ /app/quarkus/

EXPOSE 14100

CMD ["java", "-jar", "/app/quarkus-run.jar"]