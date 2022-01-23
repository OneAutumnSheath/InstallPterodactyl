RED='\033[1;31m'
ROYAL='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;36m'
NC='\033[0m'
echo -e "${BLUE}Pterodactyl Install Script ${GREEN}by ${RED}OneAutumnSheath${NC}\n"
echo -e "${BLUE}Twitter: @scorpiondevde"
echo -e " "
echo -e "${RED}WARNING! ${ROYAL}This Script will only install the dependencies for the time beeing!"
PS3='Please choose between Panel (The Webinterface) or Wings (Node Instances): '
options=("Panel Install" "Wings Install" "Quit")
select opt in "${options[@]}"
do 
    case $opt in    
        "Panel Install")
            echo -e "${ROYAL}You choose the Panel Install.\n"
            echo -e " \n"
            echo -e "${ROYAL}Installing Pterodactyl Web Panel."
            apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg
            LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
            add-apt-repository -y ppa:chris-lea/redis-server
            curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
            apt update
            apt-add-repository universe
            apt -y install php php-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} mariadb-server nginx tar unzip git redis-server
            curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
            mkdir -p /var/www/pterodactyl
            cd /var/www/pterodactyl
            curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz    
            tar -xzvf panel.tar.gz
            chmod -R 755 storage/* bootstrap/cache/
            echo "CREATE USER 'pterodactyl'@'127.0.0.1' IDENTIFIED BY 'yourPassword'; CREATE DATABASE panel; GRANT ALL PRIVILEGES ON panel.* TO 'pterodactyl'@'127.0.0.1' WITH GRANT OPTION; exit;" >> ./mysqlcommands.txt
            echo -e "From here you have to enter the commands into the mysql server wich are located in the mysqlcommands.txt."
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