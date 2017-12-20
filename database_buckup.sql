--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO "Guest";

--
-- Name: attraction_tags; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE attraction_tags (
    id bigint NOT NULL,
    attraction_id integer,
    tag_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE attraction_tags OWNER TO "Guest";

--
-- Name: attraction_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE attraction_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attraction_tags_id_seq OWNER TO "Guest";

--
-- Name: attraction_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE attraction_tags_id_seq OWNED BY attraction_tags.id;


--
-- Name: attractions; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE attractions (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    season character varying[] DEFAULT '{}'::character varying[],
    price numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE attractions OWNER TO "Guest";

--
-- Name: attractions_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE attractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attractions_id_seq OWNER TO "Guest";

--
-- Name: attractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE attractions_id_seq OWNED BY attractions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Guest";

--
-- Name: tags; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE tags (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE tags OWNER TO "Guest";

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO "Guest";

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: attraction_tags id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY attraction_tags ALTER COLUMN id SET DEFAULT nextval('attraction_tags_id_seq'::regclass);


--
-- Name: attractions id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY attractions ALTER COLUMN id SET DEFAULT nextval('attractions_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2017-12-20 18:25:34.209615	2017-12-20 18:25:34.209615
\.


--
-- Data for Name: attraction_tags; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY attraction_tags (id, attraction_id, tag_id, created_at, updated_at) FROM stdin;
1	1	1	2017-12-20 18:29:21.813821	2017-12-20 18:29:21.813821
2	1	3	2017-12-20 18:29:21.815029	2017-12-20 18:29:21.815029
3	1	4	2017-12-20 18:29:21.81589	2017-12-20 18:29:21.81589
4	1	10	2017-12-20 18:29:21.816906	2017-12-20 18:29:21.816906
5	1	16	2017-12-20 18:29:21.817805	2017-12-20 18:29:21.817805
6	2	1	2017-12-20 18:30:10.741853	2017-12-20 18:30:10.741853
7	2	3	2017-12-20 18:30:10.742514	2017-12-20 18:30:10.742514
8	2	4	2017-12-20 18:30:10.743172	2017-12-20 18:30:10.743172
9	2	6	2017-12-20 18:30:10.74376	2017-12-20 18:30:10.74376
10	2	14	2017-12-20 18:30:10.744375	2017-12-20 18:30:10.744375
11	2	15	2017-12-20 18:30:10.744958	2017-12-20 18:30:10.744958
12	3	2	2017-12-20 19:18:57.945044	2017-12-20 19:18:57.945044
13	3	3	2017-12-20 19:18:57.945959	2017-12-20 19:18:57.945959
14	3	4	2017-12-20 19:18:57.946704	2017-12-20 19:18:57.946704
15	3	5	2017-12-20 19:18:57.947416	2017-12-20 19:18:57.947416
16	3	7	2017-12-20 19:18:57.94812	2017-12-20 19:18:57.94812
17	3	15	2017-12-20 19:18:57.949016	2017-12-20 19:18:57.949016
18	4	1	2017-12-20 19:22:35.455312	2017-12-20 19:22:35.455312
19	4	5	2017-12-20 19:22:35.455978	2017-12-20 19:22:35.455978
20	4	6	2017-12-20 19:22:35.456556	2017-12-20 19:22:35.456556
21	4	8	2017-12-20 19:22:35.457131	2017-12-20 19:22:35.457131
22	4	10	2017-12-20 19:22:35.457708	2017-12-20 19:22:35.457708
23	4	16	2017-12-20 19:22:35.458278	2017-12-20 19:22:35.458278
24	5	1	2017-12-20 19:23:49.060003	2017-12-20 19:23:49.060003
25	5	5	2017-12-20 19:23:49.061213	2017-12-20 19:23:49.061213
26	5	6	2017-12-20 19:23:49.062083	2017-12-20 19:23:49.062083
27	5	8	2017-12-20 19:23:49.062779	2017-12-20 19:23:49.062779
28	5	9	2017-12-20 19:23:49.063523	2017-12-20 19:23:49.063523
29	6	1	2017-12-20 19:24:48.96834	2017-12-20 19:24:48.96834
30	6	6	2017-12-20 19:24:48.969157	2017-12-20 19:24:48.969157
31	6	8	2017-12-20 19:24:48.969803	2017-12-20 19:24:48.969803
32	7	1	2017-12-20 19:26:55.445818	2017-12-20 19:26:55.445818
33	7	5	2017-12-20 19:26:55.446544	2017-12-20 19:26:55.446544
34	7	6	2017-12-20 19:26:55.447186	2017-12-20 19:26:55.447186
35	7	9	2017-12-20 19:26:55.447841	2017-12-20 19:26:55.447841
36	7	10	2017-12-20 19:26:55.448487	2017-12-20 19:26:55.448487
37	7	13	2017-12-20 19:26:55.449143	2017-12-20 19:26:55.449143
38	7	16	2017-12-20 19:26:55.449762	2017-12-20 19:26:55.449762
39	7	8	2017-12-20 19:26:55.450409	2017-12-20 19:26:55.450409
40	8	1	2017-12-20 19:27:40.991403	2017-12-20 19:27:40.991403
41	8	6	2017-12-20 19:27:40.992123	2017-12-20 19:27:40.992123
42	8	9	2017-12-20 19:27:40.992759	2017-12-20 19:27:40.992759
43	8	11	2017-12-20 19:27:40.993364	2017-12-20 19:27:40.993364
44	8	12	2017-12-20 19:27:40.993987	2017-12-20 19:27:40.993987
45	8	13	2017-12-20 19:27:40.994786	2017-12-20 19:27:40.994786
46	8	16	2017-12-20 19:27:40.995503	2017-12-20 19:27:40.995503
47	8	8	2017-12-20 19:27:40.996316	2017-12-20 19:27:40.996316
48	9	1	2017-12-20 19:29:15.37231	2017-12-20 19:29:15.37231
49	10	1	2017-12-20 19:30:15.845428	2017-12-20 19:30:15.845428
50	10	16	2017-12-20 19:30:15.846184	2017-12-20 19:30:15.846184
51	11	1	2017-12-20 19:31:26.178185	2017-12-20 19:31:26.178185
52	11	3	2017-12-20 19:31:26.178872	2017-12-20 19:31:26.178872
53	11	4	2017-12-20 19:31:26.179473	2017-12-20 19:31:26.179473
54	11	6	2017-12-20 19:31:26.180075	2017-12-20 19:31:26.180075
55	11	15	2017-12-20 19:31:26.18073	2017-12-20 19:31:26.18073
56	11	8	2017-12-20 19:31:26.181329	2017-12-20 19:31:26.181329
\.


--
-- Name: attraction_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('attraction_tags_id_seq', 56, true);


--
-- Data for Name: attractions; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY attractions (id, name, description, season, price, created_at, updated_at) FROM stdin;
1	Space Needle	platform to watch amazing city panorama	{winter,spring,summer,fall}	35.0	2017-12-20 18:29:21.81227	2017-12-20 18:29:21.81227
2	Pike Place Market	town market in downtown	{winter,spring,summer,fall}	0.0	2017-12-20 18:30:10.740499	2017-12-20 18:30:10.740499
3	Marijuana Festival	weed fest	{fall}	25.0	2017-12-20 19:18:57.943735	2017-12-20 19:18:57.943735
4	Kerry Park	park with scenic view	{winter,spring,summer,fall}	0.0	2017-12-20 19:22:35.45438	2017-12-20 19:22:35.45438
5	Ballard Locks	locks with salmon ladder	{winter,spring,summer,fall}	0.0	2017-12-20 19:23:49.058904	2017-12-20 19:23:49.058904
6	Fremont Troll	troll statue under the I-5 bridge	{winter,spring,summer,fall}	0.0	2017-12-20 19:24:48.967327	2017-12-20 19:24:48.967327
7	Gas Works Park	park next to Union Lake with a view to downtown	{winter,spring,summer,fall}	0.0	2017-12-20 19:26:55.44483	2017-12-20 19:26:55.44483
8	Golden Garden Park	park with a beach	{winter,spring,summer,fall}	0.0	2017-12-20 19:27:40.990495	2017-12-20 19:27:40.990495
9	Seattle Aquarium	aquarium with pacific north west environment 	{winter,spring,summer,fall}	25.0	2017-12-20 19:29:15.371366	2017-12-20 19:29:15.371366
10	Whale Watching	trip to San Juan island to watch whales	{spring,summer,fall}	100.0	2017-12-20 19:30:15.844361	2017-12-20 19:30:15.844361
11	Ballard Sunday Market	street market with local products	{winter,spring,summer,fall}	0.0	2017-12-20 19:31:26.177293	2017-12-20 19:31:42.028575
\.


--
-- Name: attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('attractions_id_seq', 11, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY schema_migrations (version) FROM stdin;
20171218173746
20171218174233
20171218174558
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY tags (id, name, created_at, updated_at) FROM stdin;
1	with kids	2017-12-20 18:25:59.068984	2017-12-20 18:25:59.068984
2	for adults only	2017-12-20 18:26:06.903456	2017-12-20 18:26:06.903456
3	food	2017-12-20 18:26:10.147224	2017-12-20 18:26:10.147224
4	drink	2017-12-20 18:26:13.03124	2017-12-20 18:26:13.03124
5	park	2017-12-20 18:26:18.59158	2017-12-20 18:26:18.59158
6	for free	2017-12-20 18:26:25.183251	2017-12-20 18:26:25.183251
7	marijuana	2017-12-20 18:26:34.619499	2017-12-20 18:26:34.619499
9	picnic	2017-12-20 18:26:57.007296	2017-12-20 18:26:57.007296
10	fireworks	2017-12-20 18:27:09.140911	2017-12-20 18:27:09.140911
11	fireplace	2017-12-20 18:27:15.99112	2017-12-20 18:27:15.99112
12	swimming	2017-12-20 18:27:22.470635	2017-12-20 18:27:22.470635
13	sports	2017-12-20 18:27:27.611831	2017-12-20 18:27:27.611831
14	cheap	2017-12-20 18:27:36.866715	2017-12-20 18:27:36.866715
16	scenic view	2017-12-20 18:28:01.043117	2017-12-20 18:28:01.043117
15	shopping	2017-12-20 18:27:47.442279	2017-12-20 18:30:25.010503
8	pets welcome	2017-12-20 18:26:50.532255	2017-12-20 19:25:06.259711
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('tags_id_seq', 16, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attraction_tags attraction_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY attraction_tags
    ADD CONSTRAINT attraction_tags_pkey PRIMARY KEY (id);


--
-- Name: attractions attractions_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY attractions
    ADD CONSTRAINT attractions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

