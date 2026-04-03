# NEON STACK — Règles officielles V5.1

## 1. Idée générale
Chaque joueur construit un **programme** en lançant, en empilant, puis en terminant plusieurs **fonctions**.

Le jeu repose sur :
- la **mémoire** ;
- la **pile d'appels** ;
- l'**ordonnancement CPU** ;
- les **fonctions cassées** ;
- les effets de récursion.

Il n'y a plus de combat entre unités : la partie se joue sur la gestion des ressources, du tempo et des perturbations adverses.

## 2. Condition de victoire
Un joueur gagne immédiatement s'il atteint **21 points ou plus**, à condition d'avoir terminé :
- au moins **4 fonctions** ;
- avec au moins **3 noms de fonctions différents**.

Un joueur conserve toujours ses points.

S'il atteint ou dépasse **21 points** sans encore remplir les autres conditions de victoire, il **ne gagne pas immédiatement**, mais garde ce total.

Il gagne dès qu'un effet ou une terminaison ultérieure le laisse à **21 points ou plus** tout en remplissant aussi toutes les conditions de victoire.

## 3. Mise en place
Chaque joueur mélange son deck et pioche **5 cartes**.

Le premier joueur est désigné **aléatoirement**.

Chaque joueur peut effectuer **un mulligan une seule fois** au début de la partie : il remélange sa main dans son deck puis repioche **4 cartes**.

Le **premier joueur ne pioche pas** à son premier tour.

Si un joueur doit piocher alors que son deck est vide, il **perd immédiatement la partie**.

## 4. Mémoire
Chaque joueur commence avec :
- **20 mémoire totale** ;
- **20 mémoire libre**.

La mémoire libre sert à payer :
- les **cartes** ;
- les **appels récursifs** supplémentaires ;
- certains effets demandant explicitement un paiement en mémoire.

La mémoire totale fixe la quantité maximale de mémoire qu'un joueur peut posséder.

### 4.1 Coût mémoire des fonctions
Quand une fonction est lancée :
- son **coût mémoire initial** est payé en mémoire libre ;
- cette mémoire devient alors **réservée** ;
- son **cadre initial** est placé dans sa pile ;
- cette mémoire reste occupée tant que la fonction n'est pas terminée, nettoyée ou réparée.

Chaque **Empiler** supplémentaire sur cette fonction coûte :
- **1 Cycle CPU** ;
- **1 mémoire libre** ;
et ajoute un cadre à sa pile.

Quand un **cadre récursif normal** est dépilé, la mémoire correspondant à cet appel est libérée.

Quand le **cadre initial** est dépilé, la mémoire initiale réservée par la fonction est libérée.

### 4.2 Mémoire libre temporaire
Quand un effet fait gagner de la **mémoire libre jusqu'à la fin du tour** ou **jusqu'à la fin du prochain tour**, cette mémoire est une **mémoire libre temporaire**.

Cette mémoire peut être dépensée normalement.

À l'expiration de l'effet, toute portion **non dépensée** de cette mémoire temporaire **disparaît**.

L'expiration d'un tel effet ne provoque pas rétroactivement de coût supplémentaire et ne casse pas automatiquement une fonction.

## 5. Types de cartes
Il existe quatre types de cartes :
- **Fonction** : cœur du jeu ; crée et résout une pile d'appels.
- **Commande** : effet joué pendant ton tour.
- **Interrupt** : effet joué en réaction, pendant n'importe quel tour si son coût peut être payé.
- **Hardware** : amélioration matérielle durable.

Le coût imprimé sur une carte est payé en **mémoire libre**, sauf mention contraire.

## 6. Cycles CPU
Chaque joueur dispose de **4 Cycles CPU** au début de chacun de ses tours.

Pendant son tour, un joueur peut dépenser ses Cycles CPU pour :
- **Empiler** sur une fonction : **1 cycle** ;
- **Dépiler** un cadre : **1 cycle**.

Le joueur répartit librement ses cycles entre empilage et dépilage, dans les limites fixées par les règles.

Les cycles non utilisés sont perdus à la fin du tour.

Certains Hardware peuvent augmenter ce nombre ou rendre certaines actions gratuites.

