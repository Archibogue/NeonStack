# Neon Stack V3 - kit TCG Arena

Ce dossier prepare un chargement de **Neon Stack V3** dans **tcg-arena.fr** en mode **semi-manuel**.

## Contenu

- `Game_Neon Stack.template.json` : definition du jeu
- `CardList.template.json` : cartes Neon Stack V3
- `DeckList.template.json` : decks Cyan V3 et Orange V3
- `images/` : cartes recadrees depuis les planches V3 + utilitaires + fond de table
- `build_tcg_arena_bundle.py` : script pour remplacer `__BASE_URL__` par ton URL publique et generer le lien TCG Arena

## Ce qui est deja prevu

- regles V3 en format duel 5 cartes de main, pioche 1 par tour
- compteurs recommandes :
  1. Noyau = 20
  2. Energie max = 0
  3. Energie disponible = 0
- zones pratiques :
  - Programmes
  - Artefact
  - Pile d'appel
- auto-placement depuis la main :
  - Programme -> Programmes
  - Artefact -> Artefact
  - Equipement -> Programmes
  - Commande / Interrupt -> Pile d'appel
- sideboard utilitaire dans chaque deck :
  - Cadres 0 a 6
  - Cadres bugues
  - Cadres fantomes 0
  - Cadres infinis

Ces cartes utilitaires servent a representer la pile d'appel et les etats speciaux, puisque TCG Arena n'automatise pas tes mecanismes de recursion.

## Mise en ligne

Il faut heberger ce dossier sur une URL publique (GitHub Pages est le plus simple).

Exemple de base URL :
`https://monuser.github.io/neon-stack-tcg-arena`

Puis lancer :

```bash
python build_tcg_arena_bundle.py https://monuser.github.io/neon-stack-tcg-arena
```

Le script cree le dossier `dist/` avec :
- `CardList.json`
- `DeckList.json`
- `Game_Neon Stack.json`
- `TCG_Arena_load_link.txt`

## Methode conseillee dans TCG Arena

1. Charge le lien present dans `TCG_Arena_load_link.txt`
2. Choisis les decks :
   - `Neon Stack - Cyan V3`
   - `Neon Stack - Orange V3`
3. Ouvre le sideboard pour recuperer les cartes utilitaires de pile
4. Garde la resolution manuelle, selon le livret V3

## Remarque importante

Le layout TCG Arena fourni ici est pragmatique. Il devrait etre exploitable, mais je ne peux pas verifier visuellement l'instance chargee depuis ici.
Le coeur du travail est donc solide sur :
- les cartes V3
- les decks
- les marqueurs de pile
- le lien de chargement generable automatiquement
