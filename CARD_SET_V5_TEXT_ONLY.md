# NEON STACK — Set de cartes V5 alpha (texte uniquement)

Version sans graphisme, conçue pour la V5 alpha centrée sur :
- la mémoire ;
- les piles d'appels ;
- les Cycles CPU ;
- les fonctions cassées ;
- le bonus de récursion en Fibonacci classique.

## Format retenu
- **2 decks de 34 cartes**
- **12 cartes communes** aux deux decks
- **22 cartes spécifiques** par deck
- **Deck Cyan** : stabilité, nettoyage, réparation, contrôle de pile
- **Deck Orange** : pression, surcharge, pollution de pile, accélération risquée

---

# A. Cartes communes aux deux decks (12 cartes)

## Routine Sentinelle ×2
**Fonction** — coût mémoire initial 2 — valeur 1 — **Empiler jusqu'à 2**
- **Cas de base** : regarde la carte du dessus de ton deck. Tu peux la laisser ou la mettre dessous.
- **Remontée** : gagne 1 mémoire libre.
- **Terminaison** : pioche **F(R)** carte(s).

## Fonction Factorielle ×2
**Fonction** — coût mémoire initial 3 — valeur 2 — **Empiler jusqu'à 4**
- **Cas de base** : pioche 1 carte.
- **Remontée** : gagne 1 mémoire libre.
- **Terminaison** : gagne **F(R)** mémoire libre jusqu'à la fin du tour.

## Vérification de Bornes ×2
**Fonction** — coût mémoire initial 2 — valeur 1 — **Empiler jusqu'à 3**
- **Cas de base** : retire 1 cadre parasite de cette fonction.
- **Remontée** : tu peux regarder le sommet d'une autre de tes fonctions.
- **Terminaison** : retire jusqu'à **F(R)** cadres parasites répartis comme tu veux parmi tes fonctions.

## Collecte Incrémentale ×2
**Commande** — coût 2
- Nettoie une de tes fonctions cassées.
- Pioche 1 carte.

## Débogueur pas à pas ×1
**Interrupt** — coût 2
- Joue cette carte quand une de tes fonctions devrait casser.
- Annule cette casse.
- Dépile à la place le cadre du sommet de cette fonction. N'applique pas son effet.
- Si c'était un cadre récursif normal, libère la mémoire correspondante.

## Cache L1 ×1
**Hardware** — coût 2
- Le premier **Dépiler** que tu effectues à chacun de tes tours coûte **0 Cycle CPU**.

## Barrette RAM ×1
**Hardware** — coût 3
- Quand cette carte entre en jeu, gagne **+4 mémoire totale** et **+4 mémoire libre**.

## Planificateur local ×1
**Hardware** — coût 2
- Le premier **Empiler** que tu effectues à chacun de tes tours coûte **0 Cycle CPU**.

---

# B. Deck Cyan — 22 cartes spécifiques

## Archiviste du Cache ×2
**Fonction** — coût mémoire initial 2 — valeur 1 — **Empiler jusqu'à 3**
- **Cas de base** : regarde les 2 cartes du dessus de ton deck, puis remets-les dans l'ordre de ton choix.
- **Remontée** : gagne 1 mémoire libre.
- **Terminaison** : pioche **F(R)** carte(s), puis défausse 1 carte.

## Recherche Dichotomique ×2
**Fonction** — coût mémoire initial 2 — valeur 2 — **Empiler 3**
- **Cas de base** : révèle les 3 cartes du dessus de ton deck ; mets-en 1 dans ta main et le reste dessous dans l'ordre de ton choix.
- **Remontée** : retire 1 cadre parasite d'une de tes fonctions.
- **Terminaison** : révèle les **F(R) + 1** cartes du dessus de ton deck ; mets-en 1 dans ta main et le reste dessous dans l'ordre de ton choix.

## Tri Fusion Tempéré ×2
**Fonction** — coût mémoire initial 3 — valeur 2 — **Empiler jusqu'à 4**
- **Cas de base** : pioche 1 carte.
- **Remontée** : tu peux réordonner les 2 cartes du dessus de ton deck.
- **Terminaison** : retire jusqu'à **F(R)** cadres parasites répartis comme tu veux parmi tes fonctions.

## Compactage Mémoire ×2
**Fonction** — coût mémoire initial 3 — valeur 2 — **Empiler jusqu'à 3**
- **Cas de base** : gagne 1 mémoire libre.
- **Remontée** : retire 1 cadre parasite de cette fonction.
- **Terminaison** : nettoie une de tes fonctions cassées. Si **F(R) ≥ 2**, pioche 1 carte.

