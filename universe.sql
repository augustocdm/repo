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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(64) NOT NULL,
    notes text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_id_constellation_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_id_constellation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_id_constellation_seq OWNER TO freecodecamp;

--
-- Name: constellation_id_constellation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_id_constellation_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    shape character varying(32),
    distance_from_milky_way_in_thousand_light_years integer,
    constellation_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(64) NOT NULL,
    diameter_in_km integer,
    age_in_million_years integer,
    orbital_period_in_days numeric(8,2),
    orbital_distance_max_in_km integer,
    orbital_distance_min_in_km integer,
    axial_tilt numeric(4,1),
    has_atmosphere boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(64) NOT NULL,
    diameter_in_km integer,
    age_in_million_years integer,
    orbital_period_in_days numeric(8,2),
    obtibal_distance_max_in_km integer,
    orbital_distance_min_in_km integer,
    axial_tilt numeric(4,1),
    star_id integer,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(64) NOT NULL,
    bd_designation character varying(32),
    diameter_in_km integer,
    age_in_million_years integer,
    primary_element character varying(32),
    galaxy_id integer,
    constellation_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_star_seq OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_star_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_id_constellation_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_star_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', NULL);
INSERT INTO public.constellation VALUES (2, 'Taurus', NULL);
INSERT INTO public.constellation VALUES (3, 'Aries', NULL);
INSERT INTO public.constellation VALUES (4, 'Pegasus', NULL);
INSERT INTO public.constellation VALUES (5, 'Andromeda', NULL);
INSERT INTO public.constellation VALUES (6, 'Ursa Major', NULL);
INSERT INTO public.constellation VALUES (7, 'Serpens', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Disk-shaped', 0, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Disk-shaped', 2500, 5);
INSERT INTO public.galaxy VALUES (3, 'Bode''s Galaxy', 'Disk-shaped', 12000, 6);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'Cigar-shaped', 11500, 6);
INSERT INTO public.galaxy VALUES (5, 'Medusa Merger', 'Medusa''s snake hair', 130000, 6);
INSERT INTO public.galaxy VALUES (6, 'Hoag''s Object', 'Polar-ring galaxy', 600000, 7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3500, 4510, NULL, NULL, NULL, NULL, false, 1);
INSERT INTO public.moon VALUES (2, 'Metis', 43, NULL, 0.29, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (3, 'Adrastea', 16, NULL, 0.30, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (4, 'Amalthea', 167, NULL, 0.50, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Thebe', 99, NULL, 0.68, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Io', 3643, NULL, 1.76, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 3122, NULL, 3.53, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Ganymede', 5268, NULL, 7.16, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Callisto', 4821, NULL, 16.69, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Themisto', 9, NULL, 130.00, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (12, 'Deimos', 12, NULL, 1.26, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (13, 'Mimas', 396, NULL, 0.94, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Enceladus', 504, NULL, 1.37, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 1066, NULL, 1.89, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Dione', 1123, NULL, 2.74, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (17, 'Rhea', 1528, NULL, 4.52, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (18, 'Titan', 5149, NULL, 15.95, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (19, 'Ariel', 1158, NULL, 2.52, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 2707, NULL, 5.88, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (21, 'Umbriel', 1169, NULL, 4.14, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Phobos', 23, NULL, 0.32, NULL, NULL, NULL, NULL, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, 4540, 365.26, NULL, NULL, 23.4, 1, true);
INSERT INTO public.planet VALUES (2, 'Mercury', 4880, 4600, 87.97, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 12102, 4503, 583.92, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 4603, 686.98, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139822, 4603, 4332.59, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 116464, 4503, 10759.22, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 4503, 30688.50, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, 4503, 60195.00, NULL, NULL, NULL, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Dimidium', 271670, NULL, 4.23, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.planet VALUES (10, 'HR 8799 e', 167291, NULL, 17885.00, NULL, NULL, 25.0, 8, NULL);
INSERT INTO public.planet VALUES (11, 'HR 8799 d', 171580, NULL, 36500.00, NULL, NULL, 28.0, 8, NULL);
INSERT INTO public.planet VALUES (12, 'HR 8799 c', 185879, NULL, 68985.00, NULL, NULL, 28.0, 8, NULL);
INSERT INTO public.planet VALUES (13, 'HR 8799 b', 171580, NULL, 173010.00, NULL, NULL, 28.0, 8, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1392684, 4600, 'Hydrogen', 1, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', '+7º1055', 1234000000, NULL, NULL, 1, 1);
INSERT INTO public.star VALUES (3, 'Rigel', '-08º1063', 109781500, 8, NULL, 1, 1);
INSERT INTO public.star VALUES (4, 'Bellatrix', '+06º919', 8004000, 25, NULL, 1, 1);
INSERT INTO public.star VALUES (5, 'Aldebaran', '+16º629', 61402000, 6605, NULL, 1, 2);
INSERT INTO public.star VALUES (6, 'Alcyone', '+23º541', 11409000, 100, NULL, 1, 2);
INSERT INTO public.star VALUES (7, '51 Pegasi', '+19º5036', 1721200, 7500, NULL, 1, 4);
INSERT INTO public.star VALUES (8, 'HR 8799', '+20º5278', 1864479, 30, NULL, 1, 4);


--
-- Name: constellation_id_constellation_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_id_constellation_seq', 7, true);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 6, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 21, true);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 13, true);


--
-- Name: star_id_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_star_seq', 8, true);


--
-- Name: constellation constellation_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

