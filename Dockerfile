# --- Étape 1 : Builder (Compilation) ---
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /workspace

# Copie du POM et téléchargement des dépendances (Mise en cache des layers Docker)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copie des sources et compilation
COPY src src
RUN mvn package -DskipTests

# --- Étape 2 : Runtime (Image finale légère) ---
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Création d'un utilisateur non-root pour la sécurité
RUN addgroup -S quarkus && adduser -S quarkus -G quarkus
USER quarkus

# Copie de l'application compilée depuis l'étape de build
# Quarkus génère un dossier 'quarkus-app' optimisé (Fast-Jar)
COPY --from=build --chown=quarkus:quarkus /workspace/target/quarkus-app/lib/ /app/lib/
COPY --from=build --chown=quarkus:quarkus /workspace/target/quarkus-app/*.jar /app/
COPY --from=build --chown=quarkus:quarkus /workspace/target/quarkus-app/app/ /app/app/
COPY --from=build --chown=quarkus:quarkus /workspace/target/quarkus-app/quarkus/ /app/quarkus/

# Exposition du port
EXPOSE 8080

# Commande de lancement
CMD ["java", "-jar", "/app/quarkus-run.jar"]