# Spawnt Gegner und Game-Objekte im Heroischen Modus
UPDATE creature SET spawnMask=3 WHERE map=552;
UPDATE gameobject SET spawnMask=3 WHERE map=552;
UPDATE creature SET spawnMask=3 WHERE map=557;
UPDATE gameobject SET spawnMask=3 WHERE map=557;
 
-- ### Creature Inserts ### --

# Eredar_Deathbringer

DELETE FROM creature WHERE id=20880;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
	(20880, 552, 3, 1, 0, 1, 445.531677, -23.192076, 48.212807, 1.507181, 86400, 0, 0, 39123, 12620, 0, 0);

-- ### Arkatraz_ai_scripts ### --

# Arkatraz_Warder

DELETE FROM creature_ai_scripts WHERE creature_id=20859;
INSERT INTO creature_ai_scripts VALUES
	(2085901, 20859, 0, 0, 100, 3, 2500, 3000, 2500, 3000, 11, 15620, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcatraz Warder - Shoot (Non-Heroic)'),
	(2085902, 20859, 0, 0, 100, 5, 2500, 3000, 2500, 3000, 11, 22907, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcatraz Warder - Shoot (Heroic Mode)'),
	(2085903, 20859, 0, 0, 100, 3, 1000, 2000, 12000, 13000, 11, 15620, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcatraz Warder - Arcane Shoot (Non-Heroic)'),
	(2085904, 20859, 0, 0, 100, 5, 1000, 2000, 12000, 13000, 11, 22907, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcatraz Warder - Arcane Shoot (Heroic Mode)');

UPDATE creature_template SET AIName='EventAI', unit_flags=68 WHERE entry=20859;

# Dalliah_the_Doomsayer

DELETE FROM creature_ai_scripts WHERE creature_id=20885;
INSERT INTO creature_ai_scripts VALUES
	(2088501, 20885, 4, 0, 100, 6, 0, 0, 0, 0, 1, -73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dalliah the Doomsayer - Yell with Sound on Aggro'),
	(2088502, 20885, 5, 0, 100, 7, 0, 0, 0, 0, 1, -74, -75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dalliah the Doomsayer - Yell with Sound on Player Death'),
	(2088503, 20885, 6, 0, 100, 6, 0, 0, 0, 0, 1, -76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dalliah the Doomsayer - Yell with Sound on Creature Death'),
	(2088504, 20885, 0, 0, 80, 7, 7000, 7000, 18000, 18000, 11, 36173, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dalliah the Doomsayer - Casts Gift of the Doomsayer'),
	(2088505, 20885, 0, 0, 100, 7, 15000, 15000, 30000, 30000, 11, 36142, 0, 0, 1, -79, -80, 0, 9, 11089, 11090, -1, 'Dalliah the Doomsayer - Casts Whirlwind'),
	(2088506, 20885, 0, 0, 100, 7, 21200, 21200, 30000, 30000, 11, 36144, 0, 0, 1, -77, -78, 0, 9, 11091, 11092, -1, 'Dalliah the Doomsayer - Casts Heal'),
	(2088507, 20885, 4, 0, 100, 6, 0, 0, 0, 0, 34, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dalliah the Doomsayer - Set Inst Data on Aggro'),
	(2088508, 20885, 6, 0, 100, 6, 0, 0, 0, 0, 34, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dalliah the Doomsayer - Set Inst Data on Death'), 
	(2088509, 20885, 7, 0, 100, 6, 0, 0, 0, 0, 34, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dalliah the Doomsayer - Set Inst Data on Evade'),
	(2088510, 20885, 0, 0, 100, 5, 12000, 13000, 29000, 30000, 11, 39016, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dalliah the Doomsayer - Cast Shadow Wave (Heroic Mode)');

UPDATE creature_template SET AIName='EventAI' WHERE entry=20885;

# Death_Watcher

DELETE FROM creature_ai_scripts WHERE creature_id=20867;
INSERT INTO creature_ai_scripts VALUES
	(2086701, 20867, 0, 0, 100, 3, 3000, 4000, 15000, 20000, 11, 36655, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Watcher - Cast Drain Life (Non-Heroic)'),
	(2086702, 20867, 0, 0, 100, 5, 3000, 4000, 15000, 20000, 11, 38817, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Watcher - Cast Drain Life (Heroic Mode)'),
	(2086703, 20867, 0, 0, 60, 3, 10000, 11000, 10000, 11000, 11, 69969, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Watcher - Cast Curse of Doom (Non-Heroic)'),
	(2086704, 20867, 0, 0, 80, 5, 10000, 11000, 10000, 11000, 11, 64157, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Watcher - Cast Curse of Doom (Heroic Mode)'),
	(2086705, 20867, 0, 0, 80, 3, 2000, 2500, 10000, 12000, 11, 36664, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Watcher - Cast Tentacle Cleave (Non-Heroic)'),
	(2086706, 20867, 0, 0, 90, 5, 2000, 2500, 10000, 12000, 11, 38816, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Watcher - Cast Tentacle Cleave (Heroic Mode)');
	
UPDATE creature_template SET AIName='EventAI' WHERE entry=20867;

# Unchained Doombringer

DELETE FROM creature_ai_scripts WHERE creature_id=20900;
INSERT INTO creature_ai_scripts VALUES
	(2090001, 20900, 0, 0, 100, 3, 5000, 6000, 20000, 21000, 11, 36835, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unchained Doombringerr - Cast War Stomp (Non-Heroic)'),
	(2090002, 20900, 0, 0, 100, 5, 5000, 6000, 20000, 21000, 11, 38911, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unchained Doombringer - Cast War Stomp (Heroic Mode)'),
	(2090003, 20900, 0, 0, 100, 7, 4000, 4500, 60000, 61000, 11, 36836, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unchained Doombringer - Agonizing Armor'),	
	(2090005, 20900, 0, 0, 100, 3, 10000, 12000, 18000, 19000, 11, 36833, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unchained Doombringer - Berserker Charge');

UPDATE creature_template SET AIName='EventAI' WHERE entry=20900;

# Eredar_Soul-Eater

DELETE FROM creature_ai_scripts WHERE creature_id=20879;
INSERT INTO creature_ai_scripts VALUES
	(2087901, 20879, 0, 0, 100, 3, 5000, 6000, 15000, 16000, 11, 36786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eredar Soul-Eater - Cast Soul Chill (Non-Heroic)'),
	(2087902, 20879, 0, 0, 100, 5, 5000, 6000, 15000, 16000, 11, 38911, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eredar Soul-Eater - Cast Soul Chill (Heroic Mode)'),
	(2087903, 20879, 0, 0, 100, 7, 4000, 4500, 30000, 31000, 11, 36778, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eredar Soul-Eater - Soul Steal'),	
	(2087905, 20879, 0, 0, 100, 7, 500, 1000, 60000, 61000, 11, 36784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eredar Soul-Eater - Entropic Aura');

UPDATE creature_template SET AIName='EventAI' WHERE entry=20879;

# Ethereum_Life-Binder

DELETE FROM creature_ai_scripts WHERE creature_id=21702;
INSERT INTO creature_ai_scripts VALUES
	(2170201, 21702, 0, 0, 100, 3, 500, 1000, 15000, 20000, 11, 15654, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Life-Binder - Cast Shadow-Word: Pain (Non-Heroic)'),
	(2170202, 21702, 0, 0, 100, 5, 500, 1000, 15000, 20000, 11, 34941, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Life-Binder - Cast Shadow-Word: Pain (Heroic Mode)'),
	(2170203, 21702, 0, 0, 100, 3, 7000, 8000, 10000, 11000, 11, 37479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Life-Binder - Cast Shadow Mend (Non-Heroic)'),
	(2170204, 21702, 0, 0, 100, 5, 7000, 8000, 10000, 11000, 11, 38899, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Life-Binder - Cast Shadow Mend (Heroic Mode)'),
	(2170205, 21702, 0, 0, 100, 3, 4000, 5000, 20000, 21000, 11, 37480, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Life-Binder - Cast Bind (Non-Heroic)'),
	(2170206, 21702, 0, 0, 100, 5, 4000, 5000, 20000, 21000, 11, 38900, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Life-Binder - Cast Bind (Heroic Mode)');
	
UPDATE creature_template SET AIName='EventAI' WHERE entry=21702;

# Ethereum_Slayer

DELETE FROM creature_ai_scripts WHERE creature_id=20896;
INSERT INTO creature_ai_scripts VALUES
	(2089601, 20896, 0, 0, 80, 3, 5000, 6000, 10000, 11000, 11, 36838, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Slayer - Cast Slaying Strike (Non-Heroic)'),
	(2089602, 20896, 0, 0, 80, 5, 5000, 6000, 10000, 11000, 11, 38894, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Slayer - Cast Slaying Strike (Heroic Mode)'),
	(2089603, 20896, 0, 0, 100, 7, 500, 1000, 40000, 46000, 11, 15087, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Slayer - Cast Evasion'),
	(2089604, 20896, 0, 0, 100, 7, 6000, 7000, 6000, 7000, 11, 36839, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Slayer - Cast Impairing Poison');
	
UPDATE creature_template SET AIName='EventAI' WHERE entry=20896;

# Ethereum_Wave-Caster

DELETE FROM creature_ai_scripts WHERE creature_id=20897;
INSERT INTO creature_ai_scripts VALUES
	(2089701, 20897, 0, 0, 80, 3, 5000, 6000, 20000, 21000, 11, 36840, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Wave-Caster - Cast Transfrom (Non-Heroic)'),
	(2089702, 20897, 0, 0, 80, 5, 5000, 6000, 20000, 21000, 11, 38896, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Wave-Caster - Cast Transfrom (Heroic Mode)'),
	(2089703, 20897, 0, 0, 100, 7, 500, 1000, 29000, 30000, 11, 32639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Wave-Caster - Cast Arcane Haste'),
	(2089704, 20897, 0, 0, 75, 7, 6000, 7000, 10000, 11000, 11, 38897, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ethereum Wave-Caster - Cast Sonic Boom');
	
UPDATE creature_template SET AIName='EventAI' WHERE entry=20897;

# Gargantuan Abyssal

DELETE FROM creature_ai_scripts WHERE creature_id=20898;
INSERT INTO creature_ai_scripts VALUES 
	(2089801, 20898, 0, 0, 100, 3, 18000, 19000, 18000, 19000, 11, 36837, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Gargantuan Abyssal - Cast Meteor (Non-Heroic)'),
	(2089802, 20898, 0, 0, 100, 5, 12000, 13000, 12000, 13000, 11, 38903, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Gargantuan Abyssal - Cast Meteor (Heroic Mode)'),
	(2089803, 20898, 0, 0, 100, 7, 1000, 2000, 60000, 65000, 11, 38901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gargantuan Abyssal - Cast Fire Shield');

UPDATE creature_template SET AIName='EventAI' WHERE entry=20898;

# Negaton Screamer

DELETE FROM creature_ai_scripts WHERE creature_id=20875;
INSERT INTO creature_ai_scripts VALUES
	(2087501, 20875, 0, 0, 33, 3, 3000, 4000, 15000, 16000, 11, 36742, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Negaton Screamer - Cast Fireball Volley (Non-Heroic)'),
	(2087502, 20875, 0, 0, 33, 5, 3000, 4000, 15000, 16000, 11, 38836, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Negaton Screamer - Cast Fireball Volley (Heroic Mode)'),
	(2087503, 20875, 0, 0, 33, 3, 3000, 4000, 15000, 16000, 11, 36741, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Negaton Screamer - Cast Frostbolt Volley (Non-Heroic)'),
	(2087504, 20875, 0, 0, 33, 5, 3000, 4000, 15000, 16000, 11, 38837, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Negaton Screamer - Cast Frostbolt Volley (Heroic Mode)'),
	(2087505, 20875, 0, 0, 33, 3, 3000, 4000, 15000, 16000, 11, 36736, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Negaton Screamer - Cast Shadowbolt Volley (Non-Heroic)'),
	(2087506, 20875, 0, 0, 33, 5, 3000, 4000, 15000, 16000, 11, 38840, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Negaton Screamer - Cast Shadowbolt Volley (Heroic Mode)'),
	(2087507, 20875, 0, 0, 60, 7, 5000, 7000, 10000, 12000, 11, 13704, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Negaton Screamer - Cast Psychic Scream');
	
UPDATE creature_template SET AIName='EventAI' WHERE entry=20875;

# Proteam_Horror

DELETE FROM creature_ai_scripts WHERE creature_id=20865;
INSERT INTO creature_ai_scripts VALUES
	(2086501, 20865, 0, 0, 50, 7, 1000, 2000, 12000, 13000, 11, 22907, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protean Horror - Thooty Bite');

UPDATE creature_template SET AIName='EventAI' WHERE entry=20865;

# Protean_Nigthmare

DELETE FROM creature_ai_scripts WHERE creature_id=20864;
INSERT INTO creature_ai_scripts VALUES
	(2086401, 20864, 0, 0, 100, 3, 3000, 4000, 6000, 7000, 11, 36619, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protean Nightmare - Infectious Poisen (Non-Heroic)'),
	(2086402, 20864, 0, 0, 100, 5, 3000, 4000, 6000, 7000, 11, 38811, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protean Nightmare - Infectious Poisen (Heroic Mode)'),
	(2086403, 20864, 0, 0, 100, 3, 5000, 6000, 12000, 13000, 11, 36617, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protean Nightmare - Gaping Maw (Non-Heroic)'),
	(2086404, 20864, 0, 0, 100, 5, 5000, 6000, 12000, 13000, 11, 38810, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Protean Nightmare - Gaping Maw (Heroic Mode)');

UPDATE creature_template SET AIName='EventAI' WHERE entry=20864;

# Sightless_Eye

DELETE FROM creature_ai_scripts WHERE creature_id=21346;
INSERT INTO creature_ai_scripts VALUES
	(2134601, 21346, 0, 0, 100, 3, 500, 1000, 2000, 3000, 11, 36646, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sightless Eye - Cast Sightless Touch (Non-Heroic)'),
	(2134602, 21346, 0, 0, 100, 5, 500, 1000, 2000, 3000, 11, 38815, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sightless Eye - Cast Sightless Touch (Heroic Mode)');

UPDATE creature_template SET AIName='EventAI' WHERE entry=21346;

#  Sargeron_Hellcaller

DELETE FROM creature_ai_scripts WHERE creature_id=20902;
INSERT INTO creature_ai_scripts VALUES
	(2090201, 20902, 0, 0, 100, 7, 500, 1000, 30500, 31000, 11, 36831, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Hellcaller - Cast Curse of the Elements'),
	(2090202, 20902, 0, 0, 100, 3, 6000, 7000, 9000, 10000, 11, 36832, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Hellcaller - Cast Incinerate (Non-Heroic)'),
	(2090203, 20902, 0, 0, 100, 5, 6000, 7000, 9000, 10000, 11, 38918, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Hellcaller - Cast Incinerate (Heroic Mode)');

UPDATE creature_template SET AIName='EventAI' WHERE entry=20902;

#  Soul_Devourer

DELETE FROM creature_ai_scripts WHERE creature_id=20866;
INSERT INTO creature_ai_scripts VALUES
	(2086601, 20866, 0, 0, 100, 7, 500, 1000, 20000, 21000, 11, 36644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Soul Devourer - Cast Sightless Eye'),
	(2086602, 20866, 0, 0, 100, 3, 3000, 4000, 15000, 20000, 11, 36654, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Soul Devourer - Cast Fel Breath (Non-Heroic)'),
	(2086603, 20866, 0, 0, 100, 5, 3000, 4000, 15000, 20000, 11, 38813, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Soul Devourer - Cast Fel Breath (Heroic Mode)'),
	(2086604, 20866, 0, 0, 70, 3, 8000, 9000, 12000, 20000, 11, 33958, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Soul Devourer - Cast Enrage');
	
UPDATE creature_template SET AIName='EventAI' WHERE entry=20866;

# Skulking_Witch

DELETE FROM creature_ai_scripts WHERE creature_id=20882;
INSERT INTO creature_ai_scripts VALUES
	(2088201, 20882, 0, 0, 50, 3, 3000, 4000, 10000, 11000, 11, 36864, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skulking Witch - Cast Lash of Pain (Non-Heroic)'),
	(2088202, 20882, 0, 0, 50, 5, 3000, 4000, 10000, 11000, 11, 38852, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skulking Witch - Cast Lash of Pain (Heroic Mode)'),
	(2088203, 20882, 0, 0, 50, 3, 3000, 4000, 10000, 11000, 11, 36863, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skulking Witch - Cast Castise (Non-Heroic)'),
	(2088204, 20882, 0, 0, 50, 5, 3000, 4000, 10000, 11000, 11, 38851, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skulking Witch - Cast Castise (Heroic Mode)'),
	(2088205, 20882, 0, 0, 60, 7, 5000, 7000, 14000, 15000, 11, 36862, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skulking Witch - Cast Gouge');
	
UPDATE creature_template SET AIName='EventAI' WHERE entry=20882;

# Spiteful_Temptress

DELETE FROM creature_ai_scripts WHERE creature_id=20883;
INSERT INTO creature_ai_scripts VALUES
	(2088301, 20883, 0, 0, 100, 3, 3000, 4000, 10000, 11000, 11, 36868, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiteful Temptress - Cast Shadowbolt (Non-Heroic)'),
	(2088302, 20883, 0, 0, 100, 5, 3000, 4000, 10000, 11000, 11, 38892, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiteful Temptress - Cast Shadowbolt (Heroic Mode)'),
	(2088303, 20883, 0, 0, 70, 7, 2000, 2500, 10000, 10500, 11, 36886, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiteful Temptress - Cast Spiteful Fury'),
	(2088305, 20883, 0, 0, 60, 7, 6000, 7000, 12000, 13000, 11, 36866, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spiteful Temptress - Cast Domination');
	
UPDATE creature_template SET AIName='EventAI' WHERE entry=20883;

# Unbound_Devastator

DELETE FROM creature_ai_scripts WHERE creature_id=20881;
INSERT INTO creature_ai_scripts VALUES
	(2088101, 20881, 0, 0, 70, 3, 3000, 4000, 19000, 19500, 11, 36887, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unbound Devastator - Cast Deafening Roar (Non-Heroic)'),
	(2088102, 20881, 0, 0, 70, 5, 3000, 4000, 10000, 11000, 11, 38850, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unbound Devastator - Cast Deafening Roar (Heroic Mode)'),
	(2088103, 20881, 0, 0, 100, 3, 2000, 3000, 10000, 11000, 11, 36891, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unbound Devastator - Cast Devastate (Non-Heroic)'),
	(2088104, 20881, 0, 0, 100, 5, 2000, 3000, 10000, 11000, 11, 38849, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unbound Devastator - Cast Devastate (Heroic Mode)');

UPDATE creature_template SET AIName='EventAI' WHERE entry=20881;

# Sargeron Archer

DELETE FROM creature_ai_scripts WHERE creature_id=20901;
INSERT INTO creature_ai_scripts VALUES
	(2090101, 20901, 0, 0, 100, 3, 2500, 3000, 2500, 3000, 11, 22907, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Archer - Shoot (Non-Heroic)'),
	(2090102, 20901, 0, 0, 100, 5, 2500, 3000, 2500, 3000, 11, 38940, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Archer - Shoot (Heroic Mode)'),
	(2090103, 20901, 0, 0, 100, 3, 500, 1000, 60000, 61000, 11, 36827, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Archer - Use Hooked Net (Non-Heroic)'),	
	(2090104, 20901, 0, 0, 100, 5, 500, 1000, 60000, 61000, 11, 38912, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Archer - Use Hooked Net (Heroic Mode)'),
	(2090105, 20901, 0, 0, 100, 3, 18000, 19000, 18000, 19000, 11, 36984, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Archer - Serpent Sting (Non-Heroic)'),
	(2090106, 20901, 0, 0, 100, 5, 18000, 19000, 18000, 19000, 11, 38914, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Archer - Serpent Sting (Heroic Mode)'),
	(2090107, 20901, 0, 0, 50, 3, 6000, 6500, 15000, 15500, 11, 35932, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Archer - Cast Immolation Arrow (Non-Heroic)'),	
	(2090108, 20901, 0, 0, 50, 5, 6000, 6500, 15000, 15500, 11, 38943, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Archer - Cast Immolation Arrow (Heroic Mode)'),
	(2090109, 20901, 0, 0, 50, 3, 6000, 6500, 15000, 15500, 11, 35964, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Archer - Cast Frost Arrow (Non-Heroic)'),	
	(2090110, 20901, 0, 0, 50, 5, 6000, 6500, 15000, 15500, 11, 38942, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sargeron Archer - Cast Frost Arrow (Heroic Mode)');
	
UPDATE creature_template SET AIName='EventAI', unit_flags=68 WHERE entry=20901;

# Wrath-Srcyer Soccothrates

DELETE FROM creature_ai_scripts WHERE id IN (2088601, 2088605);
INSERT INTO creature_ai_scripts VALUES
	(2088601, 20886, 0, 0, 100, 3, 100, 500, 60000, 61000, 11, 36051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wrath-Scryer Soccothrates - Cast Fel Immolation'),
	(2088605, 20886, 0, 0, 100, 5, 100, 500, 60000, 61000, 11, 39007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wrath-Scryer Soccothrates - Cast Felfire Line Up');
	
UPDATE creature_template SET AIName='EventAI' WHERE entry=20886;

# Arcatraz Sentinel

DELETE FROM creature_ai_scripts WHERE id IN (2086901, 2086902);
INSERT INTO creature_ai_scripts VALUES
	(2086901, 20869, 0, 0, 20, 7, 1000, 5000, 120000, 125000, 11, 36716, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcatraz Sentinel - Cast Arcane Blurst'),
	(2086902, 20869, 2, 0, 100, 7, 5, 0, 0, 0, 11, 38830, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcatraz Sentinel - Cast Explode Aura'); 

UPDATE creature_template SET AIName='EventAI' WHERE entry=20869;

# Eredar_Deathbringer

DELETE FROM creature_ai_scripts WHERE creature_id=20880;
INSERT INTO creature_ai_scripts VALUES
	(2088001, 20880, 0, 0, 100, 3, 6000, 7000, 15000, 20000, 11, 36787, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eredar Deathbringer - Cast Forceful Cleave (Non-Heroic)'),
	(2088002, 20880, 0, 0, 100, 5, 6000, 7000, 15000, 20000, 11, 38846, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eredar Deathbringer - Cast Forceful Cleave (Heroic Mode)'),
	(2088003, 20880, 0, 0, 100, 3, 7000, 8000, 10000, 11000, 11, 27987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eredar Deathbringer - Cast Unholy Aura (Non-Heroic)'),
	(2088004, 20880, 0, 0, 100, 5, 7000, 8000, 10000, 11000, 11, 38844, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eredar Deathbringer - Cast Unholy Aura (Heroic Mode)');
	
UPDATE creature_template SET AIName='EventAI' WHERE entry=20880;


-- ### UPDATES ### --

# Update Hitpoints 
# Arcatraz Sentinel

UPDATE creature_template SET minhealth=46108 WHERE entry=20869;
UPDATE creature SET curhealth=46108 WHERE id=20869;
UPDATE creature_template SET minhealth=64801 WHERE entry=21586;

# Updates for some ohter fixes

UPDATE creature_template SET minhealth=28808, maxhealth=28808, ScriptName='boss_harbinger_skyriss_illusion', flags_extra=0, lootid=0, questitem1=0, unit_flags=524864 WHERE entry IN (21599, 21600);
UPDATE creature_template SET lootid=21599, questitem1=33861, minhealth=162000, maxhealth=162000 WHERE entry=21601;
UPDATE creature_template SET maxhealth=100000, minhealth=100000, flags_extra=2 WHERE entry IN (21620, 21101);
DELETE FROM creature_template_addon WHERE entry=20886;

-- ### Loot-Updates ### --

# Set Lootid for Eredar_Deathbringer in Heroic Mode

UPDATE creature_template SET lootid=20880 WHERE entry=21594;

# Update Loot-ID's for Creatures in Heroic Mode

UPDATE creature_template SET lootid=20859 WHERE entry=21587;
UPDATE creature_template SET lootid=20857 WHERE entry=21585;
UPDATE creature_template SET lootid=20900 WHERE entry=21621;
UPDATE creature_template SET lootid=20865 WHERE entry=21607;
UPDATE creature_template SET lootid=20898 WHERE entry=21598;
UPDATE creature_template SET lootid=20864 WHERE entry=21608;
UPDATE creature_template SET lootid=20875 WHERE entry=21604;
UPDATE creature_template SET lootid=20873 WHERE entry=21605;
UPDATE creature_template SET lootid=20866 WHERE entry=21614;
UPDATE creature_template SET lootid=20867 WHERE entry=21591;
UPDATE creature_template SET lootid=20881 WHERE entry=21619;
UPDATE creature_template SET lootid=20883 WHERE entry=21615;
UPDATE creature_template SET lootid=20882 WHERE entry=21613;
UPDATE creature_template SET lootid=20896 WHERE entry=21596;
UPDATE creature_template SET lootid=21702 WHERE entry=22346;
UPDATE creature_template SET lootid=20897 WHERE entry=21597;
UPDATE creature_template SET lootid=20901 WHERE entry=21610;
UPDATE creature_template SET lootid=20902 WHERE entry=21611;
UPDATE creature_template SET lootid=20879 WHERE entry=21595;
UPDATE creature_template SET lootid=20869 WHERE entry=21586;







