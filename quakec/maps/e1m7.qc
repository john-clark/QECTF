void(entity goal, entity capturee) FlagCapture_e1m7 =
{
    local entity flagboss = find(world,classname,"monster_flagboss");

    if(flagboss) {

        local entity oself = self;
        self = flagboss;

        monster_flagboss_aimForCapture(goal.origin);
        
        self = oself;
    }
}

void(entity flag,entity player) FlagPickedUp_e1m7 =
{
    local entity flagboss = find(world,classname,"monster_flagboss");

    if(flagboss)
    {
        local entity oself = self;
        self = flagboss;
        monster_flagboss_playerPickedUpFlag(player);
        self = oself;
    } 
}


void() PostPopulate_e1m7 =
{
    // Remove bridge button since bridge is made permanent
    Maps_RemoveEntitiesByModel("*16");

    // Remove deathmatch spawn platforms
    Maps_RemoveEntityByClassnameContainingPoint("func_wall",'64   448 240');
    Maps_RemoveEntityByClassnameContainingPoint("func_wall",'64  -384 240');
    Maps_RemoveEntityByClassnameContainingPoint("func_wall",'640 -384 240');
    Maps_RemoveEntityByClassnameContainingPoint("func_wall",'640  448 240');
}
void() Populate_e1m7 =
{
    // General stuff
    ctf_gamemode = GAMEMODE_DEFAULT;
    Maps_CleanEntities();
    Maps_SetNextLevel("e3m6");

    // Level exit teleports back up
    Maps_CreateTeleportDestination("tele_exit",'800 65 24', 180);
    Maps_CreateTeleport("tele_exit",'1020 55 -1050','48 48 48',TEAM_ALL,TRUE);

    // Make bridge permanent (not a button)
    Maps_CreateWall("*8",'0 0 0','0 0 0');
    Maps_CreateWall("*9",'0 0 0','0 0 0');

    // Blocking columns in middle
    //Maps_CreateWall("*10",'0  -72 -96','0 0 0');
    Maps_CreateWall("*10",'0  -72 144','0 0 0');
    //Maps_CreateWall("*10",'0 -144 -128','0 0 0');
    Maps_CreateWall("*10",'0 -144 136','0 0 0');
    //Maps_CreateWall("*10",'0 -216 -160','0 0 0');
    Maps_CreateWall("*10",'0 -216 128','0 0 0');
    //Maps_CreateWall("*11",'0  144 -128','0 0 0');
    Maps_CreateWall("*11",'0  144 136','0 0 0');
    //Maps_CreateWall("*11",'0   72 -96','0 0 0');
    Maps_CreateWall("*11",'0   72 144','0 0 0');

    // Stairs to red base
    Maps_CreateStairs("*3",'-192 64 -64','-48 64 -208','0 0 0',9);
    Maps_CreateStairs("*4",'-192 -64 -64','-48 -64 -208','0 0 0',9);

    // Stairs to blue base
    Maps_CreateStairs("*2",'232 0 -80','104 0 -208','0 0 0',8);
    Maps_CreateStairs("*5",'232 0 -80','104 0 -208','0 0 0',8);

    // Lava Platforms
    Maps_CreateWall("*3",'232 200 -128','0 0 0');
    Maps_CreateWall("*3",'232 200 -240','0 0 0');
    Maps_CreateWall("*3",'160 200 -240','0 0 0');
    Maps_CreateWall("*3",'288 200 -240','0 0 0');
    Maps_CreateWall("*4",'232 -200 -128','0 0 0');
    Maps_CreateWall("*4",'160 -200 -240','0 0 0');
    Maps_CreateWall("*4",'288 -200 -240','0 0 0');

    // Flags
    Maps_SpawnTeamKey(TEAM_BLUE,'1024 64 216');
    Maps_SpawnTeamKey(TEAM_RED, '-256 64 232');

    // Blue Team Spawns
    Maps_TeamSpawn(TEAM_BLUE,' 1024  350 216','0 180 0',SPAWN_FL_SHORT_INVULNERABILITY);
    Maps_TeamSpawn(TEAM_BLUE,' 1024 -255  -8','0 180 0',SPAWN_FL_SHORT_INVULNERABILITY);
    Maps_TeamSpawn(TEAM_BLUE,' 1024 -230 216','0 180 0',SPAWN_FL_SHORT_INVULNERABILITY);
    Maps_TeamSpawn(TEAM_BLUE,' 1024  385  -8','0 180 0',SPAWN_FL_SHORT_INVULNERABILITY);

    // Red Team Spawns
    Maps_TeamSpawn(TEAM_RED,'-256 -230 232','0 0 0',SPAWN_FL_SHORT_INVULNERABILITY);
    Maps_TeamSpawn(TEAM_RED,'-256  385  56','0 0 0',SPAWN_FL_SHORT_INVULNERABILITY);
    Maps_TeamSpawn(TEAM_RED,'-256  350 232','0 0 0',SPAWN_FL_SHORT_INVULNERABILITY);
    Maps_TeamSpawn(TEAM_RED,'-256 -255  56','0 0 0',SPAWN_FL_SHORT_INVULNERABILITY);

    // Upper sides
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,     '315 -310 216');
    Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'350 -330 216');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,     '355 -310 216');

    Maps_SpawnItemRockets(TEAM_ALL,TRUE,     '315 420 216');
    Maps_SpawnWeaponGrenadeLauncher(TEAM_ALL,'350 460 216');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,     '355 420 216');

    // Lower sides
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,    '410 450 56');
    Maps_SpawnWeaponRocketLauncher(TEAM_ALL,'350 460 56');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,    '260 450 56');

    Maps_SpawnItemRockets(TEAM_ALL,TRUE,    '410 -340 56');
    Maps_SpawnWeaponRocketLauncher(TEAM_ALL,'350 -330 56');
    Maps_SpawnItemRockets(TEAM_ALL,TRUE,    '260 -340 56');

    // Red forward (peninsula)
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'-60 30 8');
    Maps_SpawnWeaponLightning(TEAM_ALL,'-15 65 8');
    Maps_SpawnItemCells(TEAM_ALL,TRUE,'-60 70 8');

    // Blue forward (bridge)
    Maps_SpawnItemCells(TEAM_ALL,TRUE, '720 70 24');
    Maps_SpawnWeaponLightning(TEAM_ALL,'695 65 24');
    Maps_SpawnItemCells(TEAM_ALL,TRUE, '720 30 24');

    // Yellow on lifts
    Maps_SpawnArmor2(TEAM_ALL,'1225 65 -8');
    Maps_SpawnArmor2(TEAM_ALL,'-440 65 56');

    // Red and Mega on Lava Platforms
    Maps_SpawnArmorInv(TEAM_ALL,  '360 -150  56');
    Maps_SpawnHealthMega(TEAM_ALL,'340 -170 152');
    Maps_SpawnArmorInv(TEAM_ALL,  '360  280  56');
    Maps_SpawnHealthMega(TEAM_ALL,'340  260 152');

    // Red lower base
    Maps_SpawnHealth(TEAM_RED,'-270  270 56');
    Maps_SpawnArmor1(TEAM_RED,'-250  215 56');
    Maps_SpawnHealth(TEAM_RED,'-270  120 56');
    Maps_SpawnWeaponSuperShotgun(TEAM_RED,'-250 65 56');
    Maps_SpawnHealth(TEAM_RED,'-270  -30 56');
    Maps_SpawnArmor1(TEAM_RED,'-250  -85 56');
    Maps_SpawnHealth(TEAM_RED,'-270 -180 56');

    // Red upper base
    Maps_SpawnHealth(TEAM_RED,'-270 120 232');
    Maps_SpawnHealth(TEAM_RED,'-270 -30 232');
    Maps_SpawnHealth(TEAM_RED,'-170  45 232');

    // Red spawns have shells
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-270 -255  56');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-270  385  56');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-270 -230 232');
    Maps_SpawnItemShells(TEAM_RED,TRUE,'-270  350 232');

    // Blue upper base
    Maps_SpawnHealth(TEAM_BLUE,'1004  270 -8');
    Maps_SpawnArmor1(TEAM_BLUE,'1024  215 -8');
    Maps_SpawnHealth(TEAM_BLUE,'1004  120 -8');
    Maps_SpawnWeaponSuperShotgun(TEAM_BLUE,'1024 65 -8');
    Maps_SpawnHealth(TEAM_BLUE,'1004  -30 -8');
    Maps_SpawnArmor1(TEAM_BLUE,'1024  -85 -8');
    Maps_SpawnHealth(TEAM_BLUE,'1004 -180 -8');

    // Blue upper base
    Maps_SpawnHealth(TEAM_BLUE,'1004 120 168');
    Maps_SpawnHealth(TEAM_BLUE,'1004 -30 168');
    Maps_SpawnHealth(TEAM_BLUE,'805   45 160');

    // Blue spawns have shells
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,' 1004  385   -8');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,' 1004 -255   -8');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,' 1004  350  216');
    Maps_SpawnItemShells(TEAM_BLUE,TRUE,' 1004 -230  216');

    // Secrets!
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,  '750 110 -1063');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,  '750  70 -1063');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,  '750  30 -1063');
    Maps_SpawnItemSpikes(TEAM_ALL,TRUE,  '750 -10 -1063');
    Maps_SpawnWeaponNailgun(TEAM_ALL,     '910 80 -1063');
    Maps_SpawnWeaponSuperNailgun(TEAM_ALL,'910 25 -1063');

    // Decorations way up high to show side colors
    Maps_SpawnArmorInv(TEAM_ALL,  '250 -128  528');
    Maps_SpawnArmorInv(TEAM_ALL,  '250  -88  600');
    Maps_SpawnArmorInv(TEAM_ALL,  '250  -16  600');
    Maps_SpawnArmorInv(TEAM_ALL,  '250   64  600');
    Maps_SpawnArmorInv(TEAM_ALL,  '250  136  600');
    Maps_SpawnArmorInv(TEAM_ALL,  '250  208  600');
    Maps_SpawnArmorInv(TEAM_ALL,  '250  248  528');
    Maps_SpawnArmor1(TEAM_ALL,    '455 -128  528');
    Maps_SpawnArmor1(TEAM_ALL,    '455  -88  600');
    Maps_SpawnArmor1(TEAM_ALL,    '455  -16  600');
    Maps_SpawnArmor1(TEAM_ALL,    '455   64  600');
    Maps_SpawnArmor1(TEAM_ALL,    '455  136  600');
    Maps_SpawnArmor1(TEAM_ALL,    '455  208  600');
    Maps_SpawnArmor1(TEAM_ALL,    '455  248  528');


    // Flag boss
    Maps_InitializeEntity(Maps_CreateEntityAtPosition('356 64 -48'),monster_flagboss);

    // Other lightning button
    local entity ent = Maps_CreateEntityAtPosition('-828 0 -154');
    ent.model = "*13";
    ent.noise = "buttons/airbut1.wav";
    ent.speed = 40;
    ent.wait = 1.0;
    ent.lip = 4.0;
    ent.target = "t14";
    ent.angles = '0 -2 0';
    Maps_InitializeEntity(ent,func_button);
}
