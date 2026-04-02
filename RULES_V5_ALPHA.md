# NEON STACK — Règles V5 alpha

## 1. Idée générale
Chaque joueur construit un programme en menant à bien plusieurs **fonctions**.
Le cœur du jeu n'est plus un combat de créatures : il repose sur la gestion de la
**mémoire**, de la **pile d'appels**, des **cycles CPU**, des **fonctions cassées**
et du bon moment pour **empiler** ou **dépiler**.

## 2. Condition de victoire
Un joueur gagne immédiatement s'il atteint **21 points**, à condition d'avoir terminé :
- au moins **4 fonctions** ;
- avec au moins **3 noms de fonctions différents**.

## 3. Format conseillé
- **2 joueurs**
- **34 cartes par deck**
- **5 cartes en main de départ**
- **3 fonctions actives maximum** par joueur
- **2 Hardware actifs maximum** par joueur

## 4. Types de cartes
- **Fonction** : carte principale du jeu ; elle crée et exploite une pile d'appels.
- **Commande** : effet joué pendant ton tour.
- **Interrupt** : effet joué en réaction, si son texte le permet.
- **Hardware** : amélioration matérielle qui modifie surtout la mémoire,
  les cycles CPU ou la stabilité.

## 5. Mémoire
Chaque joueur commence avec :
- **20 mémoire totale** ;
- **20 mémoire libre**.

### 5.1 Coût mémoire d'une fonction
Quand tu lances une fonction, tu paies son **coût mémoire initial**.
Cette mémoire reste occupée tant que la fonction n'est pas terminée,
nettoyée ou réparée.

### 5.2 Coût mémoire d'un appel récursif
Chaque fois que tu **empiles** un nouveau cadre récursif sur une fonction,
tu paies **1 mémoire** supplémentaire.

### 5.3 Libération de mémoire
Quand tu **dépiles** un cadre, la mémoire de ce cadre est libérée.
La mémoire du cadre initial est libérée quand la fonction se termine,
c'est-à-dire quand sa pile devient vide.

## 6. Cycles CPU
Chaque joueur commence son tour avec **4 Cycles CPU**.

Pendant son tour, il peut dépenser ces cycles librement pour :
- **Empiler** un cadre sur une de ses fonctions : **1 cycle**
- **Dépiler** le cadre du sommet d'une de ses fonctions : **1 cycle**

Les cycles non utilisés sont perdus à la fin du tour.

### 6.1 Limite recommandée
Sauf effet contraire, un joueur ne peut pas dépasser **6 Cycles CPU** par tour.
Les cartes **Hardware** sont le moyen normal d'augmenter ou de moduler ce nombre.

## 7. Lancer une fonction
Quand tu joues une carte Fonction :
1. paie son coût mémoire initial ;
2. choisis sa profondeur cible si elle porte la mention **Empiler jusqu'à X** ;
3. place son **cadre initial** dans ta zone de fonctions.

Une fonction avec **Empiler 3** commence donc avec le cadre initial **[3]**.
Elle ne reçoit les cadres suivants qu'au fil des actions d'**empilage**.

## 8. Empiler
### 8.1 Empiler X
Une fonction portant **Empiler X** a une profondeur cible imposée.
Exemple : **Empiler 3** signifie que la fonction vise la suite de cadres :
`[3][2][1][0]`.

### 8.2 Empiler jusqu'à X
Une fonction portant **Empiler jusqu'à X** permet à son contrôleur de choisir,
lorsqu'il la joue, une profondeur cible comprise entre **0** et **X**.

### 8.3 Empilage progressif
Un **Empiler** ajoute le cadre suivant sur la pile de la fonction.

Exemple pour une fonction jouée avec une profondeur cible de 3 :
- lancement : `[3]`
- 1er empilage : `[3][2]`
- 2e empilage : `[3][2][1]`
- 3e empilage : `[3][2][1][0]`

Tant que le cadre `0` n'a pas été empilé, la fonction ne peut pas être dépilée.

## 9. Dépiler
**Dépiler** consiste à retirer le cadre du sommet d'une pile pour le résoudre.

- si le cadre retiré est `0`, on applique son **Cas de base** ;
- si le cadre retiré est supérieur à `0`, on applique sa **Remontée**.

Le **cas de base** est donc :
- le **dernier cadre empilé** ;
- le **premier cadre dépilé**.

## 10. Terminaison d'une fonction
Une fonction n'est **pas** terminée quand son cas de base est résolu.
Elle est terminée seulement quand son **cadre initial**,
c'est-à-dire le **premier cadre empilé**, est à son tour dépilé
et que sa pile devient vide.

À ce moment-là :
1. la fonction marque ses **points de base** ;
2. son contrôleur ajoute un bonus de récursion égal à **F(R)** ;
3. l'**effet de terminaison** de la carte est résolu avec une puissance **F(R)**,
   sauf indication contraire ;
4. la fonction est défaussée ;
5. toute la mémoire encore associée à cette fonction est libérée.

## 11. Valeur de récursion
On note **R** le nombre d'**appels récursifs réellement effectués** par une fonction.

Concrètement, **R** est le nombre de cadres ajoutés **après le cadre initial**.

Exemple :
- une fonction jouée à profondeur 0 a **R = 0** ;
- une fonction jouée à profondeur 3 a **R = 3** si elle a bien empilé `[2]`, `[1]` et `[0]`.

