# DBTTutorial
Tutorial de DBT (Data Build Tools)

# 1. Preparación
Crear el entorno virtual de python que utilice la versión (3.12) de python (Las versiones superiores no son aún compatibles con dbt-core por lo que DuckDB puede fallar o presentar errores).
### sudo add-apt-repository ppa:deadsnakes/ppa
### sudo apt update
### sudo apt install python3.12 python3.12-venv
### cd yellow-trip-data
### python3.12 -m venv .venv
### source .venv/bin/activate
### python --version

# 2. Instalar DBT-DuckDB
### pip install dbt-duckdb
### dbt --version
