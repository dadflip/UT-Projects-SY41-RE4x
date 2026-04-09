@echo off
setlocal enabledelayedexpansion

REM Coordonnées du clic (ajustez selon vos besoins)
set "x=750"
set "y=500"

REM Coordonnées de départ pour le swipe
set "x1=700"
set "y1=700"

REM Coordonnées de fin pour le swipe
set "x2=300"
set "y2=700"

REM Nombre de clics à effectuer
set "nombre_clics=10"

REM Délai entre les clics en millisecondes
set "delai_entre_clics=1000"

REM Nombre de swipes à effectuer
set "nombre_swipes=5"

REM Délai entre les swipes en millisecondes
set "delai_entre_swipes=1000"

echo Swipe numéro %%i des coordonnées X1=!x1! Y1=!y1! aux coordonnées X2=!x2! Y2=!y2!
adb shell input swipe !x1! !y1! !x2! !y2!
REM timeout /t %delai_entre_swipes% /nobreak >nul

echo Clic numéro %%i aux coordonnées X=!x! Y=!y!
adb shell input tap !x! !y!
REM timeout /t %delai_entre_clics% /nobreak >nul