# README
Tecnologias utilizadas, ruby 3.1.2, rails 7.0.4.3, bd postgresql

Instrucciones para levantar el proyecto:

Descarga el proyecto y posiconarse en la raiz. 
Instala las dependencias ejecutando bundle install en la terminal.
Crea la base de datos ejecutando rails db:create en la terminal.
Ejecuta las migraciones de la base de datos ejecutando rails db:migrate en la terminal.
Para correr la aplicación, ejecuta rails server en la terminal.
Accede a la aplicación en tu navegador web a través de la URL http://localhost:3000.

Diagreama ER

|         Users        |
| ---      | ---       |
| id       | integer   |
| email    | string    |

|        Properties          |
| ------------- | ---------- |
| id            | integer    |
| operation     | integer    |
| property_type | integer    |
| price         | float      |
| currency_type | integer    |
| commune       | string     |
| address       | string     |
| area          | integer    |
| bedrooms      | integer    |
| bathrooms     | integer    |
| user_id       | references |

Un user tiene muchas properties y una property pertenece a un user.