## 12. Fibonacci classique
Le bonus de récursion utilise la suite de Fibonacci classique :
- **F(0)=0**
- **F(1)=1**
- **F(2)=1**
- **F(3)=2**
- **F(4)=3**
- **F(5)=5**
- **F(6)=8**

Tableau utile :

| R | F(R) |
|---|---:|
| 0 | 0 |
| 1 | 1 |
| 2 | 1 |
| 3 | 2 |
| 4 | 3 |
| 5 | 5 |
| 6 | 8 |

## 13. Effets pendant l'exécution
Les effets se répartissent en trois familles.

### 13.1 Cas de base
Il s'applique quand le cadre `0` est dépilé.
C'est un effet d'exécution : il représente l'arrêt de la descente récursive.

### 13.2 Remontée
Elle s'applique chaque fois qu'un cadre supérieur à `0` est dépilé.
C'est un effet d'exécution : il représente la remontée des appels.

### 13.3 Terminaison
Elle s'applique **seulement** quand la pile de la fonction devient vide.
C'est là que l'on gagne les points et que l'effet final important se produit.

## 14. Overflow
Une pile peut contenir **7 cadres maximum**.
Si un **8e cadre** devait être ajouté, il y a **Overflow**.

Quand une fonction subit un overflow :
- elle devient **cassée** ;
- on n'ajoute pas le nouveau cadre ;
- sa pile n'évolue plus, sauf effet de réparation ;
- elle reste en jeu comme fonction cassée.

## 15. Fonctions cassées
Une fonction devient **cassée** si :
- elle subit un **Overflow** ;
- elle doit empiler un cadre mais son contrôleur n'a pas assez de mémoire libre ;
- un effet de carte la corrompt explicitement.

Une fonction cassée :
- reste en jeu ;
- ne peut plus être empilée ni dépilée ;
- ne rapporte aucun point ;
- n'applique aucun effet de terminaison ;
- continue d'occuper la mémoire déjà engagée ;
- compte toujours dans la limite des fonctions actives.

## 16. Nettoyer et réparer
### Nettoyer
**Nettoyer** une fonction cassée consiste à la défausser.
Toute la mémoire qu'elle occupait est alors libérée.

### Réparer
**Réparer** une fonction cassée consiste à la remettre en état,
selon le texte d'une carte.
Une fonction réparée peut de nouveau être empilée ou dépilée.

## 17. Déroulement d'un tour
### 1. Pioche
Pioche 1 carte.

### 2. Conception
Tu peux jouer des **Fonctions**, des **Commandes** et des **Hardware**,
en payant leurs coûts normaux.

### 3. Planification CPU
Tu dépenses tes **4 Cycles CPU** comme tu le souhaites :
- empiler sur une ou plusieurs fonctions ;
- dépiler des fonctions déjà prêtes ;
- mélanger les deux selon la situation.

### 4. Fin de tour
Les effets temporaires qui expirent en fin de tour cessent.
Les cycles CPU non utilisés sont perdus.

## 18. Exemple de tour
Tu commences ton tour avec :
- **12 mémoire totale** disponible sur tes 20 ;
- **4 Cycles CPU** ;
- une fonction **Routine Factorielle** déjà en jeu avec la pile `[3][2][1][0]` ;
- une fonction **Recherche Bornée** nouvellement lancée avec seulement `[2]`.

### Situation avant action
- **Routine Factorielle** est prête à être dépilée.
- **Recherche Bornée** vise la profondeur 2, mais n'a pas encore reçu ses cadres `[1]` puis `[0]`.

### Répartition des Cycles CPU
Tu choisis :
- **1 empilage** sur Recherche Bornée
- **3 dépilages** sur Routine Factorielle

### Action 1 — Empiler
Tu dépenses **1 cycle** pour empiler sur **Recherche Bornée**.
Sa pile devient : `[2][1]`.
Tu paies **1 mémoire** supplémentaire.

### Action 2 — Dépiler le cas de base de Routine Factorielle
Tu dépenses **1 cycle** pour dépiler le sommet `0` de **Routine Factorielle**.
Tu appliques son **Cas de base**.
La mémoire de ce cadre est libérée.

### Action 3 — Dépiler une remontée
Tu dépenses **1 cycle** pour dépiler le cadre `1`.
Tu appliques sa **Remontée**.
La mémoire de ce cadre est libérée.

### Action 4 — Dépiler une deuxième remontée
Tu dépenses **1 cycle** pour dépiler le cadre `2`.
Tu appliques sa **Remontée**.
La mémoire de ce cadre est libérée.

### Fin du tour
Il reste encore le cadre initial `[3]` sur **Routine Factorielle**.
La fonction n'est donc **pas encore terminée**.
Au tour suivant, si tu dépiles `[3]` :
- la pile deviendra vide ;
- la fonction sera terminée ;
- tu marqueras ses points de base ;
- tu ajouteras le bonus **F(3)=2** ;
- tu résoudras son effet de terminaison.

## 19. Intention pédagogique
Cette version du jeu doit faire sentir que :
- la récursivité consomme de la mémoire ;
- la pile d'appels se construit puis se vide dans un ordre précis ;
- la profondeur augmente le gain potentiel ;
- la prise de risque peut être rentable, mais elle expose à l'overflow ;
- une fonction cassée est une fuite de mémoire qu'il faut traiter.