## Inspecteur de Pile ×1
**Fonction** — coût mémoire initial 2 — valeur 1 — **Empiler jusqu'à 2**
- **Cas de base** : regarde le sommet d'une pile de ton choix.
- **Remontée** : tu peux déplacer le cadre parasite du sommet d'une de tes fonctions vers une autre de tes fonctions.
- **Terminaison** : répare une de tes fonctions cassées.

## Nettoyeur Générationnel ×1
**Fonction** — coût mémoire initial 4 — valeur 3 — **Empiler jusqu'à 5**
- **Cas de base** : nettoie une de tes fonctions cassées.
- **Remontée** : gagne 1 mémoire libre.
- **Terminaison** : pioche **F(R)** carte(s).

## Purge Contrôlée ×2
**Commande** — coût 2
- Retire jusqu'à 2 cadres parasites d'une fonction.
- Si aucun cadre parasite n'a été retiré, pioche 1 carte.

## Hotfix ×2
**Commande** — coût 3
- Répare une de tes fonctions cassées.
- Cette fonction revient avec son cadre initial seulement.
- Sa mémoire initiale reste réservée.

## Pause de Sécurité ×2
**Interrupt** — coût 2
- Joue cette carte quand un adversaire effectue un **Empiler**.
- Annule cet **Empiler**.
- Le coût en Cycle CPU est quand même payé.

## Défragmentation ×2
**Interrupt** — coût 2
- Joue cette carte quand un adversaire dépile une **Remontée**.
- Annule l'effet de cette **Remontée**.
- La mémoire normalement libérée par ce cadre est quand même libérée.

## Console de Diagnostic ×1
**Hardware** — coût 2
- Une fois par tour, quand tu lances une fonction portant la mention **Empiler jusqu'à X**, tu peux augmenter ou réduire sa profondeur cible de 1, sans sortir de l'intervalle autorisé.

## ECC Mémoire ×1
**Hardware** — coût 3
- La première fois à chaque tour qu'une de tes fonctions devrait casser, annule cette casse.
- Ajoute à la place 1 cadre parasite au sommet de cette fonction.

## Ordonnanceur Zen ×1
**Hardware** — coût 2
- Au début de chacun de tes tours, gagne **+1 Cycle CPU**.
- Ce cycle supplémentaire ne peut servir qu'à **Dépiler**.

## Limiteur de Pile ×1
**Hardware** — coût 2
- Une fois par tour, quand une de tes fonctions devrait recevoir un 8e cadre, annule cet **Empiler** à la place.

## Sauvegarde Locale ×1
**Commande** — coût 1
- Choisis une de tes fonctions actives.
- Jusqu'à la fin du tour, si elle casse, renvoie-la dans ta main à la place.
- Libère toute la mémoire qu'elle occupait.

---

# C. Deck Orange — 22 cartes spécifiques

## Greffon Glouton ×2
**Fonction** — coût mémoire initial 2 — valeur 1 — **Empiler jusqu'à 3**
- **Cas de base** : pioche 1 carte.
- **Remontée** : l'adversaire perd 1 mémoire libre.
- **Terminaison** : ajoute **F(R)** cadres parasites répartis comme tu veux entre les fonctions adverses.

## Quicksort Agressif ×2
**Fonction** — coût mémoire initial 3 — valeur 2 — **Empiler jusqu'à 4**
- **Cas de base** : regarde les 2 cartes du dessus de ton deck ; mets-en 1 dans ta main et défausse l'autre.
- **Remontée** : l'adversaire perd 1 mémoire libre.
- **Terminaison** : l'adversaire perd **F(R)** mémoire libre au début de son prochain tour.

## Expansion Fibonacci ×2
**Fonction** — coût mémoire initial 3 — valeur 2 — **Empiler jusqu'à 5**
- **Cas de base** : pioche 1 carte.
- **Remontée** : gagne 1 mémoire libre.
- **Terminaison** : gagne **F(R)** mémoire libre jusqu'à la fin de ton prochain tour.

## Fonction Parasite ×2
**Fonction** — coût mémoire initial 2 — valeur 1 — **Empiler jusqu'à 3**
- **Cas de base** : ajoute 1 cadre parasite au sommet de cette fonction.
- **Remontée** : déplace 1 cadre parasite de cette fonction vers une fonction adverse.
- **Terminaison** : si cette fonction n'a plus de cadre parasite, ajoute **F(R)** cadres parasites répartis comme tu veux entre les fonctions adverses.

