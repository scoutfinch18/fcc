--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 1);
INSERT INTO public.games VALUES (2, 1, 10);
INSERT INTO public.games VALUES (3, 2, 43);
INSERT INTO public.games VALUES (4, 2, 43);
INSERT INTO public.games VALUES (5, 3, 43);
INSERT INTO public.games VALUES (6, 3, 43);
INSERT INTO public.games VALUES (7, 2, 45);
INSERT INTO public.games VALUES (8, 2, 44);
INSERT INTO public.games VALUES (9, 2, 43);
INSERT INTO public.games VALUES (10, 1, 2);
INSERT INTO public.games VALUES (11, 1, 9);
INSERT INTO public.games VALUES (12, 4, 563);
INSERT INTO public.games VALUES (13, 4, 989);
INSERT INTO public.games VALUES (14, 5, 521);
INSERT INTO public.games VALUES (15, 5, 897);
INSERT INTO public.games VALUES (16, 4, 665);
INSERT INTO public.games VALUES (17, 4, 364);
INSERT INTO public.games VALUES (18, 4, 497);
INSERT INTO public.games VALUES (19, 1, 12);
INSERT INTO public.games VALUES (20, 6, 486);
INSERT INTO public.games VALUES (21, 6, 538);
INSERT INTO public.games VALUES (22, 7, 285);
INSERT INTO public.games VALUES (23, 7, 639);
INSERT INTO public.games VALUES (24, 6, 436);
INSERT INTO public.games VALUES (25, 6, 644);
INSERT INTO public.games VALUES (26, 6, 854);
INSERT INTO public.games VALUES (27, 8, 359);
INSERT INTO public.games VALUES (28, 8, 942);
INSERT INTO public.games VALUES (29, 9, 137);
INSERT INTO public.games VALUES (30, 9, 391);
INSERT INTO public.games VALUES (31, 8, 174);
INSERT INTO public.games VALUES (32, 8, 605);
INSERT INTO public.games VALUES (33, 8, 638);
INSERT INTO public.games VALUES (34, 10, 503);
INSERT INTO public.games VALUES (35, 10, 852);
INSERT INTO public.games VALUES (36, 11, 595);
INSERT INTO public.games VALUES (37, 11, 546);
INSERT INTO public.games VALUES (38, 10, 863);
INSERT INTO public.games VALUES (39, 10, 698);
INSERT INTO public.games VALUES (40, 10, 419);
INSERT INTO public.games VALUES (41, 12, 284);
INSERT INTO public.games VALUES (42, 12, 54);
INSERT INTO public.games VALUES (43, 13, 276);
INSERT INTO public.games VALUES (44, 13, 810);
INSERT INTO public.games VALUES (45, 12, 156);
INSERT INTO public.games VALUES (46, 12, 584);
INSERT INTO public.games VALUES (47, 12, 706);
INSERT INTO public.games VALUES (48, 14, 797);
INSERT INTO public.games VALUES (49, 14, 807);
INSERT INTO public.games VALUES (50, 15, 55);
INSERT INTO public.games VALUES (51, 15, 303);
INSERT INTO public.games VALUES (52, 14, 455);
INSERT INTO public.games VALUES (53, 14, 799);
INSERT INTO public.games VALUES (54, 14, 47);
INSERT INTO public.games VALUES (55, 16, 96);
INSERT INTO public.games VALUES (56, 16, 652);
INSERT INTO public.games VALUES (57, 17, 336);
INSERT INTO public.games VALUES (58, 17, 84);
INSERT INTO public.games VALUES (59, 16, 598);
INSERT INTO public.games VALUES (60, 16, 107);
INSERT INTO public.games VALUES (61, 16, 551);
INSERT INTO public.games VALUES (62, 1, 9);
INSERT INTO public.games VALUES (63, 1, 10);
INSERT INTO public.games VALUES (64, 18, 9);
INSERT INTO public.games VALUES (65, 18, 511);
INSERT INTO public.games VALUES (66, 19, 100);
INSERT INTO public.games VALUES (67, 19, 380);
INSERT INTO public.games VALUES (68, 18, 148);
INSERT INTO public.games VALUES (69, 18, 202);
INSERT INTO public.games VALUES (70, 18, 620);
INSERT INTO public.games VALUES (71, 21, 927);
INSERT INTO public.games VALUES (72, 21, 234);
INSERT INTO public.games VALUES (73, 22, 943);
INSERT INTO public.games VALUES (74, 22, 579);
INSERT INTO public.games VALUES (75, 21, 706);
INSERT INTO public.games VALUES (76, 21, 5);
INSERT INTO public.games VALUES (77, 21, 536);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Scout');
INSERT INTO public.users VALUES (2, 'user_1772184922444');
INSERT INTO public.users VALUES (3, 'user_1772184922443');
INSERT INTO public.users VALUES (4, 'user_1772186318065');
INSERT INTO public.users VALUES (5, 'user_1772186318064');
INSERT INTO public.users VALUES (6, 'user_1772186460047');
INSERT INTO public.users VALUES (7, 'user_1772186460046');
INSERT INTO public.users VALUES (8, 'user_1772186555639');
INSERT INTO public.users VALUES (9, 'user_1772186555638');
INSERT INTO public.users VALUES (10, 'user_1772186826369');
INSERT INTO public.users VALUES (11, 'user_1772186826368');
INSERT INTO public.users VALUES (12, 'user_1772186854156');
INSERT INTO public.users VALUES (13, 'user_1772186854155');
INSERT INTO public.users VALUES (14, 'user_1772186971149');
INSERT INTO public.users VALUES (15, 'user_1772186971148');
INSERT INTO public.users VALUES (16, 'user_1772187561154');
INSERT INTO public.users VALUES (17, 'user_1772187561153');
INSERT INTO public.users VALUES (18, 'user_1772187889905');
INSERT INTO public.users VALUES (19, 'user_1772187889904');
INSERT INTO public.users VALUES (20, 'Qwerty');
INSERT INTO public.users VALUES (21, 'user_1772188114051');
INSERT INTO public.users VALUES (22, 'user_1772188114050');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 77, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

