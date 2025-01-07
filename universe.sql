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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbit_period numeric(10,2),
    has_tail boolean NOT NULL,
    discovery_date date,
    composition text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age integer,
    has_supermassive_black_hole boolean NOT NULL,
    average_star_density numeric(10,2)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    orbital_period numeric(10,2),
    is_habitable boolean NOT NULL,
    composition text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    mass integer,
    radius numeric(10,2),
    has_atmosphere boolean NOT NULL,
    surface_temperature integer
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    mass integer,
    luminosity numeric(10,2),
    is_main_sequence boolean NOT NULL,
    spectral_type character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Encke', 3.30, true, '1786-01-17', 'Ice and dust');
INSERT INTO public.comet VALUES (2, 'Wild 2', 6.41, true, '1978-01-06', 'Ice and dust');
INSERT INTO public.comet VALUES (3, 'Tempel 1', 5.51, true, '1867-04-03', 'Ice and dust');
INSERT INTO public.comet VALUES (4, 'Borrelly', 6.86, true, '1904-12-28', 'Ice and dust');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13700, true, 0.81);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy', 10000, true, 0.35);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'The third largest in the Local Group', 5000, false, 0.54);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A spiral galaxy with distinctive appearance', 6000, true, 0.47);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A spiral galaxy with a bright nucleus', 9000, true, 0.65);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'A ring galaxy caused by collision', 4000, false, 0.32);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 27.30, false, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.32, false, 'Rocky');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1.26, false, 'Rocky');
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3.55, false, 'Icy');
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 7.15, false, 'Icy');
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 16.69, false, 'Icy');
INSERT INTO public.moon VALUES (7, 'Titan', 4, 15.95, false, 'Icy');
INSERT INTO public.moon VALUES (8, 'Enceladus', 4, 1.37, false, 'Icy');
INSERT INTO public.moon VALUES (9, 'Mimas', 4, 0.94, false, 'Icy');
INSERT INTO public.moon VALUES (10, 'Triton', 5, 5.88, false, 'Icy');
INSERT INTO public.moon VALUES (11, 'Nereid', 5, 360.14, false, 'Icy');
INSERT INTO public.moon VALUES (12, 'Charon', 6, 6.39, false, 'Icy');
INSERT INTO public.moon VALUES (13, 'Styx', 6, 20.16, false, 'Icy');
INSERT INTO public.moon VALUES (14, 'Nix', 6, 24.86, false, 'Icy');
INSERT INTO public.moon VALUES (15, 'Kerberos', 6, 32.10, false, 'Icy');
INSERT INTO public.moon VALUES (16, 'Hydra', 6, 38.20, false, 'Icy');
INSERT INTO public.moon VALUES (17, 'Amalthea', 3, 0.50, false, 'Icy');
INSERT INTO public.moon VALUES (18, 'Himalia', 3, 250.56, false, 'Icy');
INSERT INTO public.moon VALUES (19, 'Elara', 3, 259.65, false, 'Icy');
INSERT INTO public.moon VALUES (20, 'Leda', 3, 240.92, false, 'Icy');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, 6371.00, true, 288);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0, 3389.00, true, 210);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 318, 69911.00, true, 165);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 95, 58232.00, true, 134);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 1, 7160.00, true, 234);
INSERT INTO public.planet VALUES (6, 'Sirius b', 3, 1, 5878.00, true, 320);
INSERT INTO public.planet VALUES (7, 'Vega b', 4, 1, 6581.00, true, 300);
INSERT INTO public.planet VALUES (8, 'Betelgeuse b', 5, 3, 12371.00, true, 600);
INSERT INTO public.planet VALUES (9, 'Rigel b', 6, 3, 14500.00, true, 350);
INSERT INTO public.planet VALUES (11, 'Neptune', 1, 17, 24622.00, true, 73);
INSERT INTO public.planet VALUES (12, 'Uranus', 1, 15, 25362.00, true, 76);
INSERT INTO public.planet VALUES (13, 'Proxima c', 2, 2, 7890.00, true, 250);
INSERT INTO public.planet VALUES (14, 'Sirius c', 3, 2, 6400.00, true, 310);
INSERT INTO public.planet VALUES (15, 'Vega c', 4, 1, 6890.00, true, 280);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 1.00, true, 'G2V');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0, 0.00, true, 'M5.5V');
INSERT INTO public.star VALUES (3, 'Sirius', 2, 2, 25.40, true, 'A1V');
INSERT INTO public.star VALUES (4, 'Vega', 2, 2, 40.00, true, 'A0V');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3, 9, 120000.00, false, 'M1-M2Ia-Iab');
INSERT INTO public.star VALUES (6, 'Rigel', 4, 21, 120000.00, false, 'B8Ia');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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

