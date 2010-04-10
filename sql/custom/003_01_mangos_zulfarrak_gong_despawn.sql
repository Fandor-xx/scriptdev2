# Despawn des Gongs

DELETE FROM gameobject WHERE id=141832;

# Spawn von Gahz'rilla

INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES (7273, 209, 1, 1, 7271, 0, 1661.501465, 1182.729248, -2.670853, 0.753205, 36000, 5, 0, 19190, 0, 0, 1);
