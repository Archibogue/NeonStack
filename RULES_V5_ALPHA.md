# NEON STACK — Règles V5 alpha

## 1. Idée générale
Chaque joueur conçoit un programme en terminant plusieurs **fonctions**.
Le jeu n'est plus un combat de programmes : il s'agit de gérer la **mémoire**,
la **pile d'appels**, les fonctions cassées et les effets de récursion.

## 2. Condition de victoire
Un joueur gagne immédiatement s'il atteint **21 points**,
à condition d'avoir terminé :
- au moins **4 fonctions** ;
- avec au moins **3 noms de fonctions différents**.

## 3. Mémoire
Chaque joueur commence avec :
- **20 mémoire totale** ;
- **20 mémoire libre**.

Quand une fonction est lancée, son coût mémoire initial est réservé.
Chaque appel récursif supplémentaire coûte aussi de la mémoire.
Cette mémoire reste occupée tant que la fonction n'est pas terminée,
nettoyée ou réparée.

## 4. Types de cartes
- **Fonction** : cœur du programme, crée une pile d'appels.
- **Commande** : effet joué pendant ton tour.
- **Interrupt** : effet joué en réaction.
- **Hardware** : amélioration matérielle, souvent liée à la mémoire.

## 5. Fonctions
Une fonction possède généralement :
- un coût mémoire initial ;
- une valeur de base en points ;
- une mention **Recompiler X** ou **Recompiler jusqu'à X** ;
- un cas de base ;
- une remontée ;
- un effet de terminaison.

### Recompiler X
La profondeur est imposée.
Exemple : Recompiler 3 crée la pile [3][2][1][0].

### Recompiler jusqu'à X
Le joueur choisit la profondeur au moment où il joue la carte.
Cette profondeur choisie détermine le risque, le coût mémoire et le gain potentiel.

## 6. Valeur de récursion
On note **R** le nombre d'appels récursifs réellement effectués par une fonction.
C'est cette valeur réelle, et non la profondeur théorique seule,
qui sert à calculer son bonus final.

## 7. Terminer une fonction
Quand toute la pile d'une fonction a été résolue correctement :
- la fonction est terminée ;
- son contrôleur marque ses points de base ;
- il ajoute un bonus de récursion égal à **F(R)**,
  où F est la suite de Fibonacci classique ;
- l'effet de terminaison de la carte est résolu avec une puissance **F(R)**,
  sauf indication contraire ;
- la fonction est ensuite défaussée ;
- toute la mémoire qu'elle occupait est libérée.

Référence Fibonacci utilisée :
- F(0)=0
- F(1)=1
- F(2)=1
- F(3)=2
- F(4)=3
- F(5)=5
- F(6)=8

## 8. Fonctions cassées
Si une fonction subit un overflow, ne peut pas payer un appel récursif,
ou est corrompue par un effet, elle devient **cassée**.

Une fonction cassée :
- reste en jeu ;
- ne peut plus être exécutée ;
- ne rapporte aucun point ;
- continue d'occuper toute la mémoire déjà engagée ;
- compte toujours dans la limite des fonctions actives.

## 9. Nettoyer et réparer
**Nettoyer** une fonction cassée = la défausser et libérer toute sa mémoire.

Certaines cartes peuvent au contraire **réparer** une fonction cassée
et la remettre en état de fonctionner.

## 10. Limites conseillées
- **3 fonctions actives maximum** par joueur
- **2 hardware actifs maximum** par joueur
- **7 cadres maximum** dans une pile
- si un 8e cadre doit être ajouté : **overflow**

## 11. Overflow
Si une fonction devrait recevoir un **8e cadre**, il y a overflow :
- la fonction casse ;
- sa pile cesse de se développer ;
- elle reste en jeu comme fonction cassée ;
- un marqueur d'overflow peut être placé pour le signaler.

## 12. Déroulement d'un tour
1. **Pioche** : pioche 1 carte.
2. **Conception** : joue des fonctions, commandes et hardware.
3. **Appels** : ajoute des appels récursifs en payant la mémoire nécessaire.
4. **Exécution** : résous jusqu'à 3 cadres au total.
5. **Fin de tour** : les effets temporaires cessent.

## 13. Intention pédagogique
Le jeu doit faire sentir :
- qu'une récursion plus profonde peut être rentable ;
- qu'elle consomme aussi davantage de ressources ;
- qu'une pile qui déborde ou qu'une fonction cassée a un coût durable ;
- qu'il existe des outils de nettoyage et d'optimisation.
