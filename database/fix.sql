-- Eliminamos las casetas que estorban en libramorte
delete from gameobject where guid in (73381, 73364, 73886, 80083, 73382, 80311, 80494, 80033);
delete from creature where guid in (15617, 15745, 200334, 200335);

-- Les quitamos todos los addons a los npc de la zona de sister para que se ataquen entre ellos y el evento funcione (blizzlike)
DELETE FROM creature_template_addon WHERE entry IN (37125, 37125);
DELETE FROM creature_template_addon WHERE entry IN (37124, 38303);
DELETE FROM creature_template_addon WHERE entry IN (37123, 38299);
DELETE FROM creature_template_addon WHERE entry IN (37122, 38298);
DELETE FROM creature_template_addon WHERE entry IN (37134, 38131);
DELETE FROM creature_template_addon WHERE entry IN (37133, 38133);
DELETE FROM creature_template_addon WHERE entry IN (37132, 38132);
DELETE FROM creature_template_addon WHERE entry IN (37127, 38126);
DELETE FROM creature_template_addon WHERE entry IN (38125, 38130);
DELETE FROM creature_template_addon WHERE entry IN (37129, 38000);
DELETE FROM creature_template_addon WHERE entry IN (37126, 38258);
-- El jefe del evento crok tambien debe poder atacar
-- UPDATE creature_template SET unit_flags = 0 WHERE entry IN (37129, 38000);
-- Es el core el que maneja el estado de atacabl eo no de sister, la db no interviene y el inhabit type debe incluir 1 2 y 4 para que se pueda posar en el suelo por que mientras esta volando NO funciona.
UPDATE creature_template SET unit_flags = 64, inhabittype=7 WHERE entry IN (37126, 38258);

-- La flecha que lanza sister y que empala a un miembro del grupo no puee ser enemiga y debe poder hacerse click derecho para "desclavarla"
UPDATE creature_template SET unit_flags=0 WHERE entry IN (38248);

-- Caminasueños debe estar dormida 
DELETE FROM creature_addon WHERE guid=83235;

-- Caminasueños debe empezar con menos vida en los modos mas dificiles
insert into `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('203080','36789','631','10','5','0','0','4203.65','2483.89','364.961','5.51524','604800','0','0','17999997','0','0','0','0','0');
UPDATE creature SET spawnmask=5 WHERE guid=83235;

-- El cofre de caminasueños debe ser sumoneado por el core
DELETE FROM gameobject WHERE id IN (201959, 202339);

-- Hay un lich king controlador que esta bajo la valthiria caminasueños, segun tdb debe tener este data...
UPDATE creature_template SET unit_flags=33555200 WHERE entry IN (16980);
DELETE FROM creature WHERE guid = 10992;
UPDATE creature SET phasemask=17 WHERE guid=111453;

-- los adds de sindragosa deben tener el inhabit correcto para poder posarse
UPDATE creature_template SET inhabittype=5 WHERE entry IN (37533, 38220);
UPDATE creature_template SET inhabittype=5 WHERE entry IN (37534, 38219);

-- sindragosa debe ser atacable desde que llega en todos los mdos
UPDATE creature_template SET unit_flags=0 WHERE entry IN (36853, 36853, 38266, 38267);

-- El movimiento de los adds de inicio de sindragosa debe ser random por que estan volando al principio
UPDATE creature_template SET movementtype=2, speed_walk=1.5873 WHERE entry IN (37533, 38220);
UPDATE creature_template SET movementtype=2, speed_walk=1.5873 WHERE entry IN (37534, 38219);

-- Los addons de inicio de sindragosa deben atacar segun llegan
DELETE FROM creature_template_addon WHERE entry IN (37533, 38220);
DELETE FROM creature_template_addon WHERE entry IN (37534, 38219);

-- Los principes deben estar vivos quien los mata es el core
UPDATE creature_template SET dynamicflags=8 WHERE entry IN (37972, 38399, 38769, 38770);
DELETE FROM creature_template_addon WHERE entry IN (37972, 38399, 38769, 38770);
UPDATE creature_template SET dynamicflags=8 WHERE entry IN (37973, 38400, 38771, 38772);
DELETE FROM creature_template_addon WHERE entry IN (37973, 38400, 38771, 38772);
UPDATE creature_template SET dynamicflags=8 WHERE entry IN (37970, 38401, 38784, 38785);
DELETE FROM creature_template_addon WHERE entry IN (37970, 38401, 38784, 38785);

-- el orve de los principes no debe poder usasrse hasta que el script lo permite
UPDATE gameobject_template SET faction=35, flags=16 WHERE entry IN (201741);

-- El controlador del event de principes nunca debe recibir daño
UPDATE creature_template SET flags_extra=130 WHERE entry IN (38008, 38641, 38773, 38774);

-- Los principes deben tener vida 1 a no ser que el core diga lo contrario
UPDATE creature SET curhealth=1 WHERE id=37970;
UPDATE creature SET curhealth=1 WHERE id=37972;
UPDATE creature SET curhealth=1 WHERE id=37973;

-- [HACK] HAcemos los osos atacables por TODO el mundo para que puedan completar la mision directamente
UPDATE creature_template SET faction_a=14, faction_h=14 WHERE entry=30174;
