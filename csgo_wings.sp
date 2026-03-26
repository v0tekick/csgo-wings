#pragma semicolon 1

#include <sourcemod>
#include <sdktools>

public Plugin myinfo = {
    name = "CSGO Wings (In-Air Kills)",
    author = "AI",
    description = "Adds CS2-style wings for in-air kills.",
    version = "1.0",
    url = "https://github.com/v0tekick/csgo-wings"
};

char g_WeaponClasses[][] = {
    "glock", "hkp2000", "usp_silencer", "p250", "tec9", "fiveseven", "cz75a", "deagle", "revolver", "elite",
    "nova", "xm1014", "sawedoff", "mag7",
    "mac10", "mp9", "mp7", "mp5sd", "ump45", "p90", "bizon",
    "galilar", "famas", "ak47", "m4a1", "m4a1_silencer", "ssg08", "sg556", "aug", "awp", "g3sg1", "scar20",
    "m249", "negev",
    "taser",
    "knife", "knifegg", "knife_t", "knife_css", "bayonet", "knife_flip", "knife_gut", "knife_karambit",
    "knife_m9_bayonet", "knife_tactical", "knife_falchion", "knife_survival_bowie", "knife_butterfly",
    "knife_push", "knife_ursus", "knife_gypsy_jackknife", "knife_stiletto", "knife_widowmaker", "knife_ghost",
    "knife_canis", "knife_cord", "knife_skeleton", "knife_outdoor", "melee",
    "knife_kukri", "knife_twinblade"
};

public void OnPluginStart()
{
    HookEvent("player_death", Event_PlayerDeath, EventHookMode_Pre);
}

public void OnMapStart()
{
    char filePath[256];
    for (int i = 0; i < sizeof(g_WeaponClasses); i++)
    {
        Format(filePath, sizeof(filePath), "materials/panorama/images/icons/equipment/%s_inair.svg", g_WeaponClasses[i]);
        AddFileToDownloadsTable(filePath);
    }
}

public Action Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
    int attacker = GetClientOfUserId(event.GetInt("attacker"));
    int victim = GetClientOfUserId(event.GetInt("userid"));
    
    // Ignore world kills, suicides, or invalid clients
    if (attacker == 0 || attacker == victim || !IsClientInGame(attacker))
    {
        return Plugin_Continue;
    }
    
    // Check if attacker is in air
    int flags = GetEntityFlags(attacker);
    if (!(flags & FL_ONGROUND) && GetEntityMoveType(attacker) != MOVETYPE_LADDER)
    {
        char weapon[64];
        event.GetString("weapon", weapon, sizeof(weapon));
        
        // Exclude grenades (user said NOT grenades)
        if (StrEqual(weapon, "hegrenade") || 
            StrEqual(weapon, "flashbang") || 
            StrEqual(weapon, "smokegrenade") || 
            StrEqual(weapon, "decoy") || 
            StrEqual(weapon, "incgrenade") || 
            StrEqual(weapon, "molotov"))
        {
            return Plugin_Continue;
        }
        
        // Append _inair to the weapon string
        Format(weapon, sizeof(weapon), "%s_inair", weapon);
        event.SetString("weapon", weapon);
        
        return Plugin_Changed;
    }
    
    return Plugin_Continue;
}
