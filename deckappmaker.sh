#!/bin/bash
clear

#User inputs and var assignment
echo "DeckApp Maker"
echo -e "\n\n"
read -p "What would you like to call the app: " appName
read -p "Enter full URL for site you would like to create an app: " desiredPage

#simple script to scrape the desired page for favicons - will fail more often than succeeds
wget -P /home/deck/.webapps/$appName/data -nd -H -p -A  .ico,favicon*.png,ico.png,*favicon*.ico  -e robots=off $desiredPage

#saves largest and generally highest quality icon image and sets name as variable
find /home/deck/.webapps/$appName/data -type f | sort -n -r | tail -n +2 | xargs -I{} rm -v {}
icon=$(ls /home/deck/.webapps/$appName/data)

#generates desktop file that can be executed by steam
echo [Desktop Entry] > /home/deck/.webapps/$appName.desktop
echo Encoding=UTF-8 >> /home/deck/.webapps/$appName.desktop
echo Version=1.0 >> /home/deck/.webapps/$appName.desktop
echo Type=Application >> /home/deck/.webapps/$appName.desktop
echo Terminal=false >> /home/deck/.webapps/$appName.desktop
echo Exec=flatpak run org.mozilla.firefox --user-agent="\"Mozilla/5.0 (Android 13; Mobile; rv:68.0) Gecko/68.0 Firefox/103.0\"" --kiosk "$desiredPage" >> /home/deck/.webapps/$appName.desktop
echo Name=$appName >> /home/deck/.webapps/$appName.desktop
echo Icon=/home/deck/.webapps/$appName/data/$icon >> /home/deck/.webapps/$appName.desktop

#makes generated desktop file executable
chmod +x /home/deck/.webapps/$appName.desktop

echo -e "\n\n\n"
read -p "$appName was created at /home/deck/.webapps...Press any key to continue"
./deckappmaker.sh

