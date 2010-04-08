UPDATE `creature_template` SET `ScriptName` = 'boss_nalorakk', `minhealth` = 1700000, `maxhealth` = 1700000 WHERE `entry` = 23576;
UPDATE `creature_template` SET `flags_extra` = 33 WHERE `entry` = 23576; /*no crush*/
UPDATE `creature` SET `position_x` = '-77.4956', `position_y` = '1294.76', `position_z` = '48.487', `orientation` = '1.66278' WHERE `id` = 23576 LIMIT 1;

UPDATE `creature_template` set `ScriptName` = 'boss_akilzon', `minhealth` = 1300000, `maxhealth` = 1300000 where entry = 23574;
UPDATE `creature_template` set `ScriptName` = 'mob_akilzon_eagle' where `entry`=24858; /*default event ai*/

UPDATE `creature_template` SET `ScriptName` = 'boss_halazzi', `minhealth` = 1700000, `maxhealth` = 1700000 WHERE `entry` = '23577';
UPDATE `creature_template` SET `ScriptName` = 'mob_halazzi_lynx' WHERE `entry` = '24143';
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = '24224'; /*totem default `spell1` = '43301' should be in UDB*/

UPDATE `creature_template` SET `ScriptName` = 'boss_janalai', `minhealth` = 1000000, `maxhealth` = 1000000 WHERE `entry` = '23578';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_hatcher' WHERE `entry` = '23818';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_hatchling' WHERE `entry` = '23598';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_egg' WHERE `entry` = '23817';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_firebomb' WHERE `entry` = '23920';

UPDATE `creature_template` SET `ScriptName` = 'boss_hexlord_malacrass', `minhealth` = 1900000, `maxhealth` = 1900000 WHERE `entry` =24239;
UPDATE `creature_template` SET `ScriptName` = 'boss_alyson_antille' WHERE `entry` =24240;
UPDATE `creature_template` SET `ScriptName` = 'boss_thurg' WHERE `entry` =24241;
UPDATE `creature_template` SET `ScriptName` = 'boss_slither' WHERE `entry` =24242;
UPDATE `creature_template` SET `ScriptName` = 'boss_lord_raadan' WHERE `entry` =24243;
UPDATE `creature_template` SET `ScriptName` = 'boss_gazakroth' WHERE `entry` =24244;
UPDATE `creature_template` SET `ScriptName` = 'boss_fenstalker' WHERE `entry` =24245;
UPDATE `creature_template` SET `ScriptName` = 'boss_darkheart' WHERE `entry` =24246;
UPDATE `creature_template` SET `ScriptName` = 'boss_koragg' WHERE `entry` =24247;
UPDATE `creature` SET `position_x` = '117.8827',`position_y` = '921.2795',`position_z` = '33.8883',`orientation` = '1.5696' WHERE `id` = '24239' LIMIT 1;
/*UPDATE `creature_template` SET `faction_A` = '1890', `faction_H` = '1890' WHERE `entry` in ('24240', '24241', '24242', '24243', '24244', '24245', '24246', '24247');*/

UPDATE `creature_template` SET `ScriptName` = 'boss_zuljin', `minhealth` = 1600000, `maxhealth` = 1600000 WHERE `entry` =23863;
UPDATE `creature_template` SET `ScriptName` = 'do_nothing' WHERE `entry` = '24187';
UPDATE `creature_template` SET `ScriptName` = 'mob_zuljin_vortex' WHERE `entry` = '24136';
UPDATE `creature_template` SET `minlevel` = '73', `maxlevel` = '73' WHERE `entry` IN (24187, 24136);
DELETE FROM `spell_proc_event` WHERE `entry` = 43983;
INSERT INTO `spell_proc_event` VALUES ('43983', '0', '0', '0', '0', '0', '0', '16384', '0', '0', '0');
DELETE FROM `spell_script_target` WHERE `entry` = 42577;
INSERT INTO `spell_script_target` VALUES ('42577', '1', '24136');

