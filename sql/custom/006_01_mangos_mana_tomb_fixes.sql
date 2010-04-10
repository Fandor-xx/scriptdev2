##########
## Fixes für Managruft und die Questreihe für Yor
## benötigt 'go_shaffars_stasis' und 'go_mana_tomb_stasis' in go_scripts.cpp
##########

# Insert Chamber-Templates in Managruft

DELETE FROM gameobject_template WHERE entry IN (950000, 950001);
INSERT INTO gameobject_template VALUES 
	(950000, 10, 7183, 'Nexus-Prinz Shaffars Stasiskammer', '', '', '', 0, 32, 3, 0, 0, 0, 0, 0, 0, 1731, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_shaffars_stasis'), 
	(950001, 10, 7183, 'Stasiskammer der Managruft', '', '', '', 0, 32, 3, 0, 0, 0, 0, 0, 0, 1730, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'go_mana_tomb_stasis');

# Setzt die Fraktion auf Feindlich (Horde und Allianz)

UPDATE creature_template SET faction_A=16, faction_H=16 WHERE entry=22930; /* Yor */

UPDATE creature_template SET faction_A=16, faction_H=16 WHERE entry IN (22825, 20888, 22827, 22826, 22828, 22920); /* Mobs in den Stasiskammer von Schergrat */

# Spawnt die Stasiskammern in der Managruft

DELETE FROM gameobject WHERE id=950000;
INSERT INTO gameobject (id, map, spawnMask, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
	(950000, 557, 2, -233.793915, -21.134533, 16.786190, 1.534669, 680000, 100, 1); 

DELETE FROM gameobject WHERE id=950001;
INSERT INTO gameobject (id, map, spawnMask, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
	(950001, 557, 2, -21.752764, -226.521759, 0.467569, 2.825080, 680000, 100, 1); 

# Spawnt die Sockeln der Stasiskammern in der Managruft

DELETE FROM gameobject WHERE id=184998 AND map=557;
INSERT INTO gameobject (id, map, spawnMask, position_x, position_y, position_z, orientation, spawntimesecs, animprogress, state) VALUES
	(184998, 557, 2, -233.793915, -21.134533, 16.786190, 1.534669, 680000, 100, 1),
	(184998, 557, 2, -21.752764, -226.521759, 0.467569, 2.825080, 680000, 100, 1); 

# Gibt Yor das AI script

DELETE FROM creature_ai_scripts WHERE creature_id=22930;
INSERT INTO creature_ai_scripts VALUES
	(2293001, 22930, 0, 0, 70, 5, 8000, 9000, 12000, 13000, 11, 50868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Yor - Stamp'),
	(2293002, 22930, 0, 0, 100, 5, 5000, 5000, 12000, 12000, 11, 41437, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Yor - Double Breath');

UPDATE creature_template SET AIName='EventAI' WHERE entry=22930;

#  Fixes für den Trash in Managruft 

UPDATE creature_ai_scripts SET action1_param1=39672, comment='Nexus Terror - Cast Curse of Pain'  WHERE id=1930704; /* Fluch der Pain statt Fluch der Machtlosigkeit, da der Spell in zusammenwirken mit Feenfeuer (Tiergestalt) buggt. */
UPDATE creature_ai_scripts SET action1_param3=0 WHERE id IN (1831701, 1831702, 1831703, 1831704, 1831705, 1831706); /* Verhindert ein unterbrechen beim heilen */
