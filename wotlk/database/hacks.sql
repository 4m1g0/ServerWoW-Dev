-- Hack asignamos movimiento idle a los dracos para que visualmente no desaparezcan y sean matables.
UPDATE creature SET movementtype=0 WHERE id=29625;

-- Asignamos objetivo de la quest matar a los dracos unicamente, ya que estan parados es la manera mas facil de hacerlo
UPDATE quest_template SET requirednpcorgo1=29694 WHERE id=12886;

-- Asignamos una faccion hackeada al npc Garhal para que no lo maten los otros
UPDATE creature_template SET faction_A=7, faction_h=7 WHERE entry=30147;

-- Hack Fix quest Karynaku 10858 Deberia ser controlada por un SMART SCRIPT para que la dragona se levante al ser liberada pero el SMART_EVENT_SPELLHIT no funciona con gameobject (bug)
UPDATE quest_template SET requiredNpcOrGo1=-185156 WHERE id=10866;

-- Eliminado landro tirolargo por peligro de que regale monturas.
DELETE FROM creature WHERE id = 17249;

-- Esta quest debe ser completada por el script del boss, pero mientras no esta acabado hack fix
UPDATE quest_template SET requirednpcorgo1=30022, requirednpcorgocount1=1 WHERE id=12948;

-- Eliminamos temporalmente los vendedores del torneo argenta por que venden cosas sin restricciones
delete from creature where id in (33556, 33554, 33553, 33555);

-- aumentada velocidad de las esferas del lich king
UPDATE creature_template SET speed_run = 1.4 WHERE entry = 36633;
