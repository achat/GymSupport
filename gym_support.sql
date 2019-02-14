--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: exercise; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE exercise (
    eid integer NOT NULL,
    exercise_code character varying,
    ename character varying,
    descr character varying,
    comments text
);


ALTER TABLE exercise OWNER TO postgres;

--
-- Name: exercise_eid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE exercise_eid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE exercise_eid_seq OWNER TO postgres;

--
-- Name: exercise_eid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE exercise_eid_seq OWNED BY exercise.eid;


--
-- Name: expertise; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE expertise (
    eid integer NOT NULL,
    expertise_code character varying,
    workout_type character varying,
    comments character varying
);


ALTER TABLE expertise OWNER TO postgres;

--
-- Name: expertise_eid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE expertise_eid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expertise_eid_seq OWNER TO postgres;

--
-- Name: expertise_eid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE expertise_eid_seq OWNED BY expertise.eid;


--
-- Name: gym_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE gym_user (
    uid integer NOT NULL,
    username character varying,
    password character varying,
    email character varying,
    fname character varying,
    surname character varying,
    gender character varying,
    age numeric,
    weight numeric,
    height numeric,
    comments text
);


ALTER TABLE gym_user OWNER TO postgres;

--
-- Name: gym_user_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gym_user_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gym_user_uid_seq OWNER TO postgres;

--
-- Name: gym_user_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gym_user_uid_seq OWNED BY gym_user.uid;


--
-- Name: trainer_expertise; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE trainer_expertise (
    trainer_code character varying,
    expertise_code character varying,
    comments text
);


ALTER TABLE trainer_expertise OWNER TO postgres;

--
-- Name: trainers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE trainers (
    tid integer NOT NULL,
    trainer_code character varying,
    tname character varying,
    gender character varying,
    profile text,
    comments text
);


ALTER TABLE trainers OWNER TO postgres;

--
-- Name: trainers_tid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trainers_tid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trainers_tid_seq OWNER TO postgres;

--
-- Name: trainers_tid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE trainers_tid_seq OWNED BY trainers.tid;


--
-- Name: workout; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE workout (
    wid integer NOT NULL,
    workout_code character varying,
    wname character varying,
    descr character varying,
    comments text
);


ALTER TABLE workout OWNER TO postgres;

--
-- Name: workout_exercise; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE workout_exercise (
    exercise_code character varying,
    workout_code character varying,
    comments text,
    wid integer NOT NULL
);


ALTER TABLE workout_exercise OWNER TO postgres;

--
-- Name: workout_exercise_wid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE workout_exercise_wid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE workout_exercise_wid_seq OWNER TO postgres;

--
-- Name: workout_exercise_wid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE workout_exercise_wid_seq OWNED BY workout_exercise.wid;


--
-- Name: workout_expertise; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE workout_expertise (
    workout_code character varying,
    expertise_code character varying,
    comments text
);


ALTER TABLE workout_expertise OWNER TO postgres;

--
-- Name: workout_wid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE workout_wid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE workout_wid_seq OWNER TO postgres;

--
-- Name: workout_wid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE workout_wid_seq OWNED BY workout.wid;


--
-- Name: eid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY exercise ALTER COLUMN eid SET DEFAULT nextval('exercise_eid_seq'::regclass);


--
-- Name: eid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expertise ALTER COLUMN eid SET DEFAULT nextval('expertise_eid_seq'::regclass);


--
-- Name: uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gym_user ALTER COLUMN uid SET DEFAULT nextval('gym_user_uid_seq'::regclass);


--
-- Name: tid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trainers ALTER COLUMN tid SET DEFAULT nextval('trainers_tid_seq'::regclass);


--
-- Name: wid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY workout ALTER COLUMN wid SET DEFAULT nextval('workout_wid_seq'::regclass);


--
-- Name: wid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY workout_exercise ALTER COLUMN wid SET DEFAULT nextval('workout_exercise_wid_seq'::regclass);


