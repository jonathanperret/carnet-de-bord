#language: fr

Fonctionnalité: Ajout d'un membre dans le carnet par un chargé d'orientation
	En tant que chargé d'orientaion assigné
	Je veux ajouter un accompagnant dans le groupe de suivi du bénéficiaire

	Scénario: Ajout d'un membre dans le groupe de suivi par le chargé d'orientation
		Soit le chargé d'orientation assigné "giulia.diaby@cd93.fr" sur le carnet de "Tifour"
		Alors je vois "Pierre Chevalier" dans le tableau "Liste des membres du groupe de suivi"
		Quand je clique sur "Inviter un accompagnateur"
		Alors je vois "Inviter un accompagnateur"
		Quand je renseigne "camara" dans le champ "Rechercher un accompagnateur"
		Quand je clique sur "Rechercher"
		Alors je vois "Paul Camara"
		Quand je choisis "Service Social Départemental"
		Alors je clique sur "Envoyer"
		Alors je clique sur "J'ai compris"
		Alors je vois "Paul Camara" dans le tableau "Liste des membres du groupe de suivi"
