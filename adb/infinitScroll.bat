@echo off
setlocal enabledelayedexpansion

REM Coordonnées de départ pour le swipe
set "x1=500"
set "y1=900"

REM Coordonnées de fin pour le swipe (plus bas que les coordonnées de départ)
set "x2=500"
set "y2=200"

REM Délai entre les swipes en millisecondes
set "delai_entre_swipes=1000"

:scroll_infini
echo Swipe vers le bas...
adb shell input swipe !x1! !y1! !x2! !y2!
goto scroll_infini