--
-- Data for Name: exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY exercise (eid, exercise_code, ename, descr, comments) FROM stdin;
1	LEG_RAISES	Leg Raises	\N	\N
2	CRUNCHES	Crunches	\N	\N
4	JACKKNIFE	Jackknife	\N	\N
5	HIP_RAISE	Hip Raise	\N	\N
6	RUSSIAN_TWIST	Russian Twist	\N	\N
7	DEADLIFTS	Deadlifts	\N	\N
8	SEATED_ROWS	Seated Rows	\N	\N
9	BARBELL_SHRUGS	Barbell Shrugs	\N	\N
10	DUMBELL_SHRUGS	Dumbell Shrugs	\N	\N
11	BENT_OVER_ROW	Bent over row	\N	\N
12	PULL_UPS	Pull ups	\N	\N
13	BACK_EXTENSIONS	Back Extensions	\N	\N
14	T-BAR_BENT_OVER_ROW	T-Bar Bent Over row	\N	\N
15	CURLS	Curls	\N	\N
16	PREACHER	Preacher	\N	\N
17	HAMMER	Hammer	\N	\N
18	REVERSE_CURLS	Reverse Curls	\N	\N
19	LOW_PULLEY	Low Pulley	\N	\N
20	UNDERHAND_GRIP_PRONE_ON	Underhand Grip Prone on	\N	\N
21	DUMBELL_BICEPS_CURLS	Dumbell Biceps Curls	\N	\N
22	PULLEY_CABLE_CROSSOVER	Pulley Cable Crossover	\N	\N
23	TOE_RAISES	Toe Raises	\N	\N
25	SEATED_CALF_RAISES	Seated Calf Raises	\N	\N
26	DUMBELL_CALF_JUMP	Dumbell Calf Jump	\N	\N
27	STANDING_CALF_RAISES	Standing Calf Raises	\N	\N
29	BARBELL_CALF_RAISES	Barbell Calf Raises	\N	\N
30	BENCH_PRESSES	Bench Presses	\N	\N
31	INCLINE_PRESSES	Incline Presses	\N	\N
32	DUMBELL_PRESSES	Dumbell Presses	\N	\N
33	PARALLEL_BAR_DIPS	Parallel Bar Dips	\N	\N
34	CABLE_CROSSOVER_FLYS	Cable Crossover Flys	\N	\N
35	DUMBELL_FLYS	Dumbell Flys	\N	\N
37	PECK_DECK_FLIES	Peck Deck Flies	\N	\N
38	WRIST_CURLS	Wrist Curls	\N	\N
39	DUMBELL_WRIST_CURLS	Dumbell Wrist Curls	\N	\N
40	DUMBELL_WRIST_TWIST	Dumbell Wrist Twist	\N	\N
41	STANDING_WRIST_CURL	Standing Wrist Curl	\N	\N
42	SQUATS	Squats	\N	\N
43	LEG_EXTENSIONS	leg Extensions	\N	\N
44	CABLE_BACK_KICKS	Cable Back Kicks	\N	\N
45	FRONT_SQUATS	Front Squats	\N	\N
46	POWER_SQUATS	Power Squats	\N	\N
47	HACK_SQUAT	Hack Squat	\N	\N
48	BENCH_JUMP	Bench Jump	\N	\N
49	BULGARIAN_SPLIT_SQUAT	Bulgarian Split Squat	\N	\N
50	BACK_PRESSES	Back Presses	\N	\N
51	SEATED_FRONT_PRESSES	Seated Front Presses	\N	\N
52	UPRIGHT_ROW	Upright Row	\N	\N
53	LATERAL_RAISES	Lateral Raises	\N	\N
54	FRONT_RAISES	Front Raises	\N	\N
55	ARNOLD_PRESS	Arnold Press	\N	\N
56	BARBELL_FRONT_RAISE	Barbell Front Raise	\N	\N
57	PUSH_DOWNS	Push Downs	\N	\N
58	TRICEPS_KICKBACKS	Triceps KickBacks	\N	\N
59	BAR_TRICEPS_EXTENSIONS	Bar Triceps Extensions	\N	\N
60	TRICEPS_DIPS	Triceps Dips	\N	\N
61	DIAMOND_PUSHUPS	Diamond Pushups	\N	\N
62	BALL_PULL_OVER	Ball Pull over	\N	\N
63	SIT_UPS	Sit ups	\N	\N
68	PREACHER_CURLS	Preacher Curls	\N	\N
70	ONE_LEG_TOE_RAISES	One Leg Toe Raises	\N	\N
71	PUSH_UPS	Push Ups	\N	\N
\.


--
-- Name: exercise_eid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('exercise_eid_seq', 72, true);


--
-- Data for Name: expertise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY expertise (eid, expertise_code, workout_type, comments) FROM stdin;
1	CARDIO	Cardio	\N
2	STAMINA	Stamina	\N
3	STRENGTH	Strength	\N
4	LISSOMENESS	LISSOMENESS	\N
5	AEROBIC	Aerobic	\N
6	PILATES	Pilates	\N
7	STRETCHING	Stretching	\N
8	YOGA	Yoga	\N
\.


--
-- Name: expertise_eid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('expertise_eid_seq', 9, true);


--
-- Data for Name: gym_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gym_user (uid, username, password, email, fname, surname, gender, age, weight, height, comments) FROM stdin;
1	vasilis	vts	vasilis@gym.support	vasilis	tester	Male	43	78	177	test db user
\.


--
-- Name: gym_user_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('gym_user_uid_seq', 1, true);


--
-- Data for Name: trainer_expertise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trainer_expertise (trainer_code, expertise_code, comments) FROM stdin;
\.


