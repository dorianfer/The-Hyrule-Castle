#!/bin/bash

num_combat=0 # le numéro du combat
fin_action=0
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PINK='\033[1;31m'
NC='\033[0m'

combat(){
    point_combat_enne=$point_enne
    while [[ $point_combat_enne -gt 1 ]]; do
	fin_action=0
        while [[ $fin_action -lt 1 ]]; do
            echo ""
            echo -e ${RED}$nom_enne${NC}
            echo "HP: $point_combat_enne / $point_enne "
            echo ""
            echo -e ${GREEN}$nom${NC}
            echo "HP: $point_combat / $point"    
            echo ""
            echo "===== OPTION ====="
            echo -e "${YELLOW}1. Attack${NC}      ${GREEN}2. Heal${NC}"
            read ANSWER
	    if [[ ANSWER -eq 1 ]]; then
		fin_action=1
		echo "cc"
		point_combat_enne=$(($point_combat_enne-force))
		echo ""
		echo -e "${GREEN}$nom${NC} attacked and dealt $force damages!"
	    elif [[ ANSWER -eq 2 ]]; then
		point_combat=$((point_combat+(point/2)))
		if [[ $point_combat -gt $point ]]; then
                    point_combat=$point
		    fin_action=1
		    echo ""
		    echo -e "You have recharged ${GREEN}$nom${NC} "
		fi
	    else
		echo "please rewrite your number"
            fi
	done
	
	
	if [[ $point_combat_enne -gt 1 ]]; then
	    point_combat=$((point_combat-force_enne))
	    echo ""
            echo -e "${RED}$nom_enne${NC} attacked and dealt $force_enne damages!"
	else
	    echo ""
	    echo -e "${RED}$nom_enne${NC} died!"
	fi
	
	if [[ $point_combat -lt 1 ]]; then
            point_combat_enne=0
            num_combat=10
	    echo ""
	    echo -e "${GREEN}$nom${NC} ,you were our last hope, Hyrule will never regain its former glory."
	    echo ""
	    echo -e "${RED}GAME OVER${NC}"
	fi
    

    done
}

perso_random(){
    PLANCHER=0
    ECHELLE=100
    list_hasard=""
    compte=0
    num_perso_random=0
    
    while [[ $num -le $PLANCHER ]]; do
	num=$RANDOM
	let "num %= $ECHELLE"
    done
    if [[ $num -lt 50 ]]; then
		
	while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
	    if [[ $rarity == 1 ]]; then
		list_hasard[$num_perso_random]=$id
		num_perso_random=$((num_perso_random+1))
		
	    fi
		 
	done < players.csv
       
    elif [[ $num -lt 80 ]]; then
	
        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
	    if [[ $rarity == 2 ]]; then
	        list_hasard[$num_perso_random]=$id
		num_perso_random=$((num_perso_random+1))
	    fi
        done < players.csv

    elif [[ $num -lt 95 ]]; then
	
        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
	    if [[ $rarity == 3 ]]; then
                list_hasard[$num_perso_random]=$id
                num_perso_random=$((num_perso_random+1))
            fi
        done < players.csv
    elif [[ $num -lt 99 ]]; then
	
        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
	    if [[ $rarity == 4 ]]; then
                list_hasard[$num_perso_random]=$id
                num_perso_random=$((num_perso_random+1))
            fi
        done < players.csv
    else
	
        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
	    if [[ $rarity == 5 ]]; then
                list_hasard[$num_perso_random]=$id
                num_perso_random=$((num_perso_random+1))
            fi
        done < players.csv
    fi
    num_perso_random_id=$((num_perso_random+1))
    num=0
    ECHELLE=$num_perso_random_id
    while [[ $num -le $PLANCHER ]]; do
        num=$RANDOM
        let "num %= $ECHELLE"
    done
    
    num_perso_random_id=0
    num=$((num-1))
    id_hasard=${list_hasard[$num]}
    while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
	if [[ $id == $id_hasard ]]; then
	    nom=$name
            point=$hp
            force=$str
	    
	fi
    done < players.csv
    point_combat=$point
    
}

