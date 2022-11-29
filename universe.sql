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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    constellation text,
    distance_kly integer,
    magnitude numeric(4,2) NOT NULL
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
    discovery_year integer,
    discovered_by character(30),
    planet_id integer
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
-- Name: moon_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_planet (
    moon_planet_id integer NOT NULL,
    name character varying NOT NULL,
    planet_name character(30) NOT NULL
);


ALTER TABLE public.moon_planet OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_moon_planet_id_seq OWNED BY public.moon_planet.moon_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbital_period_in_days numeric(10,2),
    discovery_year integer,
    has_life boolean,
    naked_eye_visible boolean,
    star_id integer
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
    stellar_class character(10),
    abs_magnitude numeric(4,2),
    distance_ly numeric(10,2),
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_planet moon_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet ALTER COLUMN moon_planet_id SET DEFAULT nextval('public.moon_planet_moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 0, -6.50);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'Dorado/Mensa', 160, 0.90);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'Tucana', 200, 2.70);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'Andromeda', 2500, 3.40);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Triangulum', 2900, 5.70);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Centaurus', 13700, 6.84);
INSERT INTO public.galaxy VALUES (7, 'Bode´s', 'Ursa Major', 12000, 6.94);
INSERT INTO public.galaxy VALUES (8, 'Sculptor', 'Sculptor', 12000, 7.20);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 'Hall                          ', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 'Hall                          ', 4);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 'Galileo                       ', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 'Galileo                       ', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 'Galileo                       ', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 'Galileo                       ', 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 1789, 'Herschel                      ', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1789, 'Herschel                      ', 6);
INSERT INTO public.moon VALUES (10, 'Thetys', 1684, 'Cassini                       ', 6);
INSERT INTO public.moon VALUES (11, 'Dione', 1684, 'Cassini                       ', 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 1672, 'Cassini                       ', 6);
INSERT INTO public.moon VALUES (13, 'Titan', 1655, 'Huygens                       ', 6);
INSERT INTO public.moon VALUES (14, 'Ariel', 1851, 'Lassell                       ', 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 1851, 'Lassell                       ', 7);
INSERT INTO public.moon VALUES (16, 'Titania', 1787, 'Herschel                      ', 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 1787, 'Herschel                      ', 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 1948, 'Kuiper                        ', 7);
INSERT INTO public.moon VALUES (19, 'Triton', 1846, 'Lassell                       ', 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 1949, 'Kuiper                        ', 8);
INSERT INTO public.moon VALUES (21, 'Naiad', 1989, 'Terrile (Voyager 2)           ', 8);


--
-- Data for Name: moon_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_planet VALUES (1, 'Moon', 'Earth                         ');
INSERT INTO public.moon_planet VALUES (2, 'Io', 'Jupiter                       ');
INSERT INTO public.moon_planet VALUES (3, 'Phobos', 'Mars                          ');
INSERT INTO public.moon_planet VALUES (4, 'Deimos', 'Mars                          ');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 87.97, NULL, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 224.70, NULL, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 365.26, NULL, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 686.97, NULL, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4332.59, NULL, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 10759.22, NULL, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 30688.50, 1781, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 60.18, 1846, false, false, 1);
INSERT INTO public.planet VALUES (9, 'Brahe', 44.42, 2004, false, false, 3);
INSERT INTO public.planet VALUES (10, 'Dagon', 555530.00, 2008, false, false, 4);
INSERT INTO public.planet VALUES (11, 'Galileo', 14.65, 1996, false, false, 3);
INSERT INTO public.planet VALUES (12, 'Harriot', 262.00, 2007, false, false, 3);
INSERT INTO public.planet VALUES (13, 'Janssen', 0.74, 2004, false, false, 3);
INSERT INTO public.planet VALUES (14, 'Lipperhey', 4825.00, 2002, false, false, 3);
INSERT INTO public.planet VALUES (15, 'Majriti', 1276.46, 1999, false, false, 5);
INSERT INTO public.planet VALUES (16, 'Saffar', 4.62, 1996, false, false, 5);
INSERT INTO public.planet VALUES (17, 'Samh', 241.26, 1999, false, false, 5);
INSERT INTO public.planet VALUES (18, 'Thestias', 589.64, 2006, false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V       ', 4.80, 0.00, 1);
INSERT INTO public.star VALUES (2, 'Alfa Centauri A', 'G2V       ', 4.38, 4.37, 1);
INSERT INTO public.star VALUES (3, '55 Cancri A', 'G8V       ', 5.50, 41.05, 1);
INSERT INTO public.star VALUES (4, 'Fomalhault A', 'A3V       ', 1.72, 25.13, 1);
INSERT INTO public.star VALUES (5, 'Upsilon Andromedae', 'F8V       ', 3.44, 44.00, 1);
INSERT INTO public.star VALUES (6, 'Pollux', 'K0III     ', 1.08, 33.78, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_moon_planet_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


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
-- Name: moon_planet moon_planet_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_moon_name_key UNIQUE (name);


--
-- Name: moon_planet moon_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_pkey PRIMARY KEY (moon_planet_id);


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
