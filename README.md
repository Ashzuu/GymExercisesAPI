# 🏋️‍♂️ GymExercisesAPI

- [English documentation](#-about)
- [Documentation française](#-à-propos)

## English (Anglais)

### 📖 About

GymExercisesAPI is a RESTful API designed to provide an exhaustive, precise, and free database of strength training exercises (free weights, machines, cardio).

Unlike existing solutions that are often paid or limited, this project aims to become the community source of truth for developers wishing to build fitness applications without worrying about data collection.
### 🚀 Why this project?

    100% Free & Open Source

    Extreme Performance: Powered by Quarkus (Native compilation ready) for minimal latency.

    Multi-language: Designed from the start for internationalization (French at launch, English coming soon, with other languages planned).

    Precise Structure: Detailed data (targeted muscle groups, equipment type, technical instructions).

### 🛠️ Tech Stack

The architecture is designed for performance and scalability:

    Language: Java 21

    Framework: Quarkus (Reactive mode)

    Database: PostgreSQL

    ORM: Hibernate ORM with Panache

    Containerization: Docker & Docker Compose

### 🗺️ Roadmap

#### 📅 Step 1: Foundations & Data (Current)

    [X] Initialization of Quarkus project & Docker Compose.

    [X] Data Model Design.

    [X] Development of basic CRUD endpoints (Public Read-only, Admin Write).

    [X] Data Seeding: Continuous integration of exercises.

#### 📅 Step 2: Business Logic & Search

    [ ] Implementation of advanced search (Fuzzy search, filters by muscles/equipment).

    [ ] Media management: Storing links to demo images/videos.

#### 📅 Step 3: Performance & Internationalization

    [ ] Internationalization (i18n): Translating the database into English.

    [ ] Caching: Redis implementation to cache frequent requests (GET /exercises).

    [ ] API Documentation.

    [ ] Deployment of v1.0.0 and official opening to external contributions.

#### 📅 Step 4: API Showcase Website Setup

    [ ] Landing page showcasing the application's various features.

    [ ] Ability to generate 3 API keys per account (with a high rate-limit to avoid bandwidth overload).

    If the project gains traction and there is significant interest in the API's development, I will share progress updates via a dedicated communication channel (likely Discord).

## Français (French)

### 📖 À propos

GymExercisesAPI est une API RESTful conçue pour fournir une base de données exhaustive, précise et gratuite d'exercices de musculation (poids libres, machines, cardio).

Contrairement aux solutions existantes souvent payantes ou limitées, ce projet vise à devenir la source de vérité communautaire pour les développeurs souhaitant créer des applications de sport sans se soucier de la collecte de données.
### 🚀 Pourquoi ce projet ?

    100% Gratuit & Open Source

    Performance Extrême : Propulsé par Quarkus (Native compilation ready) pour une latence minimale.

    Multi-langues : Conçu dès le départ pour l'internationalisation (français au lancement, anglais à venir, autres langages possibles à prévoir).

    Structure précise : Données détaillées (groupes musculaires ciblés, type d'équipement, instructions techniques).

### 🛠️ Stack Technique

L'architecture est pensée pour la performance et la scalabilité :

    Langage : Java 21

    Framework : Quarkus (Mode réactif)

    Base de données : PostgreSQL

    ORM : Hibernate ORM avec Panache

    Conteneurisation : Docker & Docker Compose

### 🗺️ Roadmap

#### 📅 Etape 1 : Fondations & Données

    [X] Initialisation du projet Quarkus & Docker Compose.

    [X] Conception du modèle de données (MCD).

    [X] Développement des endpoints CRUD de base (Lecture seule publique, Écriture admin).

    [X] Data Seeding : Intégration des exercices au fur et à mesure.

#### 📅 Etape 2 : Logique Métier & Recherche

    [ ] Implémentation de la recherche avancée (Fuzzy search, filtres par muscles/équipement).

    [ ] Gestion des médias : Stockage des liens vers images/vidéos de démonstration.

#### 📅 Etape 3 : Performance & Internationalisation

    [ ] Internationalisation (i18n) : Traduction de la base de données en anglais.

    [ ] Caching : Implémentation de Redis pour mettre en cache les requêtes fréquentes (GET /exercises).

    [ ] Documentation API

    [ ] Déploiement de la v1.0.0 et ouverture officielle aux contributions externes.

#### 📅 Etape 4 : Mise en place du site vitrine de l'API

    [ ] Page vitrine présentant les différentes fonctionnalités de l'application

    [ ] Possibilité de générer 3 clés API par compte (avec rate-limit haut pour ne pas surcharger la bande passante)

Si le projet prend une place importante, et que vous portez un grand intérêt au développement de l'API, je fournirai dans un canal de communication dédié (sans doute Discord) les avancés de celui-ci.
