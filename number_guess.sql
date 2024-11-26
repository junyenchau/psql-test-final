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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    userid integer NOT NULL,
    gameid integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_gameid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_gameid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_gameid_seq OWNER TO freecodecamp;

--
-- Name: games_gameid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_gameid_seq OWNED BY public.games.gameid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(30) NOT NULL,
    userid integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO freecodecamp;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: games gameid; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN gameid SET DEFAULT nextval('public.games_gameid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (23, 1, 12);
INSERT INTO public.games VALUES (23, 2, 10);
INSERT INTO public.games VALUES (24, 3, 324);
INSERT INTO public.games VALUES (24, 4, 342);
INSERT INTO public.games VALUES (25, 5, 499);
INSERT INTO public.games VALUES (25, 6, 849);
INSERT INTO public.games VALUES (24, 7, 982);
INSERT INTO public.games VALUES (24, 8, 323);
INSERT INTO public.games VALUES (24, 9, 297);
INSERT INTO public.games VALUES (26, 10, 20);
INSERT INTO public.games VALUES (26, 11, 470);
INSERT INTO public.games VALUES (27, 12, 557);
INSERT INTO public.games VALUES (27, 13, 518);
INSERT INTO public.games VALUES (26, 14, 461);
INSERT INTO public.games VALUES (26, 15, 257);
INSERT INTO public.games VALUES (26, 16, 222);
INSERT INTO public.games VALUES (28, 17, 503);
INSERT INTO public.games VALUES (28, 18, 287);
INSERT INTO public.games VALUES (29, 19, 968);
INSERT INTO public.games VALUES (29, 20, 628);
INSERT INTO public.games VALUES (28, 21, 979);
INSERT INTO public.games VALUES (28, 22, 897);
INSERT INTO public.games VALUES (28, 23, 930);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('yello', 23);
INSERT INTO public.users VALUES ('user_1732616473351', 24);
INSERT INTO public.users VALUES ('user_1732616473349', 25);
INSERT INTO public.users VALUES ('user_1732616530755', 26);
INSERT INTO public.users VALUES ('user_1732616530754', 27);
INSERT INTO public.users VALUES ('user_1732616555774', 28);
INSERT INTO public.users VALUES ('user_1732616555773', 29);


--
-- Name: games_gameid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_gameid_seq', 23, true);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_userid_seq', 29, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (gameid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: games games_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- PostgreSQL database dump complete
--

