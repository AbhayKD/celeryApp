-- psql postgres postgres -f create_tables.sql



-- Adding the uuid extension here
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Creating the continent table
CREATE TABLE IF NOT EXISTS continent (
    id int NOT NULL,
    name varchar(80) NOT NULL,
    area int NOT NULL,
    population bigint NOT NULL,
    PRIMARY KEY (id)
);

-- creating the country table
CREATE TABLE IF NOT EXISTS country (
    id int NOT NULL,
    name varchar(80) NOT NULL,
    area int NOT NULL,
    hospital_count int NOT NULL,
    national_park_count int NOT NULL,
    population bigint NOT NULL,
    continent_id int NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_continent_id FOREIGN KEY (continent_id) REFERENCES continent(id) ON DELETE
    SET
        NULL
);

-- creating the city table
CREATE TABLE IF NOT EXISTS city (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    name varchar(80) NOT NULL,
    area int NOT NULL,
    roads_count int,
    trees_count int,
    population bigint NOT NULL,
    country_id int NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_country_id FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE
    SET
        NULL
);

-- Check for the sanity of being insreted/updated country population and area with respect to continent population.
CREATE OR REPLACE FUNCTION check_country() RETURNS TRIGGER AS 
$$
BEGIN 
IF NEW.population + (
    SELECT SUM(country.population) FROM country
    WHERE country.continent_id = NEW.continent_id
) > (
    SELECT continent.population FROM continent
    WHERE id = NEW.continent_id
) THEN Raise Exception 'Entered population will exceeds the continent total population!!';
END IF;
IF NEW.area + (
    SELECT SUM(country.area) FROM country
    WHERE country.continent_id = NEW.continent_id
) > (
    SELECT continent.area FROM continent
    WHERE id = NEW.continent_id
) THEN Raise Exception 'Entered area will exceeds the continent total area!!';
END IF;
RETURN NEW;
END;
$$ LANGUAGE PLpgSQL;

-- check and create the trigger if not exists.
DO $$
BEGIN
  IF NOT EXISTS(SELECT *
    FROM information_schema.triggers
    WHERE event_object_table = 'country'
    AND trigger_name = 'check_country'
  )
  THEN
    CREATE TRIGGER check_country BEFORE INSERT OR UPDATE ON country FOR EACH ROW EXECUTE PROCEDURE check_country();
  END IF;
END;
$$;


-- Check for the sanity of being insreted/updated city population with respect to country population.
CREATE OR REPLACE FUNCTION check_city() RETURNS TRIGGER AS 
$$
BEGIN 
IF NEW.population + (
    SELECT SUM(city.population) FROM city
    WHERE city.country_id = NEW.country_id
) > (
    SELECT country.population FROM country
    WHERE id = NEW.country_id
) THEN Raise Exception 'Entered population will exceeds the country total population!!';
END IF;
IF NEW.area + (
    SELECT SUM(city.area) FROM city
    WHERE city.country_id = NEW.country_id
) > (
    SELECT country.area FROM country
    WHERE id = NEW.country_id
) THEN Raise Exception 'Entered area will exceeds the country total area!!';
END IF;
RETURN NEW;
END;
$$ LANGUAGE PLpgSQL;

-- check and create the trigger if not exists.
DO $$
BEGIN
  IF NOT EXISTS(SELECT *
    FROM information_schema.triggers
    WHERE event_object_table = 'city'
    AND trigger_name = 'check_city'
  )
  THEN
    CREATE TRIGGER check_city BEFORE INSERT OR UPDATE ON city FOR EACH ROW EXECUTE PROCEDURE check_city();
  END IF;
END;
$$
