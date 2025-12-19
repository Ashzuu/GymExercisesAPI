CREATE SCHEMA IF NOT EXISTS data;
SET search_path = "data";

DROP TABLE IF EXISTS muscular_group CASCADE;
DROP TABLE IF EXISTS muscles CASCADE;
DROP TABLE IF EXISTS exercises CASCADE;
DROP TABLE IF EXISTS association_exercises_muscles CASCADE;

CREATE TABLE IF NOT EXISTS muscular_group (
id SERIAL PRIMARY KEY,
name_fr VARCHAR(100) NOT NULL,
name_en VARCHAR(100) NOT NULL,
media VARCHAR(100)
    );

CREATE TABLE IF NOT EXISTS muscles (
id SERIAL PRIMARY KEY,
name_fr VARCHAR(100) NOT NULL,
name_en VARCHAR(100) NOT NULL,
muscular_group_id INTEGER NOT NULL,
media VARCHAR(100) UNIQUE NOT NULL,
description TEXT,
FOREIGN KEY (muscular_group_id)
REFERENCES muscular_group(id)
    );

CREATE TABLE IF NOT EXISTS exercises (
id SERIAL PRIMARY KEY,
name_fr VARCHAR(100) NOT NULL,
name_en VARCHAR(100) NOT NULL,
media VARCHAR(100) NOT NULL
    );

CREATE TABLE IF NOT EXISTS association_exercises_muscles (
 id_exercise INT NOT NULL,
 id_muscle INT NOT NULL,
 is_focus BOOLEAN DEFAULT false
);

INSERT INTO muscular_group (id, name_fr, name_en, media) VALUES
 (1, 'PECTORAUX', 'CHEST', 'chest'),
 (2, 'DOS', 'BACK', 'back'),
 (3, 'ÉPAULES', 'SHOULDERS', 'shoulders'),
 (4, 'TRICEPS', 'TRICEPS', 'triceps'),
 (5, 'BICEPS', 'BICEPS', 'biceps'),
 (6, 'AVANT-BRAS', 'FOREARMS', 'forearms'),
 (7, 'JAMBES', 'LEGS', 'legs'),
 (8, 'FESSIERS', 'GLUTEUS', 'glute'),
 (9, 'ABDOMINAUX', 'CORE', 'core');

INSERT INTO muscles (muscular_group_id, name_fr, name_en, media) VALUES
 (1, 'Grand Pectoral Haut', 'Pectoralis Major Clavicular', 'pectoralis-major-clavicular'),
 (1, 'Grand Pectoral Moyen', 'Pectoralis Major Sternal', 'pectoralis-major-sternal'),
 (1, 'Grand Pectoral Bas', 'Pectoralis Major Costal', 'pectoralis-major-costal'),
 (1, 'Petit Pectoral', 'Pectoralis Minor', 'pectoralis-minor'),
 (1, 'Dentelé Antérieur', 'Serratus Anterior', 'serratus-anterior'),

 (2, 'Grand Dorsal', 'Latissimus Dorsi', 'latissimus-dorsi'),
 (2, 'Trapèzes Supérieurs', 'Trapezius Upper', 'trapezius-upper'),
 (2, 'Trapèzes Moyens', 'Trapezius Middle', 'trapezius-middle'),
 (2, 'Trapèzes Inférieurs', 'Trapezius Lower', 'trapezius-lower'),
 (2, 'Rhomboïdes', 'Rhomboids', 'rhomboids'),
 (2, 'Grand Rond', 'Teres Major', 'teres-major'),
 (2, 'Érecteurs du Rachis (Lombaires)', 'Erector Spinae', 'erector-spinae'),

 (3, 'Deltoïde Antérieur', 'Deltoid Anterior', 'deltoid-anterior'),
 (3, 'Deltoïde Latéral', 'Deltoid Lateral', 'deltoid-lateral'),
 (3, 'Deltoïde Postérieur', 'Deltoid Posterior', 'deltoid-posterior'),
 (3, 'Coiffe des Rotateurs', 'Rotator Cuff', 'rotator-cuff'),

 (4, 'Longue portion du triceps', 'Long Head Triceps Brachii', 'triceps-brachii-long-head'),
 (4, 'Vaste Latéral du triceps', 'Lateral Head Triceps Brachii', 'triceps-brachii-lateral-head'),
 (4, 'Vaste Médial du triceps', 'Medial Head Triceps Brachii', 'triceps-brachii-medial-head'),

 (5, 'Longue portion du biceps', 'Biceps Brachii (Long Head)', 'biceps-brachii-long-head'),
 (5, 'Courte portion du biceps', 'Biceps Brachii (Short Head)', 'biceps-brachii-short-head'),
 (5, 'Brachial', 'Brachialis', 'brachialis'),
 (5, 'Brachio-radial', 'Brachioradialis', 'brachioradialis'),
 (6, 'Fléchisseurs', 'Forearm Flexors', 'forearm-flexors'),
 (6, 'Extenseurs', 'Forearm Extensors', 'forearm-extensors'),

 (7, 'Droit fémoral', 'Rectus Femoris', 'rectus-femoris'),
 (7, 'Vaste Latéral', 'Vastus Lateralis', 'vastus-lateralis'),
 (7, 'Vaste Médial', 'Vastus Medialis', 'vastus-medialis'),
 (7, 'Intermédiaire', 'Vastus Intermedius', 'vastus-intermedius'),

 (7, 'Ischio-jambiers', 'Hamstrings', 'hamstrings'),
 (7, 'Adducteurs', 'Adductors', 'adductors'),
 (7, 'Ilio-psoas', 'Iliopsoas', 'iliopsoas'),
 (7, 'Jumeaux', 'Gastrocnemius', 'gastrocnemius'),
 (7, 'Soléaire', 'Soleus', 'soleus'),

 (8, 'Grand Fessier', 'Gluteus Maximus', 'gluteus-maximus'),
 (8, 'Moyen Fessier', 'Gluteus Medius', 'gluteus-medius'),

 (9, 'Grand Droit', 'Rectus Abdominis', 'rectus-abdominis'),
 (9, 'Obliques', 'Obliques', 'obliques'),
 (9, 'Transverse', 'Transversus Abdominis', 'transversus-abdominis');

CREATE INDEX idx_muscles_img ON muscles(media);