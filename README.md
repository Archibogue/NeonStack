# Neon Stack  
### Un jeu de cartes pour enseigner la récursivité en NSI

**Neon Stack** est un projet pédagogique qui propose d’aborder une notion réputée difficile de l’informatique — **la récursivité** — à travers un **jeu de cartes compétitif inspiré des TCG**.  
L’objectif est de transformer un concept abstrait en une expérience concrète, manipulable et mémorable.

Dans Neon Stack, les joueurs incarnent deux systèmes concurrents qui déploient des programmes, lancent des appels, saturent la pile d’exécution, provoquent des débordements, interrompent des remontées et cherchent à atteindre le **Noyau** adverse.

Derrière l’esthétique néon et la mécanique ludique, le jeu met en scène de vraies idées d’informatique.

---

## Pourquoi un jeu sur la récursivité ?

Pour beaucoup d’élèves, la récursivité reste une notion difficile à visualiser.  
Ils comprennent souvent le code ligne par ligne, mais peinent à se représenter :

- l’**empilement des appels**
- le rôle du **cas de base**
- la différence entre **descente** et **remontée**
- les effets d’une récursion mal bornée
- l’idée d’**overflow**
- le fait qu’un même programme puisse exister en plusieurs **instances**

Neon Stack a été conçu pour répondre à cette difficulté.  
Le jeu donne une forme matérielle à ces mécanismes :

- la **pile** devient visible ;
- les **cadres d’appel** sont manipulés ;
- le **cas de base** devient une condition concrète de stabilisation ;
- l’**absence de cas de base** produit une boucle infinie ;
- l’**overflow** devient une sanction claire et mémorable.

L’élève ne se contente plus d’entendre parler de récursivité : il la **voit fonctionner**, il la **subit**, il l’**exploite**.

---

## Objectifs pédagogiques

Le jeu vise à aider les élèves à :

- comprendre ce qu’est un **appel récursif** ;
- distinguer **phase de descente** et **phase de remontée** ;
- identifier le rôle essentiel du **cas de base** ;
- comprendre ce qu’il se passe lorsqu’une récursion est **mal bornée** ;
- visualiser la **pile d’exécution** ;
- faire le lien entre une mécanique de jeu et un **fonctionnement réel d’un programme** ;
- réinvestir ensuite ces représentations dans des exercices de programmation en Python.

---

## Une approche ludique, mais rigoureuse

Neon Stack n’est pas un simple habillage décoratif d’un cours.  
Les mécaniques du jeu ont été pensées pour correspondre à de vraies idées informatiques :

- les **Programmes** représentent des fonctions ou routines ;
- les **appels** créent de nouvelles instances dans la pile ;
- les **Interrupts** perturbent l’exécution ;
- les **Artefacts** modifient durablement l’environnement d’exécution ;
- les **cadres de pile** matérialisent la profondeur ;
- le **débordement** de pile punit l’excès d’appels ;
- une fonction privée de cas de base peut partir en **boucle infinie** ;
- certains effets deviennent plus puissants **à mesure que la profondeur augmente**, ce qui renforce l’intuition selon laquelle une récursion “travaille” sur la structure des appels successifs.

Le jeu reste volontairement jouable, interactif et conflictuel, mais il garde une vraie cohérence avec le modèle enseigné.

---

## Public visé

Ce projet s’adresse principalement à :

- des élèves de **Première NSI**
- des élèves de **Terminale NSI**
- des groupes en **atelier**, en **remédiation**, en **révision**
- des enseignants souhaitant introduire ou réactiver la récursivité autrement

Le jeu peut être utilisé :

- en **séance de découverte**
- en **activité de consolidation**
- en **évaluation informelle de compréhension**
- comme support de discussion avant ou après un cours de programmation

---

## Ce que le jeu permet de travailler

Neon Stack permet notamment de faire émerger ou de consolider les notions suivantes :

- appel de fonction
- récursivité
- cas de base
- pile d’exécution
- profondeur d’appel
- remontée de résultats
- interruption d’un traitement
- débordement de pile
- trace d’exécution
- représentation d’un processus dynamique

Il constitue aussi un bon support pour faire verbaliser les élèves :

- “Qu’est-ce qui provoque un nouvel appel ?”
- “Pourquoi cette fonction s’arrête-t-elle ?”
- “À quel moment la remontée peut-elle commencer ?”
- “Que se passe-t-il si on supprime le cas de base ?”
- “Pourquoi le programme déborde-t-il ?”

---

## Ce que contient ce dépôt

Ce dépôt rassemble les ressources du projet :

- les **cartes du jeu**
- les **règles**
- les **decks**
- les **éléments utilitaires** pour représenter la pile
- une **version jouable dans TCG Arena**
- les ressources nécessaires pour **tester**, **modifier** ou **diffuser** le jeu

---

## Jouer à Neon Stack

Une version de test jouable en ligne est disponible via **TCG Arena**.

- **Page du projet** :  
  https://archibogue.github.io/NeonStack/

- **Règles du jeu** :  
  https://archibogue.github.io/NeonStack/regles.html

- **Chargement direct dans TCG Arena** :  
  https://tcg-arena.fr/load/aHR0cHMlM0ElMkYlMkZhcmNoaWJvZ3VlLmdpdGh1Yi5pbyUyRk5lb25TdGFjayUyRkdhbWVfTmVvbiUyNTIwU3RhY2suanNvbg==

---

## Intérêt pédagogique

Le jeu permet de déplacer la difficulté.

Au lieu de commencer par du code que l’élève lit passivement, on commence par une situation où il doit :

- anticiper ;
- manipuler ;
- observer ;
- expliquer ;
- justifier ;
- relier une action visible à une logique invisible.

Le passage vers le code devient alors plus naturel.  
Quand l’élève retrouve ensuite une fonction récursive en Python, il ne voit plus seulement une suite de lignes : il voit une **pile**, des **cadres**, une **descente**, un **retour**, un **risque de débordement**.

En ce sens, Neon Stack n’est pas seulement un jeu “sur” l’informatique.  
C’est un outil pour **penser informatiquement**.

---

## Perspectives

Le projet a vocation à évoluer :

- enrichissement des cartes ;
- variantes pédagogiques ;
- scénarios d’initiation ;
- usages en classe ;
- ajustements d’équilibrage ;
- articulation avec des activités débranchées ou des exercices Python.

Il peut également servir de base à une réflexion plus large sur la place du jeu dans l’enseignement des sciences informatiques.

---

## Auteur et contexte

Ce projet a été conçu dans une démarche de pédagogie active en **Numérique et Sciences Informatiques**, avec l’idée qu’une notion difficile n’a pas besoin d’être simplifiée à l’excès pour devenir accessible : elle peut aussi être **mise en scène intelligemment**.

Neon Stack est à la fois :

- un support d’apprentissage,
- un objet de médiation,
- et une expérimentation pédagogique autour du jeu comme outil de compréhension.

---

## En résumé

**Neon Stack** cherche à faire une chose simple et ambitieuse à la fois :  
**faire comprendre la récursivité non seulement par l’explication, mais par l’expérience.**
