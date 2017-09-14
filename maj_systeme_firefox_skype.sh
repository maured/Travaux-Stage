#!/bin/sh

echo "Vous êtes sur le point de faire des mises à jours système importantes, lisez les indications ci-dessous :\n"
	echo "Choisissez RPM pour les systèmes d'exploitation suivants :"
	echo "	- Red Hat Enterprise Linux,"
	echo "	- Fedora,"
	echo "	- CentOS,"
	echo "	- Mandriva,"
	echo "	- openSUSE,"
	echo "	- SUSE Linux Enterprise,"
	echo "	- PCLinuxOS,"
	echo "	- MeeGo,"
	echo "	- Mageia.\n"
	echo "Choisissez DEB pour les systèmes d'exploitation présents sur la page internet qui va apparaître."
	sleep 15
	echo "Démarrage de la page internet\n"
	echo "Pour continuer l'installation, fermez la page internet."
	sleep 4
	firefox https://fr.wikipedia.org/wiki/Debian#Distributions_fond.C3.A9es_sur_Debian

echo "Quel installation voulez vous ?(rpm/deb)"

read sys_rep

case "$sys_rep" in
rpm)
	echo "Recherche du logiciel Firefox....."
	sleep 2
	RES=$(which firefox)
	if [ "$RES" = "/usr/bin/firefox" ]
		then
			echo "Firefox déjà installé! Mise à jour de firefox..."
			sleep 2
			sudo yum upgrade -y firefox
		else
			echo "Installation de Firefox..."
			sudo yum install -y firefox
			sleep 1
			echo "\nFirefox installé avec succès !\n"
			echo "Mise à jour de Firefox..."
			sleep 2
			sudo yum upgrade -y firefox
	fi

	echo "Mise à jour du système d'exploitation...."
	sleep 2
	sudo yum -y update && sudo yum -y upgrade

	echo -n "Voulez vous télécharger Skype ?(o/n)? "
	read rep1

	case "$rep1" in
	o|O|oui|Oui)
		echo "OK : reponse oui"
		firefox https://go.skype.com/linux.rpm
	;;
	n|N|non|Non)
		echo "Abandon de l'installation de Skype...\n"
		echo "Les mises à jours se sont bien installées !"
		exit 1
	;;
	esac
;;
deb)
	echo "Recherche du logiciel Firefox....."

	RES=$(which firefox)
	if [ "$RES" = "/usr/bin/firefox" ]
		then
			echo "Firefox déjà installé! Mise à jour de firefox..."
			sleep 2
			sudo apt-get upgrade -y firefox
		else
			sudo apt-get install -y firefox
			echo "Firefox installé avec succès !\n"
			echo "Mise à jour de Firefox..."
			sleep 2
			sudo apt-get upgrade -y firefox
	fi

	echo "Mise à jour du système d'exploitation..."
	sleep 2
	sudo apt-get update -y && sudo apt-get upgrade -y


	echo -n "\nVoulez vous télécharger Skype ?(o/n)? "
	read rep1

	case "$rep1" in
	o|O|oui|Oui)
		echo "OK : reponse oui"
		sleep 2
		firefox https://go.skype.com/linux.deb
	;;
	n|N|non|Non)
		echo "Abandon de l'installation de Skype...\n"
		echo "Les mises à jours se sont bien installées !"
		exit 1
	;;
	esac
;;
esac
