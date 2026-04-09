@echo off
setlocal enabledelayedexpansion

REM Emplacement du fichier de sortie
set "output_file=output.txt"

REM Liste des coordonnées de clic et swipe à tester
set "coordinates=500,500 700,700"

REM Délai entre les tests en millisecondes
set "delai_entre_tests=5000"

REM Effacer le fichier de sortie
echo. > %output_file%

REM Fonction pour effectuer un clic et enregistrer le nom de l'application
:perform_click
for %%c in (%coordinates%) do (
    set "coords=%%c"
    for /f "tokens=1,2 delims=," %%x in ("!coords!") do (
        echo Testing click at X=%%x Y=%%x
        adb shell input tap %%x %%y
        timeout /t 2 /nobreak >nul  REM Attendez un peu après le clic

        REM Obtenir le nom de l'application en avant-plan
        set "foreground_app="
        for /f "tokens=2" %%a in ('adb shell dumpsys window windows ^| findstr /i "Current"') do (
            set "foreground_app=%%a"
        )

        REM Si une application est en avant-plan, enregistrez les coordonnées dans le fichier
        if defined foreground_app (
            echo Application: !foreground_app! >> %output_file%
            echo Coordonnées: X=%%x Y=%%y >> %output_file%
        ) else (
            echo Aucune application en avant-plan détectée.
        )

        REM Revenir à l'écran d'accueil
        adb shell input keyevent KEYCODE_HOME
        timeout /t %delai_entre_tests% /nobreak >nul
    )
)
