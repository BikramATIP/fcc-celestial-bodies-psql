--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    distance_in_ly integer,
    diameter_in_ly integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    diameter_km numeric,
    potential_for_life boolean,
    star_id integer,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km numeric,
    solar_mass numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 0, 100000, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 158000, 14000, 'LMC');
INSERT INTO public.galaxy VALUES (3, 2500000, 220000, 'Andromeda');
INSERT INTO public.galaxy VALUES (4, 11500000, 37000, 'Cigar Galaxy');
INSERT INTO public.galaxy VALUES (5, 20870000, 170000, 'Pinwheel Galaxy');
INSERT INTO public.galaxy VALUES (6, 29350000, 50000, 'Sombrero Galaxy');
INSERT INTO public.galaxy VALUES (7, 30000000, 60000, 'Whirlpool Galaxy');
INSERT INTO public.galaxy VALUES (8, 61000000, 110000, 'NGC 1300');
INSERT INTO public.galaxy VALUES (9, 420000000, 280000, 'Tadpole Galaxy');
INSERT INTO public.galaxy VALUES (10, 600000000, 100000, 'Hoag''s Object');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mars', 6779, true, 21, 'The ''Red Planet,'', fourth from the Sun');
INSERT INTO public.planet VALUES (3, 'Venus', 12104, false, 21, 'Second planet from the Sun, toxic atmosphere');
INSERT INTO public.planet VALUES (4, 'Mercury', 4880, false, 21, 'Closest planet to the Sun, extreme temperatures');
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, false, 21, 'Largest planet in the solar system');
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, false, 21, 'Sixth planet from the Sun, known for its rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, false, 21, 'Seventh planet from the Sun, rotates on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, false, 21, 'Eighth planet from the Sun, strongest winds');
INSERT INTO public.planet VALUES (1, 'Earth', 12742, true, 1, 'The third planet from the Sun, supports life');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 14000, true, 22, 'Closest known exoplanet to Earth');
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 12000, true, 23, 'Earth-sized exoplanet in the TRAPPIST-1 system');
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 18000, true, 24, 'Known as "Earth''s Cousin."');
INSERT INTO public.planet VALUES (12, 'LHS 1140 b', 16000, true, 25, 'Rocky exoplanet in the habitable zone.');
INSERT INTO public.planet VALUES (13, 'Kepler-22b', 30000, true, 26, 'First confirmed habitable-zone exoplanet');
INSERT INTO public.planet VALUES (14, 'HD 209458 b', 180000, false, 27, 'First exoplanet detected via the transit method');
INSERT INTO public.planet VALUES (15, 'WASP-12b', 240000, false, 28, 'One of the hottest known exoplanets.');
INSERT INTO public.planet VALUES (16, 'TOI-700 d', 12000, true, 29, 'Earth-sized exoplanet in the habitable zone');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius A', 2.4, 2.02, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1.7, 1.1, 1);
INSERT INTO public.star VALUES (3, 'S Doradus', 380, 25, 2);
INSERT INTO public.star VALUES (4, 'R136a1', 35, 315, 2);
INSERT INTO public.star VALUES (5, 'Almach', 8, 2.5, 3);
INSERT INTO public.star VALUES (6, 'M31-V1', 20, 15, 3);
INSERT INTO public.star VALUES (7, 'M82 X-1', 30, 20, 4);
INSERT INTO public.star VALUES (8, 'M82-V1', 10, 8, 4);
INSERT INTO public.star VALUES (9, 'M101-OT1', 50, 18, 5);
INSERT INTO public.star VALUES (10, 'm101-V1', 25, 10, 5);
INSERT INTO public.star VALUES (11, 'M104-V1', 12, 5, 6);
INSERT INTO public.star VALUES (12, 'M104-V2', 8, 3, 6);
INSERT INTO public.star VALUES (13, 'M51-ULS1', 25, 30, 7);
INSERT INTO public.star VALUES (14, 'M51-V1', 10, 8, 7);
INSERT INTO public.star VALUES (15, 'NGC 1300-V1', 18, 13, 8);
INSERT INTO public.star VALUES (16, 'NGC 1300-V2', 22, 15, 8);
INSERT INTO public.star VALUES (17, 'Tadpole-V1', 10, 7, 9);
INSERT INTO public.star VALUES (18, 'Tadpole-V2', 15, 10, 9);
INSERT INTO public.star VALUES (19, 'Hoag-V1', 12, 6, 10);
INSERT INTO public.star VALUES (20, 'Hoag-V2', 8, 4, 10);
INSERT INTO public.star VALUES (21, 'Sun', 1.39, 1, 1);
INSERT INTO public.star VALUES (22, 'Proxima Centauri', 200000, 0.12, 1);
INSERT INTO public.star VALUES (23, 'TRAPPIST-1', 120000, 0.08, 1);
INSERT INTO public.star VALUES (24, 'Kepler-452', 1600000, 1.04, 1);
INSERT INTO public.star VALUES (25, 'LHS 1140', 140000, 0.15, 1);
INSERT INTO public.star VALUES (26, 'Kepler-22', 1800000, 0.97, 1);
INSERT INTO public.star VALUES (27, 'HD 209458', 1500000, 1.15, 1);
INSERT INTO public.star VALUES (28, 'WASP-12', 1700000, 1.35, 1);
INSERT INTO public.star VALUES (29, 'TOI-700', 1300000, 0.42, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 29, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

