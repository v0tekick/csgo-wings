import os
import shutil

weapons = [
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
]

dest_dir = "materials/panorama/images/icons/equipment"
os.makedirs(dest_dir, exist_ok=True)

for w in weapons:
    dest_path = os.path.join(dest_dir, f"{w}_inair.svg")
    shutil.copy("inairkill.svg", dest_path)

print(f"Generated {len(weapons)} SVG files.")
