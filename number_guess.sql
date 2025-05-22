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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games_played; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games_played (
    num_of_guesses integer,
    user_id integer NOT NULL,
    guesses integer,
    random_num integer,
    game_id integer NOT NULL
);


ALTER TABLE public.games_played OWNER TO freecodecamp;

--
-- Name: games_played_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_played_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_played_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_played_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_played_game_id_seq OWNED BY public.games_played.game_id;


--
-- Name: guessing_game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guessing_game (
    username character varying(22),
    games_played integer,
    best_game integer,
    user_id integer NOT NULL
);


ALTER TABLE public.guessing_game OWNER TO freecodecamp;

--
-- Name: guessing_game_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guessing_game_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guessing_game_user_id_seq OWNER TO freecodecamp;

--
-- Name: guessing_game_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guessing_game_user_id_seq OWNED BY public.guessing_game.user_id;


--
-- Name: games_played game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_played ALTER COLUMN game_id SET DEFAULT nextval('public.games_played_game_id_seq'::regclass);


--
-- Name: guessing_game user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guessing_game ALTER COLUMN user_id SET DEFAULT nextval('public.guessing_game_user_id_seq'::regclass);


--
-- Data for Name: games_played; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games_played VALUES (NULL, 3, NULL, NULL, 2);
INSERT INTO public.games_played VALUES (NULL, 4, NULL, NULL, 3);
INSERT INTO public.games_played VALUES (NULL, 5, NULL, NULL, 4);
INSERT INTO public.games_played VALUES (NULL, 6, NULL, NULL, 5);
INSERT INTO public.games_played VALUES (NULL, 7, NULL, NULL, 6);
INSERT INTO public.games_played VALUES (NULL, 8, NULL, NULL, 7);


--
-- Data for Name: guessing_game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guessing_game VALUES ('test123', NULL, NULL, 1);
INSERT INTO public.guessing_game VALUES ('test999', NULL, NULL, 2);
INSERT INTO public.guessing_game VALUES ('test888', NULL, NULL, 3);
INSERT INTO public.guessing_game VALUES ('user_1747239247047', NULL, NULL, 4);
INSERT INTO public.guessing_game VALUES ('user_1747239247046', NULL, NULL, 5);
INSERT INTO public.guessing_game VALUES ('test555', NULL, NULL, 6);
INSERT INTO public.guessing_game VALUES ('user_1747240151334', NULL, NULL, 7);
INSERT INTO public.guessing_game VALUES ('user_1747240151333', NULL, NULL, 8);


--
-- Name: games_played_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_played_game_id_seq', 7, true);


--
-- Name: guessing_game_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guessing_game_user_id_seq', 8, true);


--
-- Name: games_played games_played_game_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_played
    ADD CONSTRAINT games_played_game_id_key UNIQUE (game_id);


--
-- Name: guessing_game guessing_game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guessing_game
    ADD CONSTRAINT guessing_game_pkey PRIMARY KEY (user_id);


--
-- Name: games_played games_played_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_played
    ADD CONSTRAINT games_played_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.guessing_game(user_id);


--
-- PostgreSQL database dump complete
--

