DROP SCHEMA IF EXISTS data CASCADE;

CREATE SCHEMA IF NOT EXISTS data;
SET search_path = "data";

CREATE TABLE IF NOT EXISTS data.muscular_group (
  id SERIAL PRIMARY KEY,
  name_fr VARCHAR(100) NOT NULL,
    name_en VARCHAR(100) NOT NULL,
    media VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS data.muscles (
   id SERIAL PRIMARY KEY,
   name_fr VARCHAR(100) NOT NULL,
    name_en VARCHAR(100) NOT NULL,
    muscular_group_id INTEGER NOT NULL,
    media VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    FOREIGN KEY (muscular_group_id)
    REFERENCES muscular_group(id)
);

CREATE TABLE IF NOT EXISTS data.exercises (
     id SERIAL PRIMARY KEY,
     name_fr VARCHAR(100) NOT NULL,
    name_en VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    media VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS data.association_exercises_muscles (
     id_exercise INT NOT NULL,
     id_muscle INT NOT NULL,
     PRIMARY KEY (id_exercise, id_muscle),
     is_focus BOOLEAN DEFAULT false,
    CONSTRAINT fk_exercise FOREIGN KEY (id_exercise) REFERENCES data.exercises(id),
    CONSTRAINT fk_muscle FOREIGN KEY (id_muscle) REFERENCES data.muscles(id)
);

CREATE TABLE IF NOT EXISTS data.equipment(
    id SERIAL PRIMARY KEY,
    name_fr VARCHAR(100),
    name_en VARCHAR(100),
    description TEXT
);

CREATE TABLE IF NOT EXISTS data.exercises_equipment(
    id_exercise INT NOT NULL,
    id_equipment INT NOT NULL,
    optional BOOLEAN NOT NULL,
    PRIMARY KEY (id_exercise, id_equipment),
    CONSTRAINT fk_equipment FOREIGN KEY (id_equipment) REFERENCES equipment(id),
    CONSTRAINT fk_exercise FOREIGN KEY (id_exercise) REFERENCES exercises(id)
);

INSERT INTO data.equipment(id,name_fr, name_en, description) VALUES
(1,'Haltères', 'Dumbbells', ''),
(2,'Kettlebell', 'Kettlebell', ''),
(3,'Disque de poids', 'Weight Plate', ''),
(4,'Barre', 'Barbell', ''),
(5,'Barre Triceps', 'Triceps Bar', ''),
(6,'Barre EZ', 'EZ Bar', ''),
(7,'Barre T', 'T Bar', ''),
(8,'Barre ancrée', 'Landmine', ''),
(9,'Banc', 'Flat Bench', ''),
(10,'Banc inclinable', 'Incline Bench', ''),
(11,'Banc déclinable', 'Decline Bench', ''),
(12,'Banc à lombaires', 'Hyperextension Bench', ''),
(13,'Pupitre Larry Scott', 'Preacher Curl Bench', ''),
(14,'Station à dips / Barre parallèle', 'Dip Bars', ''),
(15,'Barre de traction', 'Pull-up Bar', ''),
(16,'Rack', 'Power Rack', ''),
(17,'Smith machine', 'Smith machine', ''),
(18,'Machine', 'Machine', ''),
(19,'Poulies', 'Cable Machine', ''),
(20,'Tapis', '', ''),
(21,'Roue abdominale', 'Ab wheel', ''),
(22,'Tapis de Course', 'Treadmill', ''),
(23,'Vélo Elliptique', 'Elliptical', ''),
(24,'Rameur', 'Rowing Machine', ''),
(25,'Corde à Sauter', 'Jump Rope', '');

INSERT INTO data.muscular_group (id, name_fr, name_en, media) VALUES
(1, 'PECTORAUX', 'CHEST', 'chest'),
(2, 'DOS', 'BACK', 'back'),
(3, 'ÉPAULES', 'SHOULDERS', 'shoulders'),
(4, 'TRICEPS', 'TRICEPS', 'triceps'),
(5, 'BICEPS', 'BICEPS', 'biceps'),
(6, 'AVANT-BRAS', 'FOREARMS', 'forearms'),
(7, 'JAMBES', 'LEGS', 'legs'),
(8, 'FESSIERS', 'GLUTEUS', 'glute'),
(9, 'ABDOMINAUX', 'CORE', 'core'),
(10, 'CARDIO', 'CARDIO', 'cardio');

INSERT INTO data.muscles (muscular_group_id, name_fr, name_en, media) VALUES
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
(9, 'Transverse', 'Transversus Abdominis', 'transversus-abdominis'),

(10, 'Cardio', 'Cardio', 'cardio');

CREATE INDEX idx_muscles_img ON data.muscles(media);

INSERT INTO data.exercises(id, name_fr, name_en, description, media) VALUES
-- --- Pectoraux / Push
(1, 'Développé Couché Barre', 'Barbell Bench Press', 'Dos plat, pieds au sol. Descendez la barre au milieu des pecs. Repoussez sans verrouiller les coudes.', 'barbell-bench-press'),
(2, 'Développé Incliné Barre', 'Incline Barbell Bench Press', 'Banc incliné à 30-45°. Descendez la barre sur le haut des pectoraux.', 'incline-barbell-bench-press'),
(3, 'Développé Décliné Barre', 'Decline Barbell Bench Press', 'Banc décliné. Cible la partie inférieure des pectoraux.', 'decline-barbell-bench-press'),
(4, 'Développé Couché Haltères', 'Dumbbell Bench Press', 'Mouvement similaire à la barre mais avec une plus grande amplitude.', 'dumbbell-bench-press'),
(5, 'Développé Incliné Haltères', 'Incline Dumbbell Press', 'Focus sur la partie claviculaire des pectoraux avec haltères.', 'incline-dumbbell-press'),
(6, 'Développé Décliné Haltères', 'Decline Dumbbell Press', 'Focus sur la partie basse des pectoraux avec haltères.', 'decline-dumbbell-press'),
(7, 'Dips', 'Chest Dips', 'Penchez le buste en avant pour solliciter les pectoraux.', 'chest-dips'),
(8, 'Écarté Couché Haltères', 'Dumbbell Flyes', 'Mouvement d''ouverture pour étirer les pectoraux. Gardez les coudes légèrement fléchis.', 'dumbbell-flyes'),
(9, 'Écarté Couché Poulie Hauteur Pecs', 'Lying Cable Flyes', 'Écartés sur banc plat avec poulies vis-à-vis.', 'lying-cable-flyes'),
(10, 'Écarté Couché Poulie Basse', 'Lying Low Cable Flyes', 'Focus sur le haut des pectoraux sur banc avec poulies basses.', 'lying-low-cable-flyes'),
(11, 'Écarté Poulie Hauteur Pecs', 'Standing Cable Flyes', 'Debout, ramenez les poulies devant vous au niveau des pectoraux.', 'standing-cable-flyes'),
(12, 'Écarté Poulie Haute', 'High Cable Flyes', 'Tirez les poulies de haut en bas pour cibler le bas des pecs.', 'high-cable-flyes'),
(13, 'Écarté Poulie Basse', 'Low Cable Flyes', 'Tirez les poulies de bas en haut pour cibler le haut des pecs.', 'low-cable-flyes'),
(14, 'Pec Deck', 'Pec Deck Machine', 'Machine d''isolation pour les pectoraux. Gardez le dos bien plaqué.', 'pec-deck'),
(15, 'Pompes', 'Push Ups', 'Mains largeur d''épaules, corps bien droit.', 'push-ups'),
(16, 'Pompes Diamant', 'Diamond Push Ups', 'Mains jointes sous la poitrine pour cibler les triceps et l''intérieur des pecs.', 'diamond-push-ups'),
(17, 'Pompes Archet', 'Archer Push Ups', 'Descendez d''un côté à la fois en gardant l''autre bras tendu.', 'archer-push-ups'),
(18, 'Pompes Large', 'Wide Push Ups', 'Mains très écartées pour un focus maximal sur les pectoraux.', 'wide-push-ups'),
(19, 'Développé Guillotine', 'Guillotine Press', 'Barre descendue vers le cou. Attention : charge légère uniquement.', 'guillotine-press'),
(20, 'Svend Press', 'Svend Press', 'Pressez un disque entre vos mains et tendez les bras devant vous.', 'svend-press'),
(21, 'Pullover Haltère', 'Dumbbell Pullover', 'Allongé, descendez l''haltère derrière la tête pour ouvrir la cage thoracique.', 'dumbbell-pullover'),
(22, 'Pullover Barre', 'Barbell Pullover', 'Variante à la barre pour l''expansion thoracique.', 'barbell-pullover'),
(23, 'Développé Prise Serrée', 'Close Grip Bench Press', 'Mains largeur d''épaules pour cibler les triceps et l''intérieur des pecs.', 'close-grip-bench-press'),
(24, 'Pompes Déclinées', 'Decline Push Ups', 'Pieds surélevés pour cibler le haut des pectoraux.', 'decline-push-ups'),

-- --- Dos / Pull
(25, 'Tractions Pronation', 'Pull Ups', 'Prise large, paumes vers l''avant. Tirez le menton au-dessus de la barre.', 'pull-ups'),
(26, 'Tractions Supination', 'Chin Ups', 'Paumes vers soi. Engage fortement les biceps.', 'chin-ups'),
(27, 'Tractions Neutre', 'Neutral Grip Pull Ups', 'Paumes face à face. Plus confortable pour les épaules.', 'neutral-pull-ups'),
(28, 'Soulevé de Terre', 'Deadlift', 'Dos plat, poussez avec les jambes. La barre frôle les tibias.', 'deadlift'),
(29, 'Rowing Barre', 'Bent Over Barbell Row', 'Buste penché, tirez la barre vers le nombril.', 'barbell-row'),
(30, 'Tirage Poitrine', 'Lat Pulldown', 'Tirez la barre vers le haut des pectoraux, buste légèrement incliné.', 'lat-pulldown'),
(31, 'Rowing Bûcheron', 'One Arm Dumbbell Row', 'Un genou sur le banc, tirez l''haltère vers la hanche.', 'dumbbell-row'),
(32, 'Tirage Horizontal Poulie', 'Seated Cable Row', 'Tirez la poignée vers le ventre en serrant les omoplates.', 'seated-row'),
(33, 'Rowing T-Bar', 'T-Bar Row', 'Rowing avec barre T ou mine. Focus épaisseur du dos.', 't-bar-row'),
(34, 'Pull Over Poulie Haute', 'Straight Arm Lat Pulldown', 'Bras tendus, tirez la barre vers les cuisses.', 'straight-arm-pulldown'),
(35, 'Shrugs Barre', 'Barbell Shrugs', 'Haussez les épaules vers les oreilles. Ne roulez pas les épaules.', 'barbell-shrugs'),
(36, 'Shrugs Haltères', 'Dumbbell Shrugs', 'Mouvement de haussement d''épaules avec haltères.', 'dumbbell-shrugs'),
(37, 'Oiseau buste penché', 'Rear Delt Flyes', 'Buste penché, élevez les bras sur le côté pour l''arrière d''épaule.', 'rear-delt-flyes'),
(38, 'Face Pull', 'Face Pull', 'Tirez la corde vers le front en écartant les mains.', 'face-pull'),
(39, 'Extensions Lombaires', 'Back Extensions', 'Enroulez et déroulez le dos sur le banc à lombaires.', 'back-extensions'),
(40, 'Good Morning', 'Good Morning', 'Barre sur les trapèzes, penchez le buste en poussant les fesses en arrière.', 'good-morning'),
(41, 'Rowing Meadows', 'Meadows Row', 'Rowing unilatéral à la mine avec prise pronation.', 'meadows-row'),

-- --- Jambes / Legs
(42, 'Squat Barre', 'Barbell Squat', 'Barre sur les trapèzes, descendez fesses en arrière, dos droit.', 'barbell-squat'),
(43, 'Front Squat', 'Front Squat', 'Barre sur l''avant des épaules. Buste très vertical.', 'front-squat'),
(44, 'Presse à Cuisses', 'Leg Press', 'Pieds largeur d''épaules, ne verrouillez pas les genoux.', 'leg-press'),
(45, 'Fentes Marchées', 'Walking Lunges', 'Faites des pas en alternant, le genou frôle le sol.', 'walking-lunges'),
(46, 'Fentes Bulgares', 'Bulgarian Split Squat', 'Un pied surélevé derrière vous sur un banc.', 'bulgarian-split-squat'),
(47, 'Leg Extension', 'Leg Extension', 'Extension des jambes à la machine pour isoler les quadriceps.', 'leg-extension'),
(48, 'Soulevé de Terre Jambes Tendues', 'Stiff Leg Deadlift', 'Descendez la barre le long des jambes en gardant les genoux fixes.', 'stiff-leg-deadlift'),
(49, 'Leg Curl Allongé', 'Lying Leg Curl', 'Ramenez les talons vers les fesses sur le ventre.', 'lying-leg-curl'),
(50, 'Leg Curl Assis', 'Seated Leg Curl', 'Variante assise pour l''isolation des ischios.', 'seated-leg-curl'),
(51, 'Hip Thrust', 'Hip Thrust', 'Dos sur le banc, barre sur les hanches, levez le bassin.', 'hip-thrust'),
(52, 'Kickback Poulie', 'Cable Kickback', 'Envoyez la jambe vers l''arrière à la poulie basse.', 'cable-kickback'),
(53, 'Goblet Squat', 'Goblet Squat', 'Squat avec haltère tenu contre la poitrine.', 'goblet-squat'),
(54, 'Hack Squat', 'Hack Squat Machine', 'Squat à la machine guidée inclinée.', 'hack-squat'),
(55, 'Mollets Debout Machine', 'Standing Calf Raise', 'Extension des mollets debout à la machine.', 'standing-calf-raise'),
(56, 'Mollets Debout Haltères', 'Dumbbell Calf Raise', 'Extension des mollets debout avec haltères.', 'dumbbell-calf-raise'),
(57, 'Mollets Assis', 'Seated Calf Raise', 'Cible spécifiquement le muscle soléaire.', 'seated-calf-raise'),
(58, 'Abducteurs Machine', 'Hip Abductor', 'Écartez les jambes à la machine.', 'hip-abductor'),
(59, 'Adducteurs Machine', 'Hip Adductor', 'Serrez les jambes à la machine.', 'hip-adductor'),
(60, 'Sissy Squat', 'Sissy Squat', 'Flexion de genou buste penché en arrière. Étirement des quads.', 'sissy-squat'),

-- --- Épaules
(61, 'Développé Militaire Barre', 'Barbell Overhead Press', 'Poussez la barre au dessus de la tête debout.', 'military-press'),
(62, 'Développé Militaire Haltères', 'Dumbbell Shoulder Press', 'Variante aux haltères du développé militaire.', 'dumbbell-shoulder-press'),
(63, 'Développé Haltères Assis', 'Seated Dumbbell Press', 'Plus stable que debout, cible le deltoïde antérieur.', 'seated-dumbbell-press'),
(64, 'Élévations Latérales Machine', 'Machine Lateral Raise', 'Isolation du deltoïde latéral à la machine.', 'machine-lateral-raise'),
(65, 'Élévations Latérales Haltères', 'Dumbbell Lateral Raise', 'Levez les haltères sur le côté jusqu''à l''horizontale.', 'lateral-raise'),
(66, 'Élévations Frontales Barre', 'Barbell Front Raise', 'Levez la barre devant vous bras tendus.', 'barbell-front-raise'),
(67, 'Élévations Frontales Haltères', 'Dumbbell Front Raise', 'Levez les haltères devant vous alternativement.', 'dumbbell-front-raise'),
(68, 'Tirage Menton', 'Upright Row', 'Tirez la barre ou poulie vers le menton, coudes hauts.', 'upright-row'),
(69, 'Développé Arnold', 'Arnold Press', 'Développé avec rotation des poignets.', 'arnold-press'),
(70, 'Élévations Latérales Poulie', 'Cable Lateral Raise', 'Élévations latérales unilatérales à la poulie basse.', 'cable-lateral-raise'),
(71, 'Élévations Buste Penché', 'Rear Delt Fly', 'Même que l''oiseau, focus arrière d''épaule.', 'rear-delt-fly'),
(72, 'Y-Raise', 'Dumbbell Y-Raise', 'Levez les haltères en forme de Y, focus trapèzes et épaules.', 'y-raise'),

-- --- Bras
(73, 'Curl Inversé', 'Reverse Barbell Curl', 'Paumes vers le bas pour cibler le dessus des avant-bras.', 'reverse-curl'),
(74, 'Curl Barre Supination', 'Barbell Curl', 'Le classique pour le volume des biceps.', 'barbell-curl'),
(75, 'Curl Haltères', 'Dumbbell Curl', 'Curl avec haltères en alterné ou simultané.', 'dumbbell-curl'),
(76, 'Curl Marteau', 'Hammer Curl', 'Prise neutre, focus brachial et avant-bras.', 'hammer-curl'),
(77, 'Curl Pupitre (Larry Scott)', 'Preacher Curl', 'Bras posés sur le pupitre pour isoler le biceps.', 'preacher-curl'),
(78, 'Curl Incliné', 'Incline Dumbbell Curl', 'Assis incliné pour étirer la longue portion du biceps.', 'incline-dumbbell-curl'),
(79, 'Curl Araignée', 'Spider Curl', 'Ventre sur banc incliné, bras ballants pour la contraction.', 'spider-curl'),
(80, 'Curl Concentration', 'Concentration Curl', 'Assis, coude calé sur la cuisse.', 'concentration-curl'),
(81, 'Extension Triceps Poulie', 'Triceps Pushdown', 'Poussez la barre ou corde vers le bas.', 'triceps-pushdown'),
(82, 'Barre au Front', 'Skull Crushers', 'Allongé, barre EZ vers le front.', 'skull-crushers'),
(83, 'Haltères au Front', 'Dumbbell Skull Crushers', 'Variante aux haltères de la barre au front.', 'dumbbell-skull-crushers'),
(84, 'Extension Nuque', 'Overhead Triceps Extension', 'Extension verticale bras levé.', 'overhead-extension'),
(85, 'Kickback Haltère', 'Dumbbell Kickback', 'Extension de l''avant-bras vers l''arrière buste penché.', 'kickback'),
(86, 'Dips banc', 'Bench Dips', 'Appui sur un banc, descendez les fesses vers le sol.', 'bench-dips'),

-- --- Abdominaux
(87, 'Crunch Sol', 'Crunch', 'Enroulement vertébral classique au sol.', 'crunch'),
(88, 'Relevé de Jambes (Suspendu)', 'Hanging Leg Raise', 'Enroulez le bassin en étant suspendu à la barre.', 'hanging-leg-raise'),
(89, 'Relevé de Bassin (Sol)', 'Leg Raises', 'Allongé, levez les jambes vers le plafond.', 'leg-raises'),
(90, 'Planche (Gainage)', 'Plank', 'Maintenez le corps droit en appui sur les avant-bras.', 'plank'),
(91, 'Planche Latérale', 'Side Plank', 'Gainage sur le côté pour les obliques.', 'side-plank'),
(92, 'Roue Abdominale', 'Ab Wheel Rollout', 'Roulez vers l''avant en gardant le dos neutre.', 'ab-wheel'),
(93, 'Russian Twist', 'Russian Twist', 'Rotation du buste assis pieds décollés.', 'russian-twist'),
(94, 'Bucheron à la poulie', 'Cable Woodchopper', 'Traction diagonale à la poulie pour les obliques.', 'woodchopper'),
(95, 'Vacuum', 'Stomach Vacuum', 'Aspirez le nombril vers la colonne en apnée.', 'vacuum'),
(96, 'Crunch à la Poulie', 'Cable Crunch', 'Enroulement du buste à genoux avec la corde.', 'cable-crunch');

INSERT INTO data.association_exercises_muscles (id_exercise, id_muscle, is_focus) VALUES

-- ================= PECTORAUX (Exos 1-24) =================

-- 1. Développé Couché Barre (Pec Moyen + Triceps + Epaule Ant)
(1, 2, true), (1, 18, false), (1, 13, false),
-- 2. Développé Incliné Barre (Pec Haut + Epaule Ant)
(2, 1, true), (2, 13, false),
-- 3. Développé Décliné Barre (Pec Bas + Triceps)
(3, 3, true), (3, 18, false),
-- 4. Développé Couché Haltères
(4, 2, true), (4, 13, false),
-- 5. Développé Incliné Haltères
(5, 1, true), (5, 13, false),
-- 6. Développé Décliné Haltères
(6, 3, true),
-- 7. Dips (Pec Bas + Triceps Long)
(7, 3, true), (7, 17, true), (7, 13, false),
-- 8. Écarté Couché Haltères
(8, 2, true),
-- 9. Poulie Vis-à-vis (Hauteur Pecs)
(9, 2, true),
-- 10. Poulie Basse (Vers le haut -> Pec Haut)
(10, 1, true),
-- 11. Standing Cable Flyes (Pec Moyen)
(11, 2, true),
-- 12. Poulie Haute (Vers le bas -> Pec Bas)
(12, 3, true),
-- 13. Poulie Basse (Doublon logique avec le 10, focus Haut)
(13, 1, true),
-- 14. Pec Deck
(14, 2, true), (14, 13, false),
-- 15. Pompes
(15, 2, true), (15, 18, false), (15, 13, false),
-- 16. Pompes Diamant (Triceps + Pec Interne)
(16, 17, true), (16, 2, false),
-- 17. Pompes Archet
(17, 2, true),
-- 18. Pompes Large
(18, 2, true),
-- 19. Guillotine Press (Pec Haut extrême)
(19, 1, true),
-- 20. Svend Press (Pec Interne)
(20, 2, true),
-- 21. Pullover Haltère (Dorsal + Pec)
(21, 6, true), (21, 2, false), (21, 5, false),
-- 22. Pullover Barre
(22, 6, true), (22, 2, false),
-- 23. Développé Prise Serrée (Triceps + Pec)
(23, 17, true), (23, 2, false),
-- 24. Pompes Déclinées (Pec Haut)
(24, 1, true),

-- ================= DOS (Exos 25-41) =================

-- 25. Tractions Pronation (Grand Dorsal + Grand Rond)
(25, 6, true), (25, 11, false), (25, 21, false),
-- 26. Tractions Supination (Dorsal + Biceps)
(26, 6, true), (26, 21, true),
-- 27. Tractions Neutre (Dorsal + Brachial)
(27, 6, true), (27, 22, false),
-- 28. Soulevé de Terre (Lombaires + Fessiers + Ischios)
(28, 12, true), (28, 35, false), (28, 30, false), (28, 7, false),
-- 29. Rowing Barre (Dorsal + Rhomboïdes)
(29, 6, true), (29, 10, false), (29, 8, false),
-- 30. Tirage Poitrine (Dorsal + Grand Rond)
(30, 6, true), (30, 11, false),
-- 31. Rowing Bûcheron (Dorsal)
(31, 6, true), (31, 21, false),
-- 32. Tirage Horizontal (Trapèzes Moyens + Rhomboïdes)
(32, 8, true), (32, 10, true), (32, 6, false),
-- 33. Rowing T-Bar (Epaisseur Dos)
(33, 8, true), (33, 6, true),
-- 34. Pull Over Poulie Haute (Isolation Dorsal)
(34, 6, true), (34, 17, false),
-- 35. Shrugs Barre (Trapèzes Sup)
(35, 7, true),
-- 36. Shrugs Haltères
(36, 7, true),
-- 37. Oiseau Buste Penché (Delto Postérieur)
(37, 15, true), (37, 10, false),
-- 38. Face Pull (Delto Post + Coiffe + Trapèzes)
(38, 15, true), (38, 16, true), (38, 8, false),
-- 39. Extensions Lombaires
(39, 12, true), (39, 35, false),
-- 40. Good Morning (Lombaires + Ischios)
(40, 12, true), (40, 30, true),
-- 41. Rowing Meadows
(41, 6, true), (41, 20, false),

-- ================= JAMBES (Exos 42-60) =================

-- 42. Squat Barre (Quadriceps + Fessiers)
(42, 26, true), (42, 27, true), (42, 35, false),
-- 43. Front Squat (Focus Quads)
(43, 26, true), (43, 28, true),
-- 44. Presse à Cuisses (Quads)
(44, 27, true), (44, 28, true),
-- 45. Fentes Marchées (Fessiers + Quads)
(45, 35, true), (45, 26, false),
-- 46. Fentes Bulgares (Fessiers)
(46, 35, true), (46, 26, false),
-- 47. Leg Extension (Quads Isolation)
(47, 26, true), (47, 28, true),
-- 48. RDL (Ischios + Fessiers)
(48, 30, true), (48, 35, false),
-- 49. Leg Curl Allongé (Ischios)
(49, 30, true),
-- 50. Leg Curl Assis
(50, 30, true),
-- 51. Hip Thrust (Grand Fessier)
(51, 35, true), (51, 30, false),
-- 52. Kickback Poulie (Grand Fessier)
(52, 35, true),
-- 53. Goblet Squat
(53, 26, true), (53, 35, false),
-- 54. Hack Squat
(54, 27, true), (54, 26, true),
-- 55. Mollets Debout Machine (Jumeaux)
(55, 33, true),
-- 56. Mollets Debout Haltères
(56, 33, true),
-- 57. Mollets Assis (Soléaire)
(57, 34, true),
-- 58. Abducteurs (Moyen Fessier)
(58, 36, true),
-- 59. Adducteurs
(59, 31, true),
-- 60. Sissy Squat (Droit Fémoral)
(60, 26, true),

-- ================= ÉPAULES (Exos 61-72) =================

-- 61. Développé Militaire (Delto Ant)
(61, 13, true), (61, 17, false),
-- 62. Développé Militaire Haltères
(62, 13, true),
-- 63. Développé Assis
(63, 13, true),
-- 64. Latérales Machine (Delto Latéral)
(64, 14, true),
-- 65. Latérales Haltères
(65, 14, true),
-- 66. Frontales Barre (Delto Ant)
(66, 13, true),
-- 67. Frontales Haltères
(67, 13, true),
-- 68. Tirage Menton (Delto Lat + Trapèzes)
(68, 14, true), (68, 7, true),
-- 69. Arnold Press
(69, 13, true), (69, 14, false),
-- 70. Latérales Poulie
(70, 14, true),
-- 71. Oiseau (Postérieur)
(71, 15, true),
-- 72. Y-Raise (Latéral + Trapèzes Inf)
(72, 14, true), (72, 9, true),

-- ================= BRAS (Exos 73-86) =================

-- 73. Curl Inversé (Extenseurs + Brachial)
(73, 25, true), (73, 22, true),
-- 74. Curl Barre (Biceps)
(74, 21, true), (74, 20, true),
-- 75. Curl Haltères
(75, 21, true),
-- 76. Marteau (Brachial + Brachio-radial)
(76, 22, true), (76, 23, true),
-- 77. Pupitre (Courte portion)
(77, 21, true),
-- 78. Incliné (Longue portion)
(78, 20, true),
-- 79. Araignée
(79, 21, true),
-- 80. Concentration
(80, 21, true),
-- 81. Triceps Poulie (Vaste Latéral)
(81, 18, true),
-- 82. Barre au Front (Longue portion)
(82, 17, true),
-- 83. Haltères au Front
(83, 17, true),
-- 84. Extension Nuque
(84, 17, true),
-- 85. Kickback
(85, 18, true),
-- 86. Dips Banc
(86, 18, true), (86, 19, true),

-- ================= ABDOS (Exos 87-96) =================

-- 87. Crunch Sol (Grand Droit)
(87, 37, true),
-- 88. Relevé Jambes Suspendu (Grand Droit + Psoas)
(88, 37, true), (88, 32, false),
-- 89. Relevé Bassin
(89, 37, true),
-- 90. Planche (Transverse)
(90, 39, true),
-- 91. Planche Latérale (Obliques)
(91, 38, true),
-- 92. Roue Abdominale
(92, 37, true), (92, 39, true),
-- 93. Russian Twist (Obliques)
(93, 38, true),
-- 94. Woodchopper (Obliques)
(94, 38, true),
-- 95. Vacuum (Transverse)
(95, 39, true),
-- 96. Crunch Poulie
(96, 37, true);

INSERT INTO data.exercises_equipment (id_exercise, id_equipment, optional) VALUES

-- ================= PECTORAUX (1-24) =================

-- 1. Développé Couché Barre (Barre + Banc Plat + Rack optionnel)
(1, 4, false), (1, 9, false), (1, 16, true),
-- 2. Développé Incliné Barre (Barre + Banc Incliné + Rack optionnel)
(2, 4, false), (2, 10, false), (2, 16, true),
-- 3. Développé Décliné Barre (Barre + Banc Décliné + Rack optionnel)
(3, 4, false), (3, 11, false), (3, 16, true),
-- 4. Développé Couché Haltères (Haltères + Banc Plat)
(4, 1, false), (4, 9, false),
-- 5. Développé Incliné Haltères (Haltères + Banc Incliné)
(5, 1, false), (5, 10, false),
-- 6. Développé Décliné Haltères (Haltères + Banc Décliné)
(6, 1, false), (6, 11, false),
-- 7. Dips (Station Dips + Lest optionnel)
(7, 14, false), (7, 3, true),
-- 8. Écarté Couché Haltères (Haltères + Banc Plat)
(8, 1, false), (8, 9, false),
-- 9 à 13. Poulies (Machine à Poulie)
(9, 19, false),
(10, 19, false), (10, 9, false), -- Couché poulie basse = besoin banc
(11, 19, false),
(12, 19, false),
(13, 19, false),
-- 14. Pec Deck (Machine)
(14, 18, false),
-- 15. Pompes (Poids du corps + Tapis optionnel)
(15, 20, true),
-- 16 à 18. Variantes Pompes
 (16, 20, true),
 (17, 20, true),
 (18, 20, true),
-- 19. Guillotine Press (Barre + Banc)
(19, 4, false), (19, 9, false),
-- 20. Svend Press (Disque)
(20, 3, false),
-- 21. Pullover Haltère (Haltère + Banc)
(21, 1, false), (21, 9, false),
-- 22. Pullover Barre (Barre + Banc)
(22, 4, false), (22, 9, false),
-- 23. Développé Prise Serrée (Barre + Banc)
(23, 4, false), (23, 9, false),
-- 24. Pompes Déclinées (Poids corps + Banc pour les pieds)
(24, 9, false),

-- ================= DOS (25-41) =================

-- 25 à 27. Tractions (Barre de traction)
(25, 15, false),
(26, 15, false),
(27, 15, false),
-- 28. Soulevé de Terre (Barre)
(28, 4, false),
-- 29. Rowing Barre (Barre)
(29, 4, false),
-- 30. Tirage Poitrine (Poulie/Machine)
(30, 19, false),
-- 31. Rowing Bûcheron (Haltère + Banc)
(31, 1, false), (31, 9, false),
-- 32. Tirage Horizontal (Poulie)
(32, 19, false),
-- 33. Rowing T-Bar (Barre T)
(33, 7, false),
-- 34. Pull Over Poulie Haute (Poulie)
(34, 19, false),
-- 35. Shrugs Barre (Barre)
(35, 4, false),
-- 36. Shrugs Haltères (Haltères)
(36, 1, false),
-- 37. Oiseau (Haltères)
(37, 1, false),
-- 38. Face Pull (Poulie)
(38, 19, false),
-- 39. Extensions Lombaires (Banc lombaires)
(39, 12, false),
-- 40. Good Morning (Barre)
(40, 4, false),
-- 41. Rowing Meadows (Landmine + Barre)
(41, 8, false), (41, 4, false),

-- ================= JAMBES (42-60) =================

-- 42. Squat Barre (Barre + Rack)
(42, 4, false), (42, 16, false),
-- 43. Front Squat (Barre + Rack)
(43, 4, false), (43, 16, false),
-- 44. Presse (Machine)
(44, 18, false),
-- 45. Fentes Marchées (Haltères)
(45, 1, false),
-- 46. Fentes Bulgares (Haltères + Banc)
(46, 1, false), (46, 9, false),
-- 47. Leg Extension (Machine)
(47, 18, false),
-- 48. RDL (Barre)
(48, 4, false),
-- 49. Leg Curl Allongé (Machine)
(49, 18, false),
-- 50. Leg Curl Assis (Machine)
(50, 18, false),
-- 51. Hip Thrust (Barre + Banc)
(51, 4, false), (51, 9, false),
-- 52. Kickback (Poulie)
(52, 19, false),
-- 53. Goblet Squat (Haltère)
(53, 1, false),
-- 54. Hack Squat (Machine)
(54, 18, false),
-- 55. Mollets Debout Machine
(55, 18, false),
-- 56. Mollets Debout Haltères
(56, 1, false),
-- 57. Mollets Assis (Machine)
(57, 18, false),
-- 58. Abducteurs (Machine)
(58, 18, false),
-- 59. Adducteurs (Machine)
(59, 18, false),

-- ================= ÉPAULES (61-72) =================

-- 61. Développé Militaire (Barre + Rack optionnel)
(61, 4, false), (61, 16, true),
-- 62. Développé Militaire Haltères (Haltères)
(62, 1, false),
-- 63. Développé Assis (Haltères + Banc Incliné à 90)
(63, 1, false), (63, 10, false),
-- 64. Latérales Machine
(64, 18, false),
-- 65. Latérales Haltères
(65, 1, false),
-- 66. Frontales Barre
(66, 4, false),
-- 67. Frontales Haltères
(67, 1, false),
-- 68. Tirage Menton (Barre)
(68, 4, false),
-- 69. Arnold Press (Haltères + Banc Incliné 90)
(69, 1, false), (69, 10, false),
-- 70. Latérales Poulie
(70, 19, false),
-- 71. Oiseau Buste Penché (Haltères)
(71, 1, false),
-- 72. Y-Raise (Haltères + Banc Incliné)
(72, 1, false), (72, 10, false),

-- ================= BRAS (73-86) =================

-- 73. Curl Inversé (Barre)
(73, 4, false),
-- 74. Curl Barre (Barre)
(74, 4, false),
-- 75. Curl Haltères (Haltères)
(75, 1, false),
-- 76. Curl Marteau (Haltères)
(76, 1, false),
-- 77. Pupitre Larry Scott (Barre EZ + Pupitre)
(77, 6, false), (77, 13, false),
-- 78. Curl Incliné (Haltères + Banc Incliné)
(78, 1, false), (78, 10, false),
-- 79. Curl Araignée (Barre EZ + Banc Incliné)
(79, 6, false), (79, 10, false),
-- 80. Curl Concentration (Haltère + Banc)
(80, 1, false), (80, 9, false),
-- 81. Triceps Poulie (Poulie)
(81, 19, false),
-- 82. Barre au Front (Barre EZ + Banc)
(82, 6, false), (82, 9, false),
-- 83. Haltères au Front (Haltères + Banc)
(83, 1, false), (83, 9, false),
-- 84. Extension Nuque (Haltère)
(84, 1, false),
-- 85. Kickback Haltère (Haltère + Banc)
(85, 1, false), (85, 9, false),
-- 86. Dips Banc (Banc)
(86, 9, false),

-- ================= ABDOS (87-96) =================

-- 87. Crunch (Poids corps + Tapis)
 (87, 20, true),
-- 88. Relevé Suspendu (Barre traction)
(88, 15, false),
-- 89. Relevé Bassin (Poids corps + Tapis)
 (89, 20, true),
-- 90. Planche (Poids corps + Tapis)
 (90, 20, true),
-- 91. Planche Latérale (Poids corps + Tapis)
(91, 20, true),
-- 92. Roue Abdominale (Roue)
(92, 21, false),
-- 93. Russian Twist (Disque de poids)
(93, 3, false),
-- 94. Woodchopper (Poulie)
(94, 19, false),
-- 95. Vacuum (Poids corps)
-- 96. Crunch Poulie (Poulie)
(96, 19, false);