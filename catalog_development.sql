--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: woto
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO woto;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: woto
--

CREATE TABLE categories (
    id integer NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    parent_id integer,
    es_body json
);


ALTER TABLE categories OWNER TO woto;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: woto
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO woto;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: woto
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: category_hierarchies; Type: TABLE; Schema: public; Owner: woto
--

CREATE TABLE category_hierarchies (
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL
);


ALTER TABLE category_hierarchies OWNER TO woto;

--
-- Name: indices; Type: TABLE; Schema: public; Owner: woto
--

CREATE TABLE indices (
    id integer NOT NULL,
    es_body json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    es_index character varying
);


ALTER TABLE indices OWNER TO woto;

--
-- Name: indices_id_seq; Type: SEQUENCE; Schema: public; Owner: woto
--

CREATE SEQUENCE indices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE indices_id_seq OWNER TO woto;

--
-- Name: indices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: woto
--

ALTER SEQUENCE indices_id_seq OWNED BY indices.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: woto
--

CREATE TABLE products (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    es_index character varying,
    es_type character varying,
    es_body json
);


ALTER TABLE products OWNER TO woto;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: woto
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO woto;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: woto
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: woto
--

CREATE TABLE properties (
    id integer NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE properties OWNER TO woto;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: woto
--

CREATE SEQUENCE properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE properties_id_seq OWNER TO woto;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: woto
--

ALTER SEQUENCE properties_id_seq OWNED BY properties.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: woto
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO woto;

--
-- Name: tree_hierarchies; Type: TABLE; Schema: public; Owner: woto
--

CREATE TABLE tree_hierarchies (
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL
);


ALTER TABLE tree_hierarchies OWNER TO woto;

--
-- Name: trees; Type: TABLE; Schema: public; Owner: woto
--

CREATE TABLE trees (
    id integer NOT NULL,
    es_index character varying,
    es_type character varying,
    es_body json,
    parent_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sort_order integer
);


ALTER TABLE trees OWNER TO woto;

--
-- Name: trees_id_seq; Type: SEQUENCE; Schema: public; Owner: woto
--

CREATE SEQUENCE trees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trees_id_seq OWNER TO woto;

--
-- Name: trees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: woto
--

ALTER SEQUENCE trees_id_seq OWNED BY trees.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: woto
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: woto
--

ALTER TABLE ONLY indices ALTER COLUMN id SET DEFAULT nextval('indices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: woto
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: woto
--

ALTER TABLE ONLY properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: woto
--

ALTER TABLE ONLY trees ALTER COLUMN id SET DEFAULT nextval('trees_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: woto
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2016-05-17 03:43:33.766051	2016-05-17 03:43:33.766051
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: woto
--

COPY categories (id, title, created_at, updated_at, parent_id, es_body) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: woto
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


--
-- Data for Name: category_hierarchies; Type: TABLE DATA; Schema: public; Owner: woto
--

COPY category_hierarchies (ancestor_id, descendant_id, generations) FROM stdin;
\.


--
-- Data for Name: indices; Type: TABLE DATA; Schema: public; Owner: woto
--

COPY indices (id, es_body, created_at, updated_at, es_index) FROM stdin;
\.


--
-- Name: indices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: woto
--

SELECT pg_catalog.setval('indices_id_seq', 1, false);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: woto
--

COPY products (id, created_at, updated_at, es_index, es_type, es_body) FROM stdin;
2458	2016-05-26 00:42:24.609387	2016-05-26 00:42:24.609387	farm	products	{"category_ids":[15,59],"title":"Гирлянды Светодиодные 160л.","price":450,"unit":"шт","animal_ids":[]}
2459	2016-05-26 00:42:24.81798	2016-05-26 00:42:24.81798	farm	products	{"category_ids":[15,59],"title":"Гирлянды Светодиодные 40л. с фигурками","price":500,"unit":"шт","animal_ids":[]}
2460	2016-05-26 00:42:24.906356	2016-05-26 00:42:24.906356	farm	products	{"category_ids":[15,59],"title":"Е2003 100л. простая 7м.","price":338,"unit":"шт","animal_ids":[]}
2461	2016-05-26 00:42:24.983996	2016-05-26 00:42:24.983996	farm	products	{"category_ids":[15,59],"title":"Е2019 100 ламп, цветные лампы","price":405,"unit":"шт","animal_ids":[]}
2462	2016-05-26 00:42:25.062279	2016-05-26 00:42:25.062279	farm	products	{"category_ids":[15,59],"title":"Е2065 Сосулька 200л. 2,7м.","price":408,"unit":"шт","animal_ids":[]}
2463	2016-05-26 00:42:25.139555	2016-05-26 00:42:25.139555	farm	products	{"category_ids":[15,59],"title":"Е2100 Сетка 100л. елка 1,2х1,2","price":615,"unit":"шт","animal_ids":[]}
2464	2016-05-26 00:42:25.217716	2016-05-26 00:42:25.217716	farm	products	{"category_ids":[15,59],"title":"Е2105 Сетка 320 ламп цетная бегущая","price":1400,"unit":"шт","animal_ids":[]}
2465	2016-05-26 00:42:25.306571	2016-05-26 00:42:25.306571	farm	products	{"category_ids":[15,59],"title":"Е50539  рис.Снежинка 25мм, 100 ламп, цветная.5,2 м+1,5м","price":605,"unit":"шт","animal_ids":[]}
2467	2016-05-26 00:42:25.473509	2016-05-26 00:42:25.473509	farm	products	{"category_ids":[15,60],"title":"Кормушка №2","price":2250,"unit":"шт","animal_ids":[]}
2469	2016-05-26 00:42:25.639864	2016-05-26 00:42:25.639864	farm	products	{"category_ids":[15,60],"title":"Разделочная доска","price":500,"unit":"шт","animal_ids":[]}
2470	2016-05-26 00:42:25.726874	2016-05-26 00:42:25.726874	farm	products	{"category_ids":[15,60],"title":"Скворечник","price":1500,"unit":"шт","animal_ids":[]}
2471	2016-05-26 00:42:25.828909	2016-05-26 00:42:25.828909	farm	products	{"category_ids":[15,60],"title":"Стул","price":7000,"unit":"шт","animal_ids":[]}
2472	2016-05-26 00:42:25.920872	2016-05-26 00:42:25.920872	farm	products	{"category_ids":[15,61],"title":"Ель","price":1000,"unit":"шт","animal_ids":[]}
2473	2016-05-26 00:42:26.017277	2016-05-26 00:42:26.017277	farm	products	{"category_ids":[15,61],"title":"Подставка","price":700,"unit":"шт","animal_ids":[]}
2474	2016-05-26 00:42:26.094857	2016-05-26 00:42:26.094857	farm	products	{"category_ids":[15,61],"title":"Сосна","price":900,"unit":"шт","animal_ids":[]}
2475	2016-05-26 00:42:26.188565	2016-05-26 00:42:26.188565	farm	products	{"category_ids":[15,62],"title":"Куры \\"Хайсекс Белый\\"","price":450,"unit":"шт","animal_ids":[]}
2476	2016-05-26 00:42:26.273415	2016-05-26 00:42:26.273415	farm	products	{"category_ids":[15,62],"title":"Куры \\"Хайсекс Браун\\"","price":400,"unit":"шт","animal_ids":[]}
2477	2016-05-26 00:42:26.428122	2016-05-26 00:42:26.428122	farm	products	{"category_ids":[15,63],"title":"Зерновая смесь для птицы","price":25,"unit":"кг","animal_ids":[49,50,51,52]}
2478	2016-05-26 00:42:26.588385	2016-05-26 00:42:26.588385	farm	products	{"category_ids":[15,63],"title":"Кукуруза","price":19,"unit":"кг","animal_ids":[49,50,52,53,55]}
2479	2016-05-26 00:42:26.681942	2016-05-26 00:42:26.681942	farm	products	{"category_ids":[15,63],"title":"Кукуруза Размол","price":20,"unit":"кг","animal_ids":[49,50,51,52,53]}
2480	2016-05-26 00:42:26.773968	2016-05-26 00:42:26.773968	farm	products	{"category_ids":[15,63],"title":"Мел 2,5 кг","price":150,"unit":"шт","animal_ids":[49,50,51,52,53,54]}
2481	2016-05-26 00:42:26.86455	2016-05-26 00:42:26.86455	farm	products	{"category_ids":[15,63],"title":"Овес","price":15,"unit":"кг","animal_ids":[49,50,52,53,54,55]}
2482	2016-05-26 00:42:26.964667	2016-05-26 00:42:26.964667	farm	products	{"category_ids":[15,63],"title":"Отруби","price":12,"unit":"кг","animal_ids":[49,50,52,53,54,55]}
2483	2016-05-26 00:42:27.060652	2016-05-26 00:42:27.060652	farm	products	{"category_ids":[15,63],"title":"Просо","price":25,"unit":"кг","animal_ids":[49,50,51,52]}
2484	2016-05-26 00:42:27.161851	2016-05-26 00:42:27.161851	farm	products	{"category_ids":[15,63],"title":"Пшеница","price":17,"unit":"кг","animal_ids":[49,50,52,53]}
2485	2016-05-26 00:42:27.262482	2016-05-26 00:42:27.262482	farm	products	{"category_ids":[15,63],"title":"Размол зерновых","price":18,"unit":"кг","animal_ids":[49,50,52,53]}
2486	2016-05-26 00:42:27.352012	2016-05-26 00:42:27.352012	farm	products	{"category_ids":[15,63],"title":"Размол зерновых №2","price":19,"unit":"кг","animal_ids":[49,50,51,52,53]}
2487	2016-05-26 00:42:27.45229	2016-05-26 00:42:27.45229	farm	products	{"category_ids":[15,63],"title":"Ракушка","price":20,"unit":"кг","animal_ids":[49,50,51,52,53]}
2488	2016-05-26 00:42:27.552515	2016-05-26 00:42:27.552515	farm	products	{"category_ids":[15,63],"title":"семечки","price":36,"unit":"кг","animal_ids":[49,50,51,52,53]}
2489	2016-05-26 00:42:27.653379	2016-05-26 00:42:27.653379	farm	products	{"category_ids":[15,63],"title":"Ячмень","price":17,"unit":"кг","animal_ids":[49,50,52,53,54,55]}
2796	2016-05-26 00:42:58.167366	2016-05-26 00:42:58.167366	farm	products	{"category_ids":[15,70],"title":"Мулен руж","price":593,"unit":"шт","animal_ids":[]}
2468	2016-05-26 00:42:25.550661	2016-05-26 03:05:45.787626	farm	products	{"category_ids":[15,60],"title":"Кормушка для синиц","price":1500,"unit":"шт","home_animal_ids":[95]}
2466	2016-05-26 00:42:25.388882	2016-05-26 03:05:55.816287	farm	products	{"category_ids":[15,60],"title":"Кормушка №1","price":1800,"unit":"шт","home_animal_ids":[95]}
2491	2016-05-26 00:42:27.84031	2016-05-26 05:21:37.474109	farm	products	{"category_ids":[15,64,112],"title":"Вака + для крупных попугаев 800г.","price":180,"unit":"шт","home_animal_ids":[95],"weight_ids":[109]}
2490	2016-05-26 00:42:27.755017	2016-05-26 07:20:22.932259	farm	products	{"category_ids":[15,64,112],"title":"БРИТ для крупных пород 12 кг.","price":4084,"unit":"шт","home_animal_ids":[93],"weight_ids":[115]}
2528	2016-05-26 00:42:31.008212	2016-05-26 05:30:58.558784	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек ассорти 350г.","price":60,"unit":"шт","home_animal_ids":[94],"weight_ids":[90]}
2522	2016-05-26 00:42:30.540377	2016-05-26 05:09:14.594582	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ ПАУЧ в ассортименте","price":19,"unit":"шт","home_animal_ids":[94]}
2521	2016-05-26 00:42:30.463543	2016-05-26 05:06:55.321066	farm	products	{"category_ids":[15,64,113],"title":"Зоо няня Бентонити 5 кг","price":261,"unit":"шт","animal_ids":[]}
2494	2016-05-26 00:42:28.083789	2016-05-26 05:23:44.27448	farm	products	{"category_ids":[15,64,112],"title":"Вака для Мел/сред. попугаев 500г.","price":40,"unit":"шт","home_animal_ids":[95],"weight_ids":[97]}
2515	2016-05-26 00:42:29.894306	2016-05-26 05:15:36.040888	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/кошек подушечки/паштет курица/утка/индейка 1,9кг.","price":366,"unit":"шт","home_animal_ids":[94],"weight_ids":[102]}
2516	2016-05-26 00:42:29.985778	2016-05-26 05:09:43.57536	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/кошек подушечки/паштет курица/утка/индейка 350г","price":75,"unit":"шт","home_animal_ids":[94],"weight_ids":[90]}
2526	2016-05-26 00:42:30.85161	2016-05-26 05:16:20.814191	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек ассорти 1,9кг.","price":280,"unit":"шт","home_animal_ids":[94],"weight_ids":[102]}
2518	2016-05-26 00:42:30.208193	2016-05-26 05:15:51.815292	farm	products	{"category_ids":[15,64,112],"title":"Вискис сух.д/котят подушечки с молоком индейка/морковь 1,9 кг.","price":435,"unit":"шт","home_animal_ids":[94],"weight_ids":[102]}
2520	2016-05-26 00:42:30.384654	2016-05-26 06:15:49.87236	farm	products	{"category_ids":[15,64,112],"title":"ДОГ ЛАНЧ кон.д/собак 760г.","price":95,"unit":"шт","home_animal_ids":[93],"weight_ids":[118]}
2496	2016-05-26 00:42:28.239169	2016-05-26 06:04:55.148623	farm	products	{"category_ids":[15,64,112],"title":"Вака Люкс для Мелких и средних попугаев 1000г.","price":138,"unit":"шт","home_animal_ids":[95],"weight_ids":[105]}
2507	2016-05-26 00:42:29.239533	2016-05-26 05:36:18.023796	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек рагу с форнелью 85г","price":22,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2509	2016-05-26 00:42:29.396183	2016-05-26 05:10:02.600984	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/стерилизованых кошек ГОВЯДИНА 1,9кг","price":435,"unit":"шт","home_animal_ids":[94],"weight_ids":[102]}
2527	2016-05-26 00:42:30.930342	2016-05-26 06:20:20.299185	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек ассорти 1кг.","price":132,"unit":"шт","home_animal_ids":[94],"weight_ids":[105]}
2511	2016-05-26 00:42:29.56302	2016-05-26 05:10:14.403416	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/стерилизованых кошек КРОЛИК 350г","price":83,"unit":"шт","home_animal_ids":[94],"weight_ids":[90]}
2497	2016-05-26 00:42:28.318573	2016-05-26 06:34:05.410422	farm	products	{"category_ids":[15,64,112],"title":"Вака Люкс для средних попугаев 900г.","price":133,"unit":"шт","home_animal_ids":[95],"weight_ids":[121]}
2523	2016-05-26 00:42:30.618572	2016-05-26 06:20:39.817238	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ ПАУЧ д/кошек кролик в соусе 100г.","price":19,"unit":"шт","home_animal_ids":[94],"weight_ids":[108]}
2498	2016-05-26 00:42:28.406664	2016-05-26 05:34:40.775114	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ в ас-те","price":22,"unit":"шт","home_animal_ids":[94]}
2493	2016-05-26 00:42:28.015227	2016-05-26 06:39:37.628501	farm	products	{"category_ids":[15,64,112],"title":"Вака для грызунов 500г.","price":29,"unit":"шт","home_animal_ids":[122],"weight_ids":[97]}
2512	2016-05-26 00:42:29.650401	2016-05-26 05:36:08.255062	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/стерилизованых кошек КУРИЦА 350г","price":83,"unit":"шт","home_animal_ids":[94],"weight_ids":[90]}
2502	2016-05-26 00:42:28.740237	2016-05-26 05:30:15.850333	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек желе с лососем 85г","price":22,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2505	2016-05-26 00:42:29.085174	2016-05-26 05:10:53.724629	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек рагу курица 85г","price":22,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2495	2016-05-26 00:42:28.162959	2016-05-26 05:36:28.407445	farm	products	{"category_ids":[15,64,112],"title":"Вака Люкс для крупных попугаев 800г.","price":206,"unit":"шт","home_animal_ids":[95],"weight_ids":[109]}
2524	2016-05-26 00:42:30.69711	2016-05-26 06:14:43.127111	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ ПАУЧ д/кошек курица в соусе 100г.","price":19,"unit":"шт","home_animal_ids":[94],"weight_ids":[108]}
2508	2016-05-26 00:42:29.317633	2016-05-26 06:08:14.209453	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/стерилизованых кошек 1.9кг","price":403,"unit":"шт","home_animal_ids":[94],"weight_ids":[102]}
2504	2016-05-26 00:42:28.963014	2016-05-26 05:35:56.884395	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек паштет курица/индейка 85г","price":22,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2525	2016-05-26 00:42:30.774553	2016-05-26 06:10:13.739599	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ ПАУЧ д/кошек рыба в соусе 100г.","price":19,"unit":"шт","home_animal_ids":[94],"weight_ids":[108]}
2517	2016-05-26 00:42:30.063508	2016-05-26 05:15:25.92659	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/кошек подушечки/паштет лосось/тунец/креветки 1,9 кг","price":366,"unit":"шт","home_animal_ids":[94],"weight_ids":[102]}
2499	2016-05-26 00:42:28.485671	2016-05-26 05:19:58.390571	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/котят паштет курица 85г","price":22,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2514	2016-05-26 00:42:29.818998	2016-05-26 05:21:26.099182	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/кошек подушечки/паштет говядина/ягненок/кролик 350г","price":75,"unit":"шт","home_animal_ids":[94],"weight_ids":[90]}
2500	2016-05-26 00:42:28.563087	2016-05-26 05:24:16.570026	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек желе говядина/ягненок 85г","price":22,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2510	2016-05-26 00:42:29.474131	2016-05-26 05:29:43.523735	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/стерилизованых кошек ГОВЯДИНА 350г","price":83,"unit":"шт","home_animal_ids":[94],"weight_ids":[90]}
2538	2016-05-26 00:42:31.905688	2016-05-26 05:14:20.452102	farm	products	{"category_ids":[15,64,112],"title":"НМ для взрослых собак мелких пород 500г","price":71,"unit":"шт","home_animal_ids":[93],"weight_ids":[97]}
2529	2016-05-26 00:42:31.097192	2016-05-26 05:14:47.219879	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек ассорти 400г.","price":57,"unit":"шт","home_animal_ids":[94],"weight_ids":[96]}
2556	2016-05-26 00:42:33.386664	2016-05-26 05:29:56.74636	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак миниатюрных пород 600 кг.","price":140,"unit":"шт","home_animal_ids":[93],"weight_ids":[98]}
2553	2016-05-26 00:42:33.152794	2016-05-26 06:21:56.627349	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак миниатюрных пород говядина 190г.","price":50,"unit":"шт","home_animal_ids":[93],"weight_ids":[119]}
2546	2016-05-26 00:42:32.585525	2016-05-26 05:17:19.546728	farm	products	{"category_ids":[15,64,113],"title":"Ошейник брезент двойной 45","price":260,"unit":"шт","animal_ids":[]}
2530	2016-05-26 00:42:31.186344	2016-05-26 05:16:52.500444	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек ассорти 800г.","price":106,"unit":"шт","home_animal_ids":[94],"weight_ids":[109]}
2544	2016-05-26 00:42:32.419429	2016-05-26 05:11:03.303642	farm	products	{"category_ids":[15,64,112],"title":"НМ для щенков кр. пород 500г","price":81,"unit":"шт","home_animal_ids":[93],"weight_ids":[97]}
2536	2016-05-26 00:42:31.751779	2016-05-26 05:29:02.392791	farm	products	{"category_ids":[15,64,112],"title":"НМ для взрослых собак 500г","price":75,"unit":"шт","home_animal_ids":[93],"weight_ids":[97]}
2563	2016-05-26 00:42:34.129987	2016-05-26 05:42:38.104533	farm	products	{"category_ids":[15,64,112],"title":"РИО  волнистые попугаи линька 500г","price":79,"unit":"шт","home_animal_ids":[95],"weight_ids":[97]}
2547	2016-05-26 00:42:32.663226	2016-05-26 05:33:21.08267	farm	products	{"category_ids":[15,64,113],"title":"Ошейник брезент одинарный 45","price":187,"unit":"шт","animal_ids":[]}
2548	2016-05-26 00:42:32.741386	2016-05-26 06:51:54.942112	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак всех пород говядина 13 кг.","price":1550,"unit":"шт","home_animal_ids":[93],"weight_ids":[107]}
2543	2016-05-26 00:42:32.3286	2016-05-26 05:23:00.658206	farm	products	{"category_ids":[15,64,112],"title":"НМ для стерилизованных кошек в асс.400г.","price":67,"unit":"шт","home_animal_ids":[94],"weight_ids":[96]}
2561	2016-05-26 00:42:33.787327	2016-05-26 05:22:40.190695	farm	products	{"category_ids":[15,64,113],"title":"ПУСИ КЭТ Наполнитель комкующийся 4,5л.3,4кг","price":94,"unit":"шт","home_animal_ids":[94]}
2551	2016-05-26 00:42:32.995372	2016-05-26 05:31:43.040258	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак малых пород 600 кг.","price":110,"unit":"шт","home_animal_ids":[93],"weight_ids":[98]}
2549	2016-05-26 00:42:32.818512	2016-05-26 06:07:04.530177	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак всех пород говядина 600 кг.","price":86,"unit":"шт","home_animal_ids":[93],"weight_ids":[98]}
2532	2016-05-26 00:42:31.405991	2016-05-26 05:34:06.031283	farm	products	{"category_ids":[15,64,113],"title":"КУЗЯ наполнитель для котят впитывающий 4,5л 2,8кг","price":74,"unit":"шт","home_animal_ids":[94]}
2564	2016-05-26 00:42:34.218784	2016-05-26 05:23:21.265283	farm	products	{"category_ids":[15,64,112],"title":"РИО  волнистые попугаи осногвной 500г","price":72,"unit":"шт","home_animal_ids":[95],"weight_ids":[97]}
2531	2016-05-26 00:42:31.272839	2016-05-26 06:32:33.005377	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек в ассортименте 2,2кг","price":275,"unit":"шт","home_animal_ids":[94],"weight_ids":[120]}
2539	2016-05-26 00:42:31.986126	2016-05-26 05:14:08.616003	farm	products	{"category_ids":[15,64,112],"title":"НМ для взрослых собак средних пород 500г","price":71,"unit":"шт","home_animal_ids":[93],"weight_ids":[97]}
2533	2016-05-26 00:42:31.496348	2016-05-26 05:08:22.83945	farm	products	{"category_ids":[15,64,113],"title":"КУЗЯ наполнитель для кошек впитывающий 4,5л 2,8кг","price":74,"unit":"шт","home_animal_ids":[94]}
2545	2016-05-26 00:42:32.507513	2016-05-26 05:20:14.735039	farm	products	{"category_ids":[15,64,112],"title":"НМ для щенков ср. и мелк. пород 500г","price":79,"unit":"шт","home_animal_ids":[93],"weight_ids":[97]}
2555	2016-05-26 00:42:33.308385	2016-05-26 06:50:18.168017	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак миниатюрных пород курица 190г.","price":50,"unit":"шт","home_animal_ids":[93],"weight_ids":[119]}
2541	2016-05-26 00:42:32.151722	2016-05-26 06:50:22.807008	farm	products	{"category_ids":[15,64,112],"title":"НМ для кошек в асс.2кг.","price":395,"unit":"шт","home_animal_ids":[94],"weight_ids":[117]}
2560	2016-05-26 00:42:33.69756	2016-05-26 05:22:01.538622	farm	products	{"category_ids":[15,64,113],"title":"ПУСИ КЭТ Наполнитель древесный 4,5л.2,6кг","price":84,"unit":"шт","home_animal_ids":[94]}
2565	2016-05-26 00:42:34.297946	2016-05-26 05:20:35.7726	farm	products	{"category_ids":[15,64,112],"title":"РИО  канарейка 500г","price":93,"unit":"шт","home_animal_ids":[95],"weight_ids":[97]}
2540	2016-05-26 00:42:32.065053	2016-05-26 05:23:55.668823	farm	products	{"category_ids":[15,64,112],"title":"НМ для котят в асс.400г.","price":75,"unit":"шт","home_animal_ids":[94],"weight_ids":[96]}
2535	2016-05-26 00:42:31.663835	2016-05-26 05:42:54.200565	farm	products	{"category_ids":[15,64,112],"title":"НМ для взрослых кошек в асс.400г.","price":75,"unit":"шт","home_animal_ids":[94],"weight_ids":[96]}
2557	2016-05-26 00:42:33.46388	2016-05-26 05:16:34.651036	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак щенки 600 кг.","price":94,"unit":"шт","home_animal_ids":[93],"weight_ids":[98]}
2534	2016-05-26 00:42:31.574021	2016-05-26 07:21:17.570102	farm	products	{"category_ids":[15,64,113],"title":"Натуралист древесный 7л.2,5 кг.","price":74,"unit":"шт","home_animal_ids":[94]}
2558	2016-05-26 00:42:33.539683	2016-05-26 05:42:26.127229	farm	products	{"category_ids":[15,64,112],"title":"Про План д/стерильных кошек 400г.","price":260,"unit":"шт","home_animal_ids":[94],"weight_ids":[96]}
2552	2016-05-26 00:42:33.075343	2016-05-26 06:17:48.966942	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак миниатюрных пород говядина 1,2кг.","price":212,"unit":"шт","home_animal_ids":[93],"weight_ids":[103]}
2559	2016-05-26 00:42:33.617889	2016-05-26 05:33:36.519484	farm	products	{"category_ids":[15,64,113],"title":"ПУСИ КЭТ Наполнитель впитывающий 4,5л.2,8кг голубой","price":84,"unit":"шт","home_animal_ids":[94]}
2573	2016-05-26 00:42:35.064633	2016-05-26 05:07:53.783463	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для собак от блох клещей 4-10кг","price":294,"unit":"шт","home_animal_ids":[93]}
2595	2016-05-26 00:42:36.853505	2016-05-26 06:19:03.86185	farm	products	{"category_ids":[15,64,112],"title":"Фрискис 600 г.","price":144,"unit":"шт","home_animal_ids":[94],"weight_ids":[98]}
2581	2016-05-26 00:42:35.720228	2016-05-26 05:04:16.629145	farm	products	{"category_ids":[15,64,113],"title":"Серия 44 капли на холку 3*1 мл.","price":165,"unit":"шт","animal_ids":[]}
2588	2016-05-26 00:42:36.306599	2016-05-26 06:09:19.162775	farm	products	{"category_ids":[15,64,112],"title":"Тушенка для собак 340г.","price":65,"unit":"шт","home_animal_ids":[93],"weight_ids":[99]}
2594	2016-05-26 00:42:36.776478	2016-05-26 06:17:18.754582	farm	products	{"category_ids":[15,64,112],"title":"Фрискис 2 кг.","price":278,"unit":"шт","home_animal_ids":[94],"weight_ids":[117]}
2569	2016-05-26 00:42:34.732991	2016-05-26 05:33:54.353521	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для кошек от блох клещей до 4кг","price":260,"unit":"шт","home_animal_ids":[94]}
2570	2016-05-26 00:42:34.807842	2016-05-26 06:18:21.242458	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для кошек от блох клещей от 4кг","price":294,"unit":"шт","home_animal_ids":[94]}
2572	2016-05-26 00:42:34.974617	2016-05-26 05:12:34.475125	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для собак от блох клещей 20-40 кг","price":393,"unit":"шт","home_animal_ids":[93]}
2580	2016-05-26 00:42:35.641546	2016-05-26 05:12:08.049812	farm	products	{"category_ids":[15,64,113],"title":"Серия 44 капли на холку 2*0,5/0,75/1мл.","price":143,"unit":"шт","animal_ids":[]}
2586	2016-05-26 00:42:36.13147	2016-05-26 05:23:31.535138	farm	products	{"category_ids":[15,64,112],"title":"Терра Кот для взрослых кошек 400г.","price":56,"unit":"шт","home_animal_ids":[94],"weight_ids":[96]}
2584	2016-05-26 00:42:35.95099	2016-05-26 05:30:48.360745	farm	products	{"category_ids":[15,64,112],"title":"Терра Кот  в/у для взрослых кошек 85г.","price":16,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2591	2016-05-26 00:42:36.543037	2016-05-26 06:08:48.424449	farm	products	{"category_ids":[15,64,112],"title":"Фаворит Для кошек 4 кг","price":432,"unit":"шт","home_animal_ids":[94],"weight_ids":[106]}
2567	2016-05-26 00:42:34.487348	2016-05-26 05:14:36.042534	farm	products	{"category_ids":[15,64,112],"title":"РИО  средние попугаи осногвной 500г","price":81,"unit":"шт","home_animal_ids":[95],"weight_ids":[97]}
2596	2016-05-26 00:42:36.931974	2016-05-26 06:19:44.532309	farm	products	{"category_ids":[15,64,112],"title":"ЦЕЗАРЬ ПАУЧ д/собак курица с зелеными овощами 100г","price":33,"unit":"шт","home_animal_ids":[93],"weight_ids":[108]}
2601	2016-05-26 00:42:37.354314	2016-05-26 05:30:36.352822	farm	products	{"category_ids":[15,64,112],"title":"ШЕБА ПАУЧ д/кошек курица/индейка 85г.","price":35,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2593	2016-05-26 00:42:36.698113	2016-05-26 06:06:33.592804	farm	products	{"category_ids":[15,64,112],"title":"Фрискис 1,5 кг.","price":278,"unit":"шт","home_animal_ids":[94],"weight_ids":[116]}
2598	2016-05-26 00:42:37.098953	2016-05-26 06:51:18.354308	farm	products	{"category_ids":[15,64,112],"title":"ЧАППИ сух.д/собак говядина 15кг.","price":1250,"unit":"шт","home_animal_ids":[93],"weight_ids":[114]}
2600	2016-05-26 00:42:37.264778	2016-05-26 05:22:51.022373	farm	products	{"category_ids":[15,64,112],"title":"ШЕБА ПАУЧ д/кошек говядина ягненак 85г.","price":35,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2576	2016-05-26 00:42:35.307924	2016-05-26 05:34:52.596656	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Ошейник от клещей (кошки/щенки)","price":313,"unit":"шт","home_animal_ids":[93,94]}
2582	2016-05-26 00:42:35.796211	2016-05-26 05:20:25.582068	farm	products	{"category_ids":[15,64,112],"title":"Сильвер для средних попугаев 500г.","price":71,"unit":"шт","home_animal_ids":[95],"weight_ids":[97]}
2592	2016-05-26 00:42:36.62024	2016-05-26 06:50:15.39044	farm	products	{"category_ids":[15,64,113],"title":"ФРЕШ СТЕП наполнитель тройной контроль запохов 3,2кг","price":417,"unit":"шт","animal_ids":[]}
2579	2016-05-26 00:42:35.563764	2016-05-26 05:59:40.590979	farm	products	{"category_ids":[15,64,112],"title":"РОЯЛ КАНИН для крупных пород. 15 кг.","price":4873,"unit":"шт","home_animal_ids":[93],"weight_ids":[114]}
2583	2016-05-26 00:42:35.876099	2016-05-26 07:21:42.043801	farm	products	{"category_ids":[15,64,113],"title":"Счастливые лапкинаполнитель древесный 16л.","price":158,"unit":"шт","home_animal_ids":[94]}
2577	2016-05-26 00:42:35.395336	2016-05-26 05:24:06.88174	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Ошейник от клещей для собак","price":358,"unit":"шт","home_animal_ids":[93]}
2597	2016-05-26 00:42:37.02094	2016-05-26 05:43:18.089535	farm	products	{"category_ids":[15,64,112],"title":"ЧАППИ кон. Мясное изобилие 400г..","price":75,"unit":"шт","home_animal_ids":[93],"weight_ids":[96]}
2589	2016-05-26 00:42:36.387875	2016-05-26 05:30:25.941655	farm	products	{"category_ids":[15,64,112],"title":"Фаворит Для активных пород собак 13 кг","price":1400,"unit":"шт","home_animal_ids":[93],"weight_ids":[107]}
2575	2016-05-26 00:42:35.230007	2016-05-26 05:21:03.784969	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для собак от блох клещей до 4кг","price":260,"unit":"шт","home_animal_ids":[93]}
2568	2016-05-26 00:42:34.574195	2016-05-26 05:14:59.616208	farm	products	{"category_ids":[15,64,112],"title":"Робинзон для мелких попугаев 500г.","price":71,"unit":"шт","home_animal_ids":[95],"weight_ids":[97]}
2599	2016-05-26 00:42:37.175187	2016-05-26 05:16:09.271249	farm	products	{"category_ids":[15,64,112],"title":"ЧАППИ сух.д/собак мясное изобилие 600г.","price":60,"unit":"шт","home_animal_ids":[93],"weight_ids":[98]}
2578	2016-05-26 00:42:35.486908	2016-05-26 05:07:41.266448	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Ошейник от клещей для собак кр/пород","price":398,"unit":"шт","home_animal_ids":[93]}
2574	2016-05-26 00:42:35.153141	2016-05-26 05:12:22.362635	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для собак от блох клещей 40-60 кг","price":459,"unit":"шт","home_animal_ids":[93]}
2566	2016-05-26 00:42:34.395483	2016-05-26 05:29:16.633987	farm	products	{"category_ids":[15,64,112],"title":"РИО  средние попугаи линька 500г","price":89,"unit":"шт","home_animal_ids":[95],"weight_ids":[97]}
2603	2016-05-26 00:42:37.569841	2016-05-26 00:42:37.569841	farm	products	{"category_ids":[15,65],"title":"Лампа ИКЗК 220-250 красная","price":250,"unit":"шт","animal_ids":[49,50,51,52]}
2604	2016-05-26 00:42:37.663888	2016-05-26 00:42:37.663888	farm	products	{"category_ids":[15,65],"title":"Брудер 44х96х50 новой модификации собранный","price":6409,"unit":"шт","animal_ids":[49,50,51,52]}
2605	2016-05-26 00:42:37.7555	2016-05-26 00:42:37.7555	farm	products	{"category_ids":[15,65],"title":"Клетка для бройлеров \\"ПРОФЕССИОНАЛ 1-7\\"","price":3465,"unit":"шт","animal_ids":[49]}
2606	2016-05-26 00:42:37.837864	2016-05-26 00:42:37.837864	farm	products	{"category_ids":[15,65],"title":"Клетка для бройлеров \\"ПРОФЕССИОНАЛ 2-7\\"","price":6630,"unit":"шт","animal_ids":[49]}
2607	2016-05-26 00:42:37.92528	2016-05-26 00:42:37.92528	farm	products	{"category_ids":[15,65],"title":"Клетка для кур-несушек \\"ПРОФЕССИОНАЛ 1-7\\"","price":3868,"unit":"шт","animal_ids":[49]}
2608	2016-05-26 00:42:38.013188	2016-05-26 00:42:38.013188	farm	products	{"category_ids":[15,65],"title":"Клетка для кур-несушек \\"ПРОФЕССИОНАЛ 1-7\\" на колесах","price":4358,"unit":"шт","animal_ids":[49]}
2609	2016-05-26 00:42:38.100883	2016-05-26 00:42:38.100883	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"Профессионал\\" на 20 голов","price":2542,"unit":"шт","animal_ids":[51]}
2610	2016-05-26 00:42:38.191202	2016-05-26 00:42:38.191202	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"Профессионал\\" на 50 голов","price":4420,"unit":"шт","animal_ids":[51]}
2611	2016-05-26 00:42:38.266359	2016-05-26 00:42:38.266359	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"ПРОФЕССИОНАЛ+\\" на 100голов","price":8840,"unit":"шт","animal_ids":[51]}
2612	2016-05-26 00:42:38.345312	2016-05-26 00:42:38.345312	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"Профессионал+\\" на 30 голов","price":3045,"unit":"шт","animal_ids":[51]}
2613	2016-05-26 00:42:38.434464	2016-05-26 00:42:38.434464	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"Профессионал+\\" на 50 голов","price":4420,"unit":"шт","animal_ids":[51]}
2614	2016-05-26 00:42:38.51369	2016-05-26 00:42:38.51369	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"Профессионал+\\" на 50 голов на колесах","price":4973,"unit":"шт","animal_ids":[51]}
2615	2016-05-26 00:42:38.613231	2016-05-26 00:42:38.613231	farm	products	{"category_ids":[15,65],"title":"Клеточная батарея для кроликов 2-1","price":6077,"unit":"шт","animal_ids":[55]}
2616	2016-05-26 00:42:38.709125	2016-05-26 00:42:38.709125	farm	products	{"category_ids":[15,65],"title":"Лоток на 88 куриных","price":618,"unit":"шт","animal_ids":[49]}
2617	2016-05-26 00:42:38.787385	2016-05-26 00:42:38.787385	farm	products	{"category_ids":[15,66],"title":"Ижевск ПК1 несушек 48 недель","price":20,"unit":"шт","animal_ids":[49]}
2618	2016-05-26 00:42:38.876429	2016-05-26 00:42:38.876429	farm	products	{"category_ids":[15,66],"title":"К-58 ГР ПЗ для откорма свин. до жирн. конд.","price":16,"unit":"кг","animal_ids":[53]}
2619	2016-05-26 00:42:39.043649	2016-05-26 00:42:39.043649	farm	products	{"category_ids":[15,66],"title":"К-58 для откорма свиней специальный","price":18,"unit":"кг","animal_ids":[53]}
2620	2016-05-26 00:42:39.224066	2016-05-26 00:42:39.224066	farm	products	{"category_ids":[15,66],"title":"К-58 КР для откорма свиней до жирн. конд.","price":21,"unit":"кг","animal_ids":[53]}
2621	2016-05-26 00:42:39.331126	2016-05-26 00:42:39.331126	farm	products	{"category_ids":[15,66],"title":"К-60 для коров специальный","price":18,"unit":"кг","animal_ids":[54]}
2622	2016-05-26 00:42:39.411491	2016-05-26 00:42:39.411491	farm	products	{"category_ids":[15,66],"title":"К-65 для откорма КРС","price":20,"unit":"кг","animal_ids":[54]}
2623	2016-05-26 00:42:39.541808	2016-05-26 00:42:39.541808	farm	products	{"category_ids":[15,66],"title":"КК-111 Комбикорм-концетрат для рыбы","price":29,"unit":"кг","animal_ids":[]}
2624	2016-05-26 00:42:39.636469	2016-05-26 00:42:39.636469	farm	products	{"category_ids":[15,66],"title":"Курск Для взрослых кроликов","price":17,"unit":"шт","animal_ids":[55]}
2625	2016-05-26 00:42:39.712281	2016-05-26 00:42:39.712281	farm	products	{"category_ids":[15,66],"title":"Курск Для откорма Свиней","price":17,"unit":"кг","animal_ids":[53]}
2626	2016-05-26 00:42:39.814357	2016-05-26 00:42:39.814357	farm	products	{"category_ids":[15,66],"title":"Курск несушек 48 недель","price":19,"unit":"шт","animal_ids":[49]}
2627	2016-05-26 00:42:39.927542	2016-05-26 00:42:39.927542	farm	products	{"category_ids":[15,66],"title":"Отруби пшеничные кормовые","price":13,"unit":"кг","animal_ids":[49,50,52,53,54]}
2628	2016-05-26 00:42:40.01489	2016-05-26 00:42:40.01489	farm	products	{"category_ids":[15,66],"title":"ПЗК-91 для кроликов","price":20,"unit":"кг","animal_ids":[55]}
2629	2016-05-26 00:42:40.1024	2016-05-26 00:42:40.1024	farm	products	{"category_ids":[15,66],"title":"ПК-1 П для перепелов 7 недель и старше","price":30,"unit":"кг","animal_ids":[51]}
2630	2016-05-26 00:42:40.190557	2016-05-26 00:42:40.190557	farm	products	{"category_ids":[15,66],"title":"ПК-1/2 для кур несушек 48 нед. и старше","price":24,"unit":"кг","animal_ids":[49]}
2631	2016-05-26 00:42:40.279752	2016-05-26 00:42:40.279752	farm	products	{"category_ids":[15,66],"title":"ПК-1/2 для кур специальный ЕРШ","price":18,"unit":"кг","animal_ids":[49]}
2632	2016-05-26 00:42:40.360445	2016-05-26 00:42:40.360445	farm	products	{"category_ids":[15,66],"title":"ПК-1/2 ПЗ для кур несушек 48 нед. и старше","price":16,"unit":"кг","animal_ids":[49]}
2633	2016-05-26 00:42:40.446199	2016-05-26 00:42:40.446199	farm	products	{"category_ids":[15,66],"title":"ПК-10 для взрослых индеек","price":25,"unit":"кг","animal_ids":[52]}
2634	2016-05-26 00:42:40.535446	2016-05-26 00:42:40.535446	farm	products	{"category_ids":[15,66],"title":"ПК-2 для молод. Кур 1-7 нед по заказу","price":39,"unit":"кг","animal_ids":[49]}
2635	2016-05-26 00:42:40.611791	2016-05-26 00:42:40.611791	farm	products	{"category_ids":[15,66],"title":"ПК-30 для гусей родительского стада","price":29,"unit":"кг","animal_ids":[50]}
2636	2016-05-26 00:42:40.690225	2016-05-26 00:42:40.690225	farm	products	{"category_ids":[15,66],"title":"ПК-4 для молод кур 14-17 нед.","price":25,"unit":"кг","animal_ids":[]}
2637	2016-05-26 00:42:40.777645	2016-05-26 00:42:40.777645	farm	products	{"category_ids":[15,66],"title":"ПК-5 для бройлеров 1-4 нед","price":39,"unit":"кг","animal_ids":[49,50,51,52]}
2638	2016-05-26 00:42:40.856726	2016-05-26 00:42:40.856726	farm	products	{"category_ids":[15,66],"title":"ПК-6 для бройлеров 5 нед и старше","price":37,"unit":"кг","animal_ids":[49]}
2639	2016-05-26 00:42:40.957147	2016-05-26 00:42:40.957147	farm	products	{"category_ids":[15,66],"title":"СК Смесь кормовая","price":17,"unit":"кг","animal_ids":[49,50,52,53,54,55]}
2797	2016-05-26 00:42:58.311584	2016-05-26 00:42:58.311584	farm	products	{"category_ids":[15,70],"title":"На счастье","price":2079,"unit":"шт","animal_ids":[]}
2640	2016-05-26 00:42:41.047958	2016-05-26 00:42:41.047958	farm	products	{"category_ids":[15,67],"title":"Бункерная кормушка для кроликов-гигантов( бол)","price":600,"unit":"шт","animal_ids":[55]}
2641	2016-05-26 00:42:41.14892	2016-05-26 00:42:41.14892	farm	products	{"category_ids":[15,67],"title":"Бункерная кормушка из оцинковки для кроликов 1 кг","price":336,"unit":"шт","animal_ids":[55]}
2642	2016-05-26 00:42:41.256117	2016-05-26 00:42:41.256117	farm	products	{"category_ids":[15,67],"title":"Бункерная кормушка из оцинковки для кроликов 3 кг","price":417,"unit":"шт","animal_ids":[49,50,51,52,55]}
2643	2016-05-26 00:42:41.364222	2016-05-26 00:42:41.364222	farm	products	{"category_ids":[15,67],"title":"Бункерная кормушка из оцинковки на 10 л","price":476,"unit":"шт","animal_ids":[49,50,51,52]}
2644	2016-05-26 00:42:41.464225	2016-05-26 00:42:41.464225	farm	products	{"category_ids":[15,67],"title":"Бункерная кормушка оцинкованная на 25 л","price":807,"unit":"шт","animal_ids":[49,50,51,52]}
2645	2016-05-26 00:42:41.546903	2016-05-26 00:42:41.546903	farm	products	{"category_ids":[15,67],"title":"Навесная кормушка  для перепелов 89 см","price":332,"unit":"шт","animal_ids":[51]}
2646	2016-05-26 00:42:41.640233	2016-05-26 00:42:41.640233	farm	products	{"category_ids":[15,67],"title":"Навесная кормушка для кур 44 см","price":321,"unit":"шт","animal_ids":[49,50,52]}
2647	2016-05-26 00:42:41.726556	2016-05-26 00:42:41.726556	farm	products	{"category_ids":[15,67],"title":"Навесная кормушка для кур 80 см","price":387,"unit":"шт","animal_ids":[49,50,52]}
2648	2016-05-26 00:42:41.808945	2016-05-26 00:42:41.808945	farm	products	{"category_ids":[15,67],"title":"Автопоилка для молодняка птиц","price":238,"unit":"шт","animal_ids":[49]}
2649	2016-05-26 00:42:41.906785	2016-05-26 00:42:41.906785	farm	products	{"category_ids":[15,67],"title":"Бак для воды","price":960,"unit":"шт","animal_ids":[49]}
2650	2016-05-26 00:42:42.043913	2016-05-26 00:42:42.043913	farm	products	{"category_ids":[15,67],"title":"Инфракрасный нагреватель","price":714,"unit":"шт","animal_ids":[49,50,51,52]}
2651	2016-05-26 00:42:42.149381	2016-05-26 00:42:42.149381	farm	products	{"category_ids":[15,67],"title":"Кормушка бункерная для цыплят 1 л","price":179,"unit":"шт","animal_ids":[49,50,52]}
2652	2016-05-26 00:42:42.252524	2016-05-26 00:42:42.252524	farm	products	{"category_ids":[15,67],"title":"Кормушка бункерная для цыплят 3 кг","price":227,"unit":"шт","animal_ids":[49,50,52]}
2653	2016-05-26 00:42:42.341506	2016-05-26 00:42:42.341506	farm	products	{"category_ids":[15,67],"title":"Кормушка бункерная прозрачная для кур 10 л","price":580,"unit":"шт","animal_ids":[49,50,52]}
2654	2016-05-26 00:42:42.435987	2016-05-26 00:42:42.435987	farm	products	{"category_ids":[15,67],"title":"Кормушка бункерная с крышкой 6кг. для кур (КБ-6)","price":445,"unit":"шт","animal_ids":[49,50,52]}
2655	2016-05-26 00:42:42.559822	2016-05-26 00:42:42.559822	farm	products	{"category_ids":[15,67],"title":"Кормушка под банку","price":119,"unit":"шт","animal_ids":[49,50,52]}
2656	2016-05-26 00:42:42.655621	2016-05-26 00:42:42.655621	farm	products	{"category_ids":[15,67],"title":"Кормушка/поилка лотковая 50см для цыплят (КЖ-50)","price":250,"unit":"шт","animal_ids":[49,50,51,52]}
2657	2016-05-26 00:42:42.743906	2016-05-26 00:42:42.743906	farm	products	{"category_ids":[15,67],"title":"Ниппелная поилка ПКН-6 для взрослого поголовья птиц","price":30,"unit":"шт","animal_ids":[49,51,52]}
2658	2016-05-26 00:42:42.828811	2016-05-26 00:42:42.828811	farm	products	{"category_ids":[15,67],"title":"Ниппель ПКН-6/360 для бройлеров и перепелов","price":40,"unit":"шт","animal_ids":[49,51,52]}
2659	2016-05-26 00:42:42.916928	2016-05-26 00:42:42.916928	farm	products	{"category_ids":[15,67],"title":"Овоскоп","price":595,"unit":"шт","animal_ids":[49,50,51,52]}
2660	2016-05-26 00:42:43.062752	2016-05-26 00:42:43.062752	farm	products	{"category_ids":[15,67],"title":"Поилка вакуумная на 10 литров","price":548,"unit":"шт","animal_ids":[49,50,52]}
2661	2016-05-26 00:42:43.150546	2016-05-26 00:42:43.150546	farm	products	{"category_ids":[15,67],"title":"Поилка вакуумная на 3 литра","price":262,"unit":"шт","animal_ids":[49,50,52]}
2662	2016-05-26 00:42:43.23727	2016-05-26 00:42:43.23727	farm	products	{"category_ids":[15,67],"title":"Поилка вакуумная на 5 литров","price":346,"unit":"шт","animal_ids":[49,50,52]}
2663	2016-05-26 00:42:43.333411	2016-05-26 00:42:43.333411	farm	products	{"category_ids":[15,67],"title":"Поилка вакуумная на 7,5 литров","price":417,"unit":"шт","animal_ids":[49,50,52]}
2664	2016-05-26 00:42:43.425032	2016-05-26 00:42:43.425032	farm	products	{"category_ids":[15,67],"title":"Поилка двойная с креплением и каплеулавливателем ПКНК-24/360","price":100,"unit":"шт","animal_ids":[49,52]}
2665	2016-05-26 00:42:43.623656	2016-05-26 00:42:43.623656	farm	products	{"category_ids":[15,67],"title":"Поилка для кроликов ПКН-10 в комплекте с крепление","price":54,"unit":"шт","animal_ids":[55]}
2666	2016-05-26 00:42:43.728965	2016-05-26 00:42:43.728965	farm	products	{"category_ids":[15,67],"title":"Поилка для цыплят 1.5 л","price":179,"unit":"шт","animal_ids":[49,52]}
2667	2016-05-26 00:42:43.813004	2016-05-26 00:42:43.813004	farm	products	{"category_ids":[15,67],"title":"Поилка микрочашечная ПМЧ-10 для перепелов, тройник,крепеж отдельно","price":54,"unit":"шт","animal_ids":[51]}
2668	2016-05-26 00:42:43.901162	2016-05-26 00:42:43.901162	farm	products	{"category_ids":[15,67],"title":"Поилка ниппельная ПСН-33 для свиней","price":179,"unit":"шт","animal_ids":[53]}
2669	2016-05-26 00:42:44.029487	2016-05-26 00:42:44.029487	farm	products	{"category_ids":[15,67],"title":"Поилка ПЖН-8/360 с креплением","price":54,"unit":"шт","animal_ids":[49,52]}
2670	2016-05-26 00:42:44.11533	2016-05-26 00:42:44.11533	farm	products	{"category_ids":[15,67],"title":"Поилка ПКН-7 для кроликов с резьбой и гайкой","price":47,"unit":"шт","animal_ids":[55]}
2671	2016-05-26 00:42:44.253986	2016-05-26 00:42:44.253986	farm	products	{"category_ids":[15,67],"title":"Поилка ПКН-9 для кроликов с креплением","price":58,"unit":"шт","animal_ids":[]}
2672	2016-05-26 00:42:44.353057	2016-05-26 00:42:44.353057	farm	products	{"category_ids":[15,67],"title":"Поилка ПКНК-12/360 оснащена креплением под круглую трубу 25 мм","price":80,"unit":"шт","animal_ids":[49,51,52]}
2673	2016-05-26 00:42:44.45633	2016-05-26 00:42:44.45633	farm	products	{"category_ids":[15,67],"title":"Поилка ПКНК-14/360 с креплением и каплеулавливател","price":85,"unit":"шт","animal_ids":[49,51,52]}
2674	2016-05-26 00:42:44.542586	2016-05-26 00:42:44.542586	farm	products	{"category_ids":[15,67],"title":"Поилка ПКНС-8 с наружным креплением на сетку, под","price":47,"unit":"шт","animal_ids":[]}
2675	2016-05-26 00:42:44.633565	2016-05-26 00:42:44.633565	farm	products	{"category_ids":[15,67],"title":"Поилка под бутылку","price":381,"unit":"шт","animal_ids":[]}
2676	2016-05-26 00:42:44.725594	2016-05-26 00:42:44.725594	farm	products	{"category_ids":[15,67],"title":"Тройник белый 8 мм","price":23,"unit":"шт","animal_ids":[49,51,52,55]}
2677	2016-05-26 00:42:44.816388	2016-05-26 00:42:44.816388	farm	products	{"category_ids":[15,67],"title":"Тройник красный 10 мм","price":34,"unit":"шт","animal_ids":[49,51,52,55]}
2678	2016-05-26 00:42:44.964882	2016-05-26 00:42:44.964882	farm	products	{"category_ids":[15,67],"title":"Шланг для ниппельного поения 10мм","price":39,"unit":"м","animal_ids":[49,51,52,55]}
2679	2016-05-26 00:42:45.150637	2016-05-26 00:42:45.150637	farm	products	{"category_ids":[15,67],"title":"Шланг для ниппельного поения 8мм","price":40,"unit":"м","animal_ids":[49,51,52,55]}
2680	2016-05-26 00:42:45.245011	2016-05-26 00:42:45.245011	farm	products	{"category_ids":[15,67],"title":"Штуцер диаметром 10 мм","price":40,"unit":"шт","animal_ids":[49,51,52,55]}
2681	2016-05-26 00:42:45.347969	2016-05-26 00:42:45.347969	farm	products	{"category_ids":[15,68],"title":"БВМД для кур-несушек и другой домашней птицы 500 гр","price":76,"unit":"шт","animal_ids":[49,50,51,52]}
2682	2016-05-26 00:42:45.479203	2016-05-26 00:42:45.479203	farm	products	{"category_ids":[15,68],"title":"БВМД для свиней 300 гр","price":61,"unit":"шт","animal_ids":[53]}
2683	2016-05-26 00:42:45.613796	2016-05-26 00:42:45.613796	farm	products	{"category_ids":[15,68],"title":"Белковая  кормосмесь (500г) (аналог кормовых дрожжей)","price":69,"unit":"шт","animal_ids":[49,50,51,52,53]}
2684	2016-05-26 00:42:45.707881	2016-05-26 00:42:45.707881	farm	products	{"category_ids":[15,68],"title":"Белковая  кормосмесь 2кг (аналог кормовых дрожжей)","price":251,"unit":"шт","animal_ids":[49,50,51,52,53]}
2685	2016-05-26 00:42:45.792055	2016-05-26 00:42:45.792055	farm	products	{"category_ids":[15,68],"title":"Вазелин 200г  (банка)","price":65,"unit":"шт","animal_ids":[54]}
2686	2016-05-26 00:42:45.893775	2016-05-26 00:42:45.893775	farm	products	{"category_ids":[15,68],"title":"Готовый корм для перепелов (2 кг) Б.","price":190,"unit":"шт","animal_ids":[51]}
2687	2016-05-26 00:42:46.002401	2016-05-26 00:42:46.002401	farm	products	{"category_ids":[15,68],"title":"Готовый корм для цыплят (2 кг) Б.","price":180,"unit":"шт","animal_ids":[49]}
2688	2016-05-26 00:42:46.1057	2016-05-26 00:42:46.1057	farm	products	{"category_ids":[15,68],"title":"Кормовой антибиотик для всех видов животных и птиц \\"Биовит-80\\" 450 гр","price":154,"unit":"шт","animal_ids":[49,50,51,52,53,54,55]}
2689	2016-05-26 00:42:46.19018	2016-05-26 00:42:46.19018	farm	products	{"category_ids":[15,68],"title":"Крем для доения \\"Денница\\" (200гр.) банка","price":81,"unit":"шт","animal_ids":[54]}
2690	2016-05-26 00:42:46.290611	2016-05-26 00:42:46.290611	farm	products	{"category_ids":[15,68],"title":"Крем для доения \\"Денница\\" (500гр.)","price":147,"unit":"шт","animal_ids":[54]}
2691	2016-05-26 00:42:46.424266	2016-05-26 00:42:46.424266	farm	products	{"category_ids":[15,68],"title":"Крем для доения \\"Зорька\\" 200 гр.","price":137,"unit":"шт","animal_ids":[54]}
2692	2016-05-26 00:42:46.516106	2016-05-26 00:42:46.516106	farm	products	{"category_ids":[15,68],"title":"Крем для доения \\"Ночка\\" банка 200г.","price":115,"unit":"шт","animal_ids":[54]}
2693	2016-05-26 00:42:46.615991	2016-05-26 00:42:46.615991	farm	products	{"category_ids":[15,68],"title":"Крем для доения Ночка, банка 750г","price":335,"unit":"шт","animal_ids":[54]}
2694	2016-05-26 00:42:46.701378	2016-05-26 00:42:46.701378	farm	products	{"category_ids":[15,68],"title":"Крем Любава 250мл. с ионами серебра .","price":175,"unit":"шт","animal_ids":[54]}
2695	2016-05-26 00:42:46.825102	2016-05-26 00:42:46.825102	farm	products	{"category_ids":[15,68],"title":"Лимисол-Ф (брикет 5кг)","price":230,"unit":"шт","animal_ids":[54]}
2696	2016-05-26 00:42:46.941847	2016-05-26 00:42:46.941847	farm	products	{"category_ids":[15,68],"title":"Мел кормовой 2,5 кг ДС","price":103,"unit":"шт","animal_ids":[49,50,51,52,53,54]}
2697	2016-05-26 00:42:47.042361	2016-05-26 00:42:47.042361	farm	products	{"category_ids":[15,68],"title":"Минеральный комплекс для домашней птицы 1,6 кг ДС","price":137,"unit":"шт","animal_ids":[49,50,51,52]}
2698	2016-05-26 00:42:47.144473	2016-05-26 00:42:47.144473	farm	products	{"category_ids":[15,68],"title":"Минеральный комплекс для домашней птицы 500 гр ДС","price":52,"unit":"шт","animal_ids":[49,50,51,52]}
2699	2016-05-26 00:42:47.235598	2016-05-26 00:42:47.235598	farm	products	{"category_ids":[15,68],"title":"Мясокостная мука 2 кг","price":272,"unit":"шт","animal_ids":[49,50,51,52,53]}
2700	2016-05-26 00:42:47.325843	2016-05-26 00:42:47.325843	farm	products	{"category_ids":[15,68],"title":"Мясокостная мука 400 гр","price":75,"unit":"шт","animal_ids":[49,50,51,52,53]}
2701	2016-05-26 00:42:47.422335	2016-05-26 00:42:47.422335	farm	products	{"category_ids":[15,68],"title":"Премикс \\"РАСКЛЕВУ-БОЙ!!!\\" 500г Б (против расклева яиц и канибализ. у птиц) спец состав","price":205,"unit":"шт","animal_ids":[49,50,51,52]}
2702	2016-05-26 00:42:47.504644	2016-05-26 00:42:47.504644	farm	products	{"category_ids":[15,68],"title":"Премикс для бройлеров 150 гр","price":58,"unit":"шт","animal_ids":[49]}
2703	2016-05-26 00:42:47.593377	2016-05-26 00:42:47.593377	farm	products	{"category_ids":[15,68],"title":"Премикс для голубей (500 гр.) Б","price":129,"unit":"шт","animal_ids":[49]}
2704	2016-05-26 00:42:47.748995	2016-05-26 00:42:47.748995	farm	products	{"category_ids":[15,68],"title":"Премикс для домашней птицы йодированный (500г) Б","price":111,"unit":"шт","animal_ids":[49,50,51,52]}
2705	2016-05-26 00:42:47.944278	2016-05-26 00:42:47.944278	farm	products	{"category_ids":[15,68],"title":"Премикс для коз и овец 200 гр.","price":51,"unit":"шт","animal_ids":[54]}
2706	2016-05-26 00:42:48.024059	2016-05-26 00:42:48.024059	farm	products	{"category_ids":[15,68],"title":"Премикс для кроликов и нутрий 200г ДС","price":56,"unit":"шт","animal_ids":[55]}
2707	2016-05-26 00:42:48.124488	2016-05-26 00:42:48.124488	farm	products	{"category_ids":[15,68],"title":"Премикс для кур-несушек и другой дом. птицы \\"Совершенная Формула\\" 150 гр.","price":78,"unit":"шт","animal_ids":[49,50,51,52]}
2708	2016-05-26 00:42:48.272464	2016-05-26 00:42:48.272464	farm	products	{"category_ids":[15,68],"title":"Премикс для кур-несушек и другой домашней птицы 150 гр.","price":46,"unit":"шт","animal_ids":[49,50,51,52]}
2709	2016-05-26 00:42:48.366079	2016-05-26 00:42:48.366079	farm	products	{"category_ids":[15,68],"title":"Премикс для кур-несушек и другой домашней птицы 30","price":84,"unit":"шт","animal_ids":[49,50,51,52]}
2710	2016-05-26 00:42:48.465453	2016-05-26 00:42:48.465453	farm	products	{"category_ids":[15,68],"title":"Премикс для кур-несушек и другой птицы  (500 гр) Б","price":91,"unit":"шт","animal_ids":[49,50,51,52]}
2711	2016-05-26 00:42:48.62429	2016-05-26 00:42:48.62429	farm	products	{"category_ids":[15,68],"title":"Премикс для молочных коров (500 гр) Б.","price":82,"unit":"шт","animal_ids":[54]}
2712	2016-05-26 00:42:48.81096	2016-05-26 00:42:48.81096	farm	products	{"category_ids":[15,68],"title":"Премикс для молочных коров 150 гр.","price":57,"unit":"шт","animal_ids":[54]}
2713	2016-05-26 00:42:49.032264	2016-05-26 00:42:49.032264	farm	products	{"category_ids":[15,68],"title":"Премикс для молочных коров 300 гр","price":104,"unit":"шт","animal_ids":[54]}
2714	2016-05-26 00:42:49.237578	2016-05-26 00:42:49.237578	farm	products	{"category_ids":[15,68],"title":"Премикс для молочных поросят 300 гр.","price":80,"unit":"шт","animal_ids":[53]}
2715	2016-05-26 00:42:49.491114	2016-05-26 00:42:49.491114	farm	products	{"category_ids":[15,68],"title":"Премикс для поросят (500 г) Б.","price":94,"unit":"шт","animal_ids":[53]}
2716	2016-05-26 00:42:49.714618	2016-05-26 00:42:49.714618	farm	products	{"category_ids":[15,68],"title":"Премикс для профилактики птичьего гриппа 500г","price":130,"unit":"шт","animal_ids":[49,50,51,52]}
2717	2016-05-26 00:42:49.815837	2016-05-26 00:42:49.815837	farm	products	{"category_ids":[15,68],"title":"Премикс для свиней (500 гр) Б.","price":85,"unit":"шт","animal_ids":[53]}
2718	2016-05-26 00:42:49.904998	2016-05-26 00:42:49.904998	farm	products	{"category_ids":[15,68],"title":"Премикс для свиней на откорме 150 гр","price":47,"unit":"шт","animal_ids":[53]}
2719	2016-05-26 00:42:49.990052	2016-05-26 00:42:49.990052	farm	products	{"category_ids":[15,68],"title":"Премикс для свиней на откорме 300 гр","price":71,"unit":"шт","animal_ids":[53]}
2720	2016-05-26 00:42:50.178402	2016-05-26 00:42:50.178402	farm	products	{"category_ids":[15,68],"title":"Премикс для свиноматок 150 гр.","price":44,"unit":"шт","animal_ids":[53]}
2721	2016-05-26 00:42:50.347152	2016-05-26 00:42:50.347152	farm	products	{"category_ids":[15,68],"title":"Премикс для телят (500 гр) Б.","price":92,"unit":"шт","animal_ids":[54]}
2722	2016-05-26 00:42:50.471301	2016-05-26 00:42:50.471301	farm	products	{"category_ids":[15,68],"title":"Премикс для телят 300 гр","price":80,"unit":"шт","animal_ids":[54]}
2723	2016-05-26 00:42:50.687633	2016-05-26 00:42:50.687633	farm	products	{"category_ids":[15,68],"title":"Премикс для улучшения качества скорлупы  \\"Скорлуп-Ca\\" 500г","price":85,"unit":"шт","animal_ids":[49,50,51,52]}
2724	2016-05-26 00:42:50.881179	2016-05-26 00:42:50.881179	farm	products	{"category_ids":[15,68],"title":"Премикс для цыплят, утят, гусят, индюшат (500 гр) Б.","price":113,"unit":"шт","animal_ids":[49,50,51,52]}
2725	2016-05-26 00:42:50.962632	2016-05-26 00:42:50.962632	farm	products	{"category_ids":[15,68],"title":"Премикс для цыплят,утят,индюшат.150гр.","price":58,"unit":"шт","animal_ids":[53]}
2726	2016-05-26 00:42:51.046341	2016-05-26 00:42:51.046341	farm	products	{"category_ids":[15,68],"title":"Премикс противоглист. профилакт.  для свиней (Альбазол-С) 300 г","price":79,"unit":"шт","animal_ids":[]}
2727	2016-05-26 00:42:51.166491	2016-05-26 00:42:51.166491	farm	products	{"category_ids":[15,68],"title":"Прикормка для рыб универсальная 1 кг","price":105,"unit":"шт","animal_ids":[]}
2728	2016-05-26 00:42:51.263914	2016-05-26 00:42:51.263914	farm	products	{"category_ids":[15,68],"title":"Примекс для кур \\"Антистрес\\" Доб-ка","price":113,"unit":"шт","animal_ids":[49,50,52]}
2729	2016-05-26 00:42:51.35974	2016-05-26 00:42:51.35974	farm	products	{"category_ids":[15,68],"title":"Ракушка калиброванная 1кг","price":47,"unit":"шт","animal_ids":[49,50,51,52]}
2730	2016-05-26 00:42:51.445163	2016-05-26 00:42:51.445163	farm	products	{"category_ids":[15,68],"title":"Ракушка калиброванная 4кг.","price":136,"unit":"шт","animal_ids":[49,50,51,52]}
2731	2016-05-26 00:42:51.540125	2016-05-26 00:42:51.540125	farm	products	{"category_ids":[15,68],"title":"Рыбий жир 100мл ДС","price":73,"unit":"шт","animal_ids":[53]}
2732	2016-05-26 00:42:51.747441	2016-05-26 00:42:51.747441	farm	products	{"category_ids":[15,68],"title":"Рыбная мука 2 кг","price":507,"unit":"шт","animal_ids":[49,50,51,52,53]}
2733	2016-05-26 00:42:51.849038	2016-05-26 00:42:51.849038	farm	products	{"category_ids":[15,68],"title":"Рыбная мука 300 гр","price":85,"unit":"шт","animal_ids":[49,50,51,52,53]}
2734	2016-05-26 00:42:51.943168	2016-05-26 00:42:51.943168	farm	products	{"category_ids":[15,68],"title":"Сера кормовая  \\"Рацион\\" 300 гр.","price":54,"unit":"шт","animal_ids":[49,50,51,52,53,54]}
2735	2016-05-26 00:42:52.024388	2016-05-26 00:42:52.024388	farm	products	{"category_ids":[15,68],"title":"Соль поваренная кормовая йод (брикет 5кг)","price":195,"unit":"шт","animal_ids":[54]}
2736	2016-05-26 00:42:52.112777	2016-05-26 00:42:52.112777	farm	products	{"category_ids":[15,68],"title":"Травяная мука 1,5кг","price":185,"unit":"шт","animal_ids":[50,53,54,55]}
2737	2016-05-26 00:42:52.216964	2016-05-26 00:42:52.216964	farm	products	{"category_ids":[15,68],"title":"Цеолитовый природный комплекс  для всех видов с/х животных 1,3 кг","price":133,"unit":"шт","animal_ids":[49,50,51,52,53,54,55]}
2738	2016-05-26 00:42:52.362726	2016-05-26 00:42:52.362726	farm	products	{"category_ids":[15,68],"title":"Цеолитовый природный комплекс  для домашней птицы 500 гр","price":57,"unit":"шт","animal_ids":[49,50,51,52]}
2739	2016-05-26 00:42:52.454833	2016-05-26 00:42:52.454833	farm	products	{"category_ids":[15,68],"title":"Цеолитовый природный комплекс  для свиней 1,3 кг","price":123,"unit":"шт","animal_ids":[53]}
2740	2016-05-26 00:42:52.557956	2016-05-26 00:42:52.557956	farm	products	{"category_ids":[15,68],"title":"Шрот подсолнечный 1,6 кг.","price":190,"unit":"шт","animal_ids":[49,50,52,53]}
2741	2016-05-26 00:42:52.652611	2016-05-26 00:42:52.652611	farm	products	{"category_ids":[15,69],"title":"Баклажан \\"Алмаз\\"","price":50,"unit":"шт","animal_ids":[]}
2742	2016-05-26 00:42:52.739521	2016-05-26 00:42:52.739521	farm	products	{"category_ids":[15,69],"title":"Бархатцы","price":50,"unit":"шт","animal_ids":[]}
2743	2016-05-26 00:42:52.825102	2016-05-26 00:42:52.825102	farm	products	{"category_ids":[15,69],"title":"Виола","price":60,"unit":"шт","animal_ids":[]}
2744	2016-05-26 00:42:52.916978	2016-05-26 00:42:52.916978	farm	products	{"category_ids":[15,69],"title":"Герань","price":650,"unit":"шт","animal_ids":[]}
2745	2016-05-26 00:42:53.000133	2016-05-26 00:42:53.000133	farm	products	{"category_ids":[15,69],"title":"Кабачки \\"Искандер\\"","price":50,"unit":"шт","animal_ids":[]}
2746	2016-05-26 00:42:53.077508	2016-05-26 00:42:53.077508	farm	products	{"category_ids":[15,69],"title":"Капуста поздняя","price":50,"unit":"шт","animal_ids":[]}
2747	2016-05-26 00:42:53.154039	2016-05-26 00:42:53.154039	farm	products	{"category_ids":[15,69],"title":"Капуста раняя","price":50,"unit":"шт","animal_ids":[]}
2748	2016-05-26 00:42:53.246965	2016-05-26 00:42:53.246965	farm	products	{"category_ids":[15,69],"title":"Кашпо","price":250,"unit":"шт","animal_ids":[]}
2749	2016-05-26 00:42:53.37735	2016-05-26 00:42:53.37735	farm	products	{"category_ids":[15,69],"title":"Огурец \\"Герман\\"","price":50,"unit":"шт","animal_ids":[]}
2750	2016-05-26 00:42:53.466556	2016-05-26 00:42:53.466556	farm	products	{"category_ids":[15,69],"title":"Пекинская капуста \\"Любимая\\"","price":50,"unit":"шт","animal_ids":[]}
2751	2016-05-26 00:42:53.556234	2016-05-26 00:42:53.556234	farm	products	{"category_ids":[15,69],"title":"Перец \\"Белозерка\\"","price":50,"unit":"шт","animal_ids":[]}
2752	2016-05-26 00:42:53.713393	2016-05-26 00:42:53.713393	farm	products	{"category_ids":[15,69],"title":"Перец \\"Виннипух\\"","price":50,"unit":"шт","animal_ids":[]}
2753	2016-05-26 00:42:53.802236	2016-05-26 00:42:53.802236	farm	products	{"category_ids":[15,69],"title":"Перец острый","price":50,"unit":"шт","animal_ids":[]}
2754	2016-05-26 00:42:53.886676	2016-05-26 00:42:53.886676	farm	products	{"category_ids":[15,69],"title":"Петунья","price":60,"unit":"шт","animal_ids":[]}
2755	2016-05-26 00:42:54.033602	2016-05-26 00:42:54.033602	farm	products	{"category_ids":[15,69],"title":"Тамат \\"Джина\\"","price":50,"unit":"шт","animal_ids":[]}
2756	2016-05-26 00:42:54.156074	2016-05-26 00:42:54.156074	farm	products	{"category_ids":[15,69],"title":"Томат \\"Бычье сердце\\"","price":50,"unit":"шт","animal_ids":[]}
2757	2016-05-26 00:42:54.235257	2016-05-26 00:42:54.235257	farm	products	{"category_ids":[15,69],"title":"Томат \\"Де барао\\"","price":50,"unit":"шт","animal_ids":[]}
2758	2016-05-26 00:42:54.367497	2016-05-26 00:42:54.367497	farm	products	{"category_ids":[15,69],"title":"Томат \\"Новичок\\"","price":50,"unit":"шт","animal_ids":[]}
2759	2016-05-26 00:42:54.521858	2016-05-26 00:42:54.521858	farm	products	{"category_ids":[15,69],"title":"Томат \\"Челнок\\"","price":50,"unit":"шт","animal_ids":[]}
2760	2016-05-26 00:42:54.645833	2016-05-26 00:42:54.645833	farm	products	{"category_ids":[15,70],"title":"12 месецев","price":2862,"unit":"шт","animal_ids":[]}
2761	2016-05-26 00:42:54.735407	2016-05-26 00:42:54.735407	farm	products	{"category_ids":[15,70],"title":"Адреналин","price":563,"unit":"шт","animal_ids":[]}
2762	2016-05-26 00:42:54.82663	2016-05-26 00:42:54.82663	farm	products	{"category_ids":[15,70],"title":"Арабская ночь","price":91,"unit":"шт","animal_ids":[]}
2763	2016-05-26 00:42:54.924929	2016-05-26 00:42:54.924929	farm	products	{"category_ids":[15,70],"title":"Ассорти \\"железная стрекоза\\"","price":434,"unit":"шт","animal_ids":[]}
2764	2016-05-26 00:42:55.015935	2016-05-26 00:42:55.015935	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи \\"Елочка\\" (фигурная)","price":81,"unit":"шт","animal_ids":[]}
2765	2016-05-26 00:42:55.102129	2016-05-26 00:42:55.102129	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи \\"звездочка\\" (фигурная)","price":67,"unit":"шт","animal_ids":[]}
2766	2016-05-26 00:42:55.32168	2016-05-26 00:42:55.32168	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 170 \\"Экстра\\"","price":24,"unit":"шт","animal_ids":[]}
2767	2016-05-26 00:42:55.400203	2016-05-26 00:42:55.400203	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 210 \\"Спектр\\" (разноцв.)","price":44,"unit":"шт","animal_ids":[]}
2768	2016-05-26 00:42:55.544664	2016-05-26 00:42:55.544664	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 210 \\"Экстра\\" (толстая)","price":29,"unit":"шт","animal_ids":[]}
2769	2016-05-26 00:42:55.632661	2016-05-26 00:42:55.632661	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 350 прямоугольные","price":164,"unit":"шт","animal_ids":[]}
2770	2016-05-26 00:42:55.713571	2016-05-26 00:42:55.713571	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 400 прямоугольные","price":398,"unit":"шт","animal_ids":[]}
2771	2016-05-26 00:42:55.794165	2016-05-26 00:42:55.794165	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 600 прямоугольные","price":275,"unit":"шт","animal_ids":[]}
2772	2016-05-26 00:42:55.87773	2016-05-26 00:42:55.87773	farm	products	{"category_ids":[15,70],"title":"Бенефис","price":4160,"unit":"шт","animal_ids":[]}
2773	2016-05-26 00:42:56.010344	2016-05-26 00:42:56.010344	farm	products	{"category_ids":[15,70],"title":"Бинго","price":553,"unit":"шт","animal_ids":[]}
2774	2016-05-26 00:42:56.090744	2016-05-26 00:42:56.090744	farm	products	{"category_ids":[15,70],"title":"Бубль-гум","price":1928,"unit":"шт","animal_ids":[]}
2775	2016-05-26 00:42:56.17822	2016-05-26 00:42:56.17822	farm	products	{"category_ids":[15,70],"title":"Вася-василек","price":258,"unit":"шт","animal_ids":[]}
2776	2016-05-26 00:42:56.270287	2016-05-26 00:42:56.270287	farm	products	{"category_ids":[15,70],"title":"Веселый пиротехник","price":675,"unit":"шт","animal_ids":[]}
2777	2016-05-26 00:42:56.358912	2016-05-26 00:42:56.358912	farm	products	{"category_ids":[15,70],"title":"Волшебные стрелы","price":1785,"unit":"шт","animal_ids":[]}
2778	2016-05-26 00:42:56.459516	2016-05-26 00:42:56.459516	farm	products	{"category_ids":[15,70],"title":"Госпожа метелица","price":3815,"unit":"шт","animal_ids":[]}
2779	2016-05-26 00:42:56.560195	2016-05-26 00:42:56.560195	farm	products	{"category_ids":[15,70],"title":"Дикие пчелы (летающая вертушка)","price":135,"unit":"шт","animal_ids":[]}
2780	2016-05-26 00:42:56.647652	2016-05-26 00:42:56.647652	farm	products	{"category_ids":[15,70],"title":"ЗД.Медный всадник","price":3400,"unit":"шт","animal_ids":[]}
2781	2016-05-26 00:42:56.734218	2016-05-26 00:42:56.734218	farm	products	{"category_ids":[15,70],"title":"Зимняя ночь","price":2520,"unit":"шт","animal_ids":[]}
2782	2016-05-26 00:42:56.878149	2016-05-26 00:42:56.878149	farm	products	{"category_ids":[15,70],"title":"Золотая рыбка","price":733,"unit":"шт","animal_ids":[]}
2783	2016-05-26 00:42:56.958202	2016-05-26 00:42:56.958202	farm	products	{"category_ids":[15,70],"title":"Изуумрудный город","price":16500,"unit":"шт","animal_ids":[]}
2784	2016-05-26 00:42:57.046205	2016-05-26 00:42:57.046205	farm	products	{"category_ids":[15,70],"title":"Капитошка","price":1920,"unit":"шт","animal_ids":[]}
2785	2016-05-26 00:42:57.167818	2016-05-26 00:42:57.167818	farm	products	{"category_ids":[15,70],"title":"Корсар-1","price":68,"unit":"шт","animal_ids":[]}
2786	2016-05-26 00:42:57.262924	2016-05-26 00:42:57.262924	farm	products	{"category_ids":[15,70],"title":"Корсар-3","price":44,"unit":"шт","animal_ids":[]}
2787	2016-05-26 00:42:57.348322	2016-05-26 00:42:57.348322	farm	products	{"category_ids":[15,70],"title":"Корсар-4","price":114,"unit":"шт","animal_ids":[]}
2788	2016-05-26 00:42:57.444132	2016-05-26 00:42:57.444132	farm	products	{"category_ids":[15,70],"title":"Лимонка (с чекой)","price":55,"unit":"шт","animal_ids":[]}
2789	2016-05-26 00:42:57.52207	2016-05-26 00:42:57.52207	farm	products	{"category_ids":[15,70],"title":"Лукоморье","price":1767,"unit":"шт","animal_ids":[]}
2790	2016-05-26 00:42:57.63318	2016-05-26 00:42:57.63318	farm	products	{"category_ids":[15,70],"title":"Лунный цветок","price":36,"unit":"шт","animal_ids":[]}
2791	2016-05-26 00:42:57.727458	2016-05-26 00:42:57.727458	farm	products	{"category_ids":[15,70],"title":"Малиновый звон","price":322,"unit":"шт","animal_ids":[]}
2792	2016-05-26 00:42:57.814483	2016-05-26 00:42:57.814483	farm	products	{"category_ids":[15,70],"title":"Мальчишник","price":2016,"unit":"шт","animal_ids":[]}
2793	2016-05-26 00:42:57.903945	2016-05-26 00:42:57.903945	farm	products	{"category_ids":[15,70],"title":"Маугли","price":800,"unit":"шт","animal_ids":[]}
2794	2016-05-26 00:42:57.994597	2016-05-26 00:42:57.994597	farm	products	{"category_ids":[15,70],"title":"Метелица","price":157,"unit":"шт","animal_ids":[]}
2795	2016-05-26 00:42:58.082519	2016-05-26 00:42:58.082519	farm	products	{"category_ids":[15,70],"title":"Мистер Х","price":739,"unit":"шт","animal_ids":[]}
2798	2016-05-26 00:42:58.500894	2016-05-26 00:42:58.500894	farm	products	{"category_ids":[15,70],"title":"Нано-салют","price":563,"unit":"шт","animal_ids":[]}
2799	2016-05-26 00:42:58.733844	2016-05-26 00:42:58.733844	farm	products	{"category_ids":[15,70],"title":"Настольный фонтан","price":200,"unit":"шт","animal_ids":[]}
2800	2016-05-26 00:42:59.032578	2016-05-26 00:42:59.032578	farm	products	{"category_ids":[15,70],"title":"Не тормози","price":1198,"unit":"шт","animal_ids":[]}
2801	2016-05-26 00:42:59.321526	2016-05-26 00:42:59.321526	farm	products	{"category_ids":[15,70],"title":"Неб. Фонарики форма \\"Сердце\\"","price":148,"unit":"шт","animal_ids":[]}
2802	2016-05-26 00:42:59.46805	2016-05-26 00:42:59.46805	farm	products	{"category_ids":[15,70],"title":"Неваляшка","price":999,"unit":"шт","animal_ids":[]}
2803	2016-05-26 00:42:59.722952	2016-05-26 00:42:59.722952	farm	products	{"category_ids":[15,70],"title":"Новогоднее приключение","price":8554,"unit":"шт","animal_ids":[]}
2804	2016-05-26 00:43:00.090923	2016-05-26 00:43:00.090923	farm	products	{"category_ids":[15,70],"title":"Огненые пчелы","price":80,"unit":"шт","animal_ids":[]}
2805	2016-05-26 00:43:00.480264	2016-05-26 00:43:00.480264	farm	products	{"category_ids":[15,70],"title":"Павлин","price":2360,"unit":"шт","animal_ids":[]}
2806	2016-05-26 00:43:00.689697	2016-05-26 00:43:00.689697	farm	products	{"category_ids":[15,70],"title":"Перчинка","price":543,"unit":"шт","animal_ids":[]}
2807	2016-05-26 00:43:00.768208	2016-05-26 00:43:00.768208	farm	products	{"category_ids":[15,70],"title":"пневмохлопушка праздничная 30 см (цветн. бум. конфети)","price":151,"unit":"шт","animal_ids":[]}
2808	2016-05-26 00:43:00.845924	2016-05-26 00:43:00.845924	farm	products	{"category_ids":[15,70],"title":"пневмохлопушка праздничная 30 см (цветн.металл. конфети)","price":199,"unit":"шт","animal_ids":[]}
2809	2016-05-26 00:43:01.001764	2016-05-26 00:43:01.001764	farm	products	{"category_ids":[15,70],"title":"пневмохлопушка Свадебная 30 см (конф. сердце)","price":173,"unit":"шт","animal_ids":[]}
2810	2016-05-26 00:43:01.079125	2016-05-26 00:43:01.079125	farm	products	{"category_ids":[15,70],"title":"Полуночник","price":4530,"unit":"шт","animal_ids":[]}
2811	2016-05-26 00:43:01.171135	2016-05-26 00:43:01.171135	farm	products	{"category_ids":[15,70],"title":"Пугач","price":78,"unit":"шт","animal_ids":[]}
2812	2016-05-26 00:43:01.257749	2016-05-26 00:43:01.257749	farm	products	{"category_ids":[15,70],"title":"Пять звезд","price":2500,"unit":"шт","animal_ids":[]}
2813	2016-05-26 00:43:01.456749	2016-05-26 00:43:01.456749	farm	products	{"category_ids":[15,70],"title":"Радость общения","price":3180,"unit":"шт","animal_ids":[]}
2814	2016-05-26 00:43:01.667556	2016-05-26 00:43:01.667556	farm	products	{"category_ids":[15,70],"title":"Разгуляй","price":14813,"unit":"шт","animal_ids":[]}
2815	2016-05-26 00:43:01.880448	2016-05-26 00:43:01.880448	farm	products	{"category_ids":[15,70],"title":"Русский сувенир","price":2310,"unit":"шт","animal_ids":[]}
2816	2016-05-26 00:43:01.970281	2016-05-26 00:43:01.970281	farm	products	{"category_ids":[15,70],"title":"Салют молодежи","price":5375,"unit":"шт","animal_ids":[]}
2817	2016-05-26 00:43:02.044159	2016-05-26 00:43:02.044159	farm	products	{"category_ids":[15,70],"title":"Северное сияние","price":1700,"unit":"шт","animal_ids":[]}
2818	2016-05-26 00:43:02.135439	2016-05-26 00:43:02.135439	farm	products	{"category_ids":[15,70],"title":"Смайлики","price":127,"unit":"шт","animal_ids":[]}
2819	2016-05-26 00:43:02.279071	2016-05-26 00:43:02.279071	farm	products	{"category_ids":[15,70],"title":"СМС-ка","price":964,"unit":"шт","animal_ids":[]}
2820	2016-05-26 00:43:02.373498	2016-05-26 00:43:02.373498	farm	products	{"category_ids":[15,70],"title":"Снеговик","price":858,"unit":"шт","animal_ids":[]}
2821	2016-05-26 00:43:02.460535	2016-05-26 00:43:02.460535	farm	products	{"category_ids":[15,70],"title":"Снеговой","price":802,"unit":"шт","animal_ids":[]}
2822	2016-05-26 00:43:02.545162	2016-05-26 00:43:02.545162	farm	products	{"category_ids":[15,70],"title":"Снегурочка","price":3374,"unit":"шт","animal_ids":[]}
2823	2016-05-26 00:43:02.666874	2016-05-26 00:43:02.666874	farm	products	{"category_ids":[15,70],"title":"Снежная сказка","price":3374,"unit":"шт","animal_ids":[]}
2824	2016-05-26 00:43:02.759587	2016-05-26 00:43:02.759587	farm	products	{"category_ids":[15,70],"title":"Сорвиголова","price":1667,"unit":"шт","animal_ids":[]}
2825	2016-05-26 00:43:02.855077	2016-05-26 00:43:02.855077	farm	products	{"category_ids":[15,70],"title":"Страна чудес","price":20438,"unit":"шт","animal_ids":[]}
2826	2016-05-26 00:43:02.947527	2016-05-26 00:43:02.947527	farm	products	{"category_ids":[15,70],"title":"Только ты","price":4160,"unit":"шт","animal_ids":[]}
2827	2016-05-26 00:43:03.03886	2016-05-26 00:43:03.03886	farm	products	{"category_ids":[15,70],"title":"Тропикана","price":2560,"unit":"шт","animal_ids":[]}
2828	2016-05-26 00:43:03.135818	2016-05-26 00:43:03.135818	farm	products	{"category_ids":[15,70],"title":"Убойная сила (3 эффекта)","price":53,"unit":"шт","animal_ids":[]}
2829	2016-05-26 00:43:03.224418	2016-05-26 00:43:03.224418	farm	products	{"category_ids":[15,70],"title":"Удалой","price":5292,"unit":"шт","animal_ids":[]}
2830	2016-05-26 00:43:03.302594	2016-05-26 00:43:03.302594	farm	products	{"category_ids":[15,70],"title":"Хлопающие шары","price":72,"unit":"шт","animal_ids":[]}
2831	2016-05-26 00:43:03.434389	2016-05-26 00:43:03.434389	farm	products	{"category_ids":[15,70],"title":"Хлопушка","price":79,"unit":"шт","animal_ids":[]}
2832	2016-05-26 00:43:03.511775	2016-05-26 00:43:03.511775	farm	products	{"category_ids":[15,70],"title":"Хлопушка \\"Супер с серпантином\\"","price":119,"unit":"шт","animal_ids":[]}
2833	2016-05-26 00:43:03.636224	2016-05-26 00:43:03.636224	farm	products	{"category_ids":[15,70],"title":"Хлопушка \\"Супер\\"","price":88,"unit":"шт","animal_ids":[]}
2834	2016-05-26 00:43:03.727591	2016-05-26 00:43:03.727591	farm	products	{"category_ids":[15,70],"title":"Цветущая сакура","price":2520,"unit":"шт","animal_ids":[]}
2835	2016-05-26 00:43:03.815347	2016-05-26 00:43:03.815347	farm	products	{"category_ids":[15,70],"title":"Час пик","price":2209,"unit":"шт","animal_ids":[]}
2836	2016-05-26 00:43:03.901532	2016-05-26 00:43:03.901532	farm	products	{"category_ids":[15,70],"title":"Чудо-юдо","price":478,"unit":"шт","animal_ids":[]}
2837	2016-05-26 00:43:03.990619	2016-05-26 00:43:03.990619	farm	products	{"category_ids":[15,70],"title":"Шаляй-валяй","price":3840,"unit":"шт","animal_ids":[]}
2838	2016-05-26 00:43:04.114042	2016-05-26 00:43:04.114042	farm	products	{"category_ids":[15,70],"title":"Ястреб","price":576,"unit":"шт","animal_ids":[]}
2839	2016-05-26 00:43:04.208034	2016-05-26 00:43:04.208034	farm	products	{"category_ids":[15,71],"title":"Родентицидная прим \\"Крысиная смерть № 1\\"  (100гр.)","price":72,"unit":"шт","animal_ids":[]}
2840	2016-05-26 00:43:04.306302	2016-05-26 00:43:04.306302	farm	products	{"category_ids":[15,71],"title":"Родентицидная прим \\"Крысиная смерть № 1\\"  (200гр.)","price":120,"unit":"шт","animal_ids":[]}
2841	2016-05-26 00:43:04.394528	2016-05-26 00:43:04.394528	farm	products	{"category_ids":[15,71],"title":"Родентицидная приманка \\"ЩЕЛКУНЧИК\\" 0,1кг","price":58,"unit":"шт","animal_ids":[]}
2842	2016-05-26 00:43:04.480368	2016-05-26 00:43:04.480368	farm	products	{"category_ids":[15,71],"title":"Родентицидная приманка \\"ЩЕЛКУНЧИК\\" 0.2кг","price":100,"unit":"шт","animal_ids":[]}
2843	2016-05-26 00:43:04.622939	2016-05-26 00:43:04.622939	farm	products	{"category_ids":[15,71],"title":"Серная дымовая шашка \\"Климат\\" 300г.","price":91,"unit":"шт","animal_ids":[]}
2844	2016-05-26 00:43:04.865612	2016-05-26 00:43:04.865612	farm	products	{"category_ids":[15,71],"title":"Циперол 170мл аэрозоль","price":322,"unit":"шт","animal_ids":[]}
2845	2016-05-26 00:43:05.025365	2016-05-26 00:43:05.025365	farm	products	{"category_ids":[15,71],"title":"Энтомозан-Супер амп. 2мл","price":76,"unit":"шт","animal_ids":[]}
2846	2016-05-26 00:43:05.120827	2016-05-26 00:43:05.120827	farm	products	{"category_ids":[15,71],"title":"ОКСАРЕП (0,5л)","price":553,"unit":"шт","animal_ids":[]}
2847	2016-05-26 00:43:05.204437	2016-05-26 00:43:05.204437	farm	products	{"category_ids":[15,71],"title":"Ловушка Mr.Mouse механ. от мышей (дерево)","price":43,"unit":"шт","animal_ids":[]}
2848	2016-05-26 00:43:05.289542	2016-05-26 00:43:05.289542	farm	products	{"category_ids":[15,71],"title":"Инсекто-акарицидная шашка Вихрь (0,1)","price":455,"unit":"шт","animal_ids":[]}
2849	2016-05-26 00:43:05.411591	2016-05-26 00:43:05.411591	farm	products	{"category_ids":[15,71],"title":"Йодная шашка Диксам (3 табл.)","price":284,"unit":"шт","animal_ids":[]}
2850	2016-05-26 00:43:05.491516	2016-05-26 00:43:05.491516	farm	products	{"category_ids":[15,71],"title":"Клей ALT (130мл.)","price":255,"unit":"шт","animal_ids":[]}
2851	2016-05-26 00:43:05.581987	2016-05-26 00:43:05.581987	farm	products	{"category_ids":[15,71],"title":"Клей EG euroguard для отлова грызунов 135 г.","price":219,"unit":"шт","animal_ids":[]}
2852	2016-05-26 00:43:05.673007	2016-05-26 00:43:05.673007	farm	products	{"category_ids":[15,71],"title":"Клей Mr.Mouse от грызунов и насекомых 135г/60","price":197,"unit":"шт","animal_ids":[]}
2853	2016-05-26 00:43:05.761168	2016-05-26 00:43:05.761168	farm	products	{"category_ids":[15,71],"title":"Крысоловка (метал.)","price":73,"unit":"шт","animal_ids":[]}
2854	2016-05-26 00:43:05.849082	2016-05-26 00:43:05.849082	farm	products	{"category_ids":[15,71],"title":"БойКот гранулы 100г. Арахис и Шоколад","price":30,"unit":"шт","animal_ids":[]}
2855	2016-05-26 00:43:06.004816	2016-05-26 00:43:06.004816	farm	products	{"category_ids":[15,71],"title":"БойКот зерно 150 г. Жареное  мясо","price":30,"unit":"шт","animal_ids":[]}
2856	2016-05-26 00:43:06.093756	2016-05-26 00:43:06.093756	farm	products	{"category_ids":[15,71],"title":"БойКот мягкий брикет К_С Подсолнух 100г","price":58,"unit":"шт","animal_ids":[]}
2857	2016-05-26 00:43:06.18151	2016-05-26 00:43:06.18151	farm	products	{"category_ids":[15,71],"title":"Аксамит-нео 500мл с распылителем","price":501,"unit":"шт","animal_ids":[]}
2858	2016-05-26 00:43:06.282078	2016-05-26 00:43:06.282078	farm	products	{"category_ids":[15,72],"title":"Инкубатор АИ -264К/96Г/189У/663","price":27984,"unit":"шт","animal_ids":[49,50,51,52]}
2859	2016-05-26 00:43:06.377958	2016-05-26 00:43:06.377958	farm	products	{"category_ids":[15,72],"title":"Инкубатор АИ-48Э","price":9282,"unit":"шт","animal_ids":[49,50,51,52]}
2571	2016-05-26 00:42:34.88448	2016-05-26 05:07:15.337857	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для собак от блох клещей 10-20 кг","price":355,"unit":"шт","home_animal_ids":[93]}
2506	2016-05-26 00:42:29.165066	2016-05-26 05:29:26.477188	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек рагу курица в кремовом соусе 85г","price":22,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2542	2016-05-26 00:42:32.240996	2016-05-26 05:10:35.718013	farm	products	{"category_ids":[15,64,112],"title":"НМ для привередливых кошек в асс.400г.","price":75,"unit":"шт","home_animal_ids":[94],"weight_ids":[96]}
2501	2016-05-26 00:42:28.651946	2016-05-26 05:10:22.751052	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек желе с курецей 85г","price":22,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2519	2016-05-26 00:42:30.296706	2016-05-26 05:31:31.386719	farm	products	{"category_ids":[15,64,112],"title":"Вискис сух.д/котят подушечки с молоком индейка/морковь 350 г.","price":75,"unit":"шт","home_animal_ids":[94],"weight_ids":[90]}
2562	2016-05-26 00:42:33.885691	2016-05-26 06:50:26.23327	farm	products	{"category_ids":[15,64,113],"title":"ПУСИ КЭТ океанический наполнитель впитывающий 4,5л.2,8кг зеленый","price":84,"unit":"шт","home_animal_ids":[94]}
2554	2016-05-26 00:42:33.231035	2016-05-26 04:54:59.196636	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак миниатюрных пород курица 1,2кг.","price":212,"unit":"шт","home_animal_ids":[93],"weight_ids":[103]}
2503	2016-05-26 00:42:28.829807	2016-05-26 05:09:52.905418	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек паштет говядина/печень 85г","price":22,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2537	2016-05-26 00:42:31.830724	2016-05-26 05:11:32.854506	farm	products	{"category_ids":[15,64,112],"title":"НМ для взрослых собак крупных пород 3кг","price":386,"unit":"шт","home_animal_ids":[93],"weight_ids":[104]}
2602	2016-05-26 00:42:37.454209	2016-05-26 05:23:10.356955	farm	products	{"category_ids":[15,64,112],"title":"ШЕБА ПАУЧ д/кошек форель/креветки 85г.","price":35,"unit":"шт","home_animal_ids":[94],"weight_ids":[89]}
2492	2016-05-26 00:42:27.929479	2016-05-26 05:27:41.387739	farm	products	{"category_ids":[15,64,112],"title":"Вака + для Мел/сред. попугаев 500г.","price":47,"unit":"шт","home_animal_ids":[95],"weight_ids":[97]}
2590	2016-05-26 00:42:36.465254	2016-05-26 05:30:07.248946	farm	products	{"category_ids":[15,64,112],"title":"Фаворит Для взрослыхт собак всех пород 13 кг","price":1250,"unit":"шт","home_animal_ids":[93],"weight_ids":[107]}
2513	2016-05-26 00:42:29.730142	2016-05-26 05:32:54.580501	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/кошек подушечки со сметаной и овощами гов/ягн/кролик 350г","price":75,"unit":"шт","home_animal_ids":[94],"weight_ids":[90]}
2587	2016-05-26 00:42:36.220539	2016-05-26 06:53:17.112055	farm	products	{"category_ids":[15,64,112],"title":"Терра Пес для взрослых собак мел. и.сред.пород 2,4кг.","price":251,"unit":"шт","home_animal_ids":[93],"weight_ids":[123]}
2585	2016-05-26 00:42:36.041287	2016-05-26 06:12:26.66049	farm	products	{"category_ids":[15,64,112],"title":"Терра Кот для взрослых кошек 2кг.","price":248,"unit":"шт","home_animal_ids":[94],"weight_ids":[117]}
2550	2016-05-26 00:42:32.907445	2016-05-26 06:13:52.730859	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак крупных пород говядина 13 кг.","price":1664,"unit":"шт","home_animal_ids":[93],"weight_ids":[107]}
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: woto
--

SELECT pg_catalog.setval('products_id_seq', 2859, true);


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: woto
--

COPY properties (id, title, created_at, updated_at) FROM stdin;
\.


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: woto
--

SELECT pg_catalog.setval('properties_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: woto
--

COPY schema_migrations (version) FROM stdin;
20160510015614
20160510052533
20160512221025
20160513012127
20160513015924
20160515192612
20160515201952
20160515202017
20160517023410
20160517033546
20160517033632
20160526034850
\.


--
-- Data for Name: tree_hierarchies; Type: TABLE DATA; Schema: public; Owner: woto
--

COPY tree_hierarchies (ancestor_id, descendant_id, generations) FROM stdin;
88	88	0
89	89	0
59	59	0
15	59	1
60	60	0
5	5	0
6	6	0
7	7	0
8	8	0
9	9	0
10	10	0
11	11	0
15	60	1
61	61	0
15	61	1
15	15	0
88	89	1
90	90	0
88	90	1
92	92	0
93	93	0
92	93	1
94	94	0
92	94	1
95	95	0
92	95	1
96	96	0
88	96	1
97	97	0
88	97	1
98	98	0
62	62	0
15	62	1
27	27	0
63	63	0
15	63	1
64	64	0
15	64	1
65	65	0
15	65	1
66	66	0
15	66	1
67	67	0
15	67	1
68	68	0
15	68	1
88	98	1
99	99	0
88	99	1
69	69	0
15	69	1
101	101	0
70	70	0
15	70	1
71	71	0
15	71	1
72	72	0
15	72	1
88	101	1
102	102	0
88	102	1
103	103	0
88	103	1
104	104	0
88	104	1
105	105	0
88	105	1
106	106	0
88	106	1
107	107	0
88	107	1
108	108	0
88	108	1
109	109	0
88	109	1
110	110	0
88	110	1
111	111	0
88	111	1
112	112	0
64	112	1
15	112	2
113	113	0
64	113	1
15	113	2
114	114	0
88	114	1
115	115	0
88	115	1
116	116	0
88	116	1
117	117	0
88	117	1
49	49	0
27	49	1
50	50	0
27	50	1
51	51	0
27	51	1
52	52	0
27	52	1
53	53	0
27	53	1
54	54	0
27	54	1
55	55	0
27	55	1
118	118	0
88	118	1
119	119	0
88	119	1
120	120	0
88	120	1
121	121	0
88	121	1
122	122	0
92	122	1
123	123	0
88	123	1
\.


--
-- Data for Name: trees; Type: TABLE DATA; Schema: public; Owner: woto
--

COPY trees (id, es_index, es_type, es_body, parent_id, created_at, updated_at, sort_order) FROM stdin;
66	farm	category_ids	{"title":"Комбикорм","options":["animal_ids"]}	15	2016-05-25 23:37:05.538659	2016-05-26 00:52:58.200186	\N
67	farm	category_ids	{"title":"Кормушки","options":["animal_ids"]}	15	2016-05-25 23:37:05.619372	2016-05-26 00:53:01.528852	\N
72	farm	category_ids	{"title":"Инкубаторы","options":["animal_ids"]}	15	2016-05-25 23:37:06.533156	2016-05-26 00:53:20.568925	\N
69	farm	category_ids	{"title":"Рассада"}	15	2016-05-25 23:37:05.949318	2016-05-26 00:54:09.411556	\N
59	farm	category_ids	{"title":"Гирлянды"}	15	2016-05-25 23:37:04.885916	2016-05-26 00:54:42.850793	\N
60	farm	category_ids	{"title":"Дерево"}	15	2016-05-25 23:37:05.018035	2016-05-26 00:55:00.479293	\N
88	farm	weight_ids	{"title":"Масса корма"}	\N	2016-05-26 02:06:06.561527	2016-05-26 04:38:34.394917	\N
92	farm	home_animal_ids	{"title":"Домашнее животное"}	\N	2016-05-26 02:11:21.054572	2016-05-26 04:41:09.554483	\N
27	farm	animal_ids	{"title":"Животное"}	\N	2016-05-17 04:08:13.206045	2016-05-26 04:42:11.066464	\N
93	farm	home_animal_ids	{"title":"Собаки"}	92	2016-05-26 02:12:11.593668	2016-05-26 02:12:40.900108	1
55	farm	animal_ids	{"title":"Кролики, нутрии","thumbnail":"/farm/animals/zayac.png"}	27	2016-05-25 21:53:47.916986	2016-05-26 08:12:20.886585	\N
94	farm	home_animal_ids	{"title":"Кошки"}	92	2016-05-26 02:13:12.257148	2016-05-26 02:13:12.257148	2
64	farm	category_ids	{"title":"Дом. животные","options":["home_animal_ids","weight_ids"]}	15	2016-05-25 23:37:05.181193	2016-05-26 04:52:12.202376	\N
15	farm	category_ids	{"title":"Корневая","options":["animal_ids"]}	\N	2016-05-17 04:03:40.650057	2016-05-26 05:01:47.497352	\N
95	farm	home_animal_ids	{"title":"Попугаи"}	92	2016-05-26 02:13:21.291922	2016-05-26 06:39:22.465532	0
112	farm	category_ids	{"title":"Корма","options":["home_animal_ids","weight_ids"]}	64	2016-05-26 04:45:45.916291	2016-05-26 04:54:04.472819	0
113	farm	category_ids	{"title":"Прочие товары","options":["home_animal_ids"]}	64	2016-05-26 05:03:31.231132	2016-05-26 05:45:06.981307	1
61	farm	category_ids	{"title":"Елки"}	15	2016-05-25 23:37:05.05672	2016-05-26 00:55:19.681995	\N
123	farm	weight_ids	{"title":"2,4 кг"}	88	2016-05-26 06:52:40.179012	2016-05-26 06:52:40.179012	17
63	farm	category_ids	{"title":"Зерно","options":["animal_ids"]}	15	2016-05-25 23:37:05.119572	2016-05-26 00:52:47.674476	\N
121	farm	weight_ids	{"title":"900 г"}	88	2016-05-26 06:33:28.306201	2016-05-26 06:33:28.306201	10
119	farm	weight_ids	{"title":"190 г"}	88	2016-05-26 06:21:39.632128	2016-05-26 06:21:39.632128	2
118	farm	weight_ids	{"title":"760 г"}	88	2016-05-26 06:15:19.501871	2016-05-26 06:15:19.501871	8
65	farm	category_ids	{"title":"Клетки","options":["animal_ids"]}	15	2016-05-25 23:37:05.455664	2016-05-26 00:52:54.790578	\N
62	farm	category_ids	{"title":"Живность"}	15	2016-05-25 23:37:05.087029	2016-05-26 00:55:38.225337	\N
106	farm	weight_ids	{"title":"4 кг"}	88	2016-05-26 03:46:54.714183	2016-05-26 06:02:54.194909	22
70	farm	category_ids	{"title":"Фейерверки"}	15	2016-05-25 23:37:06.114514	2016-05-26 00:56:38.831386	\N
71	farm	category_ids	{"title":"Средства защиты"}	15	2016-05-25 23:37:06.398704	2016-05-26 00:56:55.943323	\N
68	farm	category_ids	{"title":"Премиксы","options":["animal_ids"]}	15	2016-05-25 23:37:05.739149	2016-05-26 00:58:49.645168	\N
98	farm	weight_ids	{"title":"600 г"}	88	2016-05-26 03:45:17.773806	2016-05-26 04:01:06.054457	7
52	farm	animal_ids	{"title":"Индейки","thumbnail":"/farm/animals/indeika.png"}	27	2016-05-25 21:53:23.357335	2016-05-26 01:18:55.571938	\N
53	farm	animal_ids	{"title":"Свиньи","thumbnail":"/farm/animals/sviniya.png"}	27	2016-05-25 21:53:30.103236	2016-05-26 01:20:42.909351	\N
49	farm	animal_ids	{"title":"Куры","thumbnail":"/farm/animals/kurica.png"}	27	2016-05-25 21:52:54.087768	2016-05-26 01:21:40.176341	\N
50	farm	animal_ids	{"title":"Гуси, утки","thumbnail":"/farm/animals/gus.png"}	27	2016-05-25 21:53:11.335848	2016-05-26 01:23:13.367417	\N
51	farm	animal_ids	{"title":"Перепела","thumbnail":"/farm/animals/perepelka.jpg"}	27	2016-05-25 21:53:16.527078	2016-05-26 01:24:12.317576	\N
54	farm	animal_ids	{"title":"Крупный рогатый скот, козы, овцы","thumbnail":"/farm/animals/korova.png"}	27	2016-05-25 21:53:38.144726	2016-05-26 01:27:14.365968	\N
97	farm	weight_ids	{"title":"500 г"}	88	2016-05-26 03:22:21.879674	2016-05-26 04:01:51.464068	6
96	farm	weight_ids	{"title":"400 г"}	88	2016-05-26 03:21:43.095531	2016-05-26 04:02:02.966588	5
89	farm	weight_ids	{"title":"85 г"}	88	2016-05-26 02:08:41.699861	2016-05-26 04:02:22.238909	0
90	farm	weight_ids	{"title":"350 г"}	88	2016-05-26 02:10:12.37363	2016-05-26 04:02:26.187138	4
107	farm	weight_ids	{"title":"13 кг"}	88	2016-05-26 03:47:06.284649	2016-05-26 04:02:30.528716	24
122	farm	home_animal_ids	{"title":"Грызуны"}	92	2016-05-26 06:38:06.639028	2016-05-26 06:39:09.901775	3
105	farm	weight_ids	{"title":"1 кг"}	88	2016-05-26 03:46:47.502289	2016-05-26 04:02:36.773681	11
104	farm	weight_ids	{"title":"3 кг"}	88	2016-05-26 03:46:45.087117	2016-05-26 04:02:39.520514	20
116	farm	weight_ids	{"title":"1,5 кг"}	88	2016-05-26 06:05:52.590219	2016-05-26 06:06:10.167488	13
111	farm	weight_ids	{"title":"3,2 кг"}	88	2016-05-26 04:25:15.282651	2016-05-26 04:25:47.86019	21
114	farm	weight_ids	{"title":"15 кг"}	88	2016-05-26 05:57:44.931758	2016-05-26 05:57:44.931758	25
102	farm	weight_ids	{"title":"1,9 кг"}	88	2016-05-26 03:46:26.736946	2016-05-26 04:02:44.695972	14
101	farm	weight_ids	{"title":"2,8 кг"}	88	2016-05-26 03:46:15.838719	2016-05-26 04:02:47.703629	19
99	farm	weight_ids	{"title":"340 г"}	88	2016-05-26 03:45:37.750633	2016-05-26 04:03:01.869438	3
108	farm	weight_ids	{"title":"100 г"}	88	2016-05-26 04:08:48.056969	2016-05-26 04:08:48.056969	1
109	farm	weight_ids	{"title":"800 г"}	88	2016-05-26 04:11:12.851862	2016-05-26 04:11:12.851862	9
110	farm	weight_ids	{"title":"2,5 кг"}	88	2016-05-26 04:24:20.652476	2016-05-26 04:24:33.298054	18
115	farm	weight_ids	{"title":"12 кг"}	88	2016-05-26 06:02:33.955596	2016-05-26 06:02:50.077855	23
103	farm	weight_ids	{"title":"1,2 кг"}	88	2016-05-26 03:46:33.561992	2016-05-26 06:06:14.520374	12
120	farm	weight_ids	{"title":"2,2 кг"}	88	2016-05-26 06:31:36.125242	2016-05-26 06:31:57.177672	16
117	farm	weight_ids	{"title":"2 кг"}	88	2016-05-26 06:12:12.367879	2016-05-26 06:32:00.048384	15
\.


--
-- Name: trees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: woto
--

SELECT pg_catalog.setval('trees_id_seq', 123, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: woto
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: woto
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: indices_pkey; Type: CONSTRAINT; Schema: public; Owner: woto
--

ALTER TABLE ONLY indices
    ADD CONSTRAINT indices_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: woto
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: woto
--

ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: woto
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: trees_pkey; Type: CONSTRAINT; Schema: public; Owner: woto
--

ALTER TABLE ONLY trees
    ADD CONSTRAINT trees_pkey PRIMARY KEY (id);


--
-- Name: category_anc_desc_idx; Type: INDEX; Schema: public; Owner: woto
--

CREATE UNIQUE INDEX category_anc_desc_idx ON category_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: category_desc_idx; Type: INDEX; Schema: public; Owner: woto
--

CREATE INDEX category_desc_idx ON category_hierarchies USING btree (descendant_id);


--
-- Name: tree_anc_desc_idx; Type: INDEX; Schema: public; Owner: woto
--

CREATE UNIQUE INDEX tree_anc_desc_idx ON tree_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: tree_desc_idx; Type: INDEX; Schema: public; Owner: woto
--

CREATE INDEX tree_desc_idx ON tree_hierarchies USING btree (descendant_id);


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

