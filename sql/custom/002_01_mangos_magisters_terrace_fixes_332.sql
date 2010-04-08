# Spawnt die Gegner im HeroicMode

update creature set spawnMask=3 where map=585 AND id IN (24664, 24683, 24684, 24685, 24686, 24687, 24688, 24689, 24690, 24696, 24697, 24698, 1412, 24722, 24723, 24744, 24761, 24777, 24808, 24815, 24560, 22515, 24822);

# Spawnt die Gameobjects nun auch im Heroischem Modus

UPDATE gameobject SET spawnMask=3 WHERE map=585 AND id IN (188165, 188166, 188173, 188177, 187979, 187990, 187764, 187765, 187766, 187770, 188064, 188065, 188081, 187578, 188118, 187896);

#  Setzt ImmuneMask und FireResist für Phönixe

update creature_template set resistance2=1000, mechanic_immune_mask=619659263 where entry=24674;

#  Setzt Level und Geschwindigkeit für die Arkane Sphäre

update creature_template set minlevel=73, maxlevel=73, speed_walk=0.4, speed_run=0.4 where entry=24708;
update creature_template set minlevel=73, maxlevel=73, speed_walk=0.4, speed_run=0.4 where entry=25543;

# Setzt ScriptName und UnitFlag für die Kristalle bei Felin Feuerherz

update creature_template set ScriptName='mob_fel_crystal', unit_flags=33816578 where entry=25552;

# Setzt Level und Fraktion des Flammenstoß-Triggers

update creature_template set minlevel=73, maxlevel=73, faction_A=35, faction_H=35 where entry=24666;

# Setzt Mana und Leben für die Kristalle

update creature_template set maxmana=10000, minmana=10000, maxhealth=6000, minhealth=6000 where entry=24722;
update creature_template set maxmana=10000, minmana=10000, maxhealth=10000, minhealth=10000 where entry=25552;


