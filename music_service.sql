--
-- PostgreSQL database cluster dump
--

-- Started on 2023-06-22 18:15:04

SET default_transaction_read_only = off;

SET client_encoding = 'WIN1251';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-22 18:15:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1251';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2023-06-22 18:15:04

--
-- PostgreSQL database dump complete
--

--
-- Database "music_service" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-22 18:15:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1251';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3397 (class 1262 OID 16862)
-- Name: music_service; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE music_service WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE music_service OWNER TO postgres;

\connect music_service

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1251';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16894)
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    year date NOT NULL
);


ALTER TABLE public.album OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16893)
-- Name: album_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.album_id_seq OWNER TO postgres;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 219
-- Name: album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.album_id_seq OWNED BY public.album.id;


--
-- TOC entry 217 (class 1259 OID 16872)
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16906)
-- Name: artists_album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists_album (
    artists_id integer NOT NULL,
    album_id integer NOT NULL
);


ALTER TABLE public.artists_album OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16871)
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO postgres;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 216
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- TOC entry 225 (class 1259 OID 16936)
-- Name: collaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collaction (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    year date NOT NULL
);


ALTER TABLE public.collaction OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16935)
-- Name: collaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collaction_id_seq OWNER TO postgres;

--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 224
-- Name: collaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collaction_id_seq OWNED BY public.collaction.id;


--
-- TOC entry 215 (class 1259 OID 16864)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16878)
-- Name: genre_artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre_artists (
    genre_id integer NOT NULL,
    artists_id integer NOT NULL
);


ALTER TABLE public.genre_artists OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16863)
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_seq OWNER TO postgres;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 214
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_id_seq OWNED BY public.genre.id;


--
-- TOC entry 223 (class 1259 OID 16922)
-- Name: tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracks (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    duration time without time zone NOT NULL,
    album_id integer
);


ALTER TABLE public.tracks OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16944)
-- Name: tracks_collaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracks_collaction (
    tracks_id integer NOT NULL,
    collaction_id integer NOT NULL
);


ALTER TABLE public.tracks_collaction OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16921)
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracks_id_seq OWNER TO postgres;

--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 222
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracks_id_seq OWNED BY public.tracks.id;


--
-- TOC entry 3207 (class 2604 OID 16897)
-- Name: album id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album ALTER COLUMN id SET DEFAULT nextval('public.album_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 16875)
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 16939)
-- Name: collaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collaction ALTER COLUMN id SET DEFAULT nextval('public.collaction_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 16867)
-- Name: genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN id SET DEFAULT nextval('public.genre_id_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 16925)
-- Name: tracks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks ALTER COLUMN id SET DEFAULT nextval('public.tracks_id_seq'::regclass);


--
-- TOC entry 3385 (class 0 OID 16894)
-- Dependencies: 220
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album (id, name, year) FROM stdin;
\.


--
-- TOC entry 3382 (class 0 OID 16872)
-- Dependencies: 217
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (id, name) FROM stdin;
\.


--
-- TOC entry 3386 (class 0 OID 16906)
-- Dependencies: 221
-- Data for Name: artists_album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists_album (artists_id, album_id) FROM stdin;
\.


--
-- TOC entry 3390 (class 0 OID 16936)
-- Dependencies: 225
-- Data for Name: collaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collaction (id, name, year) FROM stdin;
\.


--
-- TOC entry 3380 (class 0 OID 16864)
-- Dependencies: 215
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (id, name) FROM stdin;
\.


--
-- TOC entry 3383 (class 0 OID 16878)
-- Dependencies: 218
-- Data for Name: genre_artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre_artists (genre_id, artists_id) FROM stdin;
\.


--
-- TOC entry 3388 (class 0 OID 16922)
-- Dependencies: 223
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracks (id, name, duration, album_id) FROM stdin;
\.


--
-- TOC entry 3391 (class 0 OID 16944)
-- Dependencies: 226
-- Data for Name: tracks_collaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracks_collaction (tracks_id, collaction_id) FROM stdin;
\.


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 219
-- Name: album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.album_id_seq', 1, false);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 216
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_id_seq', 1, false);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 224
-- Name: collaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collaction_id_seq', 1, false);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 214
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_id_seq', 1, false);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 222
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracks_id_seq', 1, false);


--
-- TOC entry 3217 (class 2606 OID 16899)
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 16877)
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 16943)
-- Name: collaction collaction_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collaction
    ADD CONSTRAINT collaction_name_key UNIQUE (name);


