#!/bin/bash
# Última actualización: 07/03/2022
cd /
# Se descarga Firefox
wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/97.0.2/linux-x86_64/es-MX/firefox-97.0.2.tar.bz2
cd /usr/local/
echo 'Se va a instalar en /usr/local/...'
read -p "Ingresa el nombre del directorio principal de instalacion, si no existe se creará: " DIRINST
if [ -d $DIRINST ];
	then
		echo 'El directorio ya existe...'
		echo '>>> Ingresando...'
		cd $DIRINST
	else
		echo 'El directorio no existe...'
		echo 'Creando directorio...'
		mkdir $DIRINST
		echo 'Directorio creado...'
		echo '>>> Ingresando...'
		cd $DIRINST
fi
sleep 2
mv /firefox-97.0.2.tar.bz2 /usr/local/$DIRINST
tar jvxf firefox-97.0.2.tar.bz2
#
#App a Menú
cd /usr/share/applications/
touch firefox.desktop
echo '[Desktop Entry]' > firefox.desktop
echo 'Version=97.0.2' >> firefox.desktop
echo 'Name=Firefox' >> firefox.desktop
echo 'Comment=Suite Navegador Web' >> firefox.desktop
echo 'Exec=/usr/local/'$DIRINST'/firefox/firefox' >> firefox.desktop
echo 'Icon=/usr/local/'$DIRINST'/firefox/browser/chrome/icons/default/default16.png' >> firefox.desktop
echo 'Categories=Network;' >> firefox.desktop
echo 'Terminal=false' >> firefox.desktop
echo 'Type=Application' >> firefox.desktop
cd /usr/local/$DIRINST/firefox/
#
#Remove
touch remove.sh
echo "#!/bin/bash" > remove.sh
echo "echo '------------------------------'" >> remove.sh
echo "echo 'Removiendo...'" >> remove.sh
echo "echo -ne '[===>                                    ]( 8.33%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=========>                              ](16.66%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[============>                           ](24.99%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[===============>                        ](33.32%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[==================>                     ](41.65%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=====================>                  ](49.98%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[========================>               ](58.31%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[===========================>            ](66.64%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[==============================>         ](74.97%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=================================>      ](83.30%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[====================================>   ](91.64%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '[=======================================>](100.00%)\r';sleep 0.2" >> remove.sh
echo "echo -ne '\n'" >> remove.sh
echo 'cd /' >> remove.sh
echo 'rm -rf /usr/share/applications/firefox.desktop' >> remove.sh
echo 'rm -rf /usr/local/'$DIRINST'/firefox/' >> remove.sh
echo 'rm -rf /home/*/.cache/mozilla/firefox/' >> remove.sh
echo 'rm -rf /home/*/.mozilla/firefox/' >> remove.sh
echo "echo 'Completado!'" >> remove.sh
echo "echo '------------------------------'" >> remove.sh
echo 'exit' >> remove.sh
chmod 744 remove.sh
#
#README
touch README.txt
echo 'Mozilla Firefox' > README.txt
echo 'Idioma=es_MX' >> README.txt
echo 'Version=97.0.2' >> README.txt
echo 'Arquitectura=64-bit' >> README.txt
echo 'Esta es una instalación no invasiva.' >> README.txt
echo 'Para desinstalar ejecute el fichero remove.sh como root.' >> README.txt
echo '' >> README.txt
echo 'https://www.mozilla.org/es-MX/' >> README.txt
echo '' >> README.txt
echo 'xaxlm' >> README.txt
#
# Limpieza
cd /
echo '------------------------------'
echo 'Limpiando...'
echo -ne '[===>                                    ]( 8.33%)\r';sleep 0.2
echo -ne '[=========>                              ](16.66%)\r';sleep 0.2
echo -ne '[============>                           ](24.99%)\r';sleep 0.2
echo -ne '[===============>                        ](33.32%)\r';sleep 0.2
echo -ne '[==================>                     ](41.65%)\r';sleep 0.2
echo -ne '[=====================>                  ](49.98%)\r';sleep 0.2
echo -ne '[========================>               ](58.31%)\r';sleep 0.2
echo -ne '[===========================>            ](66.64%)\r';sleep 0.2
echo -ne '[==============================>         ](74.97%)\r';sleep 0.2
echo -ne '[=================================>      ](83.30%)\r';sleep 0.2
echo -ne '[====================================>   ](91.64%)\r';sleep 0.2
echo -ne '[=======================================>](100.00%)\r';sleep 0.2
echo -ne '\n'
rm -rf /usr/local/$DIRINST/firefox-97.0.2.tar.bz2
if [ -d /home/*/.cache/mozilla/firefox/ ];
	then
		rm -rf /home/*/.cache/mozilla/firefox/
		rm -rf /home/*/.mozilla/firefox/
	else
		:
fi
echo 'Completado!'
echo '------------------------------'
exit
