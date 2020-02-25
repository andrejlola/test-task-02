CREATE TABLE countries
(
  id TINYINT(4) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL
);

CREATE TABLE sports
(
  id TINYINT(4) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE seasons
(
  id SMALLINT(5) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  country_id TINYINT(3) unsigned NOT NULL,
  year YEAR(4) NOT NULL,
  started_at DATE,
  finished_at DATE,
  CONSTRAINT seasons_countries_id_fk FOREIGN KEY (country_id) REFERENCES countries (id)
);
CREATE UNIQUE INDEX seasons_country_id_year_uindex ON seasons (country_id, year);

CREATE TABLE season_sport
(
  id INT(10) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
  season_id SMALLINT(5) unsigned NOT NULL,
  sport_id TINYINT(3) unsigned NOT NULL,
  CONSTRAINT season_sport_seasons_id_fk FOREIGN KEY (season_id) REFERENCES seasons (id),
  CONSTRAINT season_sport_sports_id_fk FOREIGN KEY (sport_id) REFERENCES sports (id)
);
CREATE INDEX season_sport_seasons_id_fk ON season_sport (season_id);
CREATE INDEX season_sport_sports_id_fk ON season_sport (sport_id);


select sp.name
from countries as c
inner join seasons as s on s.country_id=c.id
inner join season_sport as ss on ss.season_id=s.id
inner join sports as sp on sp.id=ss.sport_id
group by s.country_id, sp.name
having count(sp.name)>3;