--
-- TOC entry 3227 (class 2606 OID 16941)
-- Name: collaction collaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collaction
    ADD CONSTRAINT collaction_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 16948)
-- Name: tracks_collaction dk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks_collaction
    ADD CONSTRAINT dk PRIMARY KEY (tracks_id, collaction_id);


--
-- TOC entry 3211 (class 2606 OID 16869)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 16910)
-- Name: artists_album lk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_album
    ADD CONSTRAINT lk PRIMARY KEY (artists_id, album_id);


--
-- TOC entry 3215 (class 2606 OID 16882)
-- Name: genre_artists pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_artists
    ADD CONSTRAINT pk PRIMARY KEY (genre_id, artists_id);


--
-- TOC entry 3221 (class 2606 OID 16929)
-- Name: tracks tracks_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_name_key UNIQUE (name);


--
-- TOC entry 3223 (class 2606 OID 16927)
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 16916)
-- Name: artists_album artists_album_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_album
    ADD CONSTRAINT artists_album_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(id);


--
-- TOC entry 3233 (class 2606 OID 16911)
-- Name: artists_album artists_album_artists_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists_album
    ADD CONSTRAINT artists_album_artists_id_fkey FOREIGN KEY (artists_id) REFERENCES public.artists(id);


--
-- TOC entry 3230 (class 2606 OID 16888)
-- Name: genre_artists genre_artists_artists_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_artists
    ADD CONSTRAINT genre_artists_artists_id_fkey FOREIGN KEY (artists_id) REFERENCES public.artists(id);


--
-- TOC entry 3231 (class 2606 OID 16883)
-- Name: genre_artists genre_artists_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_artists
    ADD CONSTRAINT genre_artists_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(id);


--
-- TOC entry 3234 (class 2606 OID 16930)
-- Name: tracks tracks_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.album(id);


--
-- TOC entry 3235 (class 2606 OID 16954)
-- Name: tracks_collaction tracks_collaction_collaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks_collaction
    ADD CONSTRAINT tracks_collaction_collaction_id_fkey FOREIGN KEY (collaction_id) REFERENCES public.collaction(id);


--
-- TOC entry 3236 (class 2606 OID 16949)
-- Name: tracks_collaction tracks_collaction_tracks_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks_collaction
    ADD CONSTRAINT tracks_collaction_tracks_id_fkey FOREIGN KEY (tracks_id) REFERENCES public.tracks(id);


-- Completed on 2023-06-22 18:15:05

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-22 18:15:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1251';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16833)
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16832)
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO postgres;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 217
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- TOC entry 216 (class 1259 OID 16824)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16849)
-- Name: genre_artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre_artists (
    genre_id integer,
    artists_id integer
);


ALTER TABLE public.genre_artists OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16823)
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_seq OWNER TO postgres;

--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 215
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_id_seq OWNED BY public.genre.id;


--
-- TOC entry 3184 (class 2604 OID 16836)
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 16827)
-- Name: genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN id SET DEFAULT nextval('public.genre_id_seq'::regclass);


--
-- TOC entry 3340 (class 0 OID 16833)
-- Dependencies: 218
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (id, name) FROM stdin;
\.


--
-- TOC entry 3338 (class 0 OID 16824)
-- Dependencies: 216
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (id, name) FROM stdin;
\.


--
-- TOC entry 3341 (class 0 OID 16849)
-- Dependencies: 219
-- Data for Name: genre_artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre_artists (genre_id, artists_id) FROM stdin;
\.


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 217
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_id_seq', 1, false);


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 215
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_id_seq', 1, false);


--
-- TOC entry 3190 (class 2606 OID 16840)
-- Name: artists artists_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_name_key UNIQUE (name);


--
-- TOC entry 3192 (class 2606 OID 16838)
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- TOC entry 3186 (class 2606 OID 16831)
-- Name: genre genre_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_name_key UNIQUE (name);


--
-- TOC entry 3188 (class 2606 OID 16829)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 16857)
-- Name: genre_artists genre_artists_artists_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_artists
    ADD CONSTRAINT genre_artists_artists_id_fkey FOREIGN KEY (artists_id) REFERENCES public.artists(id);


--
-- TOC entry 3194 (class 2606 OID 16852)
-- Name: genre_artists genre_artists_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_artists
    ADD CONSTRAINT genre_artists_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(id);


-- Completed on 2023-06-22 18:15:05

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-06-22 18:15:05

--
-- PostgreSQL database cluster dump complete
--

