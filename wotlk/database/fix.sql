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


-- Reducida la probabilidad de alterac en bg aleatoria.
UPDATE battleground_template SET weight = 3;
UPDATE battleground_template SET weight = 1 WHERE id = 1;


-- [Quest] Plan B (11658)
SET @ENTRY_GUARD := 25342; -- Dead Caravan Guard
SET @ENTRY_WORKER := 25343; -- Dead Caravan Worker
SET @ITEM := 34842; -- Warsong Outfit
SET @GOSSIP_1 := 9155;
SET @GOSSIP_2 := 9156;
SET @QUEST := 11658; -- Plan B

DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP_1;
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP_2;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(@GOSSIP_1, 12388),
(@GOSSIP_2, 12389);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP_1;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP_2;
INSERT INTO `gossip_menu_option` VALUES
(@GOSSIP_1, 0, 0, 'Retrieve Warsong Outfit.', 1, 1, 0, 0, 0, 0, ''),
(@GOSSIP_2, 0, 0, 'Retrieve Warsong Outfit.', 1, 1, 0, 0, 0, 0, '');

UPDATE `creature_template` SET `npcflag`=`npcflag`|1 WHERE `entry` IN (@ENTRY_GUARD, @ENTRY_WORKER);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=25342 AND `id`=2534201;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=25343 AND `id`=2534301;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@ENTRY_GUARD, @ENTRY_WORKER);
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY_GUARD AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY_WORKER AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(@ENTRY_GUARD, 0, 0, 1, 62, 0, 100, 0, @GOSSIP_1, 0, 0, 0, 56, @ITEM, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[LCV] Dead Caravan Guard - On Gossip Select - Add Item Warsong Outfit'),
(@ENTRY_GUARD, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '[LCV] Dead Caravan Guard - On Gossip Select - Forced Despawn'),
(@ENTRY_WORKER, 0, 0, 1, 62, 0, 100, 0, @GOSSIP_2, 0, 0, 0, 56, @ITEM, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[LCV] Dead Caravan Worker - On Gossip Select - Add Item Warsong Outfit'),
(@ENTRY_WORKER, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '[LCV] Dead Caravan Worker - On Gossip Select - Forced Despawn');

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP_1;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP_2;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, @GOSSIP_1, 0, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, '', '[LCV] Only show gossip if player has quest Plan B'),
(15, @GOSSIP_2, 0, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, '', '[LCV] Only show gossip if player has quest Plan B'),
(15, @GOSSIP_1, 0, 0, 0, 2, 0, @ITEM, 10, 0, 1, 0, '', '[LCV] Only show gossip if player has less then 10 outfits'),
(15, @GOSSIP_2, 0, 0, 0, 2, 0, @ITEM, 10, 0, 1, 0, '', '[LCV] Only show gossip if player has less then 10 outfits');

﻿-- Author: Decode
-- Date: 2012/04/07
-- Quest: Detén la ascensión!
-- ID: 11260

SET @ENTRY := 23671;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,11,0,100,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] set faction to Halfdan "),
(@ENTRY,@SOURCETYPE,1,2,61,0,100,0,0,0,0,0,12,24118,1,60000,0,0,0,8,0,0,0,1698.87,-4111.68,272.314,272.24,"[LCV] Summon Val'kyr "),
-- (@ENTRY,@SOURCETYPE,2,3,61,0,100,0,0,0,0,0,12,24118,1,60000,0,0,0,8,0,0,0,1703.66,-4099.4,272.63,3.7945,"summon"),
(@ENTRY,@SOURCETYPE,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"[LCV] 1 yell OOC"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,1,2,10000000,20000000,1,1,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"[LCV] 2 Yell IC"),
(@ENTRY,@SOURCETYPE,4,0,0,0,100,0,1000,2000,15000,20000,11,19131,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Cast Shield Charge"),
(@ENTRY,@SOURCETYPE,5,0,0,0,100,0,3000,4000,8000,10000,11,32736,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Cast Mortal Strike"),
(@ENTRY,@SOURCETYPE,6,0,0,0,100,0,2000,3000,6000,8000,11,32015,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Cast knockdown"),
(@ENTRY,@SOURCETYPE,7,0,0,0,100,0,6000,8000,10000,12000,11,35263,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Cast Frost Attack"),
(@ENTRY,@SOURCETYPE,8,0,0,0,100,0,6000,8000,8000,10000,11,12169,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Cast Shield Block"),
(@ENTRY,@SOURCETYPE,9,0,2,0,100,0,30,40,20000,25000,11,8599,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Cast Enrage at 30% HP"),
(@ENTRY,@SOURCETYPE,10,0,2,0,100,0,10,25,20000,25000,1,2,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"[LCV] yells at 20%"),
(@ENTRY,@SOURCETYPE,11,13,6,0,100,0,10,0,0,0,45,1,1,0,0,0,0,19,24118,0,0,0.0,0.0,0.0,0.0,"[LCV] Set data to Val'kyr Observer");

DELETE FROM `creature_text` WHERE `entry`=23671;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (23671,0,0,'¿Acaso piensas que no se lo que tratas de hacer?',14,0,100,0,0,0,'1 text');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (23671,1,0,'No detendras mi Ascención, ¡es tiempo de Morir!',14,0,100,0,0,0,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (23671,2,0,'¡No!, ¡No me derrotaras!',14,0,100,0,0,0,'Comment');

-- Val'kyr Observer
SET @ENTRY2 := 24118;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY2 AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY2 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY2,@SOURCETYPE,0,1,38,0,100,0,1,1,0,0,1,0,0,0,0,0,0,21,60,0,0,0.0,0.0,0.0,0.0," [LCV] Yell after death"),
(@ENTRY2,@SOURCETYPE,1,2,61,0,100,0,0,0,0,0,1,1,100000,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"[LCV]Second dialog."),
(@ENTRY2,@SOURCETYPE,2,0,61,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV]Force to despawn");

DELETE FROM `creature_text` WHERE `entry`=24118;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (24118,0,0,'Que Desafortunado, Halfdan',14,0,100,0,0,0,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (24118,1,0,'No eres Digno de la Ascención, Halfdan. ¡Que tu alma conozca el olvido!',14,0,100,0,0,0,'Comment');


-- Author: Amnesio
-- Date: 2012/04/06
-- Quest: Protocolo de emergencia: sección 8.2, párrafo D   
-- ID: 11796

SET @NPC1 := 25845;
SET @NPC2 := 25846;
SET @NPC3 := 25847;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@NPC1, @NPC2, @NPC3);
UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry` IN (@NPC1, @NPC2, @NPC3);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC1, @NPC2, @NPC3) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(@NPC1, 0, 0, 1, 8, 0, 100, 0, 46171, 0, 0, 0, 33, @NPC1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[LCV] Kill credit NPC 25845'),
(@NPC1, 0, 1, 2, 8, 0, 100, 0, 46171, 0, 0, 0, 11, 34386, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '[LCV] Active Skill Create Hellfire Fire'),
(@NPC2, 0, 0, 1, 8, 0, 100, 0, 46171, 0, 0, 0, 33, @NPC2, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[LCV] Kill credit NPC 25846'),
(@NPC2, 0, 1, 2, 8, 0, 100, 0, 46171, 0, 0, 0, 11, 34386, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '[LCV] Active Skill Create Hellfire Fire'),
(@NPC3, 0, 0, 1, 8, 0, 100, 0, 46171, 0, 0, 0, 33, @NPC3, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[LCV] Kill credit NPC 25847'),
(@NPC3, 0, 1, 2, 8, 0, 100, 0, 46171, 0, 0, 0, 11, 34386, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '[LCV] Active Skill Create Hellfire Fire');

DELETE FROM `conditions` WHERE `SourceEntry`=46171;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES
(13,1,46171,0,31,0,3,@NPC1,0,0,0, '','[LCV] Fyx Target 1 - Spell 46171'),
(13,1,46171,1,31,0,3,@NPC2,0,0,0, '','[LCV] Fyx Target 2 - Spell 46171'),
(13,1,46171,2,31,0,3,@NPC3,0,0,0, '','[LCV] Fyx Target 3 - Spell 46171');



-- EXPERIMENTAL!! (more blizzlike dmg multipliers to icc)
-- Lord Marrowgar
UPDATE `creature_template` SET `dmg_multiplier`=55 WHERE `entry`=36612;
UPDATE `creature_template` SET `dmg_multiplier`=85 WHERE `entry`=37957;
UPDATE `creature_template` SET `dmg_multiplier`=75 WHERE `entry`=37958;
UPDATE `creature_template` SET `dmg_multiplier`=100 WHERE `entry`=37959;
-- Lady Deathwhisper
UPDATE `creature_template` SET `dmg_multiplier`=45 WHERE `entry`=36855;
UPDATE `creature_template` SET `dmg_multiplier`=70 WHERE `entry`=38106;
UPDATE `creature_template` SET `dmg_multiplier`=80 WHERE `entry`=38296;
UPDATE `creature_template` SET `dmg_multiplier`=100 WHERE `entry`=38297;
-- Deathbringer Saurfang
UPDATE `creature_template` SET `dmg_multiplier`=60 WHERE `entry`=37813;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38402;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38582;
UPDATE `creature_template` SET `dmg_multiplier`=120 WHERE `entry`=38583;
-- Festergut
UPDATE `creature_template` SET `dmg_multiplier`=75 WHERE `entry`=36626;
UPDATE `creature_template` SET `dmg_multiplier`=115 WHERE `entry`=37504;
UPDATE `creature_template` SET `dmg_multiplier`=115 WHERE `entry`=37505;
UPDATE `creature_template` SET `dmg_multiplier`=150 WHERE `entry`=37506;
-- Rotface
UPDATE `creature_template` SET `dmg_multiplier`=70 WHERE `entry`=36627;
UPDATE `creature_template` SET `dmg_multiplier`=100 WHERE `entry`=38390;
UPDATE `creature_template` SET `dmg_multiplier`=100 WHERE `entry`=38549;
UPDATE `creature_template` SET `dmg_multiplier`=140 WHERE `entry`=38550;
-- Professor Putricide
UPDATE `creature_template` SET `dmg_multiplier`=60 WHERE `entry`=36678;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38431;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38585;
UPDATE `creature_template` SET `dmg_multiplier`=120 WHERE `entry`=38586;
-- Blood Prince Council
UPDATE `creature_template` SET `dmg_multiplier`=65 WHERE `entry` IN (37970, 37973, 37972);
UPDATE `creature_template` SET `dmg_multiplier`=95 WHERE `entry` IN (38401, 38400, 38399);
UPDATE `creature_template` SET `dmg_multiplier`=95 WHERE `entry` IN (38784, 38771, 38769);
UPDATE `creature_template` SET `dmg_multiplier`=130 WHERE `entry` IN (38785, 38772, 38770);
-- Blood Queen Lana'thel
UPDATE `creature_template` SET `dmg_multiplier`=60 WHERE `entry`=37955;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38434;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38435;
UPDATE `creature_template` SET `dmg_multiplier`=120 WHERE `entry`=38436;
-- Sindragosa
UPDATE `creature_template` SET `dmg_multiplier`=60 WHERE `entry`=36853;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38265;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38266;
UPDATE `creature_template` SET `dmg_multiplier`=120 WHERE `entry`=38267;
-- fix damage for sindra 10
UPDATE `creature_template` SET `mindmg`=509, `maxdmg`=683, `attackpower`=805 WHERE `entry`=36853;



-- Author: Decode
-- Date: 2012/04/13
-- Quest: Ninguna piedad con los cautivos
-- ID: 12245
 
-- Insert into gossip_menu_option 
 DELETE FROM `gossip_menu_option` WHERE  `menu_id`=27381;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(27381, 0, 0, 'No, Canciller, no diría que he venido a "rescatarle" per se.', 1, 1, 0, 0, 0, 0, NULL),
(27381, 1, 0, '¿Dónde mantienen cautivo al escribano jefe Barriga?', 1, 1, 101, 0, 0, 0, NULL),
(27381, 2, 0, '¿Viste adónde se llevaron al ingeniero sanitario Burke?', 1, 1, 103, 0, 0, 0, NULL),
(27381, 3, 0, '¿Alguna idea de dónde tienen al guardia de la Muerte Schneider?', 1, 1, 102, 0, 0, 0, NULL);
 
DELETE FROM `gossip_menu_option` WHERE  `menu_id`=27379;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(27379, 0, 0, 'No temas. Tus días como ingeniero sanitario se acercan a su fín.', 1, 1, 0, 0, 0, 0, NULL),
(27379, 1, 0, '¿Puedes decirme dónde tienen enjaulado al Canciller Amai?', 1, 1, 100, 0, 0, 0, NULL),
(27379, 2, 0, '¿Dónde mantienen cautivo al escribano jefe Barriga?', 1, 1, 101, 0, 0, 0, NULL),
(27379, 3, 0, '¿Alguna idea de dónde tienen al guardia de la Muerte Schneider?', 1, 1, 102, 0, 0, 0, NULL);
 
DELETE FROM `gossip_menu_option` WHERE  `menu_id`=27378;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(27378, 0, 0, '¡Hoy no, escribano jefe!', 1, 1, 0, 0, 0, 0, NULL),
(27378, 1, 0, '¿Puedes decirme dónde tienen enjaulado al Canciller Amai?', 1, 1, 100, 0, 0, 0, NULL),
(27378, 2, 0, '¿Viste adónde se llevaron al ingeniero sanitario Burke?', 1, 1, 103, 0, 0, 0, NULL),
(27378, 3, 0, '¿Alguna idea de dónde tienen al guardia de la Muerte Schneider?', 1, 1, 102, 0, 0, 0, NULL);
 
DELETE FROM `gossip_menu_option` WHERE  `menu_id`=27376;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(27376, 0, 0, 'Me temo que no, Schneider. ¡Ha llegado tu hora!', 1, 1, 0, 0, 0, 0, NULL),
(27376, 1, 0, '¿Puedes decirme dónde tienen enjaulado al Canciller Amai?', 1, 1, 100, 0, 0, 0, NULL),
(27376, 2, 0, '¿Dónde mantienen cautivo al escribano jefe Barriga?', 1, 1, 101, 0, 0, 0, NULL),
(27376, 3, 0, '¿Viste adónde se llevaron al ingeniero sanitario Burke?', 1, 1, 103, 0, 0, 0, NULL);

 -- Creature text entry for Npc
DELETE FROM creature_text WHERE entry=27376;
INSERT INTO creature_text (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (27376,0,0,'¿Qué quieres decir con que ha llegado mi hora? ¡Te mataré ahí mismo!',12,0,100,0,0,0,'Comment');
DELETE FROM creature_text WHERE entry=27381;
INSERT INTO creature_text (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (27381,0,0,'¿Qué significa esto? ¡para! ¡te pagaré el doble!',12,0,100,0,0,0,'Comment');
DELETE FROM creature_text WHERE entry=27379;
INSERT INTO creature_text (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (27379,0,0,'No! ¡Te lo ruego! ¡Por favor, no me mates!',12,0,100,0,0,0,'Comment');
DELETE FROM creature_text WHERE entry=27378;
INSERT INTO creature_text (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (27378,0,0,'No puedes hablar en serio... ¡ Te amonestaré por esto $C!',12,0,100,0,0,0,'Comment');

-- gossip_menu
-- SELECT * FROM gossip_menu where entry IN (100 ,101 ,102 ,103,27376,27378,27379,27381)
DELETE FROM gossip_menu WHERE entry IN (100 ,101 ,102 ,103,27376,27378,27379,27381);
INSERT INTO gossip_menu (entry, text_id) VALUES
(27376,8000000),
(27378,8000001),
(27379,8000002),
(27381,8000003),
(103,8000005),
(102,8000006),
(101,8000007),
(100,8000008);

-- Npc anwers to questions
-- select * from npc_text WHERE id IN (8000000, 8000001, 8000002, 8000003, 8000005, 8000006, 8000007, 8000008);
DELETE FROM npc_text WHERE id IN (8000000, 8000001, 8000002, 8000003, 8000005, 8000006, 8000007, 8000008);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES
(8000000, 'Crees que podrías sacarme de aquí, $c?', '', 0, 1, 0, 6, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8000001, 'ah bien, has venido a rescatarme. ¡Ahora sacame de aquí!', '', 0, 1, 0, 5, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8000002, 'Hey, $g tío. : ma\am;. te he visto por aquí. ¿ Te importaría sacarme de aquí?', '', 0, 1, 0, 1, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8000003, 'No sé qué pasó. ¡Acababa de llegar a Rencor Venenoso y, de repente, me desperté en esta jaula! ¿ Has venido a rescatarme?', '', 0, 1, 0, 5, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8000005, 'Creo que está en el lateral sur de la abadía.', 'Creo que está en el lateral sur de la abadía.', 0, 1, 0, 1, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8000006, 'Creo que la tienen cerca de la Horca.', 'Creo que la tienen cerca de la Horca.', 0, 1, 0, 1, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8000007, 'Creo que lo han enjaulado cerca del aserradero.', 'Creo que lo han enjaulado cerca del aserradero.', 0, 1, 0, 1, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8000008, 'Creo que los vi llevarlo hacia la parte norte de la abadía, cerca de los objetivos de tiro con arco.', 'Creo que los vi llevarlo hacia la parte norte de la abadía, cerca de los objetivos de tiro con arco.', 0, 1, 0, 1, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '');

 -- Deathguard Schneider -------------
SET @ENTRY := 27376;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI", gossip_menu_id=27376 WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,27376,0,0,0,80,27376000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0," [LCV] On gossip Menu select");

SET @ENTRY := 27376000;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,100,100,0,0,72,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Close Gossip to enter IC"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,100,100,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Talk IC"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,2000,2000,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Set faction to 14"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,2000,2000,0,0,46,1,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Move out to the cage for being able to attack");
  
-- Senior Scrivener Barriga -------------
 SET @ENTRY := 27378;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName='SmartAI', gossip_menu_id=27378 WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,27378,0,0,0,80,27378000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] On gossip Menu select");
 
SET @ENTRY := 27378000;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,100,100,0,0,72,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Close Gossip to enter IC"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,100,100,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Talk IC"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,2000,2000,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Set faction to 14"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,2000,2000,0,0,46,1,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Move out to the cage for being able to attack");
 
 -- Engineer Burke
 SET @ENTRY := 27379;
SET @SOURCETYPE := 0;

 DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName='SmartAI', gossip_menu_id=27379 WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,27379,0,0,0,80,27379000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] On gossip Menu select");
 
SET @ENTRY := 27379000;
SET @SOURCETYPE := 9; 
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,100,100,0,0,72,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Close Gossip to enter IC"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,100,100,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Talk IC"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,2000,2000,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Set faction to 14"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,2000,2000,0,0,46,1,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Move out to the cage for being able to attack");
 
 -- Chancellor Amai
 SET @ENTRY := 27381;
SET @SOURCETYPE := 0;
 
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=@SOURCETYPE;
UPDATE creature_template SET AIName='SmartAI', gossip_menu_id=27381 WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,27381,0,0,0,80,27381000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] On gossip Menu select");
 
SET @ENTRY := 27381000;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,100,100,0,0,72,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Close Gossip to enter IC"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,100,100,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Talk IC"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,2000,2000,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Set faction to 14"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,2000,2000,0,0,46,1,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"[LCV] Move out to the cage for being able to attack");
 
-- Insert into conditions 
DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN (27376,27378,27379,27381);
INSERT INTO conditions (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 27381, 3, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27381, 2, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27381, 1, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27381, 0, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27379, 3, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27379, 2, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27379, 1, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27379, 0, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27378, 3, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27378, 2, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27378, 1, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27378, 0, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27376, 3, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27376, 2, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27376, 1, 0, 9, 12245, 0, 0, 0, '', NULL),
(15, 27376, 0, 0, 9, 12245, 0, 0, 0, '', NULL);



-- Author: Decode
-- Date: 2012/04/25
-- Quest: Punto de inflexión
-- ID: 10507

-- Socrethar
SET @ENTRY := 20132;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
DELETE FROM creature_ai_scripts WHERE creature_id=@entry;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,11,0,100,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Socrethar - On respawn - Set faction to 14"),
(@ENTRY,@SOURCETYPE,2,0,23,0,100,0,37539,0,0,0,11,37539,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Socrethar -  Has aura - Cast spell Nether Protection"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,4000,4000,6000,6000,11,15496,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Socretar - IC - Cast Cleave"),
(@ENTRY,@SOURCETYPE,4,0,0,0,100,0,2000,2000,10000,10000,11,28448,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Socretar - IC - Cast Shadow Bolt Volley"),
(@ENTRY,@SOURCETYPE,5,0,0,0,100,0,5000,5000,10000,10000,11,37537,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Socretar - IC - Cast Backlash"),
(@ENTRY,@SOURCETYPE,6,0,0,0,100,0,20000,20000,30000,30000,11,37540,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Socretar - IC - Cast Fireball Barrage"),
(@ENTRY,@SOURCETYPE,7,0,0,0,100,0,2000,2000,15000,20000,11,37538,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Socrethar - IC- Cast Anti-Magic Shield"),
(@ENTRY,@SOURCETYPE,8,0,1,0,100,0,0,0,0,0,19,33088,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Socrethar - OOC- Remove Unit flag back to normal");

-- Kaylaan the Lost
SET @ENTRY2 := 20794;
SET @SOURCETYPE2 := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY2 AND `source_type`=@SOURCETYPE2;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY2 LIMIT 1;
UPDATE creature_template SET InhabitType=1 WHERE entry=@ENTRY2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,11,0,100,0,0,0,0,0,18,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Kaylaan the lost - on respawn - Set React State");



-- Author: Amnesio
-- Date: 2012/05/03
-- Quest: Bombing Run
-- ID: 11010

SET @NPC1 := 23118;
SET @NPC2 := 22451;
SET @OBJ := 185861;
SET @SPELL1 := 40160;  
SET @SPELL2 := 40197; 
SET @SPELL3 := 36238; 
SET @TEXT := 2096;
SET @GUIDOBJ := 209440;
SET @GUIDNPC := 209426; 

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC1;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC2;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC1 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC2 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(@NPC1, 0, 0, 1, 8, 0, 100, 0, @SPELL1, 0, 0, 0, 33, @NPC1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[LCV] Kill credit NPC 23118'),
(@NPC1, 0, 1, 1, 8, 0, 100, 0, @SPELL1, 0, 0, 0, 11, 40162, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '[LCV] Kill credit NPC 23118'),
(@NPC2, 0, 0, 0, 1, 0, 100, 0, 2000, 4000, 6000, 8000, 11, @SPELL3, 0, 0, 0, 0, 0, 18, 35, 0, 0, 0, 0, 0, 0, '[LCV] Attac NPC ');

DELETE FROM `conditions` WHERE `SourceEntry`=@SPELL1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES
(13,1,@SPELL1,0,31,0,5,@NPC1,0,0,0, '','[LCV] Fyx Target Spell 40160'),
(17,0,@SPELL1,0,23,0,3785,0,0,0,@TEXT,'','[LCV] Area 3785 (Forge Camp: Wrath) usable Spell 40160'),
(17,0,@SPELL1,1,23,0,3784,0,0,0,@TEXT,'','[LCV] Area 3785 (Forge Camp: terror)  usable Spell 40160');

DELETE FROM `trinity_string` WHERE `entry`=@TEXT;
INSERT INTO `trinity_string` (`entry`, `content_default`)
VALUES
(@TEXT, 'Area invalida, solo utilizable en Forge Camp: Wrath o Forge Camp: terror');

DELETE FROM `creature_template_addon` WHERE `entry`=@NPC1;
INSERT INTO `creature_template_addon` (`entry`, `path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`)
VALUES
(@NPC1, 0, 0, 0, 0, 0,'40194 40196');

DELETE FROM `creature` WHERE `id`=@NPC1;
INSERT INTO `creature` (`guid`, `id`,`map`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`)
VALUES
(@GUIDNPC,@NPC1,530,1,2765.238281,7022.401367,370.205109,2.237938),
(@GUIDNPC+1,@NPC1,530,1,2779.886963,7032.839355,370.539960,2.249719),
(@GUIDNPC+2,@NPC1,530,1,2802.229492,7040.037598,370.079315,2.223496),
(@GUIDNPC+3,@NPC1,530,1,2820.273682,7050.170898,370.451782,1.497002),
(@GUIDNPC+4,@NPC1,530,1,2941.743652,7104.679688,370.088531,2.243130),
(@GUIDNPC+5,@NPC1,530,1,1700.898438,7342.907227,369.962006,5.636046),
(@GUIDNPC+6,@NPC1,530,1,1695.757080,7352.343262,370.263550,0.012581),
(@GUIDNPC+7,@NPC1,530,1,1707.099121,7368.621582,369.987183,5.416125),
(@GUIDNPC+8,@NPC1,530,1,1719.083984,7383.237793,370.056396,6.248646),
(@GUIDNPC+9,@NPC1,530,1,1623.423462,7247.753418,369.019836,0.648757),
(@GUIDNPC+10,@NPC1,530,1,1637.106812,7234.111816,368.717102,0.114682),
(@GUIDNPC+11,@NPC1,530,1,1653.978638,7209.547852,368.938507,6.276129),
(@GUIDNPC+12,@NPC1,530,1,1652.010376,7189.753906,369.434845,0.047918);

DELETE FROM `gameobject` WHERE `id`=@OBJ;
INSERT INTO `gameobject` (`guid`, `id`,`map`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`)
VALUES
(@GUIDOBJ,@OBJ,530,1,2765.238281,7022.401367,370.205109,2.237938),
(@GUIDOBJ+1,@OBJ,530,1,2779.886963,7032.839355,370.539960,2.249719),
(@GUIDOBJ+2,@OBJ,530,1,2802.229492,7040.037598,370.079315,2.223496),
(@GUIDOBJ+3,@OBJ,530,1,2820.273682,7050.170898,370.451782,1.497002),
(@GUIDOBJ+4,@OBJ,530,1,2941.743652,7104.679688,370.088531,2.243130),
(@GUIDOBJ+5,@OBJ,530,1,1700.898438,7342.907227,369.962006,5.636046),
(@GUIDOBJ+6,@OBJ,530,1,1695.757080,7352.343262,370.263550,0.012581),
(@GUIDOBJ+7,@OBJ,530,1,1707.099121,7368.621582,369.987183,5.416125),
(@GUIDOBJ+8,@OBJ,530,1,1719.083984,7383.237793,370.056396,6.248646),
(@GUIDOBJ+9,@OBJ,530,1,1623.423462,7247.753418,369.019836,0.648757),
(@GUIDOBJ+10,@OBJ,530,1,1637.106812,7234.111816,368.717102,0.114682),
(@GUIDOBJ+11,@OBJ,530,1,1653.978638,7209.547852,368.938507,6.276129),
(@GUIDOBJ+12,@OBJ,530,1,1652.010376,7189.753906,369.434845,0.047918);



-- Autor: Amnesio
-- Quest:just-following-orders
-- ID:12540

SET @NPC1 := 28325;
SET @NPC2:= 28217;
SET @GOSSIP_1:=9677;
SET @QUEST:=12540;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC1;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@NPC2;
UPDATE `creature_template` SET `npcflag`=`npcflag`|3 WHERE `entry`=@NPC2;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=@NPC2;
UPDATE `creature_template` SET `dynamicflags`= `dynamicflags`|32 WHERE `entry`=@NPC2;
UPDATE `creature_template` SET `unit_flags`= `unit_flags`|536870912 WHERE `entry`=@NPC2;
DELETE FROM `creature` WHERE `id`=@NPC1;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@NPC2;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC1 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC2 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(@NPC1, 0, 0, 0, 1, 0, 100, 0, 5000, 9000, 9000, 14000, 11, 34370, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, '[LCV] Fix Atack npc 28325'),
(@NPC1, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 33, @NPC1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[LCV] Fix kill credit  quest 12540'),
(@NPC2, 0, 0, 0, 1, 0, 100, 0, 1, 100, 150, 200, 95, 32, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '[LCV] Injured Rainspeaker Oracle - dead - '),
(@NPC2, 0, 1, 0, 62, 0, 100, 0, @GOSSIP_1, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[LCV] Injured Rainspeaker Oracle - On Gossip Select - '),
(@NPC2, 0, 2, 0, 62, 0, 100, 0, @GOSSIP_1, 0, 0, 0, 12, @NPC1, 6, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '[LCV] Injured Rainspeaker Oracle - On Gossip Select - Spawn npc 28325'),
(@NPC2, 0, 3, 0, 62, 0, 100, 0, @GOSSIP_1, 0, 0, 0, 96, 32, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '[LCV] Injured Rainspeaker Oracle - live'),
(@NPC2, 0, 4, 0, 62, 0, 100, 0, @GOSSIP_1, 0, 0, 0, 23, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '[LCV] Injured Rainspeaker Oracle - Change Phase'),
(@NPC2, 0, 5, 0, 1, 1, 100, 0, 18000, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '[LCV] Injured Rainspeaker Oracle - Respawn phase 0 3min later');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP_1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES
(15, @GOSSIP_1, 0, 0, 9, 0, @QUEST, 0, 0, 0, 0, '', '[LCV] Only show gossip if player has quest Just Following Orders');

DELETE FROM `gossip_menu` WHERE `entry`=9677 AND `text_id`=13124;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9677,13124);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=9677;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9677,0,0, '<Reach down and pull the Injured Rainspeaker Oracle to its feet.>',1,1,0,0,0,0, '');
