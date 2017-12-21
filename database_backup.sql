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
environment	default_env	2017-12-21 00:37:42.007876	2017-12-21 00:37:42.007876
\.


--
-- Data for Name: attraction_tags; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY attraction_tags (id, attraction_id, tag_id, created_at, updated_at) FROM stdin;
1	1	1	2017-12-21 16:21:35.122485	2017-12-21 16:21:35.122485
2	1	3	2017-12-21 16:21:35.124383	2017-12-21 16:21:35.124383
3	1	4	2017-12-21 16:21:35.125116	2017-12-21 16:21:35.125116
4	1	6	2017-12-21 16:21:35.125836	2017-12-21 16:21:35.125836
5	1	14	2017-12-21 16:21:35.12652	2017-12-21 16:21:35.12652
6	1	17	2017-12-21 16:21:35.127194	2017-12-21 16:21:35.127194
7	1	18	2017-12-21 16:21:35.127856	2017-12-21 16:21:35.127856
8	1	19	2017-12-21 16:21:35.12866	2017-12-21 16:21:35.12866
9	1	20	2017-12-21 16:21:35.129345	2017-12-21 16:21:35.129345
10	2	1	2017-12-21 16:22:41.258946	2017-12-21 16:22:41.258946
11	2	5	2017-12-21 16:22:41.259665	2017-12-21 16:22:41.259665
12	2	6	2017-12-21 16:22:41.26028	2017-12-21 16:22:41.26028
13	2	9	2017-12-21 16:22:41.260882	2017-12-21 16:22:41.260882
14	2	13	2017-12-21 16:22:41.261489	2017-12-21 16:22:41.261489
15	2	15	2017-12-21 16:22:41.262092	2017-12-21 16:22:41.262092
16	3	1	2017-12-21 16:23:36.684258	2017-12-21 16:23:36.684258
17	3	5	2017-12-21 16:23:36.685184	2017-12-21 16:23:36.685184
18	3	6	2017-12-21 16:23:36.685941	2017-12-21 16:23:36.685941
19	3	8	2017-12-21 16:23:36.687001	2017-12-21 16:23:36.687001
20	3	15	2017-12-21 16:23:36.687804	2017-12-21 16:23:36.687804
21	3	18	2017-12-21 16:23:36.688465	2017-12-21 16:23:36.688465
22	3	20	2017-12-21 16:23:36.689077	2017-12-21 16:23:36.689077
23	4	1	2017-12-21 16:24:28.886436	2017-12-21 16:24:28.886436
24	4	6	2017-12-21 16:24:28.887185	2017-12-21 16:24:28.887185
25	4	17	2017-12-21 16:24:28.887816	2017-12-21 16:24:28.887816
26	5	1	2017-12-21 16:25:24.012753	2017-12-21 16:25:24.012753
27	5	5	2017-12-21 16:25:24.01343	2017-12-21 16:25:24.01343
28	5	6	2017-12-21 16:25:24.014045	2017-12-21 16:25:24.014045
29	5	8	2017-12-21 16:25:24.014641	2017-12-21 16:25:24.014641
30	5	9	2017-12-21 16:25:24.015432	2017-12-21 16:25:24.015432
31	5	12	2017-12-21 16:25:24.016104	2017-12-21 16:25:24.016104
32	5	13	2017-12-21 16:25:24.016711	2017-12-21 16:25:24.016711
33	5	15	2017-12-21 16:25:24.017306	2017-12-21 16:25:24.017306
34	5	20	2017-12-21 16:25:24.01792	2017-12-21 16:25:24.01792
35	6	1	2017-12-21 16:26:22.812156	2017-12-21 16:26:22.812156
36	6	5	2017-12-21 16:26:22.812827	2017-12-21 16:26:22.812827
37	6	6	2017-12-21 16:26:22.813451	2017-12-21 16:26:22.813451
38	6	8	2017-12-21 16:26:22.814053	2017-12-21 16:26:22.814053
39	6	10	2017-12-21 16:26:22.814732	2017-12-21 16:26:22.814732
40	6	11	2017-12-21 16:26:22.815411	2017-12-21 16:26:22.815411
41	6	12	2017-12-21 16:26:22.816064	2017-12-21 16:26:22.816064
42	6	13	2017-12-21 16:26:22.816668	2017-12-21 16:26:22.816668
43	6	15	2017-12-21 16:26:22.817233	2017-12-21 16:26:22.817233
44	7	1	2017-12-21 16:27:20.492029	2017-12-21 16:27:20.492029
45	7	16	2017-12-21 16:27:20.492744	2017-12-21 16:27:20.492744
46	8	1	2017-12-21 16:28:08.197548	2017-12-21 16:28:08.197548
47	8	13	2017-12-21 16:28:08.198236	2017-12-21 16:28:08.198236
48	8	21	2017-12-21 16:28:08.198853	2017-12-21 16:28:08.198853
49	9	1	2017-12-21 16:29:41.743975	2017-12-21 16:29:41.743975
50	9	3	2017-12-21 16:29:41.744657	2017-12-21 16:29:41.744657
51	9	4	2017-12-21 16:29:41.745272	2017-12-21 16:29:41.745272
52	9	6	2017-12-21 16:29:41.745882	2017-12-21 16:29:41.745882
53	9	14	2017-12-21 16:29:41.746475	2017-12-21 16:29:41.746475
54	9	15	2017-12-21 16:29:41.747079	2017-12-21 16:29:41.747079
55	9	17	2017-12-21 16:29:41.74767	2017-12-21 16:29:41.74767
56	10	2	2017-12-21 16:30:44.688534	2017-12-21 16:30:44.688534
57	10	3	2017-12-21 16:30:44.689218	2017-12-21 16:30:44.689218
58	10	4	2017-12-21 16:30:44.689801	2017-12-21 16:30:44.689801
59	10	5	2017-12-21 16:30:44.690389	2017-12-21 16:30:44.690389
60	10	7	2017-12-21 16:30:44.690962	2017-12-21 16:30:44.690962
61	10	14	2017-12-21 16:30:44.691582	2017-12-21 16:30:44.691582
62	11	1	2017-12-21 16:31:34.993977	2017-12-21 16:31:34.993977
63	11	13	2017-12-21 16:31:34.994853	2017-12-21 16:31:34.994853
64	12	1	2017-12-21 16:32:36.924688	2017-12-21 16:32:36.924688
65	12	16	2017-12-21 16:32:36.925365	2017-12-21 16:32:36.925365
66	12	17	2017-12-21 16:32:36.925966	2017-12-21 16:32:36.925966
67	12	20	2017-12-21 16:32:36.926555	2017-12-21 16:32:36.926555
68	13	1	2017-12-21 16:33:56.052109	2017-12-21 16:33:56.052109
69	13	3	2017-12-21 16:33:56.052769	2017-12-21 16:33:56.052769
70	13	4	2017-12-21 16:33:56.053343	2017-12-21 16:33:56.053343
71	13	13	2017-12-21 16:33:56.053983	2017-12-21 16:33:56.053983
72	14	1	2017-12-21 16:35:06.042539	2017-12-21 16:35:06.042539
73	14	19	2017-12-21 16:35:06.043207	2017-12-21 16:35:06.043207
74	14	20	2017-12-21 16:35:06.043793	2017-12-21 16:35:06.043793
75	14	21	2017-12-21 16:35:06.044372	2017-12-21 16:35:06.044372
76	15	1	2017-12-21 16:36:00.922222	2017-12-21 16:36:00.922222
77	15	16	2017-12-21 16:36:00.922984	2017-12-21 16:36:00.922984
78	15	20	2017-12-21 16:36:00.923641	2017-12-21 16:36:00.923641
79	16	1	2017-12-21 16:36:46.545927	2017-12-21 16:36:46.545927
80	16	14	2017-12-21 16:36:46.546698	2017-12-21 16:36:46.546698
81	16	16	2017-12-21 16:36:46.547357	2017-12-21 16:36:46.547357
82	16	17	2017-12-21 16:36:46.547998	2017-12-21 16:36:46.547998
83	17	1	2017-12-21 16:37:47.394026	2017-12-21 16:37:47.394026
84	17	3	2017-12-21 16:37:47.395044	2017-12-21 16:37:47.395044
85	17	4	2017-12-21 16:37:47.39601	2017-12-21 16:37:47.39601
86	17	6	2017-12-21 16:37:47.396639	2017-12-21 16:37:47.396639
87	17	14	2017-12-21 16:37:47.397598	2017-12-21 16:37:47.397598
88	17	20	2017-12-21 16:37:47.398465	2017-12-21 16:37:47.398465
89	18	1	2017-12-21 16:38:37.160496	2017-12-21 16:38:37.160496
90	18	16	2017-12-21 16:38:37.161167	2017-12-21 16:38:37.161167
91	18	20	2017-12-21 16:38:37.161753	2017-12-21 16:38:37.161753
92	18	21	2017-12-21 16:38:37.162355	2017-12-21 16:38:37.162355
\.


