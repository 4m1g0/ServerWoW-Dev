-- Evitamos que salgan mensajes de error relacionados con trinity o con ytdb
UPDATE page_text SET `text` = '<Error> Texto no encontrado. Por favor si copnoces el texto que deberia aparecer en lugar de este mensaje comunicate con Zazu.' WHERE `text` LIKE '%ytdb%';
UPDATE npc_text SET `text0_0` = '<Error> Texto no encontrado. Por favor si copnoces el texto que deberia aparecer en lugar de este mensaje comunicate con Zazu.' WHERE `text0_0` LIKE '%ytdb%';
UPDATE script_texts SET content_default = '<Texto to no encontrado, por favor reporta este error a Zazu>', content_loc6 = '<Texto to no encontrado, por favor reporta este error a Zazu>' WHERE entry = -1000000;
