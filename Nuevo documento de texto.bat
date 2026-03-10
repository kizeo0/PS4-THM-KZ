@echo off
setlocal
title Reparando Carga a GitHub - PS4-THM-KZ
set REPO_URL=https://github.com/kizeo0/PS4-THM-KZ.git

echo --- PASO 1: Configurando identidad (Necesario para evitar el error) ---
:: Esto es obligatorio para que Git te deje hacer el "commit"
git config --local user.email "usuario@ejemplo.com"
git config --local user.name "Cargador Automatico"

echo.
echo --- PASO 2: Inicializando Repositorio ---
:: Si ya existe una carpeta .git corrupta, la reiniciamos
if exist ".git" (
    echo Limpiando rastro anterior...
    rd /s /q ".git"
)
git init

echo.
echo --- PASO 3: Vinculando con GitHub ---
git remote add origin %REPO_URL%

echo.
echo --- PASO 4: Indexando imagenes (Son +700, espera un poco) ---
git add .

echo.
echo --- PASO 5: Creando el paquete (Commit) ---
git commit -m "by KiZeo"

echo.
echo --- PASO 6: Cambiando nombre de rama a 'main' ---
git branch -M main

echo.
echo --- PASO 7: Subiendo a GitHub ---

git config http.postBuffer 524288000

git push -u origin main -f

echo.
echo --- ¡LISTO! 
pause
