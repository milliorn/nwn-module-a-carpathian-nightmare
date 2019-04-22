# A Carpathian Nightmare v4 - Neverwinter Nights Enhanced Edition

#### Repository for the Neverwinter Nights module A Carpathian Nightmare.

## Scripts
### List of scripts and what they do.


**acn_** - ACN Subrace: More dependencies found inside the scripts such as includes.  Engine fires in module events.

**ai_** - ACN Modified A.I. Scripts: Various scripts based on Bioware/Beamdog A.I.

**area_** - Area OnExit Cleanup Scripts:  Used to cleanup an area when no PC's remain.

**arena_** - Arena Scripts:  Various scripts for the two arenas.

**asterius_** - Asterius Boss:  Scripts to handle the boss and area.

**ch_inc_summon** - Summon Include:  Used with Cheetah's Custom Summon Creature scripts.

**chk_** - See **dm_** scripts.

**cls_** - Feat Spells:  Custom feat spells.

**dm_** - DM Omega Forge:  Custom crafting/forge system created by DM Omega.  Source can be found on the NwVault.  Although its a great system it has some exploits for persistent worlds.  My edits cover all known exploits/bugs that have been reported.  It is heavy in scripts unfortunately do to the use of the built-in dialog system.

**https://neverwintervault.org/project/nwn1/script/omega-forge-v23**

**door_** - Door Scripts:  Various door scripts used in the module.

**gaunt_** - Gauntlet Scripts:  Various scripts used in the Gauntlet area.

**hgll_** - Higher Ground Legendary Level System:  This is the only known working version for Neverwinter Nights Enhanced Edition.  The original authors have not ported it over for EE likely because they have not ported the HG community to EE.  You can download the original version off of the NwVault although that version uses **nwnx2** which was not ported over to EE, instead **nwnxee** is being used for EE.

**https://neverwintervault.org/project/nwn1/script/higher-ground-legendary-level-system-levels-41-60-v21-hgll**

**inc_** - Include Scripts:  Unless noted otherwise these are the module include scripts.

**itm_** - Item Activate Scripts:  Tag based scripts used to activate items unique power.

**merry_** - Merry Scripts:  All scripts to handle the Merry area, npcs, maps, etc.

**mod_** - Module Event Scripts:  All the scripts that go into the modules event handlers.

**nmr_** - Item Scribe System:  All scripts to run the item scribe(naming) system found inside of town.  Useful in RP situations since it charges a fee and interacts with an NPC and a chest to do the job.  I cannot find the author or this download on the NwVault.  Likely it has not migrated, though could be found digging through the archive that you can download from the vault.

**nw_** - Various NwN Scripts:  All spell scripts, these scripts were changed to better reflect or recreate the 3.5 or 5.0 rules.  Some of them are a blend of both.

**nwnx_** - NWNXEE Scripts:  At the time of this writing some of these scripts are outdated, yet work with the current plugins I use.  You would simply just have to pull the latest image of NWNXEE and the scripts that support the plugins.

**obj_** - Object Scripts:  These scripts are used in placeables event handlers.

**pc_** - PC Change Name System:  At the time of this writing this system does not work.  It was intended for the PC to interact with an NPC to change the PC name.  If work is done to allow this I will revisit this and complete it.

**pg_lists_i** - Unknown:  I believe this is used with ZDLG for HGLL.  It's simply and include file.

**port_** - Port Scripts:  Various scripts to port a PC.

**pws_** - Bindstone PC Portal System:  This is a NwVault system that allowed the PC to "bind" their soul to the stone and then port back to the stone they are binded with.  The following link is what I believe to be the source but I am not 100% sure.  The authors name does match.  I have also done small mods to this not found on the source.

**https://neverwintervault.org/project/nwn1/script/tutorial-bind-point-system**

**rav_** - Ravana Scripts:  These scripts are used for the Ravana's Tunnels and Ravana's Coven maps.  The tunnels was designed to be a somewhat Infinite Dungeon scenario before such a thing existed in NwN.  Basically when a PC enters the tunnels and clicks on a transistion the transistion script would randomly port a player to a destination via dice throw.  Until recently the secret was kept from players which led to players drawing and sharing maps they made to try and figure out the shortest route to the boss, when no such route existed.  You could theoretically get to the boss on the first transistion, or the Nth transistion(I've seen 50+ transistions before).  The Coven originates from the **Path of Ascension** module as the area known as Rakshasha's Coven, and the Tunnels were the old Gauntlet from the persistent world **"Chaotic World"**.

**sf_bounty** - Bounty Script:  This is the current version from the original (much simplier) Bounty Script system that was originally created by **Scarface** from **Chaotic World**.  It was the entire theme to promote pvp during NwN heyday that draw players to play ACN and Chaotic World.  These two modules were pvp action modules, essentially a multi-map arena you level up in through Action gameplay and pvp.  This script has **never** been released until now.  I retained the original name of this script as a way to give credit to Scarface for his original work.

**sf_sockets** - Scarface's Socket System:  This is the last version Scarface created that was never released.  It is more current that the NwVault version.  I am also the owner and maintainer of Scarface's work.  It also includes fixes not found on the vault.

**https://neverwintervault.org/project/nwn1/script/scarfaces-socketed-items-v25**

**sf_xp** - Scarfaces's GP/XP Script:  Modified version of Scarfaces GP/XP script.  Designed to give xp upon slaying an npc.  Original source can be found on the NwVault.

**https://neverwintervault.org/project/nwn1/script/scarfaces-gpxp-distribution-system**

**sfpb** - Scarface's Persistant Banking System:  This is the ACN revision of his system.  He originally authored the GP and Item Banking system using NwN DB or nwnx2 SQL.  This version has bug fixes for both GP and Item Banking, along with XP Banking using his GP scripts as templates.  It also uses nwnxee **Redis** as a database to store this info.  The old means of storing data are left in the scripts and commented out (I think).  Original source can be found on the vault, but his latest version is closed source from Chaotic World.

**https://neverwintervault.org/project/nwn2/script/scarfaces-persistent-banking-v10**

**spawn_** - Spawn Scripts:  Various scripts to spawn in NPC's in the module.

**store_** - Store Scripts:  Various scripts to spawn a merchant's store.

**ws_** - Shifter Scripts:  These scripts allow Druids and Shifters to shift while retaining bonus from items.  Original source can be found on the NwVault.  One I am posting is what I believe to be the source, not to be confused with Shadoow's version.

**https://neverwintervault.org/project/nwn1/script/improved-shifter-wildshape-fixes-v13**

**x0_ and x1_** - NwN Scripts:  Various spell scripts modified for 3.5 or 5.0 rules.  Some are blends of both.  

**x2_** - NwN Scripts:  Most of these are to change the way crafting is done via radial menu.  Basically no charge to change appearance of gear.  **x2_pc_umdcheck** is used to implement DnD UMD rules.  I cannot locate the source to this from the vault.  The rest of the scripts are custom changes to NwN spells again to conform to 3.5, 5.0 or a blend of both rules.

**x3_s2_pdk_** - PDK Scripts:  These scripts are my changes to empower the PDK class.  House rules, no DnD rules found here.  Basically I tried to work within what was done to change as little as possible, and just extend its powers like duration or the effects of the spells themselves.

**zdlg_** - ZDLG System:  This is an alternative long ago for a conversation driven system to avoid the built-in NwN system.  It's primary use is to support **hgll** scripts.  I cannot locate the source for this on the NwVault.
