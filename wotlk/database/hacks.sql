-- Hack asignamos movimiento idle a los dracos para que visualmente no desaparezcan y sean matables.
UPDATE creature SET movementtype=0 WHERE id=29625;

-- Asignamos objetivo de la quest matar a los dracos unicamente, ya que estan parados es la manera mas facil de hacerlo
UPDATE quest_template SET requirednpcorgo1=29694 WHERE id=12886;

-- Asignamos una faccion hackeada al npc Garhal para que no lo maten los otros
UPDATE creature_template SET faction_A=7, faction_h=7 WHERE entry=30147;

-- Hack Fix quest Karynaku 10858 Deberia ser controlada por un SMART SCRIPT para que la dragona se levante al ser liberada pero el SMART_EVENT_SPELLHIT no funciona con gameobject (bug)
UPDATE quest_template SET requiredNpcOrGo1=-185156, requirednpcorgocount1=1, requiredspellcast1=38790 WHERE id=10858;

-- Eliminado landro tirolargo por peligro de que regale monturas.
DELETE FROM creature WHERE id = 17249;
