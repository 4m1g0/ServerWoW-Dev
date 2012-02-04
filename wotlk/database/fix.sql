/*-- ############
-- # ICC Work #
-- ############
-- APLICAR UNA SOLA VEZ
-- mobs first part
-- dmg
UPDATE creature_template SET mindmg=488, maxdmg=620, attackpower=642, minrangedmg=350, maxrangedmg=530, rangedattackpower=121 WHERE entry IN (37011, 38061);
UPDATE creature_template SET attackpower=632 WHERE entry IN (36724, 38057);
UPDATE creature_template SET attackpower=792 WHERE entry IN (37007, 38031);
UPDATE creature_template SET attackpower=642 WHERE entry IN (37012, 38059);
UPDATE creature_template SET dmg_multiplier=dmg_multiplier*2, baseattacktime=1000, rangeattacktime=1000 WHERE entry IN (37011, 36724, 37007, 37012);
UPDATE creature_template SET dmg_multiplier=dmg_multiplier*4, baseattacktime=1000, rangeattacktime=1000 WHERE entry IN (38061, 38057, 38031, 38059);
-- Inmune
UPDATE creature_template SET mechanic_immune_mask=667893759 WHERE entry IN (37011, 38061, 36724, 38057, 37007, 38031, 37012, 38059);
-- respawns all ICC
UPDATE creature SET spawntimesecs=604800 WHERE spawntimesecs < 100000 AND spawntimesecs > 30 AND map=631;

-- mobs second part
-- dmg
UPDATE creature_template SET attackpower=326 WHERE entry IN (36808, 38075);
UPDATE creature_template SET attackpower=782 WHERE entry IN (36805, 38076);
UPDATE creature_template SET attackpower=726 WHERE entry IN (36811, 38072);
UPDATE creature_template SET attackpower=330 WHERE entry IN (36807, 38073);
UPDATE creature_template SET attackpower=669 WHERE entry IN (37890, 38393, 38628, 38629);
UPDATE creature_template SET attackpower=642 WHERE entry IN (38009, 38398, 38630, 38631);
UPDATE creature_template SET attackpower=642 WHERE entry IN (38135, 38395, 38634, 38635);
UPDATE creature_template SET attackpower=608 WHERE entry IN (38136, 38396, 38632, 38633);
UPDATE creature_template SET dmg_multiplier=14 WHERE entry IN (38009, 38398, 38630, 38631);
UPDATE creature_template SET dmg_multiplier=14 WHERE entry IN (38135, 38395, 38634, 38635);
UPDATE creature_template SET dmg_multiplier=14 WHERE entry IN (38136, 38396, 38632, 38633);
UPDATE creature_template SET dmg_multiplier=19.4 WHERE entry = 36807;
UPDATE creature_template SET dmg_multiplier=24.1 WHERE entry = 38073;
UPDATE creature_template SET dmg_multiplier=23 WHERE entry = 36805;
UPDATE creature_template SET dmg_multiplier=23 WHERE entry = 36805;
UPDATE creature_template SET baseattacktime=1000, rangeattacktime=1000 WHERE entry IN (36808, 38075, 36805, 38076, 36811, 38072, 36807, 38073, 37890, 38393, 38628, 38629, 38009, 38398, 38630, 38631, 38135, 38395, 38634, 38635, 38136, 38396, 38632, 38633, 38009, 38398, 38630, 38631, 38135, 38395, 38634, 38635, 38136, 38396, 38632, 38633) AND baseattacktime =2000;
UPDATE creature_template SET dmg_multiplier=dmg_multiplier*2 WHERE entry IN (38075, 38076, 38072, 38073, 38393, 38398, 38395, 38396, 38398, 38395, 38396);

-- Inmunemask para las babas de profesor putricio, canalizan mucho daño y no deben ser cortadas
update creature_template set mechanic_immune_mask = 617299839 where entry in (37697, 38604, 38758, 38759); 
update creature_template set mechanic_immune_mask = 617299839 where entry in (37562, 38602, 38760, 38761);
*/
-- Añadido spawn de Lok'lira the Crone para hijos de hodir FROM ytdb (29975)
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES('900000','29975','571','1','1','0','0','6917.26','-1541.88','833.81','1.11376','600','0','0','12175','0','0','0','0','0');

-- InhabitType de este npc debe ser 4 para que se mantenga en el aire y el vehicle id para que el arpon surta efecto sobre el.
UPDATE creature_template SET inhabittype=4, vehicleid=197 WHERE entry=29754;

-- Asignado el spell correcto a la quest Disncipline
UPDATE smart_scripts SET event_param1=56033 WHERE entryorguid=30146 AND id=1;

-- Eliminada quest incorrecta de un npc, la quest correcta es 10870 y no 10871 la segunda debio ser marcada como obsoleta por blizzard
DELETE FROM creature_questrelation WHERE id=22112 AND quest=10871;

-- Corregidas immunidades de las valkyr en el encuentro del rey exanime
UPDATE creature_template SET mechanic_immune_mask = 617299839 WHERE entry IN (36609, 39120, 39121, 39122);

-- Añadidas inmunidades a los bosses de TOC (data ytdb)
UPDATE creature_template SET mechanic_immune_mask = 803160063 WHERE entry IN (34796, 35438, 35439, 35440);
UPDATE creature_template SET mechanic_immune_mask = 803160063 WHERE entry IN (35144, 35511, 35512, 35513);
UPDATE creature_template SET mechanic_immune_mask = 803160063 WHERE entry IN (34799, 35514, 35515, 35516);
UPDATE creature_template SET mechanic_immune_mask = 803160063 WHERE entry IN (34797, 35447, 35448, 35449);
UPDATE creature_template SET mechanic_immune_mask = 803160063 WHERE entry IN (34780, 35216, 35268, 35269);
UPDATE creature_template SET mechanic_immune_mask = 668942335 WHERE entry IN (34497, 35350, 35351, 35352);
UPDATE creature_template SET mechanic_immune_mask = 769605631 WHERE entry IN (34496, 35347, 35348, 35349);
UPDATE creature_template SET mechanic_immune_mask = 650854235 WHERE entry IN (34564, 34566, 35615, 35616);
