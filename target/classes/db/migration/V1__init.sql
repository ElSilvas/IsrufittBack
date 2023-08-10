CREATE TABLE IF NOT EXISTS client (
    id SERIAL,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (id)
    );
CREATE TABLE IF NOT EXISTS objective (
     id SERIAL PRIMARY KEY,
     nombre VARCHAR(100) NOT NULL
    );

CREATE TABLE IF NOT EXISTS rutina (
    id INT PRIMARY KEY,
    objective_id INT,
    description VARCHAR(100),
    days VARCHAR(100),
    FOREIGN KEY (objective_id) REFERENCES objective(id)
    );

CREATE TABLE IF NOT EXISTS exercise (
    id INT PRIMARY KEY,
    description VARCHAR(100),
    series INT,
    repetitions INT
    );
CREATE TABLE IF NOT EXISTS details (
    id SERIAL PRIMARY KEY,
    rutina_id INT,
    exercise_id INT,
    FOREIGN KEY (rutina_id) REFERENCES rutina(id),
    FOREIGN KEY (exercise_id) REFERENCES exercise(id)
    );
CREATE TABLE IF NOT EXISTS diet (
    id INT PRIMARY KEY,
    objective_id INT,
    description VARCHAR(100),
    monday VARCHAR(100),
    tuesday VARCHAR(100),
    wednesday VARCHAR(100),
    thursday VARCHAR(100),
    friday VARCHAR(100),
    FOREIGN KEY (objective_id) REFERENCES objective(id)
    );


CREATE TABLE IF NOT EXISTS history (
    id INT PRIMARY KEY,
    start_date DATE,
    present_date DATE,
    weight DOUBLE PRECISION,
    height DOUBLE PRECISION,
    imc DOUBLE PRECISION,
    diet_id INT,
    rutina_id INT,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES client(id),
    FOREIGN KEY (diet_id) REFERENCES diet(id),
    FOREIGN KEY (rutina_id) REFERENCES rutina(id)
    );