/* Querys for boss majordomus Executos */
# Change place of the chest

DELETE FROM gameobject WHERE id=179703;
INSERT INTO gameobject (id, map, position_x, position_y, position_z, orientation, spawntimesecs, animprogress) VALUES
	(179703, 409, 784.434998, -1207.390015, -120.639000, 2.592130, 604800, 100); 

# Reduce Speed

UPDATE creature_template SET speed_walk=1.3 WHERE entry IN (11664, 11663, 12018);

# Change Faction

UPDATE creature_template SET faction_A=54, faction_H=54 WHERE entry IN (11664, 11663, 12018);

#  Update Script settings

UPDATE creature_template SET ScriptName='boss_elite' WHERE entry=11664;
UPDATE creature_template SET ScriptName='boss_healer' WHERE entry=11663;
UPDATE creature_template SET ScriptName='boss_majordomo' WHERE entry=12018;

# Update spawntime for Boss

UPDATE creature SET spawntimesecs=604800 WHERE id=12018;

# majordomus adden

DELETE FROM creature WHERE id=12018;
INSERT INTO creature (id, map, position_x, position_y, position_z, orientation, spawntimesecs, curhealth, curmana) VALUES
	(12018, 409, 767.674, -1205.82, -119.415, 2.81403, 604800, 666200, 0);

# macht die Truhe bei Majordomus Executos (MC) lootbar.

UPDATE gameobject SET state=1 where id=179703;


