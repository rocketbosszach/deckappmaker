# Deck App Maker 
A small standalone bash script to automate making executable webapps for the Steam Deck platform. Similar utilities like WebcataloGNU General Public License v3.0g pack their own blends of Chromium or other browsers that restrict functionality such as extensions, leading the user to rely on their paid ad blocking solutions. This tool uses the default installation of Firefox and takes advantage of the --kiosk command line switch, allowing the user to browse with whichever extensions and tools they prefer.

## Installation
1. Place anywhere and execute from terminal. Deck App Maker uses default installation values and directories and will place the .desktop and icon files in ~/home/deck/.webapps *.
2. In Steam, go to "Add a Non-Steam Game to My Library" and navigate to /home/deck/.webapps and select the app. It should now show up in your library

*Other browsers and directories may be used but the script will need to be edited to reflect the desired file paths.

# License
GNU General Public License v3.0