--
-- Name: attraction_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('attraction_tags_id_seq', 92, true);


--
-- Data for Name: attractions; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY attractions (id, name, description, season, price, created_at, updated_at) FROM stdin;
1	Pike Place Market	town market in downtown	{Winter,Spring,Summer,Fall}	0.0	2017-12-21 16:21:35.111073	2017-12-21 16:21:35.111073
2	Kerry Park	park with scenic view	{Winter,Spring,Summer,Fall}	0.0	2017-12-21 16:22:41.258036	2017-12-21 16:22:41.258036
3	Ballard Locks	locks with salmon ladder	{Winter,Spring,Summer,Fall}	0.0	2017-12-21 16:23:36.683224	2017-12-21 16:23:36.683224
4	Fremont Troll	troll statue under the I-5 bridge\t	{Winter,Spring,Summer,Fall}	0.0	2017-12-21 16:24:28.884995	2017-12-21 16:24:28.884995
5	Gas Works Park	park next to Union Lake with a view to downtown	{Winter,Spring,Summer,Fall}	0.0	2017-12-21 16:25:24.011874	2017-12-21 16:25:24.011874
6	Golden Garden Park	park with a beach	{Winter,Spring,Summer,Fall}	0.0	2017-12-21 16:26:22.811292	2017-12-21 16:26:22.811292
7	Seattle Aquarium	aquarium with pacific north west environment	{Winter,Spring,Summer,Fall}	28.0	2017-12-21 16:27:20.490817	2017-12-21 16:27:20.490817
8	Whale Watching	trip to San Juan island to watch whales	{Spring,Summer,Fall}	100.0	2017-12-21 16:28:08.19665	2017-12-21 16:28:08.19665
9	Ballard Sunday Market	street market with local products and art	{Winter,Spring,Summer,Fall}	0.0	2017-12-21 16:29:41.743074	2017-12-21 16:29:41.743074
10	Hemp Fest	marijuana festival	{Fall}	20.0	2017-12-21 16:30:44.687012	2017-12-21 16:30:44.687012
11	Great Wheel	moving platform to watch city panorama	{Winter,Spring,Summer,Fall}	30.0	2017-12-21 16:31:34.992971	2017-12-21 16:31:34.992971
12	Museum Of Pop Culture	colorful exhibits cover everything from the history of indie video games and horror films to Nirvana, the Seahawks, and more	{Winter,Spring,Summer,Fall}	26.0	2017-12-21 16:32:36.923812	2017-12-21 16:32:36.923812
13	Space Needle	Views from the top feature Elliott Bay, the Cascade Mountains, and even Mount Rainier.	{Winter,Spring,Summer,Fall}	28.0	2017-12-21 16:33:56.051239	2017-12-21 16:33:56.051239
14	Seattle Center Monorail	The designated historic landmark can reach a top speed of 45 miles per hour and weaves between skyscrapers above the city streets.	{Winter,Spring,Summer,Fall}	10.0	2017-12-21 16:35:06.041694	2017-12-21 16:35:06.041694
15	Pacific Science Center	This family-friendly museum is where science lessons come to life	{Winter,Spring,Summer,Fall}	35.0	2017-12-21 16:36:00.919891	2017-12-21 16:36:00.919891
16	Chihuly Garden And Glass	The  museum is dedicated to the work and career of locally born, world-renowned glassblower Dale Chihuly.	{Winter,Spring,Summer,Fall}	24.0	2017-12-21 16:36:46.544895	2017-12-21 16:36:46.544895
17	Chinatown-international District	The ornate Chinatown Gate welcomes you to this diverse neighborhood, where the food scene is incredible	{Winter,Spring,Summer,Fall}	0.0	2017-12-21 16:37:47.393139	2017-12-21 16:37:47.393139
18	Museum Of Flight	The Museum of Flight is one of the largest air and space collections in the country, with an overwhelming number of things to see.	{Winter,Spring,Summer,Fall}	31.0	2017-12-21 16:38:37.159592	2017-12-21 16:38:37.159592
\.


