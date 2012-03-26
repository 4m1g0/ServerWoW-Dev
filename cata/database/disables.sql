delete from disables where `comment` like '[LCV]%';

-- Trial of champion 
INSERT INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (2, 650, 3, '[LCV]Close: Trial of champion');

-- Halls of reflection 
INSERT INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (2, 668, 3, '[LCV]Close: Halls of reflection ');

-- Icecrown citadel
-- INSERT INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (2, 631, 15, '[LCV]Close: Icecrown citadel');

-- Ruby sanctrum
-- INSERT INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (2, 724, 15, '[LCV]Close: Ruby sanctrum');

-- Vault of archavon
INSERT INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (2, 624, 3, '[LCV]Close: Vault of archavon');



-- Isle of Conquest
INSERT INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (3, 30, 0, '[LCV]Close: Isle of Conquest');

-- Spell Eye of kilrogg
INSERT INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 126, 1, '[LCV]Disable: Eye of Kilrogg');

-- Spell Eyes of the Beast 
INSERT INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 1002, 1, '[LCV]Disable: Eyes of the Beast');

-- Spells: Mithril Mechanical Dragonling and Winterfin First Responder (summon lots of npcs)
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 12624, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 23050, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 23075, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 3969, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 4073, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 23051, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 23075, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 23076, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 12736, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 19802, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 27602, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 19804, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 19830, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 23052, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 23074, 1, '[LCV]Disable: dragonizo mecánico de mitril');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 12749, 1, '[LCV]Disable: Winterfin First Responder');
INSERT IGNORE INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 48739, 1, '[LCV]Disable: Mithril Mechanical Dragonling');

-- Spells que permiten sanacion instantanea, importante en cata
INSERT INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 65455, 1, '[LCV]Disable: Furia de la naturaleza');
INSERT INTO disables (`sourceType`, `entry`, `flags`, `comment`) VALUES (0, 80987, 1, '[LCV]Disable: Juego de parches Venaprofunda');

-- Fix critical exploit https://github.com/TrinityCore/TrinityCore/pull/3567
INSERT INTO `disables` VALUES
(0, 23397, 3, '', '', '[LCV]CURRENTLY A SOURCE OF BUG ABUSE - Allows Warriors to stack Berserker Stance passive auras indefinitely and for use in all stances'),
(0, 23398, 3, '', '', '[LCV]CURRENTLY A SOURCE OF BUG ABUSE - Allows Druids to stack Cat Form passive auras indefinitely and for use in all stances');



