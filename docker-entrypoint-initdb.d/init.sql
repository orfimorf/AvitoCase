\connect admin_avito
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-03-14 09:01:17

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
-- TOC entry 220 (class 1259 OID 59815)
-- Name: baseline_matrix_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.baseline_matrix_1 (
    id bigint NOT NULL,
    microcategory_id integer,
    location_id integer,
    price integer
);


ALTER TABLE public.baseline_matrix_1 OWNER TO postgres;


-- TOC entry 222 (class 1259 OID 59822)
-- Name: baseline_matrix_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.baseline_matrix_2 (
    id bigint NOT NULL,
    microcategory_id integer,
    location_id integer,
    price integer
);


ALTER TABLE public.baseline_matrix_2 OWNER TO postgres;



--
-- TOC entry 224 (class 1259 OID 59829)
-- Name: baseline_matrix_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.baseline_matrix_3 (
    id bigint NOT NULL,
    microcategory_id integer,
    location_id integer,
    price integer
);


ALTER TABLE public.baseline_matrix_3 OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 59828)
-- Name: baseline_matrix_3_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--


--
-- TOC entry 216 (class 1259 OID 59799)
-- Name: baselines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baselines (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    active boolean DEFAULT false NOT NULL
);


ALTER TABLE public.baselines OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 59798)
-- Name: baselines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.baselines_id_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 5;


ALTER SEQUENCE public.baselines_id_seq OWNER TO postgres;

--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 215
-- Name: baselines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.baselines_id_seq OWNED BY public.baselines.id;


--
-- TOC entry 226 (class 1259 OID 59836)
-- Name: discount_matrix_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.discount_matrix_1 (
    id bigint NOT NULL,
    microcategory_id integer,
    location_id integer,
    price integer
);


ALTER TABLE public.discount_matrix_1 OWNER TO postgres;




--
-- TOC entry 228 (class 1259 OID 59843)
-- Name: discount_matrix_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.discount_matrix_2 (
    id bigint NOT NULL,
    microcategory_id integer,
    location_id integer,
    price integer
);


ALTER TABLE public.discount_matrix_2 OWNER TO postgres;



--
-- TOC entry 230 (class 1259 OID 59850)
-- Name: discount_matrix_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IF NOT EXISTS public.discount_matrix_3 (
    id bigint NOT NULL,
    microcategory_id integer,
    location_id integer,
    price integer
);


ALTER TABLE public.discount_matrix_3 OWNER TO postgres;



--
-- TOC entry 218 (class 1259 OID 59807)
-- Name: discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discounts (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    active boolean DEFAULT false NOT NULL,
    segment bigint
);


ALTER TABLE public.discounts OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 59806)
-- Name: discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discounts_id_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 5;


ALTER SEQUENCE public.discounts_id_seq OWNER TO postgres;

--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 217
-- Name: discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discounts_id_seq OWNED BY public.discounts.id;



--
-- TOC entry 4669 (class 2604 OID 59802)
-- Name: baselines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baselines ALTER COLUMN id SET DEFAULT nextval('public.baselines_id_seq'::regclass);



--
-- TOC entry 4671 (class 2604 OID 59810)
-- Name: discounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts ALTER COLUMN id SET DEFAULT nextval('public.discounts_id_seq'::regclass);


--
-- TOC entry 4843 (class 0 OID 59815)
-- Dependencies: 220
-- Data for Name: baseline_matrix_1; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4845 (class 0 OID 59822)
-- Dependencies: 222
-- Data for Name: baseline_matrix_2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4847 (class 0 OID 59829)
-- Dependencies: 224
-- Data for Name: baseline_matrix_3; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4839 (class 0 OID 59799)
-- Dependencies: 216
-- Data for Name: baselines; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.baselines (id, name, active) VALUES (1, 'baseline_matrix_1', true);
INSERT INTO public.baselines (id, name, active) VALUES (2, 'baseline_matrix_2', false);
INSERT INTO public.baselines (id, name, active) VALUES (3, 'baseline_matrix_3', false);


--
-- TOC entry 4849 (class 0 OID 59836)
-- Dependencies: 226
-- Data for Name: discount_matrix_1; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4851 (class 0 OID 59843)
-- Dependencies: 228
-- Data for Name: discount_matrix_2; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4853 (class 0 OID 59850)
-- Dependencies: 230
-- Data for Name: discount_matrix_3; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4841 (class 0 OID 59807)
-- Dependencies: 218
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.discounts (id, name, active, segment) VALUES (1, 'discount_matrix_1', true, 168);
INSERT INTO public.discounts (id, name, active, segment) VALUES (2, 'discount_matrix_2', false, 290);
INSERT INTO public.discounts (id, name, active, segment) VALUES (3, 'discount_matrix_3', false, 350);


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 219
-- Name: baseline_matrix_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baseline_matrix_1_id_seq', 1, false);


--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 221
-- Name: baseline_matrix_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baseline_matrix_2_id_seq', 1, false);


--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 223
-- Name: baseline_matrix_3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baseline_matrix_3_id_seq', 1, false);


--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 215
-- Name: baselines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baselines_id_seq', 1, false);


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 225
-- Name: discount_matrix_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_matrix_1_id_seq', 1, false);


--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 227
-- Name: discount_matrix_2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_matrix_2_id_seq', 1, false);


--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 229
-- Name: discount_matrix_3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_matrix_3_id_seq', 1, false);


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 217
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discounts_id_seq', 3, true);


--



--

--
-- TOC entry 4680 (class 2606 OID 59805)
-- Name: baselines baselines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baselines
    ADD CONSTRAINT baselines_pkey PRIMARY KEY (id);




--
-- TOC entry 4682 (class 2606 OID 59813)
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


-- Completed on 2024-03-14 09:01:17

--
-- PostgreSQL database dump complete
--