Un joueur ne peut jamais dépasser **6 Cycles CPU** pendant un tour, sauf mention contraire d'une carte.

## 7. Fonctions actives et Hardware
Un joueur peut contrôler au maximum :
- **3 fonctions actives** ;
- **2 Hardware actifs**.

Un joueur **ne peut pas jouer** une Fonction s'il contrôle déjà **3 fonctions actives**.

Une Fonction active **ne peut pas être défaussée volontairement** tant qu'elle n'est pas terminée, sauf effet de carte.

Si un joueur joue un Hardware alors qu'il en contrôle déjà **2**, il choisit immédiatement un de ses Hardware actifs et le met en défausse.

## 8. Empiler et dépiler
### 8.1 Empiler X
**Empiler X** signifie qu'une fonction a une profondeur cible fixe de **X**.

Quand elle est lancée, on place son cadre initial **[X]**.

Puis, en dépensant des Cycles CPU et de la mémoire libre, on peut empiler successivement **[X-1]**, **[X-2]**, et ainsi de suite jusqu'à **[0]**.

### 8.2 Empiler jusqu'à X
**Empiler jusqu'à X** signifie que le joueur choisit, au lancement de la fonction, une profondeur cible comprise entre **0** et **X**.

Le cadre initial porte cette valeur choisie.

### 8.3 Dépiler
**Dépiler** consiste à retirer le cadre du sommet d'une pile et à appliquer son effet d'exécution, selon sa nature.

## 9. Atteindre [0], puis remonter
Une fonction **ne peut pas être dépilée tant qu'elle n'a pas atteint son cadre [0]**.

Une fois le cadre **[0]** empilé, la fonction entre en **phase de remontée**.

Une fonction en phase de remontée **ne peut plus recevoir d'Empiler normal** par dépense de Cycle CPU.

Seuls les **effets de cartes** peuvent encore lui ajouter des cadres après cela.

## 10. Cas de base, remontée, terminaison
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

## 11. Valeur de récursion
On note **R** la valeur de récursion de la fonction.

La valeur de **R** est fixée **au lancement de la fonction** :
- si la carte dit **Empiler X**, alors **R = X** ;
- si la carte dit **Empiler jusqu'à X**, alors **R** est égal à la profondeur choisie au lancement.

Les **cadres parasites** ne modifient jamais **R**.

Les cadres ajoutés par un **effet de carte** ne modifient pas **R**, sauf si une carte précise explicitement le contraire.

Le bonus de récursion suit la **suite de Fibonacci classique** :
- F(0) = 0
- F(1) = 1
- F(2) = 1
- F(3) = 2
- F(4) = 3
- F(5) = 5
- F(6) = 8

## 12. Score d'une fonction terminée
La **valeur** imprimée sur une carte **Fonction** correspond à ses **points de base**.

Quand une fonction se termine :
1. son contrôleur marque ses **points de base** ;
2. il ajoute un bonus de récursion égal à **F(R)** ;
3. il résout l'effet de **Terminaison** de la carte ;
4. la fonction est défaussée ;
5. toute la mémoire qu'elle occupait est libérée.

## 13. Fonctions cassées
Une fonction casse si :
- elle devrait **Empiler** mais son contrôleur n'a pas assez de mémoire libre pour payer cet appel ;
- elle devrait recevoir un cadre au-delà de la limite autorisée ;
- un effet de carte la casse explicitement.

Une fonction cassée :
- reste en jeu ;
- ne peut plus être empilée ni dépilée ;
- ne rapporte aucun point ;
- continue d'occuper toute la mémoire déjà engagée ;
- compte toujours dans la limite des fonctions actives.

## 14. Nettoyer et réparer
**Nettoyer** une fonction cassée consiste à la défausser ; toute sa mémoire est alors libérée.

**Réparer** une fonction cassée consiste à la remettre en état selon le texte de la carte.

Par défaut, une fonction réparée revient avec :
- sa mémoire initiale toujours réservée ;
- son cadre initial seulement ;
- aucun cadre parasite, sauf mention contraire.

## 15. Cadres parasites
Certains effets ajoutent des **cadres parasites**.

Un cadre parasite :
- compte pour la taille de la pile ;
- doit être dépilé normalement ;
- n'applique aucun cas de base ni aucune remontée ;
- ne libère pas de mémoire lorsqu'il est dépilé ;
- ne modifie jamais **R**.

