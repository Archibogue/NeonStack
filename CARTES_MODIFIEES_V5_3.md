# NEON STACK — Cartes modifiées V5.3

Cette fiche liste uniquement les cartes dont le texte change entre la V5.2 et la V5.3.

Les autres cartes du set V5.2 restent inchangées.

---

## 1. Bombe à Retours ×1

**Deck** : Orange  
**Type** : Fonction  
**Catégorie de pioche** : Fonctions  
**Coût mémoire initial** : 4  
**Valeur** : 3  
**Profondeur** : Empiler 4

### Texte V5.3

- **Cas de base** : Pioche 1 carte.
- **Remontée** : Au prochain tour adverse, la première fonction adverse mise à jour en phase de descente ignore sa mise à jour.
- **Terminaison** : L’adversaire perd 2 mémoire libre au début de son prochain tour.

Si plusieurs effets de **Bombe à Retours** devraient s’appliquer au même tour adverse, un seul de ces effets s’applique.

### Raison de la modification

La version V5.2 ralentissait trop fortement l’adversaire et retirait trop de mémoire à la terminaison. La V5.3 conserve l’identité de sabotage temporel, mais évite le verrouillage complet d’un tour adverse.

---

## 2. Overclocking ×1

**Deck** : Orange  
**Type** : Hardware  
**Catégorie de pioche** : Système  
**Coût** : 2

### Texte V5.3

Au début de chacun de tes tours, tu peux choisir une de tes fonctions. Elle effectue immédiatement une mise à jour supplémentaire.

Si elle ne termine pas ce tour-ci, perds 1 mémoire libre à la fin du tour.

Cette mise à jour supplémentaire a lieu au début de la phase de mise à jour, avant les mises à jour normales.

### Raison de la modification

La version V5.2 accélérait fortement Orange tout en appliquant une pénalité systématique. La V5.3 transforme la carte en outil de timing : elle est très rentable si elle aide une fonction à terminer, mais risquée si elle est utilisée trop tôt.

---

## 3. Rappel des règles associées

Ces cartes supposent les clarifications V5.3 suivantes :

- Le joueur actif choisit l’ordre de mise à jour de ses fonctions.
- Les Commandes et Interrupts libèrent leur mémoire après résolution.
- Les Hardware conservent leur mémoire occupée tant qu’ils restent en jeu.
- Un cadre parasite ajouté avant [0] ne bloque pas la descente.
- La mémoire libre ne descend jamais sous 0.
