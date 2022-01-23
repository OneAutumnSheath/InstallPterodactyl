RED='\033[1;31m'
ROYAL='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;36m'
NC='\033[0m'
echo -e "${BLUE}Pterodactyl Install Script ${GREEN}by ${RED}OneAutumnSheath${NC}\n"
echo -e "${BLUE}Twitter: @scorpiondevde"

PS3='Please choose between Panel (The Webinterface) or Wings (Node Instances): '
options=("Panel Install" "Wings Install" "Quit")
select opt in "${options[@]}"
do 
    case $opt in    
        "Panel Install")
            echo -e "${ROYAL}You choose the Panel Install.\n"
            echo -e " \n"
            echo -e "${ROYAL}Installing Pterodactyl Web Panel."
            break
            ;;
        "Wings Install")
            echo -e "${ROYAL}You choose the Wings Install.\n"
            echo -e " \n"
            echo -e "${ROYAL}Installing Pterodactyl Wings Node"
           break
           ;;
        "Quit")
            break
            ;;
            *) echo "${RED}invalid option $REPLY";;
        esac
done