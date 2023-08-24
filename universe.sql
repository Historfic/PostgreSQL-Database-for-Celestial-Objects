--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    perihelion_distance numeric(10,2) NOT NULL,
    aphelion_distance numeric(10,2) NOT NULL,
    orbital_period numeric(10,2) NOT NULL,
    star_id integer,
    comet_name text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    comment text,
    likes integer,
    galaxy_name text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    distance_from_planet numeric(10,2) NOT NULL,
    comment text,
    moon_name text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    diameter integer NOT NULL,
    gravity numeric(5,2) NOT NULL,
    is_spherical boolean,
    planet_name text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    comment text,
    star_name text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley"s Comet', 0.59, 35.10, 76.00, NULL, NULL);
INSERT INTO public.comet VALUES (2, 'Encke"s Comet', 0.33, 4.17, 3.30, NULL, NULL);
INSERT INTO public.comet VALUES (3, 'Swift-Tuttle"s Comet', 1.05, 10.30, 133.20, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our solar system.', true, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest major galaxy to the Milky Way.', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy in the constellation Triangulum.', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf Galaxy', 'A dwarf galaxy orbiting the Milky Way Galaxy.', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Magellanic Clouds', 'Two is irregular galaxies that are satellites of the Milky Way Galaxy', false, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'A barred spiral galaxy that is known for its distinctive sombrero-shaped dust lane.', false, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'Phobos', 4, 22, 9.38, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Deimos', 4, 12, 23.46, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1, 5262, 1.07, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Moon', 1, 3474, 384400.00, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Io', 5, 3642, 421700.00, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Europa', 5, 3121, 671000.00, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Callisto', 5, 4821, 1882700.00, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Titan', 6, 5150, 1221870.00, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 1528, 527080.00, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, 734, 3560800.00, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Enceladus', 6, 504, 238020.00, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Tethys', 6, 530, 294660.00, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Dione', 6, 1123, 377400.00, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Miranda', 8, 500, 1295200.00, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Ariel', 8, 1158, 1910200.00, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Umbriel', 8, 578, 2705300.00, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Titania', 8, 1578, 4366000.00, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Oberon', 8, 1529, 5826300.00, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Titaniar', 8, 1578, 4366000.00, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'Oberun', 8, 1529, 5826300.00, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12, 9.80, true, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12, 8.90, true, NULL);
INSERT INTO public.planet VALUES (3, 'Mars', 1, 6, 3.70, true, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6, 3.70, true, NULL);
INSERT INTO public.planet VALUES (5, 'Mercury', 1, 4, 3.70, true, NULL);
INSERT INTO public.planet VALUES (6, 'Venus', 1, 12, 8.87, true, NULL);
INSERT INTO public.planet VALUES (7, 'Jupiter', 1, 143, 24.79, true, NULL);
INSERT INTO public.planet VALUES (8, 'Saturn', 1, 120, 10.44, true, NULL);
INSERT INTO public.planet VALUES (9, 'Uranius', 1, 51, 8.87, true, NULL);
INSERT INTO public.planet VALUES (10, 'Neptune', 1, 49, 11.15, true, NULL);
INSERT INTO public.planet VALUES (11, 'Pluto', 1, 2, 0.06, false, NULL);
INSERT INTO public.planet VALUES (12, 'Eris', 1, 2, 0.09, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 5, 93.01, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 5, 4.37, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Barnard"s Star', 2, 13, 6.01, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 240, 8.60, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Arcturus', 1, 5, 36.70, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 1, 450, 25.30, NULL, NULL);


--
-- Name: comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 26, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: comet comet_comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_name_key UNIQUE (comet_name);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (moon_name);


--
-- Name: moon moon_name_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_planet_id_key UNIQUE (name, planet_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (planet_name);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (star_name);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

