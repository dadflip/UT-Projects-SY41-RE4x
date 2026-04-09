@echo off
setlocal enabledelayedexpansion

REM Coordonnées du clic (ajustez selon vos besoins)
set "x=500"
set "y=500"

REM Nombre de clics à effectuer
set "nombre_clics=10"

REM Délai entre les clics en millisecondes
set "delai_entre_clics=1000"

REM Boucle pour effectuer les clics
for /l %%i in (1,1,%nombre_clics%) do (
    echo Clic numéro %%i aux coordonnées X=!x! Y=!y!
    adb shell input tap !x! !y!
    timeout /t %delai_entre_clics% /nobreak >nul
)

echo Script terminé.