/*DELETE FROM `gameobject_loot_template` WHERE `entry` IN (186648,187021,186667,186672);*/
DELETE FROM `creature_loot_template` WHERE `entry` IN (23790, 23999, 24024, 24001);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23790, 33480, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23790, 33481, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23790, 33483, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23790, 33489, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23790, 33590, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23790, 33591, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23790, 33805, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23790, 33971, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23999, 33490, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23999, 33491, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23999, 33492, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23999, 33493, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23999, 33494, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (23999, 33495, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (24024, 33496, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (24024, 33497, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (24024, 33498, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (24024, 33499, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (24024, 33500, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (24001, 33496, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (24001, 33497, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (24001, 33498, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (24001, 33499, 0, 1);
INSERT INTO `creature_loot_template` (`entry`, `item`, `chanceorquestchance`, `groupid`) VALUES (24001, 33500, 0, 1);
UPDATE `creature_template` SET `lootid` = `entry`, `ScriptName` = 'npc_zulaman_hostage' WHERE `entry` IN (23790, 23999, 24024, 24001);


ALTER TABLE `gameobject` AUTO_INCREMENT = 100000; /*http://www.udbforums.org/Custom-Content-and-GUIDs-t8650.html*/
/*doors*/
DELETE FROM `gameobject` WHERE `id` IN (186303, 186304, 186859, 186858) AND `guid` >= 100000;
INSERT INTO `gameobject`  (`id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
	SELECT 186303, 568, 1, 307.178, 1122.81, 10.0798, 0.0546852, 0, 0, 0.0273392, 0.999626, 25, 0, 0
	FROM `gameobject` WHERE NOT EXISTS(SELECT * FROM `gameobject` WHERE `id`=186303) LIMIT 1;
INSERT INTO `gameobject`  (`id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
	SELECT 186304, 568, 1, 125, 915, 34, 4.67869, 0, 0, 0.718921, -0.695091, 25, 0, 1
	FROM `gameobject` WHERE NOT EXISTS(SELECT * FROM `gameobject` WHERE `id`=186304) LIMIT 1;	
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
	SELECT 186859, 568, 1, 120.526, 733.926, 45.1114, 4.72569, 0, 0, 0.70239, -0.711792, 25, 0, 0
	FROM `gameobject` WHERE NOT EXISTS(SELECT * FROM `gameobject` WHERE `id`=186859) LIMIT 1;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
	SELECT 186858, 568, 1, 337.269, 1396.05, 74.4265, 0.320266, 0, 0, 0.15945, 0.987206, 25, 0, 0
	FROM `gameobject` WHERE NOT EXISTS(SELECT * FROM `gameobject` WHERE `id`=186858) LIMIT 1;
/*chests*/
/*DELETE FROM `gameobject` WHERE `id` IN (186648, 187021, 186667, 186672) AND `guid` >= 100000;
INSERT INTO `gameobject`  (`id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
	SELECT 186648, 568, 1, 124, 967, 65, 0.0546852, 0, 0, 0.0273392, 0.999626, 25, 0, 0
	FROM `gameobject` WHERE NOT EXISTS(SELECT * FROM `gameobject` WHERE `id`=186648) LIMIT 1;*/

# Setzt die Frösche auf npcflag 0 was bewirkt das sie keine Items verkaufen wie bisher.

UPDATE creature_template SET npcflag=0 WHERE entry=24396;

# Despawn 'Tanzar'

DELETE FROM creature WHERE id=23790;

# Zulaman Creature spawn on the way to akil'zon

DELETE FROM creature WHERE map=568 AND guid > 100000;
INSERT INTO creature (id, map,  position_x, position_y, position_z, orientation, spawntimesecs, curhealth, curmana) VALUES
	(23581, 568, 224.096924, 1437.665771, 26.265295, 1.608510, 7200, 66000, 31550),
	(24179, 568, 233.399994, 1438.020020, 26.299900, 1.608510, 7200, 57000, 32310),
	(23582, 568, 234.033142, 1421.244629, 31.651335, 1.608510, 7200, 86000, 0),
	(23542, 568, 223.330750, 1420.840820, 31.219351, 1.608510, 7200, 86000, 0),
	(23581, 568, 223.538971, 1402.530029, 37.571327, 1.608510, 7200, 66000, 31550),
	(24179, 568, 232.815765, 1402.880127, 37.486328, 1.608510, 7200, 57000, 32310),
	(23582, 568, 232.780609, 1384.333496, 44.486130, 1.542536, 7200, 86000, 0),
	(23542, 568, 223.556198, 1384.594238, 43.710697, 1.627359, 7200, 86000, 0),
	(23596, 568, 269.566864, 1377.615479, 49.321880, 3.143176, 7200, 69000, 6462),
	(23596, 568, 265.754272, 1373.319580, 49.325592, 3.143176, 7200, 69000, 6462),
	(23596, 568, 265.740967, 1381.712524, 49.322567, 3.143176, 7200, 69000, 6462);

# Setzt die HP der bosse zu Beginn auf ihr maximum

UPDATE creature SET curhealth=1700000 WHERE id=23576;
UPDATE creature SET curhealth=1300000 WHERE id=23574;
UPDATE creature SET curhealth=600000 WHERE id=23577;
UPDATE creature SET curhealth=1000000 WHERE id=23578;
UPDATE creature SET curhealth=1600000 WHERE id=23863;
UPDATE creature SET curhealth=1900000 WHERE id=24239;
	