enne_random(){
    PLANCHER=0
    ECHELLE=100
    hasard_enne=""
    compte=0
    num_enne_random=0
    while [[ $num -le $PLANCHER ]]; do
        num=$RANDOM
        let "num %= $ECHELLE"
    done
    if [[ $num -lt 50 ]]; then

        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
            if [[ $rarity == 1 ]]; then
                list_hasard_enne[$num_enne_random]=$id
                num_enne_random=$((num_enne_random+1))

            fi

        done < enemies.csv
    elif [[ $num -lt 80 ]]; then

        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
            if [[ $rarity == 2 ]]; then
                list_hasard_enne[$num_enne_random]=$id
                num_enne_random=$((num_enne_random+1))
            fi
        done < enemies.csv

    elif [[ $num -lt 95 ]]; then

        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
            if [[ $rarity == 3 ]]; then
                list_hasard_enne[$num_enne_random]=$id
                num_enne_random=$((num_enne_random+1))
            fi
        done < enemies.csv
    elif [[ $num -lt 99 ]]; then

        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
            if [[ $rarity == 4 ]]; then
                list_hasard_enne[$num_enne_random]=$id
                num_enne_random=$((num_enne_random+1))
            fi
        done < enemies.csv
    else

        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
            if [[ $rarity == 5 ]]; then
                list_hasard_enne[$num_enne_random]=$id
                num_enne_random=$((num_enne_random+1))
            fi
        done < enemies.csv
    fi
    num_enne_random=$((num_enne_random+1))
    num=0
    ECHELLE=$num_enne_random
    while [[ $num -le $PLANCHER ]]; do
        num=$RANDOM
        let "num %= $ECHELLE"
    done
    num_enne_random_id=0
    num=$((num-1))
    id_hasard=${list_hasard_enne[$num]}
    while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
        if [[ $id == $id_hasard ]]; then
            nom_enne=$name
            point_enne=$hp
            force_enne=$str
            num_enne_random=$((num_enne_random+1))
        fi
    done < enemies.csv
    point_combat_enne=$point_enne



}
    
boss_random(){
    PLANCHER=0
    ECHELLE=100
    hasard_enne=""
    compte=0
    num_enne_random=0
    while [[ $num -le $PLANCHER ]]; do
        num=$RANDOM
        let "num %= $ECHELLE"
    done
    if [[ $num -lt 50 ]]; then

        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
            if [[ $rarity == 1 ]]; then
                list_hasard_enne[$num_enne_random]=$id
                num_enne_random=$((num_enne_random+1))

            fi

        done < bosses.csv
    elif [[ $num -lt 80 ]]; then

        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
            if [[ $rarity == 2 ]]; then
                list_hasard_enne[$num_enne_random]=$id
                num_enne_random=$((num_enne_random+1))
            fi
        done < bosses.csv

    elif [[ $num -lt 95 ]]; then

        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
            if [[ $rarity == 3 ]]; then
                list_hasard_enne[$num_enne_random]=$id
                num_enne_random=$((num_enne_random+1))
            fi
        done < bosses.csv
    elif [[ $num -lt 99 ]]; then

        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
            if [[ $rarity == 4 ]]; then
                list_hasard_enne[$num_enne_random]=$id
                num_enne_random=$((num_enne_random+1))
            fi
        done < bosses.csv
    else

        while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
            if [[ $rarity == 5 ]]; then
                list_hasard_enne[$num_enne_random]=$id
                num_enne_random=$((num_enne_random+1))
            fi
        done < bosses.csv
    fi
    num_enne_random=$((num_enne_random+1))
    num=0
    ECHELLE=$num_enne_random
    while [[ $num -le $PLANCHER ]]; do
        num=$RANDOM
        let "num %= $ECHELLE"
    done
    num_enne_random_id=0
    num=$((num-1))
    id_hasard=${list_hasard[$num]}
    while IFS=',' read -r id name hp mp str int def res spd luck race class rarity ; do
        if [[ $id == $id_hasard ]]; then
            nom_enne=$name
            point_enne=$hp
            force_enne=$str
            num_enne_random=$((num_enne_random+1))
        fi
    done < bosses.csv
    point_combat_enne=$point_enne
}

perso_random
echo -e "${GREEN}$nom${NC} ,Save our kingdom by killing all the monsters in this 10-story tower,"
echo "watch out the kingdom is controlled by the monster that’s high up."
echo ""
echo "Fight him and kill him and our kingdom will regain its serenity,"
echo -e "don’t forget that I ${PINK}Zelda${NC} will always support you."
echo ""
while [[ $num_combat -lt 10 ]]; do
    num_combat=$((num_combat+1))
    echo ""
    echo "========== FIGHT  $num_combat =========="
    if [[ $num_combat -ne 10 ]]; then
	enne_random
     	combat 	
    else
	boss_random
	echo -e "Who also disturb the great, the one and only ${RED}$nom_enne${NC} ?"
	echo -e "It’s you ${GREEN}$nom${NC}, you think you can beat me?"
	echo "Know that Hyrule will remain to my thanks"
	echo "AH AH AH AH AH"
	combat 
    fi
done
if [[ $point_combat -gt 1 ]]; then
    echo -e "You saved Hyrule, ${PINK}Zelda${NC} and all the people of the kingdom"
    echo "thank you for it by organizing a great feast."
    echo -e "well done, you won, ${PINK}Zelda${NC} thanks you"
fi
