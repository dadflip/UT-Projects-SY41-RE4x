@echo off
setlocal enabledelayedexpansion

REM Coordonnées de départ pour le swipe
set "x1=500"
set "y1=500"

REM Coordonnées de fin pour le swipe
set "x2=700"
set "y2=700"

REM Nombre de swipes à effectuer
set "nombre_swipes=5"

REM Délai entre les swipes en millisecondes
set "delai_entre_swipes=1000"

REM Boucle pour effectuer les swipes
for /l %%i in (1,1,%nombre_swipes%) do (
    echo Swipe numéro %%i des coordonnées X1=!x1! Y1=!y1! aux coordonnées X2=!x2! Y2=!y2!
    adb shell input swipe !x1! !y1! !x2! !y2!
    timeout /t %delai_entre_swipes% /nobreak >nul
)

echo Script terminé.
