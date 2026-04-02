# NEON STACK — Règles V5 alpha

## 1. Idée générale
Chaque joueur construit un **programme** en terminant plusieurs **fonctions**.
Le jeu ne repose plus sur des combats entre programmes, mais sur la gestion de :
- la **mémoire** ;
- la **pile d'appels** ;
- l'**ordonnancement CPU** ;
- les **fonctions cassées** ;
- les effets de récursion.

## 2. Condition de victoire
Un joueur gagne immédiatement s'il atteint **21 points**, à condition d'avoir terminé :
- au moins **4 fonctions** ;
- avec au moins **3 noms de fonctions différents**.

## 3. Mémoire
Chaque joueur commence avec :
- **20 mémoire totale** ;
- **20 mémoire libre**.

La mémoire libre sert à payer les cartes et les appels récursifs.

### 3.1 Coût mémoire des fonctions
Quand une fonction est lancée :
- son **coût mémoire initial** est réservé ;
- son **cadre initial** est empilé ;
- cette mémoire reste occupée tant que la fonction n'est pas terminée, nettoyée ou réparée.

Chaque **Empiler** supplémentaire sur cette fonction coûte **1 mémoire libre** et ajoute un cadre à sa pile.

Quand un cadre récursif est dépilé, la mémoire correspondante est libérée.
Quand le cadre initial est dépilé, le coût mémoire initial est libéré.

## 4. Types de cartes
- **Fonction** : cœur du jeu ; crée et résout une pile d'appels.
- **Commande** : effet joué pendant ton tour.
- **Interrupt** : effet joué en réaction, pendant n'importe quel tour si son coût peut être payé.
- **Hardware** : amélioration matérielle durable.

## 5. Cycles CPU
Chaque joueur dispose de **4 Cycles CPU** au début de chacun de ses tours.

Pendant son tour, il peut dépenser ses Cycles CPU pour :
- **Empiler** sur une fonction : **1 cycle** ;
- **Dépiler** un cadre : **1 cycle**.

Le joueur répartit librement ses cycles entre empilage et dépilage.
Les cycles non utilisés sont perdus à la fin du tour.

Certains Hardware peuvent augmenter ce nombre ou rendre une action gratuite.
Un joueur ne peut jamais dépasser **6 Cycles CPU** pendant un tour, sauf mention contraire d'une carte.

## 6. Empiler et dépiler
### Empiler X
**Empiler X** signifie qu'une fonction a une profondeur cible fixe de **X**.
Quand elle est lancée, on empile son cadre initial **[X]**.
Puis, en dépensant des Cycles CPU et de la mémoire, on peut empiler successivement **[X-1]**, **[X-2]**, etc., jusqu'à **[0]**.

### Empiler jusqu'à X
**Empiler jusqu'à X** signifie que le joueur choisit, au lancement de la fonction, une profondeur cible comprise entre **0** et **X**.
Le cadre initial porte cette valeur choisie.

### Dépiler
**Dépiler** consiste à retirer le cadre du sommet d'une pile et à appliquer son effet d'exécution.

## 7. Cas de base, remontée, terminaison
Le **cas de base** est le cadre **[0]**.
Il est :
- le **dernier cadre empilé** ;
- le **premier cadre dépilé**.

Une fonction n'est **pas** terminée quand son cas de base est résolu.
Elle est terminée seulement quand son **cadre initial** — c'est-à-dire le **premier cadre empilé** — est dépilé à son tour et que sa pile devient vide.

Chaque fonction peut donc avoir jusqu'à trois niveaux d'effet :
- **Cas de base** : effet du cadre [0] ;
- **Remontée** : effet des cadres supérieurs à [0] ;
- **Terminaison** : effet final, appliqué seulement quand la pile de la fonction devient vide.

## 8. Valeur de récursion
On note **R** le nombre d'appels récursifs réellement effectués par une fonction.

Exemples :
- si une fonction n'empile que son cadre initial, alors **R = 0** ;
- si elle atteint une pile **[3][2][1][0]**, alors **R = 3**.

Le bonus de récursion suit la **suite de Fibonacci classique** :
- F(0) = 0
- F(1) = 1
- F(2) = 1
- F(3) = 2
- F(4) = 3
- F(5) = 5
- F(6) = 8

## 9. Score d'une fonction terminée
Quand une fonction se termine :
1. son contrôleur marque ses **points de base** ;
2. il ajoute un bonus de récursion égal à **F(R)** ;
3. il résout l'effet de **Terminaison** de la carte ;
4. la fonction est défaussée ;
5. toute la mémoire qu'elle occupait est libérée.