Quand un effet ajoute plusieurs cadres, ils sont ajoutés **un par un**.

Dès qu'un **8e cadre** devrait être ajouté à une pile, l'**overflow** se déclenche immédiatement :
- la fonction casse aussitôt ;
- les ajouts restants ne sont pas appliqués ;
- la pile n'est plus résolue normalement ensuite.

## 16. Cadres ajoutés par effet
Quand un effet ajoute un **cadre récursif normal** à une fonction, ce cadre est ajouté du côté du **plus grand cadre**.

Sa valeur est égale à la plus grande valeur déjà présente, **plus 1**.

En revanche, si une carte dit qu'elle ajoute un **cadre parasite**, elle ajoute bien un **cadre parasite**, et non un cadre récursif normal.

## 17. Overflow
Une pile ne peut contenir que **7 cadres**.

Si un effet devrait ajouter un **8e cadre**, il y a **overflow** :
- la fonction concernée casse immédiatement ;
- elle reste en jeu comme fonction cassée ;
- sa pile n'est plus résolue.

## 18. Interrupts et ordre de réaction
Les **Interrupts** peuvent être joués **pendant n'importe quel tour**, dès que leur condition de déclenchement est remplie et que leur coût peut être payé.

Quand un événement déclencheur se produit :
1. le joueur **non actif** a la première possibilité de jouer un Interrupt ;
2. puis les joueurs alternent, **un Interrupt à la fois** ;
3. les Interrupts se résolvent ensuite dans **l'ordre inverse de leur pose** ;
4. un joueur qui veut répondre à un Interrupt doit le faire **immédiatement** ;
5. un joueur ne peut pas attendre puis revenir plus tard dans la même séquence de réaction.

Si les deux joueurs passent successivement, la séquence de réaction s'achève et on reprend la résolution normale du jeu.

### 18.1 Empiler annulé
Quand un **Empiler** est annulé :
- le cadre n'est pas ajouté ;
- la **mémoire libre** correspondant à cet Empiler n'est **pas payée** ;
- le **Cycle CPU** n'est perdu que si la carte ou l'effet l'indique explicitement.

## 19. Cas particulier : Débogueur pas à pas
Si **Débogueur pas à pas** annule une casse puis dépile le dernier cadre d'une fonction, cette fonction est **défaussée sans marquer de points** et **sans appliquer d'effet de Terminaison**.

Si le cadre dépilé était le **cadre initial**, la mémoire initiale de cette fonction est libérée normalement.

Ainsi, **Débogueur pas à pas** peut sauver une fonction d'une casse, mais ne transforme jamais cette casse en terminaison gratuite.

## 20. Déroulement d'un tour
1. **Pioche** : pioche 1 carte, sauf pour le premier joueur à son premier tour.
2. **Conception** : joue des fonctions, commandes et Hardware tant que tu peux payer leur coût en mémoire libre.
3. **Ordonnancement CPU** : dépense jusqu'à 4 Cycles CPU, ou davantage si un effet t'en donne, pour Empiler et/ou Dépiler dans le respect des règles.
4. **Fin de tour** : les effets temporaires cessent ; les cycles non utilisés sont perdus ; la mémoire libre temporaire non dépensée disparaît.

## 21. Texte harmonisé : Injection de Boucle
**Injection de Boucle** a le texte officiel suivant :

**Interrupt — coût 2**  
Joue cette carte quand une fonction est lancée ou quand un joueur effectue un **Empiler** sur une fonction.  
**Ajoute immédiatement 1 cadre parasite au sommet de cette fonction.**  
Son contrôleur doit payer **1 mémoire libre** ; sinon, cette fonction casse.

## 22. Intention pédagogique
Le jeu doit faire sentir que :
- la récursion profonde est rentable mais lente à exécuter ;
- empiler et dépiler sont deux choix concurrents ;
- la mémoire engagée devient une vraie contrainte ;
- une fonction cassée est une fuite durable ;
- les outils de nettoyage, réparation et stabilisation ont une vraie valeur ;
- les interruptions adverses punissent les lignes trop gourmandes ou mal sécurisées.
