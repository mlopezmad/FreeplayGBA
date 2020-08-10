#!/bin/bash

cd ~
git clone https://github.com/julenvitoria/FreeplayGBAcm3
if grep -q "Actualizar-Addons" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Directorio Actualizar Addons ya se encuentra"
else
        mkdir /home/pi/RetroPie/retropiemenu/Actualizar-Addons
fi
mkdir /home/pi/RetroPie/retropiemenu/Actualizar-Addons
cp /home/pi/FreeplayGBAcm3/Update.sh /home/pi/RetroPie/retropiemenu/Actualizar-Addons
cp /home/pi/FreeplayGBAcm3/ActualizarSistema.sh /home/pi/RetroPie/retropiemenu/Actualizar-Addons
chmod +x /home/pi/RetroPie/retropiemenu/Actualizar-Addons/Update.sh
chmod +x /home/pi/RetroPie/retropiemenu/Actualizar-Addons/ActualizarSistema.sh
if grep -q "Actualizar Addons de la Imagen" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Actualizar Addons ya se encuentra en el menu"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Actualizar-Addons/Update.sh</path>\n\t\t<name>Actualizar Addons de la Imagen</name>\n\t\t<desc>Script para la actualizacion de las diferentes opciones y configuraciones de la imagen FreeplayGBAcm3</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
if grep -q "Actualizar Sistema de la Imagen" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Actualizar Sistema ya se encuentra en el menu"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Actualizar-Addons/ActualizarSistema.sh</path>\n\t\t<name>Actualizar Sistema de la Imagen</name>\n\t\t<desc>Script para la actualizacion del sistema de la imagen FreeplayGBAcm3</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

