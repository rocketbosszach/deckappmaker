#!/bin/bash

while :
do

    clear

    #User inputs and var assignment
    echo "DeckApp Maker"
    echo -e "\n\n"
    read -p "What would you like to call the app: " appName
    read -p "Enter full URL for site you would like to create an app: " desiredPage

    #simple script to scrape the desired page for favicons - will fail more often than succeeds
    wget -P /home/deck/.webapps/${appName// /_}/data -nd -H -p -A  .ico,favicon*.png,ico.png,*favicon*.ico  -e robots=off $desiredPage

    #saves largest and generally highest quality icon image and sets name as variable
    find /home/deck/.webapps/${appName// /_}/data -type f | sort -n -r | tail -n +2 | xargs -I{} rm -v {}
    icon=$(ls /home/deck/.webapps/${appName// /_}/data)

    #generates bash file that can be executed by steam
    echo \#!/bin/bash >> /home/deck/.webapps/${appName// /_}/launcher.sh
    echo flatpak run org.mozilla.firefox --user-agent="\"Mozilla/5.0 (Android 13; Mobile; rv:68.0) Gecko/68.0 Firefox/103.0\"" --kiosk "$desiredPage" >> /home/deck/.webapps/${appName// /_}/launcher.sh

    #generates desktop file for steam library archive
    echo [Desktop Entry] >> /home/deck/.webapps/${appName// /_}/${appName// /_}.desktop
    echo Name=$appName >> /home/deck/.webapps/${appName// /_}/${appName// /_}.desktop
    echo Comment=Browse a Steam Deck friendly version of this website. >> /home/deck/.webapps/${appName// /_}/${appName// /_}.desktop
    echo Exec=/home/deck/.webapps/${appName// /_}/launcher.sh >> /home/deck/.webapps/${appName// /_}/${appName// /_}.desktop
    echo Icon=/home/deck/.webapps/${appName// /_}/data/$icon >> /home/deck/.webapps/${appName// /_}/{appName// /_}.desktop
    echo Terminal=false >> /home/deck/.webapps/${appName// /_}/${appName// /_}.desktop
    echo Type=Application >> /home/deck/.webapps/${appName// /_}/${appName// /_}.desktop
    echo Categories=App >> /home/deck/.webapps/${appName// /_}/${appName// /_}.desktop

    #makes generated desktop file executable
    chmod +x /home/deck/.webapps/${appName// /_}/${appName// /_}.desktop
    chmod +x /home/deck/.webapps/${appName// /_}/launcher.sh

    echo -e "\n\n\n"
    read -p "$appName was created at /home/deck/.webapps/${appName// /_}/..."
    echo -e "\n\n"

done
