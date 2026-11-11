--
-- PostgreSQL database dump
--

\restrict P7ning97YSfE2ohOTukRYdoeF4eSiHye2ryQava0SoLP5qVPLjplw9AbbLyx5Af

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

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
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artists_id_seq OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: playlist_songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist_songs (
    playlist_id integer NOT NULL,
    song_id integer NOT NULL,
    "position" integer NOT NULL,
    CONSTRAINT playlist_songs_position_check CHECK (("position" > 0))
);


ALTER TABLE public.playlist_songs OWNER TO postgres;

--
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.playlists_id_seq OWNER TO postgres;

--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    title text NOT NULL,
    artist_id integer NOT NULL,
    duration_seconds integer NOT NULL,
    CONSTRAINT songs_duration_seconds_check CHECK ((duration_seconds > 0))
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.songs_id_seq OWNER TO postgres;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artists (id, name) FROM stdin;
1	Queen
2	Daft Punk
3	Adele
4	Imagine Dragons
5	Nirvana
\.


--
-- Data for Name: playlist_songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlist_songs (playlist_id, song_id, "position") FROM stdin;
1	2	1
1	4	2
1	1	3
1	6	4
1	9	5
2	8	1
2	2	2
2	5	3
2	9	4
3	7	1
3	3	2
3	1	3
3	6	4
\.


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlists (id, name) FROM stdin;
1	Road Trip
2	Workout
3	Late Night
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (id, title, artist_id, duration_seconds) FROM stdin;
1	Bohemian Rhapsody	1	355
2	Don't Stop Me Now	1	209
3	Under Pressure	1	248
4	One More Time	2	320
5	Get Lucky	2	369
6	Rolling in the Deep	3	228
7	Someone Like You	3	285
8	Believer	4	204
9	Smells Like Teen Spirit	5	301
\.


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_id_seq', 5, true);


--
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlists_id_seq', 3, true);


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_id_seq', 9, true);


--
-- Name: artists artists_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_name_key UNIQUE (name);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: playlist_songs playlist_songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_pkey PRIMARY KEY (playlist_id, song_id);


--
-- Name: playlist_songs playlist_songs_playlist_id_position_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_playlist_id_position_key UNIQUE (playlist_id, "position");


--
-- Name: playlists playlists_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_name_key UNIQUE (name);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: playlist_songs playlist_songs_playlist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_playlist_id_fkey FOREIGN KEY (playlist_id) REFERENCES public.playlists(id) ON DELETE CASCADE;


--
-- Name: playlist_songs playlist_songs_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(id);


--
-- Name: songs songs_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(id);


--
-- PostgreSQL database dump complete
--

\unrestrict P7ning97YSfE2ohOTukRYdoeF4eSiHye2ryQava0SoLP5qVPLjplw9AbbLyx5Af

