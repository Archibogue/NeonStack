# NEON STACK — Règles officielles V5.2 harmonisées

## 1. Idée générale
Chaque joueur construit un **programme** en lançant, en faisant évoluer, puis en terminant plusieurs **fonctions**.

Le jeu repose sur :
- la **mémoire** ;
- les **piles d’appels** ;
- les **fonctions cassées** ;
- les **cadres parasites** ;
- les effets de récursion.

Il n’y a plus de combat entre unités. La partie se joue sur la gestion de la mémoire, du tempo des fonctions, des perturbations adverses et du bon moment pour lancer ou sécuriser ses fonctions.

## 2. Condition de victoire
Un joueur gagne immédiatement s’il atteint **21 points ou plus**, à condition d’avoir terminé :
- au moins **4 fonctions** ;
- avec au moins **3 noms de fonctions différents**.

Un joueur conserve toujours ses points.

S’il atteint **21 points ou plus** sans remplir encore les autres conditions de victoire, il ne gagne pas immédiatement, mais garde ce total. Il gagne dès qu’un effet ou une terminaison ultérieure le laisse à **21 points ou plus** tout en remplissant aussi toutes les conditions de victoire.

## 3. Mise en place

### 3.1 Séparation des cartes
Chaque joueur sépare son paquet en **deux piles** :
- une **pile Fonctions**, contenant uniquement les cartes **Fonction** ;
- une **pile Système**, contenant les cartes **Commande**, **Interrupt** et **Hardware**.

Ces deux piles sont mélangées séparément.

### 3.2 Main de départ
Chaque joueur pioche **5 cartes** au total.
Pour la règle de base, on recommande :
- **3 cartes depuis la pile Fonctions** ;
- **2 cartes depuis la pile Système**.

### 3.3 Premier joueur
Le premier joueur est désigné aléatoirement.

Le premier joueur **ne pioche pas** à son premier tour.

### 3.4 Mulligan
Chaque joueur peut effectuer **un mulligan une seule fois** au début de la partie :
- il remélange sa main dans ses deux piles ;
- il repioche **5 cartes** selon la répartition de son choix ;
- puis il place **1 carte de sa main sous la pile de son choix**.

### 3.5 Défaite par épuisement
Un joueur perd la partie seulement s’il doit piocher une carte et qu’il ne peut piocher :
- ni dans sa **pile Fonctions** ;
- ni dans sa **pile Système**.

## 4. Mémoire
Chaque joueur commence avec :
- **15 mémoire totale** ;
- **15 mémoire libre**.

La mémoire libre sert à payer :
- les **cartes** ;
- les **appels récursifs** supplémentaires ;
- certains effets demandant explicitement un paiement en mémoire.

La mémoire totale fixe la quantité maximale de mémoire qu’un joueur peut posséder.

## 5. Types de cartes
Il existe quatre types de cartes :

### Fonction
Carte principale du jeu. Elle crée une pile d’appels, produit des points et des effets.

### Commande
Carte jouée pendant ton tour.

### Interrupt
Carte jouée en réaction, pendant n’importe quel tour si sa condition est remplie et si son coût peut être payé.

### Hardware
Amélioration durable qui reste en jeu.

Le coût imprimé sur une carte est payé en **mémoire libre**, sauf mention contraire.

## 6. Fonctions actives et Hardware
Un joueur peut contrôler au maximum :
- **3 fonctions actives** ;
- **2 Hardware actifs**.

Un joueur ne peut pas jouer une Fonction s’il contrôle déjà **3 fonctions actives**.

Une Fonction active ne peut pas être défaussée volontairement tant qu’elle n’est pas terminée ou cassée, sauf effet de carte.

Si un joueur joue un Hardware alors qu’il en contrôle déjà **2**, il choisit immédiatement un de ses Hardware actifs et le met en défausse.

## 7. Coût mémoire des fonctions

### 7.1 Lancement d’une fonction
Quand une fonction est lancée :
- son **coût mémoire initial** est payé en mémoire libre ;
- cette mémoire devient alors **réservée** ;
- son **cadre initial** est placé dans sa pile ;
- cette mémoire reste occupée tant que la fonction n’est pas terminée, nettoyée, supprimée par effet, ou réparée selon le texte applicable.

### 7.2 Empilage supplémentaire
Chaque fois qu’une fonction reçoit un cadre récursif supplémentaire, son contrôleur doit payer :
- **1 mémoire libre**,

sauf si une carte modifie ce coût.

### 7.3 Libération de mémoire
Quand un **cadre récursif normal** est dépilé, la mémoire correspondant à cet appel est libérée.

Quand le **cadre initial** est dépilé, la mémoire initiale réservée par la fonction est libérée.

Les **cadres parasites** ne libèrent jamais de mémoire.

## 8. Phase de mise à jour des fonctions
Au début du tour d’un joueur, toutes ses **fonctions actives non cassées** passent par une **phase de mise à jour**, une par une.

