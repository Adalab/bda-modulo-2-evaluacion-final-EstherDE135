# 📽️ Sakila SQL Exercises — Proyecto para tienda de alquiler de películas

Este repositorio contiene un conjunto de ejercicios SQL diseñados para explorar y analizar la base de datos “Sakila”, una base de datos de ejemplo ampliamente utilizada para estudios relacionados con gestión de tiendas de alquiler de películas.

## 📊 Descripción del Proyecto

La base de datos “Sakila” representa el esquema típico de una tienda de alquiler de películas, incluyendo información sobre películas, actores, clientes, alquileres, pagos y más.  
Este proyecto tiene como objetivo aplicar consultas SQL para extraer datos útiles y realizar análisis relevantes para operaciones comerciales.

## 📁 Contenido del Archivo SQL

El archivo principal contiene una colección organizada de ejercicios SQL que responden a diferentes necesidades y preguntas del negocio.  
Cada sección está comentada para indicar el objetivo de la consulta.

### 🔍 Ejercicios incluidos:

1. **Películas y Clasificaciones**
   - Listar todos los títulos de películas sin duplicados.
   - Mostrar títulos de películas clasificadas como 'PG-13'.
   - Encontrar títulos con duración mayor a 120 minutos.
   - Mostrar títulos que no sean de clasificación 'R' ni 'PG-13'.

2. **Búsqueda por Descripción**
   - Buscar películas cuya descripción contiene las palabras "amazing", "dog" o "cat".

3. **Actores**
   - Encontrar actores cuyo apellido contiene "Gibson".
   - Listar actores con 'actor_id' entre 10 y 20.
   - Mostrar actores que aparecen en más de 10 películas.
   - Detectar actores que no aparecen en ninguna película.

4. **Clientes**
   - Contar cuántas películas ha alquilado cada cliente, incluyendo los que no alquilaron nada.

5. **Categorías**
   - Mostrar el número total de películas alquiladas por categoría.
   - Encontrar todas las películas que pertenecen a la misma categoría que "Family".
   - Mostrar categorías cuyo promedio de duración supera los 120 minutos.

6. **Estadísticas de Películas**
   - Obtener promedio de duración por clasificación.
   - Contar películas por clasificación.

7. **Relaciones entre Tablas**
   - Mostrar actores que participan en una película específica ('Indian Love').
   - Buscar películas por categoría y duración con múltiples condiciones.

## 🛠️ Requisitos

- **MySQL** o un gestor compatible con SQL estándar.
- Base de datos “Sakila” instalada.  
  Puedes descargarla desde el repositorio oficial de MySQL:
  👉 https://dev.mysql.com/doc/sakila/en/

## 🚀 Uso

1. Instala la base de datos Sakila en tu servidor de MySQL.
2. Abre un cliente SQL (como MySQL Workbench, DBeaver o línea de comandos).
3. Ejecuta las consultas contenidas en el archivo `Evaluacion_final_modulo_2.sql`.
4. Revisa los resultados para entender mejor cómo se relacionan los datos.

## 🧠 Objetivos de Aprendizaje

- Reforzar conocimientos en consultas SQL.
- Comprender relaciones entre tablas mediante claves foráneas.
- Practicar filtrado, agrupamiento y agregación de datos.
- Aplicar funciones SQL como `JOIN`, `GROUP BY`, `HAVING`, `LIKE`, `COUNT()`, `AVG()` y más.

## 📌 Notas

- Todas las consultas están pensadas para fines educativos.
- Asegúrate de tener la base de datos “Sakila” correctamente cargada antes de ejecutar los ejercicios.

## 📬 Contacto

¿Tienes sugerencias, dudas o mejoras para este repositorio?  
No dudes en abrir un _issue_ o enviar una solicitud (_pull request_).

---

Autor: Esther Domínguez Escudero
