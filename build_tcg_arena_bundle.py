#!/usr/bin/env python3
import argparse, json, os, base64, urllib.parse, shutil
def patch_obj(obj, base_url):
    if isinstance(obj, dict): return {k: patch_obj(v, base_url) for k, v in obj.items()}
    if isinstance(obj, list): return [patch_obj(v, base_url) for v in obj]
    if isinstance(obj, str): return obj.replace("__BASE_URL__", base_url.rstrip("/"))
    return obj
def save_json(path, data):
    with open(path, "w", encoding="utf-8") as f: json.dump(data, f, ensure_ascii=False, separators=(",", ":"))
parser=argparse.ArgumentParser(description="Construit les fichiers TCG Arena de Neon Stack avec une base URL.")
parser.add_argument("base_url", help="Ex. https://monuser.github.io/neon-stack-tcg-arena")
parser.add_argument("--src", default=os.path.dirname(__file__), help="Dossier source contenant les templates")
parser.add_argument("--out", default=None, help="Dossier de sortie")
args=parser.parse_args()
src=args.src
out=args.out or os.path.join(src, "dist")
os.makedirs(out, exist_ok=True)
for folder in ["images"]:
    src_path=os.path.join(src, folder)
    dst_path=os.path.join(out, folder)
    if os.path.exists(dst_path): shutil.rmtree(dst_path)
    shutil.copytree(src_path, dst_path)
with open(os.path.join(src, "CardList.template.json"), encoding="utf-8") as f: cards=patch_obj(json.load(f), args.base_url)
with open(os.path.join(src, "DeckList.template.json"), encoding="utf-8") as f: decks=patch_obj(json.load(f), args.base_url)
with open(os.path.join(src, "Game_Neon Stack.template.json"), encoding="utf-8") as f: game=patch_obj(json.load(f), args.base_url)
save_json(os.path.join(out, "CardList.json"), cards)
save_json(os.path.join(out, "DeckList.json"), decks)
save_json(os.path.join(out, "Game_Neon Stack.json"), game)
game_url=args.base_url.rstrip("/") + "/Game_Neon%20Stack.json"
encoded=base64.b64encode(urllib.parse.quote(game_url, safe="").encode("utf-8")).decode("ascii")
load_link="https://tcg-arena.fr/load/" + encoded
with open(os.path.join(out, "TCG_Arena_load_link.txt"), "w", encoding="utf-8") as f: f.write(load_link + "\n")
print("Fichiers construits dans:", out)
print("Lien de chargement TCG Arena:")
print(load_link)