- Si une fonction **n’a pas encore atteint [0]**, elle **empile automatiquement** un nouveau cadre.
- Si une fonction **a déjà atteint [0]**, elle **dépile automatiquement** son cadre du sommet.

Les fonctions évoluent donc automatiquement :
- elles **descendent** jusqu’au cas de base ;
- puis elles **remontent** cadre après cadre jusqu’à terminaison.

Le joueur ne choisit pas, à ce stade, entre empiler ou dépiler : cela dépend uniquement de l’état de chaque fonction.

## 9. Empiler et dépiler

### 9.1 Empiler X
**Empiler X** signifie qu’une fonction a une profondeur cible fixe de **X**.

Quand elle est lancée, on place son cadre initial **[X]**.

Puis, à chaque mise à jour, si elle n’a pas encore atteint **[0]**, elle reçoit successivement :
**[X-1]**, puis **[X-2]**, etc., jusqu’à **[0]**.

### 9.2 Empiler jusqu’à X
**Empiler jusqu’à X** signifie que le joueur choisit, au lancement de la fonction, une profondeur cible comprise entre **0** et **X**.

Le cadre initial porte cette valeur choisie.

### 9.3 Dépiler
**Dépiler** consiste à retirer le cadre du sommet d’une pile et à appliquer son effet selon sa nature.

## 10. Atteindre [0], puis remonter
Une fonction ne peut pas dépiler tant qu’elle n’a pas atteint son cadre **[0]**.

Une fois le cadre **[0]** placé, la fonction entre en **phase de remontée**.

Une fonction en phase de remontée ne peut plus recevoir d’empilage normal.

Seuls les **effets de cartes** peuvent encore lui ajouter des cadres après cela.

## 11. Cas de base, remontée, terminaison
Le **cas de base** est le cadre **[0]**.

Il est :
- le **dernier cadre empilé normalement** ;
- le **premier cadre dépilé en remontée**.

Une fonction n’est pas terminée quand son cas de base est résolu.

Elle est terminée seulement quand son **cadre initial** — c’est-à-dire le premier cadre placé — est dépilé à son tour et que sa pile devient vide.

Chaque fonction peut donc avoir jusqu’à trois niveaux d’effet :
- **Cas de base** : effet du cadre **[0]** ;
- **Remontée** : effet des cadres supérieurs à **[0]** ;
- **Terminaison** : effet final, appliqué seulement quand la pile de la fonction devient vide.

## 12. Valeur de récursion
On note **R** la valeur de récursion de la fonction.

La valeur de **R** est fixée **au lancement** de la fonction :
- si la carte dit **Empiler X**, alors **R = X** ;
- si la carte dit **Empiler jusqu’à X**, alors **R** est égal à la profondeur choisie au lancement.

Les **cadres parasites** ne modifient jamais **R**.

Les cadres ajoutés par un effet de carte ne modifient pas **R**, sauf mention explicite du contraire.

Le bonus de récursion suit la **suite de Fibonacci classique** :
- F(0) = 0
- F(1) = 1
- F(2) = 1
- F(3) = 2
- F(4) = 3
- F(5) = 5
- F(6) = 8

## 13. Score d’une fonction terminée
La **valeur** imprimée sur une carte Fonction correspond à ses **points de base**.

Quand une fonction se termine :
1. son contrôleur marque ses **points de base** ;
2. il ajoute un bonus de récursion égal à **F(R)** ;
3. il résout l’effet de **Terminaison** ;
4. la fonction est défaussée ;
5. toute la mémoire qu’elle occupait est libérée.

## 14. Fonctions cassées
Une fonction casse si :
- elle devrait **empiler** mais son contrôleur n’a pas assez de mémoire libre pour payer cet appel ;
- elle devrait recevoir un cadre au-delà de la limite autorisée ;
- un effet de carte la casse explicitement.

Une fonction cassée :
- reste en jeu ;
- ne peut plus être empilée ni dépilée ;
- ne rapporte aucun point ;
- continue d’occuper toute la mémoire déjà engagée ;
- compte toujours dans la limite des fonctions actives.

## 15. Nettoyer et réparer

### Nettoyer
**Nettoyer** une fonction cassée consiste à la défausser.
Toute sa mémoire est alors libérée.

### Réparer
**Réparer** une fonction cassée consiste à la remettre en état selon le texte de la carte utilisée.

Par défaut, une fonction réparée revient avec :
- sa **mémoire initiale toujours réservée** ;
- son **cadre initial seulement** ;
- **aucun cadre parasite**, sauf mention contraire.

## 16. Reboot
À la place de toute autre action pendant son tour, un joueur peut effectuer un **reboot**.

Dans ce cas :
- toutes ses **fonctions actives**, intactes ou cassées, sont défaussées ;
- toutes leurs piles sont retirées **sans produire d’effet** ;
- il récupère immédiatement toute sa **mémoire libre** ;
- toute sa **mémoire totale** redevient entièrement disponible ;
- ses **Hardware** restent en jeu ;
- il défausse toute sa main ;
- il pioche **5 nouvelles cartes** ;
- il ne peut effectuer **aucune autre action** ce tour-ci.

