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

# 3. Crear el proyecto DBT
### dbt init taxi_project

# 4. Mover la carpeta "data" que contiene los archivos *.parquet dentro del proyecto
### mv data taxi_project/

# 5. Crear el modelo de DBT
### cd taxi_project
### mkdir -p models/staging
Crear el archivo 
### nano models/staging/stg_yellow_tripdata.sql
Pegar el contenido
### SELECT * FROM read_parquet('data/yellow_tripdata_*.parquet', filename = true)
Guardar, cerrar y ejecutar el modelo
### dbt run

# 6. Eliminar los modelos de ejemplo
### rm -rf models/example

# 7. Verificamos que los archivos parquet realmente se unieron
Vamos a contar cuántas filas tiene el modelo. Debería ser la suma de la cantidad de filas de todos los parquets.
### python -c "import duckdb; con = duckdb.connect('dev.duckdb'); print(con.execute('SELECT COUNT (*) FROM stg_yellow_tripdata').fetchone())"

También podemos confirmar que sí efectivamente se leyeron todos los archivos parquets relacionados, utilizando la columna filename que se agrega.
### python -c "import duckdb; con = duckdb.connect('dev.duckdb'); print(con.execute('SELECT filename, COUNT(*) FROM stg_yellow_tripdata GROUP BY filename ORDER BY filename').fetchall())"

# 8. Limpieza de datos
Se crean los archivos **notebook** para análisis de datos. 
Se compara el estado de los registros antes y después del proceso de  limpieza. 