--
-- Name: attractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('attractions_id_seq', 18, true);


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
1	with kids	2017-12-21 16:06:06.108128	2017-12-21 16:06:06.108128
2	for adults only	2017-12-21 16:06:15.347168	2017-12-21 16:06:15.347168
3	food	2017-12-21 16:06:19.462715	2017-12-21 16:06:24.027556
4	drinks	2017-12-21 16:06:36.76709	2017-12-21 16:06:36.76709
5	park	2017-12-21 16:06:40.218854	2017-12-21 16:06:40.218854
6	for free	2017-12-21 16:06:49.230298	2017-12-21 16:06:49.230298
7	marijuana	2017-12-21 16:06:56.670852	2017-12-21 16:06:56.670852
8	picnic	2017-12-21 16:07:00.590383	2017-12-21 16:07:00.590383
9	fireworks	2017-12-21 16:07:08.142476	2017-12-21 16:07:08.142476
10	fireplace	2017-12-21 16:07:15.738381	2017-12-21 16:07:15.738381
11	swimming	2017-12-21 16:07:54.774463	2017-12-21 16:07:54.774463
12	sports	2017-12-21 16:08:01.127806	2017-12-21 16:08:01.127806
13	scenic view	2017-12-21 16:08:07.902476	2017-12-21 16:08:07.902476
14	shopping	2017-12-21 16:08:17.190294	2017-12-21 16:08:17.190294
15	pets welcome	2017-12-21 16:08:25.710966	2017-12-21 16:08:25.710966
16	exibition	2017-12-21 16:08:31.990992	2017-12-21 16:08:31.990992
17	art	2017-12-21 16:08:36.798032	2017-12-21 16:08:36.798032
18	life music	2017-12-21 16:08:45.086065	2017-12-21 16:08:45.086065
19	downtown	2017-12-21 16:08:51.253953	2017-12-21 16:08:51.253953
20	history	2017-12-21 16:08:57.557223	2017-12-21 16:08:57.557223
21	trip	2017-12-21 16:09:01.2287	2017-12-21 16:09:01.2287
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('tags_id_seq', 21, true);


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