--
-- Data for Name: trainers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trainers (tid, trainer_code, tname, gender, profile, comments) FROM stdin;
\.


--
-- Name: trainers_tid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('trainers_tid_seq', 1, false);


--
-- Data for Name: workout; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY workout (wid, workout_code, wname, descr, comments) FROM stdin;
1	ABS	Abs	\N	\N
2	ABDUCTORS	Abductors	\N	\N
3	ADDUCTORS	Adductors	\N	\N
4	KNEES	Knees	\N	\N
5	TRICEPS	Triceps	\N	\N
6	HAMSTRINGS	Hamstrings	\N	\N
7	CALVES	Calves	\N	\N
8	LOWER_BACK	Lower Back	\N	\N
9	TRAPS	Traps	\N	\N
10	GLUTES	Glutes	\N	\N
11	LATS	Lats	\N	\N
12	BACK	Back	\N	\N
14	CHEST	Chest	\N	\N
16	QUADS	Quads	\N	\N
17	BICEPS	Biceps	\N	\N
13	SHOULDER	Shoulders	\N	\N
15	FOREARMS	Forearm	\N	\N
18	TOTAL_BODY	Total Body	\N	\N
\.


--
-- Data for Name: workout_exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY workout_exercise (exercise_code, workout_code, comments, wid) FROM stdin;
LEG_RAISES	ABS	\N	1
CRUNCHES	ABS	\N	2
SIT_UPS	ABS	\N	3
JACKKNIFE	ABS	\N	4
HIP_RAISE	ABS	\N	5
RUSSIAN_TWIST	ABS	\N	6
DEADLIFTS	BACK	\N	7
SEATED_ROWS	BACK	\N	8
BARBELL_SHRUGS	BACK	\N	9
DUMBELL_SHRUGS	BACK	\N	10
BENT_OVER_ROW	BACK	\N	11
PULL_UPS	BACK	\N	12
BACK_EXTENSIONS	BACK	\N	13
T-BAR_BENT_OVER_ROW	BACK	\N	14
CURLS	BICEPS	\N	15
PREACHER	BICEPS	\N	16
HAMMER	BICEPS	\N	17
REVERSE_CURLS	BICEPS	\N	18
LOW_PULLEY	BICEPS	\N	19
UNDERHAND_GRIP_PRONE_ON	BICEPS	\N	20
DUMBELL_BICEPS_CURLS	BICEPS	\N	21
PULLEY_CABLE_CROSSOVER	BICEPS	\N	22
TOE_RAISES	CALVES	\N	23
ONE_LEG_TOE_RAISES	CALVES	\N	24
SEATED_CALF_RAISES	CALVES	\N	25
DUMBELL_CALF_JUMP	CALVES	\N	26
STANDING_CALF_RAISES	CALVES	\N	27
SEATED_CALF_RAISES	CALVES	\N	28
BARBELL_CALF_RAISES	CALVES	\N	29
PUSH_DOWNS	TRICEPS	\N	30
TRICEPS_KICKBACKS	TRICEPS	\N	31
BAR_TRICEPS_EXTENSIONS	TRICEPS	\N	32
TRICEPS_DIPS	TRICEPS	\N	33
DIAMOND_PUSHUPS	TRICEPS	\N	34
BALL_PULL_OVER	TRICEPS	\N	35
BENCH_PRESSES	CHEST	\N	36
INCLINE_PRESSES	CHEST	\N	37
DUMBELL_PRESSES	CHEST	\N	38
PARALLEL_BAR_DIPS	CHEST	\N	39
CABLE_CROSSOVER_FLYS	CHEST	\N	40
DUMBELL_FLYS	CHEST	\N	41
PUSH_UPS	CHEST	\N	42
PECK_DECK_FLIES	CHEST	\N	43
BACK_PRESSES	SHOULDER	\N	44
SEATED_FRONT_PRESSES	SHOULDER	\N	45
UPRIGHT_ROW	SHOULDER	\N	46
LATERAL_RAISES	SHOULDER	\N	47
FRONT_RAISES	SHOULDER	\N	48
ARNOLD_PRESS	SHOULDER	\N	49
BARBELL_FRONT_RAISE	SHOULDER	\N	50
SQUATS	ABDUCTORS	\N	51
LEG_EXTENSIONS	ABDUCTORS	\N	52
CABLE_BACK_KICKS	ABDUCTORS	\N	53
FRONT_SQUATS	ABDUCTORS	\N	54
POWER_SQUATS	ABDUCTORS	\N	55
HACK_SQUAT	ABDUCTORS	\N	56
BENCH_JUMP	ABDUCTORS	\N	57
BULGARIAN_SPLIT_SQUAT	ABDUCTORS	\N	58
SQUATS	ADDUCTORS	\N	59
LEG_EXTENSIONS	ADDUCTORS	\N	60
CABLE_BACK_KICKS	ADDUCTORS	\N	61
FRONT_SQUATS	ADDUCTORS	\N	62
POWER_SQUATS	ADDUCTORS	\N	63
HACK_SQUAT	ADDUCTORS	\N	64
BENCH_JUMP	ADDUCTORS	\N	65
BULGARIAN_SPLIT_SQUAT	ADDUCTORS	\N	66
SQUATS	KNEES	\N	67
LEG_EXTENSIONS	KNEES	\N	68
CABLE_BACK_KICKS	KNEES	\N	69
FRONT_SQUATS	KNEES	\N	70
POWER_SQUATS	KNEES	\N	71
HACK_SQUAT	KNEES	\N	72
BENCH_JUMP	KNEES	\N	73
BULGARIAN_SPLIT_SQUAT	KNEES	\N	74
SQUATS	GLUTES	\N	75
LEG_EXTENSIONS	GLUTES	\N	76
CABLE_BACK_KICKS	GLUTES	\N	77
FRONT_SQUATS	GLUTES	\N	78
POWER_SQUATS	GLUTES	\N	79
HACK_SQUAT	GLUTES	\N	80
BENCH_JUMP	GLUTES	\N	81
BULGARIAN_SPLIT_SQUAT	GLUTES	\N	82
SQUATS	QUADS	\N	83
LEG_EXTENSIONS	QUADS	\N	84
CABLE_BACK_KICKS	QUADS	\N	85
FRONT_SQUATS	QUADS	\N	86
POWER_SQUATS	QUADS	\N	87
HACK_SQUAT	QUADS	\N	88
BENCH_JUMP	QUADS	\N	89
BULGARIAN_SPLIT_SQUAT	QUADS	\N	90
WRIST_CURLS	FOREARMS	\N	91
DUMBELL_WRIST_CURLS	FOREARMS	\N	92
DUMBELL_WRIST_TWIST	FOREARMS	\N	93
STANDING_WRIST_CURL	FOREARMS	\N	94
SIT_UPS	TOTAL_BODY	\N	95
LEG_RAISES	TOTAL_BODY	\N	96
DEADLIFTS	TOTAL_BODY	\N	97
SEATED_ROWS	TOTAL_BODY	\N	98
CURLS	TOTAL_BODY	\N	99
PREACHER_CURLS	TOTAL_BODY	\N	100
TOE_RAISES	TOTAL_BODY	\N	101
ONE_LEG_TOE_RAISES	TOTAL_BODY	\N	102
PUSH_UPS	TOTAL_BODY	\N	103
PECK_DECK_FLIES	TOTAL_BODY	\N	104
\.


