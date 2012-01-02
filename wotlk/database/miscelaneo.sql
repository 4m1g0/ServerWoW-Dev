-- Evitamos que salgan mensajes de error relacionados con trinity
UPDATE script_texts SET content_default = '<Texto to no encontrado, por favor reporta este error a Zazu>', content_loc6 = '<Texto to no encontrado, por favor reporta este error a Zazu>' WHERE entry = -1000000;