## Bombe à Retours ×1
**Fonction** — coût mémoire initial 4 — valeur 3 — **Empiler 4**
- **Cas de base** : pioche 1 carte.
- **Remontée** : l'adversaire perd 1 Cycle CPU à son prochain tour.
- **Terminaison** : l'adversaire perd **F(R)** mémoire libre au début de son prochain tour.

## Récursion Gloutonne ×1
**Fonction** — coût mémoire initial 4 — valeur 3 — **Empiler jusqu'à 6**
- **Cas de base** : aucun effet.
- **Remontée** : gagne 1 mémoire libre.
- **Terminaison** : si **R ≥ 4**, marque 2 points supplémentaires.

## Injection de Boucle ×2
**Interrupt** — coût 2
- Joue cette carte quand une fonction est lancée ou quand un joueur effectue un **Empiler** sur une fonction.
- Ajoute immédiatement 1 cadre supplémentaire à cette fonction.
- Son contrôleur doit payer 1 mémoire libre ; sinon, cette fonction casse.

## Stack Spike ×2
**Interrupt** — coût 3
- Joue cette carte quand une fonction contient exactement 5 ou 6 cadres.
- Ajoute 2 cadres parasites à cette fonction.

## Pollution de Cache ×2
**Commande** — coût 2
- Choisis une fonction adverse.
- Ajoute-lui 2 cadres parasites.

## Rebond Infini ×1
**Interrupt** — coût 3
- Joue cette carte quand un adversaire devrait dépiler un cadre **[0]**.
- Annule le **Cas de base** de ce cadre.
- Cette fonction casse immédiatement.

## Overclocking ×1
**Hardware** — coût 2
- Au début de chacun de tes tours, gagne **+1 Cycle CPU**.
- Si tu dépenses 5 Cycles CPU ou plus pendant ce tour, perds 1 mémoire libre à la fin du tour.

## Démon du Débordement ×1
**Hardware** — coût 3
- À chaque fois qu'une fonction adverse casse à cause d'un overflow, ajoute 1 cadre parasite à une autre fonction adverse.

## Sabotage de Collecte ×1
**Interrupt** — coût 1
- Joue cette carte quand un adversaire joue une carte qui **nettoie** ou **répare**.
- Contrecarre cette carte.

## Swap Brutal ×2
**Commande** — coût 1
- Gagne 3 mémoire libre jusqu'à la fin du tour.
- À la fin du tour, si tu n'as pas terminé au moins une fonction, perds 1 mémoire totale.

---

# D. Résumé de composition

## Deck Cyan (34 cartes)
### Communes (12)
- Routine Sentinelle ×2
- Fonction Factorielle ×2
- Vérification de Bornes ×2
- Collecte Incrémentale ×2
- Débogueur pas à pas ×1
- Cache L1 ×1
- Barrette RAM ×1
- Planificateur local ×1

### Spécifiques Cyan (22)
- Archiviste du Cache ×2
- Recherche Dichotomique ×2
- Tri Fusion Tempéré ×2
- Compactage Mémoire ×2
- Inspecteur de Pile ×1
- Nettoyeur Générationnel ×1
- Purge Contrôlée ×2
- Hotfix ×2
- Pause de Sécurité ×2
- Défragmentation ×2
- Console de Diagnostic ×1
- ECC Mémoire ×1
- Ordonnanceur Zen ×1
- Limiteur de Pile ×1
- Sauvegarde Locale ×1

## Deck Orange (34 cartes)
### Communes (12)
- Routine Sentinelle ×2
- Fonction Factorielle ×2
- Vérification de Bornes ×2
- Collecte Incrémentale ×2
- Débogueur pas à pas ×1
- Cache L1 ×1
- Barrette RAM ×1
- Planificateur local ×1

### Spécifiques Orange (22)
- Greffon Glouton ×2
- Quicksort Agressif ×2
- Expansion Fibonacci ×2
- Fonction Parasite ×2
- Bombe à Retours ×1
- Récursion Gloutonne ×1
- Injection de Boucle ×2
- Stack Spike ×2
- Pollution de Cache ×2
- Rebond Infini ×1
- Overclocking ×1
- Démon du Débordement ×1
- Sabotage de Collecte ×1
- Swap Brutal ×2

---

# E. Remarques d'équilibrage
- **Prototype alpha** : les coûts et quantités devront être testés.
- Le deck **Cyan** devrait gagner par régularité, réparation et rendement.
- Le deck **Orange** devrait gagner par pression de pile, tempo CPU et sabotage.
- Les cartes qui forcent des bonds de profondeur ou des gros swings de mémoire doivent rester rares, car le bonus en Fibonacci classique augmente déjà fortement la récompense des fonctions profondes.