--
-- Name: workout_exercise_wid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('workout_exercise_wid_seq', 104, true);


--
-- Data for Name: workout_expertise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY workout_expertise (workout_code, expertise_code, comments) FROM stdin;
\.


--
-- Name: workout_wid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('workout_wid_seq', 18, true);


--
-- Name: exercise_exercise_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exercise
    ADD CONSTRAINT exercise_exercise_code_key UNIQUE (exercise_code);


--
-- Name: exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY exercise
    ADD CONSTRAINT exercise_pkey PRIMARY KEY (eid);


--
-- Name: expertise_expertise_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY expertise
    ADD CONSTRAINT expertise_expertise_code_key UNIQUE (expertise_code);


--
-- Name: expertise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY expertise
    ADD CONSTRAINT expertise_pkey PRIMARY KEY (eid);


--
-- Name: gym_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY gym_user
    ADD CONSTRAINT gym_user_pkey PRIMARY KEY (uid);


--
-- Name: gym_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY gym_user
    ADD CONSTRAINT gym_user_username_key UNIQUE (username);


--
-- Name: trainers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trainers
    ADD CONSTRAINT trainers_pkey PRIMARY KEY (tid);


--
-- Name: trainers_trainer_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trainers
    ADD CONSTRAINT trainers_trainer_code_key UNIQUE (trainer_code);


--
-- Name: workout_exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY workout_exercise
    ADD CONSTRAINT workout_exercise_pkey PRIMARY KEY (wid);


--
-- Name: workout_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY workout
    ADD CONSTRAINT workout_pkey PRIMARY KEY (wid);


--
-- Name: workout_workout_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY workout
    ADD CONSTRAINT workout_workout_code_key UNIQUE (workout_code);


--
-- Name: workout_exercise_exercise_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY workout_exercise
    ADD CONSTRAINT workout_exercise_exercise_code_fkey FOREIGN KEY (exercise_code) REFERENCES exercise(exercise_code);


--
-- Name: workout_exercise_workout_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY workout_exercise
    ADD CONSTRAINT workout_exercise_workout_code_fkey FOREIGN KEY (workout_code) REFERENCES workout(workout_code);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