Le reboot sert à sortir d’une situation bloquée, mais coûte un tour entier et consomme des ressources de pioche.

## 17. Cadres parasites
Certains effets ajoutent des **cadres parasites**.

Un cadre parasite :
- compte pour la taille de la pile ;
- doit être dépilé normalement ;
- n’applique **aucun Cas de base**, **aucune Remontée**, **aucune Terminaison** ;
- ne libère **pas** de mémoire lorsqu’il est dépilé ;
- ne modifie jamais **R**.

Les cadres parasites représentent des appels parasites ou des encombrements de pile. Ils ralentissent ou perturbent la fonction, sans produire d’effet utile.

## 18. Cadres ajoutés par effet
Quand un effet ajoute un **cadre récursif normal** à une fonction, ce cadre est ajouté du côté du **plus grand cadre**.

Sa valeur est égale à la plus grande valeur déjà présente, **plus 1**.

En revanche, si une carte dit qu’elle ajoute un **cadre parasite**, elle ajoute bien un cadre parasite, et non un cadre récursif normal.

Quand un effet ajoute plusieurs cadres, ils sont ajoutés **un par un**.

## 19. Overflow
Une pile ne peut contenir que **7 cadres**.

Si un effet ou une mise à jour devrait ajouter un **8e cadre**, il y a immédiatement **overflow** :
- la fonction casse aussitôt ;
- les ajouts restants ne sont pas appliqués ;
- la pile n’est plus résolue normalement ensuite.

La fonction reste en jeu comme fonction cassée.

## 20. Interrupts et mémoire
Les **Interrupts** peuvent être joués pendant n’importe quel tour, dès que leur condition de déclenchement est remplie et que leur coût peut être payé.

Un Interrupt est payé en **mémoire libre** au moment où il est joué.

Une fois l’Interrupt entièrement résolu, la mémoire utilisée pour le payer est **immédiatement libérée**.

Ainsi :
- un Interrupt doit bien pouvoir être payé ;
- mais il n’occupe pas durablement de mémoire comme une Fonction.

## 21. Ordre de réaction
Quand un événement déclencheur se produit :
1. le joueur **non actif** a la première possibilité de jouer un Interrupt ;
2. puis les joueurs alternent, **un Interrupt à la fois** ;
3. les Interrupts se résolvent ensuite dans **l’ordre inverse de leur pose** ;
4. un joueur qui veut répondre à un Interrupt doit le faire immédiatement ;
5. un joueur ne peut pas attendre puis revenir plus tard dans la même séquence.

Si les deux joueurs passent successivement, la séquence de réaction s’achève et le jeu reprend.

## 22. Empilage annulé
Quand un **empilage** est annulé :
- le cadre n’est pas ajouté ;
- la **mémoire libre** correspondant à cet empilage n’est **pas payée**.

## 23. Cas particulier : Débogueur pas à pas
Si **Débogueur pas à pas** annule une casse puis dépile le dernier cadre d’une fonction, cette fonction est défaussée :
- **sans marquer de points** ;
- **sans appliquer d’effet de Terminaison**.

Si le cadre dépilé était le **cadre initial**, la mémoire initiale de cette fonction est libérée normalement.

Ainsi, **Débogueur pas à pas** peut sauver une fonction d’une casse, mais ne transforme jamais cette casse en terminaison gratuite.

## 24. Déroulement d’un tour
1. **Phase de mise à jour** : toutes les fonctions actives non cassées du joueur actif sont mises à jour automatiquement.
   - si elles n’ont pas atteint **[0]**, elles empilent ;
   - sinon, elles dépilent.

2. **Pioche** : le joueur pioche **1 carte** dans la pile de son choix :
   - **pile Fonctions**
   - ou **pile Système**
   Le premier joueur ne pioche pas à son premier tour.

3. **Conception** : le joueur peut jouer des Fonctions, des Commandes et des Hardware tant qu’il peut payer leur coût, ou choisir d’effectuer un **reboot** à la place de toute autre action.

4. **Fin de tour** : les effets temporaires cessent ; la mémoire libre temporaire non dépensée disparaît.

## 25. Intention pédagogique
Le jeu doit faire sentir que :
- la récursion profonde est rentable, mais plus lente à mener jusqu’au score ;
- les fonctions évoluent automatiquement : elles descendent jusqu’au cas de base, puis remontent ;
- la mémoire engagée devient une vraie contrainte ;
- les cadres parasites ralentissent ou perturbent l’exécution ;
- une fonction cassée est une fuite durable ;
- les outils de nettoyage, de réparation et de protection ont une vraie valeur ;
- bien choisir quand lancer une nouvelle fonction est essentiel, car son évolution se poursuivra ensuite automatiquement.