## 10. Fonctions cassées
Une fonction casse si :
- elle devrait Empiler mais son contrôleur n'a pas assez de mémoire libre pour payer cet appel ;
- elle devrait recevoir un cadre au-delà de la limite autorisée ;
- un effet de carte la casse explicitement.

Une fonction cassée :
- reste en jeu ;
- ne peut plus être empilée ni dépilée ;
- ne rapporte aucun point ;
- continue d'occuper toute la mémoire déjà engagée ;
- compte toujours dans la limite des fonctions actives.

## 11. Nettoyer et réparer
**Nettoyer** une fonction cassée : la défausser ; toute sa mémoire est alors libérée.

**Réparer** une fonction cassée : la remettre en état selon le texte de la carte.
Par défaut, une fonction réparée revient avec :
- sa mémoire initiale toujours réservée ;
- son cadre initial seulement ;
- aucun cadre parasite, sauf mention contraire.

## 12. Cadres parasites
Certains effets ajoutent des **cadres parasites**.

Un cadre parasite :
- compte pour la taille de la pile ;
- doit être dépilé normalement ;
- n'applique aucun cas de base ni aucune remontée ;
- ne libère pas de mémoire lorsqu'il est dépilé.

## 13. Overflow
Une pile ne peut contenir que **7 cadres**.

Si un effet devrait ajouter un **8e cadre**, il y a **overflow** :
- la fonction concernée casse immédiatement ;
- elle reste en jeu comme fonction cassée ;
- sa pile n'est plus résolue.

## 14. Limites de jeu
- **3 fonctions actives maximum** par joueur ;
- **2 Hardware actifs maximum** par joueur ;
- **7 cadres maximum** par pile ;
- **6 Cycles CPU maximum** par tour ;
- **34 cartes par deck** pour la version alpha actuelle.

## 15. Déroulement d'un tour
1. **Pioche** : pioche 1 carte.
2. **Conception** : joue des fonctions, commandes et Hardware tant que tu peux payer leur coût en mémoire.
3. **Ordonnancement CPU** : dépense jusqu'à 4 Cycles CPU pour Empiler et/ou Dépiler, dans l'ordre de ton choix.
4. **Fin de tour** : les effets temporaires cessent ; les cycles non utilisés sont perdus.

## 16. Exemple de tour
Tu contrôles la fonction **Fonction Factorielle**.
Elle a :
- coût mémoire initial **3** ;
- valeur de base **2** ;
- **Empiler jusqu'à 4**.

Au tour précédent, tu l'as lancée en choisissant une profondeur cible de **3**.
Tu as donc empilé le cadre initial **[3]** et réservé **3 mémoire**.

Au début de ton tour :
- tu as encore **17 mémoire libre** ;
- tu reçois **4 Cycles CPU**.

### Étape 1 : Empiler
Tu dépenses **1 Cycle CPU** et **1 mémoire libre** pour empiler **[2]**.
Il te reste :
- **3 Cycles CPU** ;
- **16 mémoire libre**.

Tu dépenses encore **1 Cycle CPU** et **1 mémoire libre** pour empiler **[1]**.
Il te reste :
- **2 Cycles CPU** ;
- **15 mémoire libre**.

Tu dépenses encore **1 Cycle CPU** et **1 mémoire libre** pour empiler **[0]**.
La pile est maintenant : **[3][2][1][0]**.
Il te reste :
- **1 Cycle CPU** ;
- **14 mémoire libre**.

### Étape 2 : Dépiler
Tu dépenses **1 Cycle CPU** pour dépiler le sommet **[0]**.
Tu appliques le **Cas de base** de la carte.
La fonction n'est pas encore terminée, car les cadres **[1]**, **[2]** et **[3]** restent dans la pile.

En fin de tour, la pile est donc encore partiellement résolue.
Au tour suivant, tu pourras dépenser des cycles pour dépiler les cadres de remontée.
Quand **[3]** — le premier cadre empilé — sera enfin dépilé et que la pile deviendra vide :
- la fonction sera **terminée** ;
- tu marqueras ses **2 points de base** ;
- tu ajouteras le bonus **F(3) = 2** ;
- tu résoudras son effet de **Terminaison** ;
- tu libéreras son coût mémoire initial ;
- la carte ira en défausse.

## 17. Intention pédagogique
Le jeu doit faire sentir que :
- la récursion profonde est rentable mais lente à exécuter ;
- empiler et dépiler sont deux choix concurrents ;
- la mémoire engagée devient une vraie contrainte ;
- une fonction cassée est une fuite durable ;
- les outils de nettoyage, réparation et stabilisation ont une vraie valeur.
