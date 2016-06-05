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
    es_body json,
    es_response json
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

COPY products (id, created_at, updated_at, es_index, es_type, es_body, es_response) FROM stdin;
2461	2016-05-26 00:42:24.983996	2016-06-05 19:44:11.111021	farm	products	{"category_ids":[15,59],"title":"Е2019 100 ламп, цветные лампы","price":405,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2461","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2463	2016-05-26 00:42:25.139555	2016-06-05 19:44:11.255615	farm	products	{"category_ids":[15,59],"title":"Е2100 Сетка 100л. елка 1,2х1,2","price":615,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2463","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2465	2016-05-26 00:42:25.306571	2016-06-05 19:44:11.41137	farm	products	{"category_ids":[15,59],"title":"Е50539  рис.Снежинка 25мм, 100 ламп, цветная.5,2 м+1,5м","price":605,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2465","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2467	2016-05-26 00:42:25.473509	2016-06-05 19:44:11.500262	farm	products	{"category_ids":[15,60],"title":"Кормушка №2","price":2250,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2467","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2470	2016-05-26 00:42:25.726874	2016-06-05 19:44:11.655409	farm	products	{"category_ids":[15,60],"title":"Скворечник","price":1500,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2470","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2471	2016-05-26 00:42:25.828909	2016-06-05 19:44:11.743368	farm	products	{"category_ids":[15,60],"title":"Стул","price":7000,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2471","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2473	2016-05-26 00:42:26.017277	2016-06-05 19:44:11.966886	farm	products	{"category_ids":[15,61],"title":"Подставка","price":700,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2473","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2476	2016-05-26 00:42:26.273415	2016-06-05 19:44:12.210555	farm	products	{"category_ids":[15,62],"title":"Куры \\"Хайсекс Браун\\"","price":400,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2476","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2478	2016-05-26 00:42:26.588385	2016-06-05 19:44:12.367422	farm	products	{"category_ids":[15,63],"title":"Кукуруза","price":19,"unit":"кг","properties":{"animal_ids":[49,50,52,53,55]}}	{"_index":"farm","_type":"products","_id":"2478","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2479	2016-05-26 00:42:26.681942	2016-06-05 19:44:12.446725	farm	products	{"category_ids":[15,63],"title":"Кукуруза Размол","price":20,"unit":"кг","properties":{"animal_ids":[49,50,51,52,53]}}	{"_index":"farm","_type":"products","_id":"2479","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2481	2016-05-26 00:42:26.86455	2016-06-05 19:44:12.610822	farm	products	{"category_ids":[15,63],"title":"Овес","price":15,"unit":"кг","properties":{"animal_ids":[49,50,52,53,54,55]}}	{"_index":"farm","_type":"products","_id":"2481","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2483	2016-05-26 00:42:27.060652	2016-06-05 19:44:12.777997	farm	products	{"category_ids":[15,63],"title":"Просо","price":25,"unit":"кг","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2483","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2485	2016-05-26 00:42:27.262482	2016-06-05 19:44:12.965718	farm	products	{"category_ids":[15,63],"title":"Размол зерновых","price":18,"unit":"кг","properties":{"animal_ids":[49,50,52,53]}}	{"_index":"farm","_type":"products","_id":"2485","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2487	2016-05-26 00:42:27.45229	2016-06-05 19:44:13.143663	farm	products	{"category_ids":[15,63],"title":"Ракушка","price":20,"unit":"кг","properties":{"animal_ids":[49,50,51,52,53]}}	{"_index":"farm","_type":"products","_id":"2487","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2488	2016-05-26 00:42:27.552515	2016-06-05 19:44:13.278131	farm	products	{"category_ids":[15,63],"title":"семечки","price":36,"unit":"кг","properties":{"animal_ids":[49,50,51,52,53]}}	{"_index":"farm","_type":"products","_id":"2488","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2796	2016-05-26 00:42:58.167366	2016-06-05 19:44:13.432873	farm	products	{"category_ids":[15,70],"title":"Мулен руж","price":593,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2796","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2491	2016-05-26 00:42:27.84031	2016-06-05 19:44:13.710086	farm	products	{"category_ids":[15,64,112],"title":"Вака + для крупных попугаев 800г.","price":180,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[109]}}	{"_index":"farm","_type":"products","_id":"2491","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2466	2016-05-26 00:42:25.388882	2016-06-05 19:44:13.877241	farm	products	{"category_ids":[15,60],"title":"Кормушка №1","price":1800,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2466","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2468	2016-05-26 00:42:25.550661	2016-06-05 19:44:13.966103	farm	products	{"category_ids":[15,60],"title":"Кормушка для синиц","price":1500,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2468","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2522	2016-05-26 00:42:30.540377	2016-06-05 19:44:14.346221	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ ПАУЧ в ассортименте","price":19,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2522","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2521	2016-05-26 00:42:30.463543	2016-06-05 19:44:14.589241	farm	products	{"category_ids":[15,64,113],"title":"Зоо няня Бентонити 5 кг","price":261,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2521","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2515	2016-05-26 00:42:29.894306	2016-06-05 19:44:14.754869	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/кошек подушечки/паштет курица/утка/индейка 1,9кг.","price":366,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[102]}}	{"_index":"farm","_type":"products","_id":"2515","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2642	2016-05-26 00:42:41.256117	2016-06-05 19:44:26.769728	farm	products	{"category_ids":[15,67],"title":"Бункерная кормушка из оцинковки для кроликов 3 кг","price":417,"unit":"шт","properties":{"animal_ids":[49,50,51,52,55]}}	{"_index":"farm","_type":"products","_id":"2642","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2516	2016-05-26 00:42:29.985778	2016-06-05 19:44:14.843796	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/кошек подушечки/паштет курица/утка/индейка 350г","price":75,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[90]}}	{"_index":"farm","_type":"products","_id":"2516","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2520	2016-05-26 00:42:30.384654	2016-06-05 19:44:15.155181	farm	products	{"category_ids":[15,64,112],"title":"ДОГ ЛАНЧ кон.д/собак 760г.","price":95,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[118]}}	{"_index":"farm","_type":"products","_id":"2520","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2507	2016-05-26 00:42:29.239533	2016-06-05 19:44:15.310225	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек рагу с форнелью 85г","price":22,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2507","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2527	2016-05-26 00:42:30.930342	2016-06-05 19:44:15.467317	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек ассорти 1кг.","price":132,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[105]}}	{"_index":"farm","_type":"products","_id":"2527","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2511	2016-05-26 00:42:29.56302	2016-06-05 19:44:15.54389	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/стерилизованых кошек КРОЛИК 350г","price":83,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[90]}}	{"_index":"farm","_type":"products","_id":"2511","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2523	2016-05-26 00:42:30.618572	2016-06-05 19:44:15.788831	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ ПАУЧ д/кошек кролик в соусе 100г.","price":19,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[108]}}	{"_index":"farm","_type":"products","_id":"2523","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2498	2016-05-26 00:42:28.406664	2016-06-05 19:44:15.866005	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ в ас-те","price":22,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2498","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2512	2016-05-26 00:42:29.650401	2016-06-05 19:44:16.021443	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/стерилизованых кошек КУРИЦА 350г","price":83,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[90]}}	{"_index":"farm","_type":"products","_id":"2512","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2505	2016-05-26 00:42:29.085174	2016-06-05 19:44:16.177399	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек рагу курица 85г","price":22,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2505","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2495	2016-05-26 00:42:28.162959	2016-06-05 19:44:16.255167	farm	products	{"category_ids":[15,64,112],"title":"Вака Люкс для крупных попугаев 800г.","price":206,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[109]}}	{"_index":"farm","_type":"products","_id":"2495","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2508	2016-05-26 00:42:29.317633	2016-06-05 19:44:16.388373	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/стерилизованых кошек 1.9кг","price":403,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[102]}}	{"_index":"farm","_type":"products","_id":"2508","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2525	2016-05-26 00:42:30.774553	2016-06-05 19:44:16.555003	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ ПАУЧ д/кошек рыба в соусе 100г.","price":19,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[108]}}	{"_index":"farm","_type":"products","_id":"2525","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2517	2016-05-26 00:42:30.063508	2016-06-05 19:44:16.633097	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/кошек подушечки/паштет лосось/тунец/креветки 1,9 кг","price":366,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[102]}}	{"_index":"farm","_type":"products","_id":"2517","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2499	2016-05-26 00:42:28.485671	2016-06-05 19:44:16.710507	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/котят паштет курица 85г","price":22,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2499","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2500	2016-05-26 00:42:28.563087	2016-06-05 19:44:16.866042	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек желе говядина/ягненок 85г","price":22,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2500","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2538	2016-05-26 00:42:31.905688	2016-06-05 19:44:17.021666	farm	products	{"category_ids":[15,64,112],"title":"НМ для взрослых собак мелких пород 500г","price":71,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2538","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2529	2016-05-26 00:42:31.097192	2016-06-05 19:44:17.100885	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек ассорти 400г.","price":57,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[96]}}	{"_index":"farm","_type":"products","_id":"2529","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2553	2016-05-26 00:42:33.152794	2016-06-05 19:44:17.311456	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак миниатюрных пород говядина 190г.","price":50,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[119]}}	{"_index":"farm","_type":"products","_id":"2553","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2546	2016-05-26 00:42:32.585525	2016-06-05 19:44:17.446	farm	products	{"category_ids":[15,64,113],"title":"Ошейник брезент двойной 45","price":260,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2546","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2544	2016-05-26 00:42:32.419429	2016-06-05 19:44:17.599664	farm	products	{"category_ids":[15,64,112],"title":"НМ для щенков кр. пород 500г","price":81,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2544","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2552	2016-05-26 00:42:33.075343	2016-06-05 19:44:19.612211	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак миниатюрных пород говядина 1,2кг.","price":212,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[103]}}	{"_index":"farm","_type":"products","_id":"2552","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2547	2016-05-26 00:42:32.663226	2016-06-05 19:44:17.83474	farm	products	{"category_ids":[15,64,113],"title":"Ошейник брезент одинарный 45","price":187,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2547","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2543	2016-05-26 00:42:32.3286	2016-06-05 19:44:18.01341	farm	products	{"category_ids":[15,64,112],"title":"НМ для стерилизованных кошек в асс.400г.","price":67,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[96]}}	{"_index":"farm","_type":"products","_id":"2543","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2551	2016-05-26 00:42:32.995372	2016-06-05 19:44:18.168004	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак малых пород 600 кг.","price":110,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[98]}}	{"_index":"farm","_type":"products","_id":"2551","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2532	2016-05-26 00:42:31.405991	2016-06-05 19:44:18.356788	farm	products	{"category_ids":[15,64,113],"title":"КУЗЯ наполнитель для котят впитывающий 4,5л 2,8кг","price":74,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2532","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2564	2016-05-26 00:42:34.218784	2016-06-05 19:44:18.434763	farm	products	{"category_ids":[15,64,112],"title":"РИО  волнистые попугаи осногвной 500г","price":72,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2564","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2539	2016-05-26 00:42:31.986126	2016-06-05 19:44:18.590971	farm	products	{"category_ids":[15,64,112],"title":"НМ для взрослых собак средних пород 500г","price":71,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2539","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2533	2016-05-26 00:42:31.496348	2016-06-05 19:44:18.678338	farm	products	{"category_ids":[15,64,113],"title":"КУЗЯ наполнитель для кошек впитывающий 4,5л 2,8кг","price":74,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2533","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2555	2016-05-26 00:42:33.308385	2016-06-05 19:44:18.834654	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак миниатюрных пород курица 190г.","price":50,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[119]}}	{"_index":"farm","_type":"products","_id":"2555","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2541	2016-05-26 00:42:32.151722	2016-06-05 19:44:18.922581	farm	products	{"category_ids":[15,64,112],"title":"НМ для кошек в асс.2кг.","price":395,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[117]}}	{"_index":"farm","_type":"products","_id":"2541","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2565	2016-05-26 00:42:34.297946	2016-06-05 19:44:19.101776	farm	products	{"category_ids":[15,64,112],"title":"РИО  канарейка 500г","price":93,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2565","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2535	2016-05-26 00:42:31.663835	2016-06-05 19:44:19.27833	farm	products	{"category_ids":[15,64,112],"title":"НМ для взрослых кошек в асс.400г.","price":75,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[96]}}	{"_index":"farm","_type":"products","_id":"2535","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2557	2016-05-26 00:42:33.46388	2016-06-05 19:44:19.368744	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак щенки 600 кг.","price":94,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[98]}}	{"_index":"farm","_type":"products","_id":"2557","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2558	2016-05-26 00:42:33.539683	2016-06-05 19:44:19.534079	farm	products	{"category_ids":[15,64,112],"title":"Про План д/стерильных кошек 400г.","price":260,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[96]}}	{"_index":"farm","_type":"products","_id":"2558","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2559	2016-05-26 00:42:33.617889	2016-06-05 19:44:19.690118	farm	products	{"category_ids":[15,64,113],"title":"ПУСИ КЭТ Наполнитель впитывающий 4,5л.2,8кг голубой","price":84,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2559","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2573	2016-05-26 00:42:35.064633	2016-06-05 19:44:19.767647	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для собак от блох клещей 4-10кг","price":294,"unit":"шт","properties":{"home_animal_ids":[93]}}	{"_index":"farm","_type":"products","_id":"2573","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2581	2016-05-26 00:42:35.720228	2016-06-05 19:44:19.935038	farm	products	{"category_ids":[15,64,113],"title":"Серия 44 капли на холку 3*1 мл.","price":165,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2581","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2594	2016-05-26 00:42:36.776478	2016-06-05 19:44:20.324645	farm	products	{"category_ids":[15,64,112],"title":"Фрискис 2 кг.","price":278,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[117]}}	{"_index":"farm","_type":"products","_id":"2594","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2570	2016-05-26 00:42:34.807842	2016-06-05 19:44:20.479716	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для кошек от блох клещей от 4кг","price":294,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2570","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2572	2016-05-26 00:42:34.974617	2016-06-05 19:44:20.557593	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для собак от блох клещей 20-40 кг","price":393,"unit":"шт","properties":{"home_animal_ids":[93]}}	{"_index":"farm","_type":"products","_id":"2572","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2580	2016-05-26 00:42:35.641546	2016-06-05 19:44:20.634729	farm	products	{"category_ids":[15,64,113],"title":"Серия 44 капли на холку 2*0,5/0,75/1мл.","price":143,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2580","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2591	2016-05-26 00:42:36.543037	2016-06-05 19:44:20.879376	farm	products	{"category_ids":[15,64,112],"title":"Фаворит Для кошек 4 кг","price":432,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[106]}}	{"_index":"farm","_type":"products","_id":"2591","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2567	2016-05-26 00:42:34.487348	2016-06-05 19:44:20.957556	farm	products	{"category_ids":[15,64,112],"title":"РИО  средние попугаи осногвной 500г","price":81,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2567","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2601	2016-05-26 00:42:37.354314	2016-06-05 19:44:21.179906	farm	products	{"category_ids":[15,64,112],"title":"ШЕБА ПАУЧ д/кошек курица/индейка 85г.","price":35,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2601","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2593	2016-05-26 00:42:36.698113	2016-06-05 19:44:21.268546	farm	products	{"category_ids":[15,64,112],"title":"Фрискис 1,5 кг.","price":278,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[116]}}	{"_index":"farm","_type":"products","_id":"2593","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2600	2016-05-26 00:42:37.264778	2016-06-05 19:44:21.44711	farm	products	{"category_ids":[15,64,112],"title":"ШЕБА ПАУЧ д/кошек говядина ягненак 85г.","price":35,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2600","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2582	2016-05-26 00:42:35.796211	2016-06-05 19:44:21.612806	farm	products	{"category_ids":[15,64,112],"title":"Сильвер для средних попугаев 500г.","price":71,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2582","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2592	2016-05-26 00:42:36.62024	2016-06-05 19:44:21.68994	farm	products	{"category_ids":[15,64,113],"title":"ФРЕШ СТЕП наполнитель тройной контроль запохов 3,2кг","price":417,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2592","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2583	2016-05-26 00:42:35.876099	2016-06-05 19:44:21.846175	farm	products	{"category_ids":[15,64,113],"title":"Счастливые лапкинаполнитель древесный 16л.","price":158,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2583","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2577	2016-05-26 00:42:35.395336	2016-06-05 19:44:21.923671	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Ошейник от клещей для собак","price":358,"unit":"шт","properties":{"home_animal_ids":[93]}}	{"_index":"farm","_type":"products","_id":"2577","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2589	2016-05-26 00:42:36.387875	2016-06-05 19:44:22.079281	farm	products	{"category_ids":[15,64,112],"title":"Фаворит Для активных пород собак 13 кг","price":1400,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[107]}}	{"_index":"farm","_type":"products","_id":"2589","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2568	2016-05-26 00:42:34.574195	2016-06-05 19:44:22.247006	farm	products	{"category_ids":[15,64,112],"title":"Робинзон для мелких попугаев 500г.","price":71,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2568","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2599	2016-05-26 00:42:37.175187	2016-06-05 19:44:22.335828	farm	products	{"category_ids":[15,64,112],"title":"ЧАППИ сух.д/собак мясное изобилие 600г.","price":60,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[98]}}	{"_index":"farm","_type":"products","_id":"2599","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2574	2016-05-26 00:42:35.153141	2016-06-05 19:44:22.513284	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для собак от блох клещей 40-60 кг","price":459,"unit":"шт","properties":{"home_animal_ids":[93]}}	{"_index":"farm","_type":"products","_id":"2574","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2566	2016-05-26 00:42:34.395483	2016-06-05 19:44:22.600985	farm	products	{"category_ids":[15,64,112],"title":"РИО  средние попугаи линька 500г","price":89,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2566","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2604	2016-05-26 00:42:37.663888	2016-06-05 19:44:22.802181	farm	products	{"category_ids":[15,65],"title":"Брудер 44х96х50 новой модификации собранный","price":6409,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2604","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2605	2016-05-26 00:42:37.7555	2016-06-05 19:44:22.890681	farm	products	{"category_ids":[15,65],"title":"Клетка для бройлеров \\"ПРОФЕССИОНАЛ 1-7\\"","price":3465,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2605","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2607	2016-05-26 00:42:37.92528	2016-06-05 19:44:23.079668	farm	products	{"category_ids":[15,65],"title":"Клетка для кур-несушек \\"ПРОФЕССИОНАЛ 1-7\\"","price":3868,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2607","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2609	2016-05-26 00:42:38.100883	2016-06-05 19:44:23.301143	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"Профессионал\\" на 20 голов","price":2542,"unit":"шт","properties":{"animal_ids":[51]}}	{"_index":"farm","_type":"products","_id":"2609","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2610	2016-05-26 00:42:38.191202	2016-06-05 19:44:23.390077	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"Профессионал\\" на 50 голов","price":4420,"unit":"шт","properties":{"animal_ids":[51]}}	{"_index":"farm","_type":"products","_id":"2610","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2612	2016-05-26 00:42:38.345312	2016-06-05 19:44:23.546299	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"Профессионал+\\" на 30 голов","price":3045,"unit":"шт","properties":{"animal_ids":[51]}}	{"_index":"farm","_type":"products","_id":"2612","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2722	2016-05-26 00:42:50.471301	2016-06-05 19:44:23.625107	farm	products	{"category_ids":[15,68],"title":"Премикс для телят 300 гр","price":80,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2722","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2596	2016-05-26 00:42:36.931974	2016-06-05 19:44:21.03458	farm	products	{"category_ids":[15,64,112],"title":"ЦЕЗАРЬ ПАУЧ д/собак курица с зелеными овощами 100г","price":33,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[108]}}	{"_index":"farm","_type":"products","_id":"2596","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2615	2016-05-26 00:42:38.613231	2016-06-05 19:44:23.913126	farm	products	{"category_ids":[15,65],"title":"Клеточная батарея для кроликов 2-1","price":6077,"unit":"шт","properties":{"animal_ids":[55]}}	{"_index":"farm","_type":"products","_id":"2615","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2617	2016-05-26 00:42:38.787385	2016-06-05 19:44:24.070464	farm	products	{"category_ids":[15,66],"title":"Ижевск ПК1 несушек 48 недель","price":20,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2617","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2619	2016-05-26 00:42:39.043649	2016-06-05 19:44:24.246469	farm	products	{"category_ids":[15,66],"title":"К-58 для откорма свиней специальный","price":18,"unit":"кг","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2619","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2621	2016-05-26 00:42:39.331126	2016-06-05 19:44:24.413323	farm	products	{"category_ids":[15,66],"title":"К-60 для коров специальный","price":18,"unit":"кг","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2621","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2622	2016-05-26 00:42:39.411491	2016-06-05 19:44:24.491679	farm	products	{"category_ids":[15,66],"title":"К-65 для откорма КРС","price":20,"unit":"кг","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2622","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2624	2016-05-26 00:42:39.636469	2016-06-05 19:44:24.647122	farm	products	{"category_ids":[15,66],"title":"Курск Для взрослых кроликов","price":17,"unit":"шт","properties":{"animal_ids":[55]}}	{"_index":"farm","_type":"products","_id":"2624","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2625	2016-05-26 00:42:39.712281	2016-06-05 19:44:24.800371	farm	products	{"category_ids":[15,66],"title":"Курск Для откорма Свиней","price":17,"unit":"кг","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2625","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2627	2016-05-26 00:42:39.927542	2016-06-05 19:44:25.091907	farm	products	{"category_ids":[15,66],"title":"Отруби пшеничные кормовые","price":13,"unit":"кг","properties":{"animal_ids":[49,50,52,53,54]}}	{"_index":"farm","_type":"products","_id":"2627","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2629	2016-05-26 00:42:40.1024	2016-06-05 19:44:25.245962	farm	products	{"category_ids":[15,66],"title":"ПК-1 П для перепелов 7 недель и старше","price":30,"unit":"кг","properties":{"animal_ids":[51]}}	{"_index":"farm","_type":"products","_id":"2629","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2631	2016-05-26 00:42:40.279752	2016-06-05 19:44:25.467887	farm	products	{"category_ids":[15,66],"title":"ПК-1/2 для кур специальный ЕРШ","price":18,"unit":"кг","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2631","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2633	2016-05-26 00:42:40.446199	2016-06-05 19:44:25.869239	farm	products	{"category_ids":[15,66],"title":"ПК-10 для взрослых индеек","price":25,"unit":"кг","properties":{"animal_ids":[52]}}	{"_index":"farm","_type":"products","_id":"2633","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2634	2016-05-26 00:42:40.535446	2016-06-05 19:44:25.959636	farm	products	{"category_ids":[15,66],"title":"ПК-2 для молод. Кур 1-7 нед по заказу","price":39,"unit":"кг","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2634","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2636	2016-05-26 00:42:40.690225	2016-06-05 19:44:26.213857	farm	products	{"category_ids":[15,66],"title":"ПК-4 для молод кур 14-17 нед.","price":25,"unit":"кг","properties":{}}	{"_index":"farm","_type":"products","_id":"2636","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2638	2016-05-26 00:42:40.856726	2016-06-05 19:44:26.38084	farm	products	{"category_ids":[15,66],"title":"ПК-6 для бройлеров 5 нед и старше","price":37,"unit":"кг","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2638","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2639	2016-05-26 00:42:40.957147	2016-06-05 19:44:26.457537	farm	products	{"category_ids":[15,66],"title":"СК Смесь кормовая","price":17,"unit":"кг","properties":{"animal_ids":[49,50,52,53,54,55]}}	{"_index":"farm","_type":"products","_id":"2639","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2797	2016-05-26 00:42:58.311584	2016-06-05 19:44:26.535436	farm	products	{"category_ids":[15,70],"title":"На счастье","price":2079,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2797","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2643	2016-05-26 00:42:41.364222	2016-06-05 19:44:26.847123	farm	products	{"category_ids":[15,67],"title":"Бункерная кормушка из оцинковки на 10 л","price":476,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2643","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2645	2016-05-26 00:42:41.546903	2016-06-05 19:44:27.002475	farm	products	{"category_ids":[15,67],"title":"Навесная кормушка  для перепелов 89 см","price":332,"unit":"шт","properties":{"animal_ids":[51]}}	{"_index":"farm","_type":"products","_id":"2645","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2646	2016-05-26 00:42:41.640233	2016-06-05 19:44:27.080821	farm	products	{"category_ids":[15,67],"title":"Навесная кормушка для кур 44 см","price":321,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2646","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2648	2016-05-26 00:42:41.808945	2016-06-05 19:44:27.269988	farm	products	{"category_ids":[15,67],"title":"Автопоилка для молодняка птиц","price":238,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2648","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2649	2016-05-26 00:42:41.906785	2016-06-05 19:44:27.370001	farm	products	{"category_ids":[15,67],"title":"Бак для воды","price":960,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2649","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2653	2016-05-26 00:42:42.341506	2016-06-05 19:44:27.702713	farm	products	{"category_ids":[15,67],"title":"Кормушка бункерная прозрачная для кур 10 л","price":580,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2653","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2655	2016-05-26 00:42:42.559822	2016-06-05 19:44:27.859315	farm	products	{"category_ids":[15,67],"title":"Кормушка под банку","price":119,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2655","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2656	2016-05-26 00:42:42.655621	2016-06-05 19:44:27.936855	farm	products	{"category_ids":[15,67],"title":"Кормушка/поилка лотковая 50см для цыплят (КЖ-50)","price":250,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2656","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2658	2016-05-26 00:42:42.828811	2016-06-05 19:44:28.102173	farm	products	{"category_ids":[15,67],"title":"Ниппель ПКН-6/360 для бройлеров и перепелов","price":40,"unit":"шт","properties":{"animal_ids":[49,51,52]}}	{"_index":"farm","_type":"products","_id":"2658","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2659	2016-05-26 00:42:42.916928	2016-06-05 19:44:28.193029	farm	products	{"category_ids":[15,67],"title":"Овоскоп","price":595,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2659","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2661	2016-05-26 00:42:43.150546	2016-06-05 19:44:28.370287	farm	products	{"category_ids":[15,67],"title":"Поилка вакуумная на 3 литра","price":262,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2661","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2662	2016-05-26 00:42:43.23727	2016-06-05 19:44:28.459022	farm	products	{"category_ids":[15,67],"title":"Поилка вакуумная на 5 литров","price":346,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2662","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2665	2016-05-26 00:42:43.623656	2016-06-05 19:44:28.714772	farm	products	{"category_ids":[15,67],"title":"Поилка для кроликов ПКН-10 в комплекте с крепление","price":54,"unit":"шт","properties":{"animal_ids":[55]}}	{"_index":"farm","_type":"products","_id":"2665","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2666	2016-05-26 00:42:43.728965	2016-06-05 19:44:28.792212	farm	products	{"category_ids":[15,67],"title":"Поилка для цыплят 1.5 л","price":179,"unit":"шт","properties":{"animal_ids":[49,52]}}	{"_index":"farm","_type":"products","_id":"2666","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2668	2016-05-26 00:42:43.901162	2016-06-05 19:44:28.946786	farm	products	{"category_ids":[15,67],"title":"Поилка ниппельная ПСН-33 для свиней","price":179,"unit":"шт","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2668","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2669	2016-05-26 00:42:44.029487	2016-06-05 19:44:29.025965	farm	products	{"category_ids":[15,67],"title":"Поилка ПЖН-8/360 с креплением","price":54,"unit":"шт","properties":{"animal_ids":[49,52]}}	{"_index":"farm","_type":"products","_id":"2669","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2671	2016-05-26 00:42:44.253986	2016-06-05 19:44:29.192611	farm	products	{"category_ids":[15,67],"title":"Поилка ПКН-9 для кроликов с креплением","price":58,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2671","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2672	2016-05-26 00:42:44.353057	2016-06-05 19:44:29.281641	farm	products	{"category_ids":[15,67],"title":"Поилка ПКНК-12/360 оснащена креплением под круглую трубу 25 мм","price":80,"unit":"шт","properties":{"animal_ids":[49,51,52]}}	{"_index":"farm","_type":"products","_id":"2672","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2674	2016-05-26 00:42:44.542586	2016-06-05 19:44:29.47025	farm	products	{"category_ids":[15,67],"title":"Поилка ПКНС-8 с наружным креплением на сетку, под","price":47,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2674","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2675	2016-05-26 00:42:44.633565	2016-06-05 19:44:29.558654	farm	products	{"category_ids":[15,67],"title":"Поилка под бутылку","price":381,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2675","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2677	2016-05-26 00:42:44.816388	2016-06-05 19:44:29.716674	farm	products	{"category_ids":[15,67],"title":"Тройник красный 10 мм","price":34,"unit":"шт","properties":{"animal_ids":[49,51,52,55]}}	{"_index":"farm","_type":"products","_id":"2677","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2679	2016-05-26 00:42:45.150637	2016-06-05 19:44:29.937313	farm	products	{"category_ids":[15,67],"title":"Шланг для ниппельного поения 8мм","price":40,"unit":"м","properties":{"animal_ids":[49,51,52,55]}}	{"_index":"farm","_type":"products","_id":"2679","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2680	2016-05-26 00:42:45.245011	2016-06-05 19:44:30.014385	farm	products	{"category_ids":[15,67],"title":"Штуцер диаметром 10 мм","price":40,"unit":"шт","properties":{"animal_ids":[49,51,52,55]}}	{"_index":"farm","_type":"products","_id":"2680","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2682	2016-05-26 00:42:45.479203	2016-06-05 19:44:30.180532	farm	products	{"category_ids":[15,68],"title":"БВМД для свиней 300 гр","price":61,"unit":"шт","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2682","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2684	2016-05-26 00:42:45.707881	2016-06-05 19:44:30.348221	farm	products	{"category_ids":[15,68],"title":"Белковая  кормосмесь 2кг (аналог кормовых дрожжей)","price":251,"unit":"шт","properties":{"animal_ids":[49,50,51,52,53]}}	{"_index":"farm","_type":"products","_id":"2684","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2685	2016-05-26 00:42:45.792055	2016-06-05 19:44:30.436478	farm	products	{"category_ids":[15,68],"title":"Вазелин 200г  (банка)","price":65,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2685","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2689	2016-05-26 00:42:46.19018	2016-06-05 19:44:30.781462	farm	products	{"category_ids":[15,68],"title":"Крем для доения \\"Денница\\" (200гр.) банка","price":81,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2689","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2690	2016-05-26 00:42:46.290611	2016-06-05 19:44:30.869459	farm	products	{"category_ids":[15,68],"title":"Крем для доения \\"Денница\\" (500гр.)","price":147,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2690","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2692	2016-05-26 00:42:46.516106	2016-06-05 19:44:31.026108	farm	products	{"category_ids":[15,68],"title":"Крем для доения \\"Ночка\\" банка 200г.","price":115,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2692","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2694	2016-05-26 00:42:46.701378	2016-06-05 19:44:31.241517	farm	products	{"category_ids":[15,68],"title":"Крем Любава 250мл. с ионами серебра .","price":175,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2694","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2695	2016-05-26 00:42:46.825102	2016-06-05 19:44:31.503685	farm	products	{"category_ids":[15,68],"title":"Лимисол-Ф (брикет 5кг)","price":230,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2695","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2698	2016-05-26 00:42:47.144473	2016-06-05 19:44:31.814679	farm	products	{"category_ids":[15,68],"title":"Минеральный комплекс для домашней птицы 500 гр ДС","price":52,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2698","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2699	2016-05-26 00:42:47.235598	2016-06-05 19:44:31.914071	farm	products	{"category_ids":[15,68],"title":"Мясокостная мука 2 кг","price":272,"unit":"шт","properties":{"animal_ids":[49,50,51,52,53]}}	{"_index":"farm","_type":"products","_id":"2699","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2700	2016-05-26 00:42:47.325843	2016-06-05 19:44:31.99214	farm	products	{"category_ids":[15,68],"title":"Мясокостная мука 400 гр","price":75,"unit":"шт","properties":{"animal_ids":[49,50,51,52,53]}}	{"_index":"farm","_type":"products","_id":"2700","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2702	2016-05-26 00:42:47.504644	2016-06-05 19:44:32.148689	farm	products	{"category_ids":[15,68],"title":"Премикс для бройлеров 150 гр","price":58,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2702","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2703	2016-05-26 00:42:47.593377	2016-06-05 19:44:32.226047	farm	products	{"category_ids":[15,68],"title":"Премикс для голубей (500 гр.) Б","price":129,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2703","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2705	2016-05-26 00:42:47.944278	2016-06-05 19:44:32.383059	farm	products	{"category_ids":[15,68],"title":"Премикс для коз и овец 200 гр.","price":51,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2705","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2707	2016-05-26 00:42:48.124488	2016-06-05 19:44:32.560081	farm	products	{"category_ids":[15,68],"title":"Премикс для кур-несушек и другой дом. птицы \\"Совершенная Формула\\" 150 гр.","price":78,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2707","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2709	2016-05-26 00:42:48.366079	2016-06-05 19:44:32.793543	farm	products	{"category_ids":[15,68],"title":"Премикс для кур-несушек и другой домашней птицы 30","price":84,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2709","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2710	2016-05-26 00:42:48.465453	2016-06-05 19:44:32.871156	farm	products	{"category_ids":[15,68],"title":"Премикс для кур-несушек и другой птицы  (500 гр) Б","price":91,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2710","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2711	2016-05-26 00:42:48.62429	2016-06-05 19:44:32.948468	farm	products	{"category_ids":[15,68],"title":"Премикс для молочных коров (500 гр) Б.","price":82,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2711","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2713	2016-05-26 00:42:49.032264	2016-06-05 19:44:33.103501	farm	products	{"category_ids":[15,68],"title":"Премикс для молочных коров 300 гр","price":104,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2713","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2715	2016-05-26 00:42:49.491114	2016-06-05 19:44:33.43787	farm	products	{"category_ids":[15,68],"title":"Премикс для поросят (500 г) Б.","price":94,"unit":"шт","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2715","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2717	2016-05-26 00:42:49.815837	2016-06-05 19:44:33.637177	farm	products	{"category_ids":[15,68],"title":"Премикс для свиней (500 гр) Б.","price":85,"unit":"шт","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2717","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2718	2016-05-26 00:42:49.904998	2016-06-05 19:44:33.715473	farm	products	{"category_ids":[15,68],"title":"Премикс для свиней на откорме 150 гр","price":47,"unit":"шт","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2718","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2720	2016-05-26 00:42:50.178402	2016-06-05 19:44:33.870799	farm	products	{"category_ids":[15,68],"title":"Премикс для свиноматок 150 гр.","price":44,"unit":"шт","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2720","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2721	2016-05-26 00:42:50.347152	2016-06-05 19:44:34.027152	farm	products	{"category_ids":[15,68],"title":"Премикс для телят (500 гр) Б.","price":92,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2721","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2725	2016-05-26 00:42:50.962632	2016-06-05 19:44:34.29299	farm	products	{"category_ids":[15,68],"title":"Премикс для цыплят,утят,индюшат.150гр.","price":58,"unit":"шт","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2725","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2727	2016-05-26 00:42:51.166491	2016-06-05 19:44:34.448898	farm	products	{"category_ids":[15,68],"title":"Прикормка для рыб универсальная 1 кг","price":105,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2727","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2728	2016-05-26 00:42:51.263914	2016-06-05 19:44:34.526649	farm	products	{"category_ids":[15,68],"title":"Примекс для кур \\"Антистрес\\" Доб-ка","price":113,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2728","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2730	2016-05-26 00:42:51.445163	2016-06-05 19:44:34.683216	farm	products	{"category_ids":[15,68],"title":"Ракушка калиброванная 4кг.","price":136,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2730","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2732	2016-05-26 00:42:51.747441	2016-06-05 19:44:34.839246	farm	products	{"category_ids":[15,68],"title":"Рыбная мука 2 кг","price":507,"unit":"шт","properties":{"animal_ids":[49,50,51,52,53]}}	{"_index":"farm","_type":"products","_id":"2732","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2734	2016-05-26 00:42:51.943168	2016-06-05 19:44:35.016002	farm	products	{"category_ids":[15,68],"title":"Сера кормовая  \\"Рацион\\" 300 гр.","price":54,"unit":"шт","properties":{"animal_ids":[49,50,51,52,53,54]}}	{"_index":"farm","_type":"products","_id":"2734","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2736	2016-05-26 00:42:52.112777	2016-06-05 19:44:35.270764	farm	products	{"category_ids":[15,68],"title":"Травяная мука 1,5кг","price":185,"unit":"шт","properties":{"animal_ids":[50,53,54,55]}}	{"_index":"farm","_type":"products","_id":"2736","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2738	2016-05-26 00:42:52.362726	2016-06-05 19:44:35.770727	farm	products	{"category_ids":[15,68],"title":"Цеолитовый природный комплекс  для домашней птицы 500 гр","price":57,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2738","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2739	2016-05-26 00:42:52.454833	2016-06-05 19:44:35.993597	farm	products	{"category_ids":[15,68],"title":"Цеолитовый природный комплекс  для свиней 1,3 кг","price":123,"unit":"шт","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2739","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2740	2016-05-26 00:42:52.557956	2016-06-05 19:44:36.148342	farm	products	{"category_ids":[15,68],"title":"Шрот подсолнечный 1,6 кг.","price":190,"unit":"шт","properties":{"animal_ids":[49,50,52,53]}}	{"_index":"farm","_type":"products","_id":"2740","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2741	2016-05-26 00:42:52.652611	2016-06-05 19:44:36.238357	farm	products	{"category_ids":[15,69],"title":"Баклажан \\"Алмаз\\"","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2741","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2743	2016-05-26 00:42:52.825102	2016-06-05 19:44:36.404882	farm	products	{"category_ids":[15,69],"title":"Виола","price":60,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2743","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2745	2016-05-26 00:42:53.000133	2016-06-05 19:44:36.560063	farm	products	{"category_ids":[15,69],"title":"Кабачки \\"Искандер\\"","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2745","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2747	2016-05-26 00:42:53.154039	2016-06-05 19:44:36.71543	farm	products	{"category_ids":[15,69],"title":"Капуста раняя","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2747","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2748	2016-05-26 00:42:53.246965	2016-06-05 19:44:36.816058	farm	products	{"category_ids":[15,69],"title":"Кашпо","price":250,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2748","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2751	2016-05-26 00:42:53.556234	2016-06-05 19:44:37.081617	farm	products	{"category_ids":[15,69],"title":"Перец \\"Белозерка\\"","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2751","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2752	2016-05-26 00:42:53.713393	2016-06-05 19:44:37.171017	farm	products	{"category_ids":[15,69],"title":"Перец \\"Виннипух\\"","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2752","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2754	2016-05-26 00:42:53.886676	2016-06-05 19:44:37.338902	farm	products	{"category_ids":[15,69],"title":"Петунья","price":60,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2754","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2756	2016-05-26 00:42:54.156074	2016-06-05 19:44:37.515748	farm	products	{"category_ids":[15,69],"title":"Томат \\"Бычье сердце\\"","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2756","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2757	2016-05-26 00:42:54.235257	2016-06-05 19:44:37.593514	farm	products	{"category_ids":[15,69],"title":"Томат \\"Де барао\\"","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2757","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2759	2016-05-26 00:42:54.521858	2016-06-05 19:44:37.837931	farm	products	{"category_ids":[15,69],"title":"Томат \\"Челнок\\"","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2759","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2761	2016-05-26 00:42:54.735407	2016-06-05 19:44:38.005783	farm	products	{"category_ids":[15,70],"title":"Адреналин","price":563,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2761","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2763	2016-05-26 00:42:54.924929	2016-06-05 19:44:38.194282	farm	products	{"category_ids":[15,70],"title":"Ассорти \\"железная стрекоза\\"","price":434,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2763","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2766	2016-05-26 00:42:55.32168	2016-06-05 19:44:38.438849	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 170 \\"Экстра\\"","price":24,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2766","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2768	2016-05-26 00:42:55.544664	2016-06-05 19:44:38.604724	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 210 \\"Экстра\\" (толстая)","price":29,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2768","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2770	2016-05-26 00:42:55.713571	2016-06-05 19:44:38.761218	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 400 прямоугольные","price":398,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2770","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2772	2016-05-26 00:42:55.87773	2016-06-05 19:44:38.928127	farm	products	{"category_ids":[15,70],"title":"Бенефис","price":4160,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2772","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2773	2016-05-26 00:42:56.010344	2016-06-05 19:44:39.016067	farm	products	{"category_ids":[15,70],"title":"Бинго","price":553,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2773","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2774	2016-05-26 00:42:56.090744	2016-06-05 19:44:39.105914	farm	products	{"category_ids":[15,70],"title":"Бубль-гум","price":1928,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2774","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2776	2016-05-26 00:42:56.270287	2016-06-05 19:44:39.283809	farm	products	{"category_ids":[15,70],"title":"Веселый пиротехник","price":675,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2776","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2778	2016-05-26 00:42:56.459516	2016-06-05 19:44:39.449068	farm	products	{"category_ids":[15,70],"title":"Госпожа метелица","price":3815,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2778","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2780	2016-05-26 00:42:56.647652	2016-06-05 19:44:39.606942	farm	products	{"category_ids":[15,70],"title":"ЗД.Медный всадник","price":3400,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2780","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2781	2016-05-26 00:42:56.734218	2016-06-05 19:44:39.683305	farm	products	{"category_ids":[15,70],"title":"Зимняя ночь","price":2520,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2781","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2783	2016-05-26 00:42:56.958202	2016-06-05 19:44:39.839557	farm	products	{"category_ids":[15,70],"title":"Изуумрудный город","price":16500,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2783","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2785	2016-05-26 00:42:57.167818	2016-06-05 19:44:40.0053	farm	products	{"category_ids":[15,70],"title":"Корсар-1","price":68,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2785","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2787	2016-05-26 00:42:57.348322	2016-06-05 19:44:40.239311	farm	products	{"category_ids":[15,70],"title":"Корсар-4","price":114,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2787","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2789	2016-05-26 00:42:57.52207	2016-06-05 19:44:40.426976	farm	products	{"category_ids":[15,70],"title":"Лукоморье","price":1767,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2789","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2790	2016-05-26 00:42:57.63318	2016-06-05 19:44:40.54346	farm	products	{"category_ids":[15,70],"title":"Лунный цветок","price":36,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2790","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2792	2016-05-26 00:42:57.814483	2016-06-05 19:44:40.739141	farm	products	{"category_ids":[15,70],"title":"Мальчишник","price":2016,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2792","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2794	2016-05-26 00:42:57.994597	2016-06-05 19:44:40.962719	farm	products	{"category_ids":[15,70],"title":"Метелица","price":157,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2794","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2798	2016-05-26 00:42:58.500894	2016-06-05 19:44:41.138897	farm	products	{"category_ids":[15,70],"title":"Нано-салют","price":563,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2798","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2800	2016-05-26 00:42:59.032578	2016-06-05 19:44:41.316306	farm	products	{"category_ids":[15,70],"title":"Не тормози","price":1198,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2800","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2802	2016-05-26 00:42:59.46805	2016-06-05 19:44:41.483041	farm	products	{"category_ids":[15,70],"title":"Неваляшка","price":999,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2802","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2803	2016-05-26 00:42:59.722952	2016-06-05 19:44:41.561093	farm	products	{"category_ids":[15,70],"title":"Новогоднее приключение","price":8554,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2803","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2805	2016-05-26 00:43:00.480264	2016-06-05 19:44:41.716222	farm	products	{"category_ids":[15,70],"title":"Павлин","price":2360,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2805","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2806	2016-05-26 00:43:00.689697	2016-06-05 19:44:41.794034	farm	products	{"category_ids":[15,70],"title":"Перчинка","price":543,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2806","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2809	2016-05-26 00:43:01.001764	2016-06-05 19:44:42.094824	farm	products	{"category_ids":[15,70],"title":"пневмохлопушка Свадебная 30 см (конф. сердце)","price":173,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2809","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2632	2016-05-26 00:42:40.360445	2016-06-05 19:44:25.612666	farm	products	{"category_ids":[15,66],"title":"ПК-1/2 ПЗ для кур несушек 48 нед. и старше","price":16,"unit":"кг","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2632","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2813	2016-05-26 00:43:01.456749	2016-06-05 19:44:42.438572	farm	products	{"category_ids":[15,70],"title":"Радость общения","price":3180,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2813","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2815	2016-05-26 00:43:01.880448	2016-06-05 19:44:42.617263	farm	products	{"category_ids":[15,70],"title":"Русский сувенир","price":2310,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2815","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2817	2016-05-26 00:43:02.044159	2016-06-05 19:44:42.773177	farm	products	{"category_ids":[15,70],"title":"Северное сияние","price":1700,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2817","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2818	2016-05-26 00:43:02.135439	2016-06-05 19:44:42.85068	farm	products	{"category_ids":[15,70],"title":"Смайлики","price":127,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2818","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2820	2016-05-26 00:43:02.373498	2016-06-05 19:44:43.105998	farm	products	{"category_ids":[15,70],"title":"Снеговик","price":858,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2820","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2822	2016-05-26 00:43:02.545162	2016-06-05 19:44:43.450013	farm	products	{"category_ids":[15,70],"title":"Снегурочка","price":3374,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2822","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2824	2016-05-26 00:43:02.759587	2016-06-05 19:44:43.62844	farm	products	{"category_ids":[15,70],"title":"Сорвиголова","price":1667,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2824","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2826	2016-05-26 00:43:02.947527	2016-06-05 19:44:43.806342	farm	products	{"category_ids":[15,70],"title":"Только ты","price":4160,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2826","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2827	2016-05-26 00:43:03.03886	2016-06-05 19:44:43.88446	farm	products	{"category_ids":[15,70],"title":"Тропикана","price":2560,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2827","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2829	2016-05-26 00:43:03.224418	2016-06-05 19:44:44.270535	farm	products	{"category_ids":[15,70],"title":"Удалой","price":5292,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2829","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2831	2016-05-26 00:43:03.434389	2016-06-05 19:44:44.796666	farm	products	{"category_ids":[15,70],"title":"Хлопушка","price":79,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2831","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2833	2016-05-26 00:43:03.636224	2016-06-05 19:44:44.973303	farm	products	{"category_ids":[15,70],"title":"Хлопушка \\"Супер\\"","price":88,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2833","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2834	2016-05-26 00:43:03.727591	2016-06-05 19:44:45.050752	farm	products	{"category_ids":[15,70],"title":"Цветущая сакура","price":2520,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2834","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2836	2016-05-26 00:43:03.901532	2016-06-05 19:44:45.217622	farm	products	{"category_ids":[15,70],"title":"Чудо-юдо","price":478,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2836","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2838	2016-05-26 00:43:04.114042	2016-06-05 19:44:45.43901	farm	products	{"category_ids":[15,70],"title":"Ястреб","price":576,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2838","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2840	2016-05-26 00:43:04.306302	2016-06-05 19:44:45.617558	farm	products	{"category_ids":[15,71],"title":"Родентицидная прим \\"Крысиная смерть № 1\\"  (200гр.)","price":120,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2840","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2842	2016-05-26 00:43:04.480368	2016-06-05 19:44:45.805919	farm	products	{"category_ids":[15,71],"title":"Родентицидная приманка \\"ЩЕЛКУНЧИК\\" 0.2кг","price":100,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2842","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2843	2016-05-26 00:43:04.622939	2016-06-05 19:44:45.883425	farm	products	{"category_ids":[15,71],"title":"Серная дымовая шашка \\"Климат\\" 300г.","price":91,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2843","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2844	2016-05-26 00:43:04.865612	2016-06-05 19:44:45.962521	farm	products	{"category_ids":[15,71],"title":"Циперол 170мл аэрозоль","price":322,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2844","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2846	2016-05-26 00:43:05.120827	2016-06-05 19:44:46.143301	farm	products	{"category_ids":[15,71],"title":"ОКСАРЕП (0,5л)","price":553,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2846","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2848	2016-05-26 00:43:05.289542	2016-06-05 19:44:46.306105	farm	products	{"category_ids":[15,71],"title":"Инсекто-акарицидная шашка Вихрь (0,1)","price":455,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2848","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2850	2016-05-26 00:43:05.491516	2016-06-05 19:44:46.483207	farm	products	{"category_ids":[15,71],"title":"Клей ALT (130мл.)","price":255,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2850","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2852	2016-05-26 00:43:05.673007	2016-06-05 19:44:47.577627	farm	products	{"category_ids":[15,71],"title":"Клей Mr.Mouse от грызунов и насекомых 135г/60","price":197,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2852","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2854	2016-05-26 00:43:05.849082	2016-06-05 19:44:49.050156	farm	products	{"category_ids":[15,71],"title":"БойКот гранулы 100г. Арахис и Шоколад","price":30,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2854","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2459	2016-05-26 00:42:24.81798	2016-06-05 19:44:10.887237	farm	products	{"category_ids":[15,59],"title":"Гирлянды Светодиодные 40л. с фигурками","price":500,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2459","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2460	2016-05-26 00:42:24.906356	2016-06-05 19:44:11.032828	farm	products	{"category_ids":[15,59],"title":"Е2003 100л. простая 7м.","price":338,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2460","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2462	2016-05-26 00:42:25.062279	2016-06-05 19:44:11.187754	farm	products	{"category_ids":[15,59],"title":"Е2065 Сосулька 200л. 2,7м.","price":408,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2462","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2464	2016-05-26 00:42:25.217716	2016-06-05 19:44:11.333401	farm	products	{"category_ids":[15,59],"title":"Е2105 Сетка 320 ламп цетная бегущая","price":1400,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2464","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2469	2016-05-26 00:42:25.639864	2016-06-05 19:44:11.577745	farm	products	{"category_ids":[15,60],"title":"Разделочная доска","price":500,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2469","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2472	2016-05-26 00:42:25.920872	2016-06-05 19:44:11.821203	farm	products	{"category_ids":[15,61],"title":"Ель","price":1000,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2472","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2474	2016-05-26 00:42:26.094857	2016-06-05 19:44:12.044562	farm	products	{"category_ids":[15,61],"title":"Сосна","price":900,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2474","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2857	2016-05-26 00:43:06.18151	2016-06-05 19:44:50.051281	farm	products	{"category_ids":[15,71],"title":"Аксамит-нео 500мл с распылителем","price":501,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2857","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2859	2016-05-26 00:43:06.377958	2016-06-05 19:44:50.433962	farm	products	{"category_ids":[15,72],"title":"Инкубатор АИ-48Э","price":9282,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2859","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2506	2016-05-26 00:42:29.165066	2016-06-05 19:44:50.796579	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек рагу курица в кремовом соусе 85г","price":22,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2506","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2542	2016-05-26 00:42:32.240996	2016-06-05 19:44:50.884349	farm	products	{"category_ids":[15,64,112],"title":"НМ для привередливых кошек в асс.400г.","price":75,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[96]}}	{"_index":"farm","_type":"products","_id":"2542","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2849	2016-05-26 00:43:05.411591	2016-06-05 19:44:51.118766	farm	products	{"category_ids":[15,71],"title":"Йодная шашка Диксам (3 табл.)","price":284,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2849","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2519	2016-05-26 00:42:30.296706	2016-06-05 19:44:51.195245	farm	products	{"category_ids":[15,64,112],"title":"Вискис сух.д/котят подушечки с молоком индейка/морковь 350 г.","price":75,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[90]}}	{"_index":"farm","_type":"products","_id":"2519","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2554	2016-05-26 00:42:33.231035	2016-06-05 19:44:51.351253	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак миниатюрных пород курица 1,2кг.","price":212,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[103]}}	{"_index":"farm","_type":"products","_id":"2554","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2503	2016-05-26 00:42:28.829807	2016-06-05 19:44:51.43001	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек паштет говядина/печень 85г","price":22,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2503","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2537	2016-05-26 00:42:31.830724	2016-06-05 19:44:51.518822	farm	products	{"category_ids":[15,64,112],"title":"НМ для взрослых собак крупных пород 3кг","price":386,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[104]}}	{"_index":"farm","_type":"products","_id":"2537","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2492	2016-05-26 00:42:27.929479	2016-06-05 19:44:51.752271	farm	products	{"category_ids":[15,64,112],"title":"Вака + для Мел/сред. попугаев 500г.","price":47,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2492","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2513	2016-05-26 00:42:29.730142	2016-06-05 19:44:51.930084	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/кошек подушечки со сметаной и овощами гов/ягн/кролик 350г","price":75,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[90]}}	{"_index":"farm","_type":"products","_id":"2513","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2587	2016-05-26 00:42:36.220539	2016-06-05 19:44:52.006962	farm	products	{"category_ids":[15,64,112],"title":"Терра Пес для взрослых собак мел. и.сред.пород 2,4кг.","price":251,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[123]}}	{"_index":"farm","_type":"products","_id":"2587","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2733	2016-05-26 00:42:51.849038	2016-06-05 19:44:34.926963	farm	products	{"category_ids":[15,68],"title":"Рыбная мука 300 гр","price":85,"unit":"шт","properties":{"animal_ids":[49,50,51,52,53]}}	{"_index":"farm","_type":"products","_id":"2733","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2807	2016-05-26 00:43:00.768208	2016-06-05 19:44:41.916872	farm	products	{"category_ids":[15,70],"title":"пневмохлопушка праздничная 30 см (цветн. бум. конфети)","price":151,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2807","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2518	2016-05-26 00:42:30.208193	2016-06-05 19:44:15.076819	farm	products	{"category_ids":[15,64,112],"title":"Вискис сух.д/котят подушечки с молоком индейка/морковь 1,9 кг.","price":435,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[102]}}	{"_index":"farm","_type":"products","_id":"2518","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2475	2016-05-26 00:42:26.188565	2016-06-05 19:44:12.13353	farm	products	{"category_ids":[15,62],"title":"Куры \\"Хайсекс Белый\\"","price":450,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2475","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2477	2016-05-26 00:42:26.428122	2016-06-05 19:44:12.288088	farm	products	{"category_ids":[15,63],"title":"Зерновая смесь для птицы","price":25,"unit":"кг","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2477","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2480	2016-05-26 00:42:26.773968	2016-06-05 19:44:12.534131	farm	products	{"category_ids":[15,63],"title":"Мел 2,5 кг","price":150,"unit":"шт","properties":{"animal_ids":[49,50,51,52,53,54]}}	{"_index":"farm","_type":"products","_id":"2480","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2482	2016-05-26 00:42:26.964667	2016-06-05 19:44:12.689512	farm	products	{"category_ids":[15,63],"title":"Отруби","price":12,"unit":"кг","properties":{"animal_ids":[49,50,52,53,54,55]}}	{"_index":"farm","_type":"products","_id":"2482","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2484	2016-05-26 00:42:27.161851	2016-06-05 19:44:12.878158	farm	products	{"category_ids":[15,63],"title":"Пшеница","price":17,"unit":"кг","properties":{"animal_ids":[49,50,52,53]}}	{"_index":"farm","_type":"products","_id":"2484","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2486	2016-05-26 00:42:27.352012	2016-06-05 19:44:13.056705	farm	products	{"category_ids":[15,63],"title":"Размол зерновых №2","price":19,"unit":"кг","properties":{"animal_ids":[49,50,51,52,53]}}	{"_index":"farm","_type":"products","_id":"2486","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2489	2016-05-26 00:42:27.653379	2016-06-05 19:44:13.355903	farm	products	{"category_ids":[15,63],"title":"Ячмень","price":17,"unit":"кг","properties":{"animal_ids":[49,50,52,53,54,55]}}	{"_index":"farm","_type":"products","_id":"2489","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2458	2016-05-26 00:42:24.609387	2016-06-05 19:44:13.621909	farm	products	{"category_ids":[15,59],"title":"Гирлянды Светодиодные 160л.","price":450,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2458","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2490	2016-05-26 00:42:27.755017	2016-06-05 19:44:13.788495	farm	products	{"category_ids":[15,64,112],"title":"БРИТ для крупных пород 12 кг.","price":4084,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[115]}}	{"_index":"farm","_type":"products","_id":"2490","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2528	2016-05-26 00:42:31.008212	2016-06-05 19:44:14.055575	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек ассорти 350г.","price":60,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[90]}}	{"_index":"farm","_type":"products","_id":"2528","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2494	2016-05-26 00:42:28.083789	2016-06-05 19:44:14.666949	farm	products	{"category_ids":[15,64,112],"title":"Вака для Мел/сред. попугаев 500г.","price":40,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2494","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2526	2016-05-26 00:42:30.85161	2016-06-05 19:44:14.990142	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек ассорти 1,9кг.","price":280,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[102]}}	{"_index":"farm","_type":"products","_id":"2526","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2496	2016-05-26 00:42:28.239169	2016-06-05 19:44:15.233044	farm	products	{"category_ids":[15,64,112],"title":"Вака Люкс для Мелких и средних попугаев 1000г.","price":138,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[105]}}	{"_index":"farm","_type":"products","_id":"2496","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2509	2016-05-26 00:42:29.396183	2016-06-05 19:44:15.388293	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/стерилизованых кошек ГОВЯДИНА 1,9кг","price":435,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[102]}}	{"_index":"farm","_type":"products","_id":"2509","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2497	2016-05-26 00:42:28.318573	2016-06-05 19:44:15.710337	farm	products	{"category_ids":[15,64,112],"title":"Вака Люкс для средних попугаев 900г.","price":133,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[121]}}	{"_index":"farm","_type":"products","_id":"2497","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2493	2016-05-26 00:42:28.015227	2016-06-05 19:44:15.943857	farm	products	{"category_ids":[15,64,112],"title":"Вака для грызунов 500г.","price":29,"unit":"шт","properties":{"home_animal_ids":[122],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2493","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2502	2016-05-26 00:42:28.740237	2016-06-05 19:44:16.099278	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек желе с лососем 85г","price":22,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2502","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2524	2016-05-26 00:42:30.69711	2016-06-05 19:44:16.321491	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ ПАУЧ д/кошек курица в соусе 100г.","price":19,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[108]}}	{"_index":"farm","_type":"products","_id":"2524","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2504	2016-05-26 00:42:28.963014	2016-06-05 19:44:16.477382	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек паштет курица/индейка 85г","price":22,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2504","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2563	2016-05-26 00:42:34.129987	2016-06-05 19:44:17.755686	farm	products	{"category_ids":[15,64,112],"title":"РИО  волнистые попугаи линька 500г","price":79,"unit":"шт","properties":{"home_animal_ids":[95],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2563","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2584	2016-05-26 00:42:35.95099	2016-06-05 19:44:20.800821	farm	products	{"category_ids":[15,64,112],"title":"Терра Кот  в/у для взрослых кошек 85г.","price":16,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2584","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2514	2016-05-26 00:42:29.818998	2016-06-05 19:44:16.78829	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/кошек подушечки/паштет говядина/ягненок/кролик 350г","price":75,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[90]}}	{"_index":"farm","_type":"products","_id":"2514","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2510	2016-05-26 00:42:29.474131	2016-06-05 19:44:16.944023	farm	products	{"category_ids":[15,64,112],"title":"Вискас сух.д/стерилизованых кошек ГОВЯДИНА 350г","price":83,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[90]}}	{"_index":"farm","_type":"products","_id":"2510","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2556	2016-05-26 00:42:33.386664	2016-06-05 19:44:17.222406	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак миниатюрных пород 600 кг.","price":140,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[98]}}	{"_index":"farm","_type":"products","_id":"2556","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2530	2016-05-26 00:42:31.186344	2016-06-05 19:44:17.522055	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек ассорти 800г.","price":106,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[109]}}	{"_index":"farm","_type":"products","_id":"2530","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2536	2016-05-26 00:42:31.751779	2016-06-05 19:44:17.677397	farm	products	{"category_ids":[15,64,112],"title":"НМ для взрослых собак 500г","price":75,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2536","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2548	2016-05-26 00:42:32.741386	2016-06-05 19:44:17.935303	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак всех пород говядина 13 кг.","price":1550,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[107]}}	{"_index":"farm","_type":"products","_id":"2548","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2561	2016-05-26 00:42:33.787327	2016-06-05 19:44:18.089867	farm	products	{"category_ids":[15,64,113],"title":"ПУСИ КЭТ Наполнитель комкующийся 4,5л.3,4кг","price":94,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2561","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2549	2016-05-26 00:42:32.818512	2016-06-05 19:44:18.267506	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак всех пород говядина 600 кг.","price":86,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[98]}}	{"_index":"farm","_type":"products","_id":"2549","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2531	2016-05-26 00:42:31.272839	2016-06-05 19:44:18.511406	farm	products	{"category_ids":[15,64,112],"title":"КИТИКЕТ сух.д/кошек в ассортименте 2,2кг","price":275,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[120]}}	{"_index":"farm","_type":"products","_id":"2531","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2545	2016-05-26 00:42:32.507513	2016-06-05 19:44:18.756344	farm	products	{"category_ids":[15,64,112],"title":"НМ для щенков ср. и мелк. пород 500г","price":79,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[97]}}	{"_index":"farm","_type":"products","_id":"2545","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2560	2016-05-26 00:42:33.69756	2016-06-05 19:44:19.011743	farm	products	{"category_ids":[15,64,113],"title":"ПУСИ КЭТ Наполнитель древесный 4,5л.2,6кг","price":84,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2560","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2540	2016-05-26 00:42:32.065053	2016-06-05 19:44:19.190447	farm	products	{"category_ids":[15,64,112],"title":"НМ для котят в асс.400г.","price":75,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[96]}}	{"_index":"farm","_type":"products","_id":"2540","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2534	2016-05-26 00:42:31.574021	2016-06-05 19:44:19.457354	farm	products	{"category_ids":[15,64,113],"title":"Натуралист древесный 7л.2,5 кг.","price":74,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2534","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2595	2016-05-26 00:42:36.853505	2016-06-05 19:44:19.846861	farm	products	{"category_ids":[15,64,112],"title":"Фрискис 600 г.","price":144,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[98]}}	{"_index":"farm","_type":"products","_id":"2595","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2588	2016-05-26 00:42:36.306599	2016-06-05 19:44:20.055836	farm	products	{"category_ids":[15,64,112],"title":"Тушенка для собак 340г.","price":65,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[99]}}	{"_index":"farm","_type":"products","_id":"2588","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2569	2016-05-26 00:42:34.732991	2016-06-05 19:44:20.401194	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для кошек от блох клещей до 4кг","price":260,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2569","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2586	2016-05-26 00:42:36.13147	2016-06-05 19:44:20.712708	farm	products	{"category_ids":[15,64,112],"title":"Терра Кот для взрослых кошек 400г.","price":56,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[96]}}	{"_index":"farm","_type":"products","_id":"2586","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2614	2016-05-26 00:42:38.51369	2016-06-05 19:44:23.835021	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"Профессионал+\\" на 50 голов на колесах","price":4973,"unit":"шт","properties":{"animal_ids":[51]}}	{"_index":"farm","_type":"products","_id":"2614","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2598	2016-05-26 00:42:37.098953	2016-06-05 19:44:21.357667	farm	products	{"category_ids":[15,64,112],"title":"ЧАППИ сух.д/собак говядина 15кг.","price":1250,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[114]}}	{"_index":"farm","_type":"products","_id":"2598","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2576	2016-05-26 00:42:35.307924	2016-06-05 19:44:21.53496	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Ошейник от клещей (кошки/щенки)","price":313,"unit":"шт","properties":{"home_animal_ids":[93,94]}}	{"_index":"farm","_type":"products","_id":"2576","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2579	2016-05-26 00:42:35.563764	2016-06-05 19:44:21.768969	farm	products	{"category_ids":[15,64,112],"title":"РОЯЛ КАНИН для крупных пород. 15 кг.","price":4873,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[114]}}	{"_index":"farm","_type":"products","_id":"2579","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2597	2016-05-26 00:42:37.02094	2016-06-05 19:44:22.00144	farm	products	{"category_ids":[15,64,112],"title":"ЧАППИ кон. Мясное изобилие 400г..","price":75,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[96]}}	{"_index":"farm","_type":"products","_id":"2597","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2575	2016-05-26 00:42:35.230007	2016-06-05 19:44:22.169038	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для собак от блох клещей до 4кг","price":260,"unit":"шт","properties":{"home_animal_ids":[93]}}	{"_index":"farm","_type":"products","_id":"2575","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2578	2016-05-26 00:42:35.486908	2016-06-05 19:44:22.425084	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Ошейник от клещей для собак кр/пород","price":398,"unit":"шт","properties":{"home_animal_ids":[93]}}	{"_index":"farm","_type":"products","_id":"2578","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2603	2016-05-26 00:42:37.569841	2016-06-05 19:44:22.723291	farm	products	{"category_ids":[15,65],"title":"Лампа ИКЗК 220-250 красная","price":250,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2603","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2606	2016-05-26 00:42:37.837864	2016-06-05 19:44:22.967818	farm	products	{"category_ids":[15,65],"title":"Клетка для бройлеров \\"ПРОФЕССИОНАЛ 2-7\\"","price":6630,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2606","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2608	2016-05-26 00:42:38.013188	2016-06-05 19:44:23.15677	farm	products	{"category_ids":[15,65],"title":"Клетка для кур-несушек \\"ПРОФЕССИОНАЛ 1-7\\" на колесах","price":4358,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2608","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2611	2016-05-26 00:42:38.266359	2016-06-05 19:44:23.469127	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"ПРОФЕССИОНАЛ+\\" на 100голов","price":8840,"unit":"шт","properties":{"animal_ids":[51]}}	{"_index":"farm","_type":"products","_id":"2611","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2613	2016-05-26 00:42:38.434464	2016-06-05 19:44:23.701906	farm	products	{"category_ids":[15,65],"title":"Клетка для перепелов \\"Профессионал+\\" на 50 голов","price":4420,"unit":"шт","properties":{"animal_ids":[51]}}	{"_index":"farm","_type":"products","_id":"2613","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2616	2016-05-26 00:42:38.709125	2016-06-05 19:44:23.991841	farm	products	{"category_ids":[15,65],"title":"Лоток на 88 куриных","price":618,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2616","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2618	2016-05-26 00:42:38.876429	2016-06-05 19:44:24.157873	farm	products	{"category_ids":[15,66],"title":"К-58 ГР ПЗ для откорма свин. до жирн. конд.","price":16,"unit":"кг","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2618","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2620	2016-05-26 00:42:39.224066	2016-06-05 19:44:24.323672	farm	products	{"category_ids":[15,66],"title":"К-58 КР для откорма свиней до жирн. конд.","price":21,"unit":"кг","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2620","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2623	2016-05-26 00:42:39.541808	2016-06-05 19:44:24.569385	farm	products	{"category_ids":[15,66],"title":"КК-111 Комбикорм-концетрат для рыбы","price":29,"unit":"кг","properties":{}}	{"_index":"farm","_type":"products","_id":"2623","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2626	2016-05-26 00:42:39.814357	2016-06-05 19:44:24.985699	farm	products	{"category_ids":[15,66],"title":"Курск несушек 48 недель","price":19,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2626","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2628	2016-05-26 00:42:40.01489	2016-06-05 19:44:25.169387	farm	products	{"category_ids":[15,66],"title":"ПЗК-91 для кроликов","price":20,"unit":"кг","properties":{"animal_ids":[55]}}	{"_index":"farm","_type":"products","_id":"2628","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2630	2016-05-26 00:42:40.190557	2016-06-05 19:44:25.390098	farm	products	{"category_ids":[15,66],"title":"ПК-1/2 для кур несушек 48 нед. и старше","price":24,"unit":"кг","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2630","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2731	2016-05-26 00:42:51.540125	2016-06-05 19:44:34.759107	farm	products	{"category_ids":[15,68],"title":"Рыбий жир 100мл ДС","price":73,"unit":"шт","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2731","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2651	2016-05-26 00:42:42.149381	2016-06-05 19:44:27.547185	farm	products	{"category_ids":[15,67],"title":"Кормушка бункерная для цыплят 1 л","price":179,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2651","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2635	2016-05-26 00:42:40.611791	2016-06-05 19:44:26.046095	farm	products	{"category_ids":[15,66],"title":"ПК-30 для гусей родительского стада","price":29,"unit":"кг","properties":{"animal_ids":[50]}}	{"_index":"farm","_type":"products","_id":"2635","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2637	2016-05-26 00:42:40.777645	2016-06-05 19:44:26.301934	farm	products	{"category_ids":[15,66],"title":"ПК-5 для бройлеров 1-4 нед","price":39,"unit":"кг","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2637","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2640	2016-05-26 00:42:41.047958	2016-06-05 19:44:26.613631	farm	products	{"category_ids":[15,67],"title":"Бункерная кормушка для кроликов-гигантов( бол)","price":600,"unit":"шт","properties":{"animal_ids":[55]}}	{"_index":"farm","_type":"products","_id":"2640","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2641	2016-05-26 00:42:41.14892	2016-06-05 19:44:26.691267	farm	products	{"category_ids":[15,67],"title":"Бункерная кормушка из оцинковки для кроликов 1 кг","price":336,"unit":"шт","properties":{"animal_ids":[55]}}	{"_index":"farm","_type":"products","_id":"2641","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2644	2016-05-26 00:42:41.464225	2016-06-05 19:44:26.925249	farm	products	{"category_ids":[15,67],"title":"Бункерная кормушка оцинкованная на 25 л","price":807,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2644","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2647	2016-05-26 00:42:41.726556	2016-06-05 19:44:27.180215	farm	products	{"category_ids":[15,67],"title":"Навесная кормушка для кур 80 см","price":387,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2647","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2650	2016-05-26 00:42:42.043913	2016-06-05 19:44:27.45885	farm	products	{"category_ids":[15,67],"title":"Инфракрасный нагреватель","price":714,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2650","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2652	2016-05-26 00:42:42.252524	2016-06-05 19:44:27.625649	farm	products	{"category_ids":[15,67],"title":"Кормушка бункерная для цыплят 3 кг","price":227,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2652","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2654	2016-05-26 00:42:42.435987	2016-06-05 19:44:27.780987	farm	products	{"category_ids":[15,67],"title":"Кормушка бункерная с крышкой 6кг. для кур (КБ-6)","price":445,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2654","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2657	2016-05-26 00:42:42.743906	2016-06-05 19:44:28.013748	farm	products	{"category_ids":[15,67],"title":"Ниппелная поилка ПКН-6 для взрослого поголовья птиц","price":30,"unit":"шт","properties":{"animal_ids":[49,51,52]}}	{"_index":"farm","_type":"products","_id":"2657","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2660	2016-05-26 00:42:43.062752	2016-06-05 19:44:28.28128	farm	products	{"category_ids":[15,67],"title":"Поилка вакуумная на 10 литров","price":548,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2660","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2663	2016-05-26 00:42:43.333411	2016-06-05 19:44:28.547593	farm	products	{"category_ids":[15,67],"title":"Поилка вакуумная на 7,5 литров","price":417,"unit":"шт","properties":{"animal_ids":[49,50,52]}}	{"_index":"farm","_type":"products","_id":"2663","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2664	2016-05-26 00:42:43.425032	2016-06-05 19:44:28.636352	farm	products	{"category_ids":[15,67],"title":"Поилка двойная с креплением и каплеулавливателем ПКНК-24/360","price":100,"unit":"шт","properties":{"animal_ids":[49,52]}}	{"_index":"farm","_type":"products","_id":"2664","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2667	2016-05-26 00:42:43.813004	2016-06-05 19:44:28.871249	farm	products	{"category_ids":[15,67],"title":"Поилка микрочашечная ПМЧ-10 для перепелов, тройник,крепеж отдельно","price":54,"unit":"шт","properties":{"animal_ids":[51]}}	{"_index":"farm","_type":"products","_id":"2667","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2670	2016-05-26 00:42:44.11533	2016-06-05 19:44:29.114363	farm	products	{"category_ids":[15,67],"title":"Поилка ПКН-7 для кроликов с резьбой и гайкой","price":47,"unit":"шт","properties":{"animal_ids":[55]}}	{"_index":"farm","_type":"products","_id":"2670","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2673	2016-05-26 00:42:44.45633	2016-06-05 19:44:29.370253	farm	products	{"category_ids":[15,67],"title":"Поилка ПКНК-14/360 с креплением и каплеулавливател","price":85,"unit":"шт","properties":{"animal_ids":[49,51,52]}}	{"_index":"farm","_type":"products","_id":"2673","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2676	2016-05-26 00:42:44.725594	2016-06-05 19:44:29.636897	farm	products	{"category_ids":[15,67],"title":"Тройник белый 8 мм","price":23,"unit":"шт","properties":{"animal_ids":[49,51,52,55]}}	{"_index":"farm","_type":"products","_id":"2676","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2678	2016-05-26 00:42:44.964882	2016-06-05 19:44:29.791967	farm	products	{"category_ids":[15,67],"title":"Шланг для ниппельного поения 10мм","price":39,"unit":"м","properties":{"animal_ids":[49,51,52,55]}}	{"_index":"farm","_type":"products","_id":"2678","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2681	2016-05-26 00:42:45.347969	2016-06-05 19:44:30.092354	farm	products	{"category_ids":[15,68],"title":"БВМД для кур-несушек и другой домашней птицы 500 гр","price":76,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2681","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2687	2016-05-26 00:42:46.002401	2016-06-05 19:44:30.614854	farm	products	{"category_ids":[15,68],"title":"Готовый корм для цыплят (2 кг) Б.","price":180,"unit":"шт","properties":{"animal_ids":[49]}}	{"_index":"farm","_type":"products","_id":"2687","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2724	2016-05-26 00:42:50.881179	2016-06-05 19:44:34.203556	farm	products	{"category_ids":[15,68],"title":"Премикс для цыплят, утят, гусят, индюшат (500 гр) Б.","price":113,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2724","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2683	2016-05-26 00:42:45.613796	2016-06-05 19:44:30.269799	farm	products	{"category_ids":[15,68],"title":"Белковая  кормосмесь (500г) (аналог кормовых дрожжей)","price":69,"unit":"шт","properties":{"animal_ids":[49,50,51,52,53]}}	{"_index":"farm","_type":"products","_id":"2683","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2686	2016-05-26 00:42:45.893775	2016-06-05 19:44:30.525873	farm	products	{"category_ids":[15,68],"title":"Готовый корм для перепелов (2 кг) Б.","price":190,"unit":"шт","properties":{"animal_ids":[51]}}	{"_index":"farm","_type":"products","_id":"2686","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2688	2016-05-26 00:42:46.1057	2016-06-05 19:44:30.692501	farm	products	{"category_ids":[15,68],"title":"Кормовой антибиотик для всех видов животных и птиц \\"Биовит-80\\" 450 гр","price":154,"unit":"шт","properties":{"animal_ids":[49,50,51,52,53,54,55]}}	{"_index":"farm","_type":"products","_id":"2688","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2691	2016-05-26 00:42:46.424266	2016-06-05 19:44:30.948044	farm	products	{"category_ids":[15,68],"title":"Крем для доения \\"Зорька\\" 200 гр.","price":137,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2691","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2693	2016-05-26 00:42:46.615991	2016-06-05 19:44:31.104457	farm	products	{"category_ids":[15,68],"title":"Крем для доения Ночка, банка 750г","price":335,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2693","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2696	2016-05-26 00:42:46.941847	2016-06-05 19:44:31.626063	farm	products	{"category_ids":[15,68],"title":"Мел кормовой 2,5 кг ДС","price":103,"unit":"шт","properties":{"animal_ids":[49,50,51,52,53,54]}}	{"_index":"farm","_type":"products","_id":"2696","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2697	2016-05-26 00:42:47.042361	2016-06-05 19:44:31.715693	farm	products	{"category_ids":[15,68],"title":"Минеральный комплекс для домашней птицы 1,6 кг ДС","price":137,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2697","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2701	2016-05-26 00:42:47.422335	2016-06-05 19:44:32.070616	farm	products	{"category_ids":[15,68],"title":"Премикс \\"РАСКЛЕВУ-БОЙ!!!\\" 500г Б (против расклева яиц и канибализ. у птиц) спец состав","price":205,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2701","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2704	2016-05-26 00:42:47.748995	2016-06-05 19:44:32.304456	farm	products	{"category_ids":[15,68],"title":"Премикс для домашней птицы йодированный (500г) Б","price":111,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2704","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2706	2016-05-26 00:42:48.024059	2016-06-05 19:44:32.470475	farm	products	{"category_ids":[15,68],"title":"Премикс для кроликов и нутрий 200г ДС","price":56,"unit":"шт","properties":{"animal_ids":[55]}}	{"_index":"farm","_type":"products","_id":"2706","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2708	2016-05-26 00:42:48.272464	2016-06-05 19:44:32.704437	farm	products	{"category_ids":[15,68],"title":"Премикс для кур-несушек и другой домашней птицы 150 гр.","price":46,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2708","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2712	2016-05-26 00:42:48.81096	2016-06-05 19:44:33.026464	farm	products	{"category_ids":[15,68],"title":"Премикс для молочных коров 150 гр.","price":57,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2712","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2714	2016-05-26 00:42:49.237578	2016-06-05 19:44:33.181218	farm	products	{"category_ids":[15,68],"title":"Премикс для молочных поросят 300 гр.","price":80,"unit":"шт","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2714","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2716	2016-05-26 00:42:49.714618	2016-06-05 19:44:33.525339	farm	products	{"category_ids":[15,68],"title":"Премикс для профилактики птичьего гриппа 500г","price":130,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2716","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2719	2016-05-26 00:42:49.990052	2016-06-05 19:44:33.793471	farm	products	{"category_ids":[15,68],"title":"Премикс для свиней на откорме 300 гр","price":71,"unit":"шт","properties":{"animal_ids":[53]}}	{"_index":"farm","_type":"products","_id":"2719","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2723	2016-05-26 00:42:50.687633	2016-06-05 19:44:34.114816	farm	products	{"category_ids":[15,68],"title":"Премикс для улучшения качества скорлупы  \\"Скорлуп-Ca\\" 500г","price":85,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2723","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2726	2016-05-26 00:42:51.046341	2016-06-05 19:44:34.370714	farm	products	{"category_ids":[15,68],"title":"Премикс противоглист. профилакт.  для свиней (Альбазол-С) 300 г","price":79,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2726","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2729	2016-05-26 00:42:51.35974	2016-06-05 19:44:34.603673	farm	products	{"category_ids":[15,68],"title":"Ракушка калиброванная 1кг","price":47,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2729","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2765	2016-05-26 00:42:55.102129	2016-06-05 19:44:38.36006	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи \\"звездочка\\" (фигурная)","price":67,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2765","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2735	2016-05-26 00:42:52.024388	2016-06-05 19:44:35.104193	farm	products	{"category_ids":[15,68],"title":"Соль поваренная кормовая йод (брикет 5кг)","price":195,"unit":"шт","properties":{"animal_ids":[54]}}	{"_index":"farm","_type":"products","_id":"2735","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2737	2016-05-26 00:42:52.216964	2016-06-05 19:44:35.585502	farm	products	{"category_ids":[15,68],"title":"Цеолитовый природный комплекс  для всех видов с/х животных 1,3 кг","price":133,"unit":"шт","properties":{"animal_ids":[49,50,51,52,53,54,55]}}	{"_index":"farm","_type":"products","_id":"2737","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2742	2016-05-26 00:42:52.739521	2016-06-05 19:44:36.316217	farm	products	{"category_ids":[15,69],"title":"Бархатцы","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2742","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2744	2016-05-26 00:42:52.916978	2016-06-05 19:44:36.483669	farm	products	{"category_ids":[15,69],"title":"Герань","price":650,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2744","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2746	2016-05-26 00:42:53.077508	2016-06-05 19:44:36.637747	farm	products	{"category_ids":[15,69],"title":"Капуста поздняя","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2746","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2749	2016-05-26 00:42:53.37735	2016-06-05 19:44:36.904624	farm	products	{"category_ids":[15,69],"title":"Огурец \\"Герман\\"","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2749","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2750	2016-05-26 00:42:53.466556	2016-06-05 19:44:36.993669	farm	products	{"category_ids":[15,69],"title":"Пекинская капуста \\"Любимая\\"","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2750","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2753	2016-05-26 00:42:53.802236	2016-06-05 19:44:37.259849	farm	products	{"category_ids":[15,69],"title":"Перец острый","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2753","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2755	2016-05-26 00:42:54.033602	2016-06-05 19:44:37.427474	farm	products	{"category_ids":[15,69],"title":"Тамат \\"Джина\\"","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2755","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2758	2016-05-26 00:42:54.367497	2016-06-05 19:44:37.671077	farm	products	{"category_ids":[15,69],"title":"Томат \\"Новичок\\"","price":50,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2758","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2760	2016-05-26 00:42:54.645833	2016-06-05 19:44:37.91637	farm	products	{"category_ids":[15,70],"title":"12 месецев","price":2862,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2760","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2762	2016-05-26 00:42:54.82663	2016-06-05 19:44:38.093403	farm	products	{"category_ids":[15,70],"title":"Арабская ночь","price":91,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2762","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2764	2016-05-26 00:42:55.015935	2016-06-05 19:44:38.283005	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи \\"Елочка\\" (фигурная)","price":81,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2764","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2767	2016-05-26 00:42:55.400203	2016-06-05 19:44:38.5159	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 210 \\"Спектр\\" (разноцв.)","price":44,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2767","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2769	2016-05-26 00:42:55.632661	2016-06-05 19:44:38.682227	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 350 прямоугольные","price":164,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2769","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2771	2016-05-26 00:42:55.794165	2016-06-05 19:44:38.83828	farm	products	{"category_ids":[15,70],"title":"Бенг. Свечи 600 прямоугольные","price":275,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2771","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2775	2016-05-26 00:42:56.17822	2016-06-05 19:44:39.194658	farm	products	{"category_ids":[15,70],"title":"Вася-василек","price":258,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2775","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2777	2016-05-26 00:42:56.358912	2016-06-05 19:44:39.371175	farm	products	{"category_ids":[15,70],"title":"Волшебные стрелы","price":1785,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2777","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2779	2016-05-26 00:42:56.560195	2016-06-05 19:44:39.527507	farm	products	{"category_ids":[15,70],"title":"Дикие пчелы (летающая вертушка)","price":135,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2779","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2782	2016-05-26 00:42:56.878149	2016-06-05 19:44:39.760392	farm	products	{"category_ids":[15,70],"title":"Золотая рыбка","price":733,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2782","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2784	2016-05-26 00:42:57.046205	2016-06-05 19:44:39.92705	farm	products	{"category_ids":[15,70],"title":"Капитошка","price":1920,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2784","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2786	2016-05-26 00:42:57.262924	2016-06-05 19:44:40.094294	farm	products	{"category_ids":[15,70],"title":"Корсар-3","price":44,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2786","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2788	2016-05-26 00:42:57.444132	2016-06-05 19:44:40.337756	farm	products	{"category_ids":[15,70],"title":"Лимонка (с чекой)","price":55,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2788","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2811	2016-05-26 00:43:01.171135	2016-06-05 19:44:42.271569	farm	products	{"category_ids":[15,70],"title":"Пугач","price":78,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2811","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2791	2016-05-26 00:42:57.727458	2016-06-05 19:44:40.626809	farm	products	{"category_ids":[15,70],"title":"Малиновый звон","price":322,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2791","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2793	2016-05-26 00:42:57.903945	2016-06-05 19:44:40.815474	farm	products	{"category_ids":[15,70],"title":"Маугли","price":800,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2793","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2795	2016-05-26 00:42:58.082519	2016-06-05 19:44:41.050186	farm	products	{"category_ids":[15,70],"title":"Мистер Х","price":739,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2795","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2799	2016-05-26 00:42:58.733844	2016-06-05 19:44:41.227234	farm	products	{"category_ids":[15,70],"title":"Настольный фонтан","price":200,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2799","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2801	2016-05-26 00:42:59.321526	2016-06-05 19:44:41.395555	farm	products	{"category_ids":[15,70],"title":"Неб. Фонарики форма \\"Сердце\\"","price":148,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2801","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2804	2016-05-26 00:43:00.090923	2016-06-05 19:44:41.639895	farm	products	{"category_ids":[15,70],"title":"Огненые пчелы","price":80,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2804","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2808	2016-05-26 00:43:00.845924	2016-06-05 19:44:42.009126	farm	products	{"category_ids":[15,70],"title":"пневмохлопушка праздничная 30 см (цветн.металл. конфети)","price":199,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2808","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2810	2016-05-26 00:43:01.079125	2016-06-05 19:44:42.182948	farm	products	{"category_ids":[15,70],"title":"Полуночник","price":4530,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2810","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2812	2016-05-26 00:43:01.257749	2016-06-05 19:44:42.34946	farm	products	{"category_ids":[15,70],"title":"Пять звезд","price":2500,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2812","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2814	2016-05-26 00:43:01.667556	2016-06-05 19:44:42.528342	farm	products	{"category_ids":[15,70],"title":"Разгуляй","price":14813,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2814","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2816	2016-05-26 00:43:01.970281	2016-06-05 19:44:42.695476	farm	products	{"category_ids":[15,70],"title":"Салют молодежи","price":5375,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2816","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2819	2016-05-26 00:43:02.279071	2016-06-05 19:44:42.928367	farm	products	{"category_ids":[15,70],"title":"СМС-ка","price":964,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2819","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2821	2016-05-26 00:43:02.460535	2016-06-05 19:44:43.317081	farm	products	{"category_ids":[15,70],"title":"Снеговой","price":802,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2821","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2823	2016-05-26 00:43:02.666874	2016-06-05 19:44:43.539937	farm	products	{"category_ids":[15,70],"title":"Снежная сказка","price":3374,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2823","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2825	2016-05-26 00:43:02.855077	2016-06-05 19:44:43.717478	farm	products	{"category_ids":[15,70],"title":"Страна чудес","price":20438,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2825","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2828	2016-05-26 00:43:03.135818	2016-06-05 19:44:43.984088	farm	products	{"category_ids":[15,70],"title":"Убойная сила (3 эффекта)","price":53,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2828","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2830	2016-05-26 00:43:03.302594	2016-06-05 19:44:44.594819	farm	products	{"category_ids":[15,70],"title":"Хлопающие шары","price":72,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2830","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2832	2016-05-26 00:43:03.511775	2016-06-05 19:44:44.885374	farm	products	{"category_ids":[15,70],"title":"Хлопушка \\"Супер с серпантином\\"","price":119,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2832","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2835	2016-05-26 00:43:03.815347	2016-06-05 19:44:45.127623	farm	products	{"category_ids":[15,70],"title":"Час пик","price":2209,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2835","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2837	2016-05-26 00:43:03.990619	2016-06-05 19:44:45.362264	farm	products	{"category_ids":[15,70],"title":"Шаляй-валяй","price":3840,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2837","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2839	2016-05-26 00:43:04.208034	2016-06-05 19:44:45.539477	farm	products	{"category_ids":[15,71],"title":"Родентицидная прим \\"Крысиная смерть № 1\\"  (100гр.)","price":72,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2839","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2841	2016-05-26 00:43:04.394528	2016-06-05 19:44:45.717256	farm	products	{"category_ids":[15,71],"title":"Родентицидная приманка \\"ЩЕЛКУНЧИК\\" 0,1кг","price":58,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2841","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2845	2016-05-26 00:43:05.025365	2016-06-05 19:44:46.050081	farm	products	{"category_ids":[15,71],"title":"Энтомозан-Супер амп. 2мл","price":76,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2845","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2847	2016-05-26 00:43:05.204437	2016-06-05 19:44:46.217762	farm	products	{"category_ids":[15,71],"title":"Ловушка Mr.Mouse механ. от мышей (дерево)","price":43,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2847","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2851	2016-05-26 00:43:05.581987	2016-06-05 19:44:46.806899	farm	products	{"category_ids":[15,71],"title":"Клей EG euroguard для отлова грызунов 135 г.","price":219,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2851","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2853	2016-05-26 00:43:05.761168	2016-06-05 19:44:48.940602	farm	products	{"category_ids":[15,71],"title":"Крысоловка (метал.)","price":73,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2853","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2855	2016-05-26 00:43:06.004816	2016-06-05 19:44:49.583888	farm	products	{"category_ids":[15,71],"title":"БойКот зерно 150 г. Жареное  мясо","price":30,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2855","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2856	2016-05-26 00:43:06.093756	2016-06-05 19:44:49.907426	farm	products	{"category_ids":[15,71],"title":"БойКот мягкий брикет К_С Подсолнух 100г","price":58,"unit":"шт","properties":{}}	{"_index":"farm","_type":"products","_id":"2856","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2858	2016-05-26 00:43:06.282078	2016-06-05 19:44:50.216988	farm	products	{"category_ids":[15,72],"title":"Инкубатор АИ -264К/96Г/189У/663","price":27984,"unit":"шт","properties":{"animal_ids":[49,50,51,52]}}	{"_index":"farm","_type":"products","_id":"2858","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2571	2016-05-26 00:42:34.88448	2016-06-05 19:44:50.683935	farm	products	{"category_ids":[15,64,113],"title":"Рольф Клуб 3Д Капли для собак от блох клещей 10-20 кг","price":355,"unit":"шт","properties":{"home_animal_ids":[93]}}	{"_index":"farm","_type":"products","_id":"2571","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2501	2016-05-26 00:42:28.651946	2016-06-05 19:44:51.031154	farm	products	{"category_ids":[15,64,112],"title":"Вискас ПАУЧ д/кошек желе с курецей 85г","price":22,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2501","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2562	2016-05-26 00:42:33.885691	2016-06-05 19:44:51.274426	farm	products	{"category_ids":[15,64,113],"title":"ПУСИ КЭТ океанический наполнитель впитывающий 4,5л.2,8кг зеленый","price":84,"unit":"шт","properties":{"home_animal_ids":[94]}}	{"_index":"farm","_type":"products","_id":"2562","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2602	2016-05-26 00:42:37.454209	2016-06-05 19:44:51.606364	farm	products	{"category_ids":[15,64,112],"title":"ШЕБА ПАУЧ д/кошек форель/креветки 85г.","price":35,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[89]}}	{"_index":"farm","_type":"products","_id":"2602","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2590	2016-05-26 00:42:36.465254	2016-06-05 19:44:51.841909	farm	products	{"category_ids":[15,64,112],"title":"Фаворит Для взрослыхт собак всех пород 13 кг","price":1250,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[107]}}	{"_index":"farm","_type":"products","_id":"2590","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2585	2016-05-26 00:42:36.041287	2016-06-05 19:44:52.084464	farm	products	{"category_ids":[15,64,112],"title":"Терра Кот для взрослых кошек 2кг.","price":248,"unit":"шт","properties":{"home_animal_ids":[94],"weight_ids":[117]}}	{"_index":"farm","_type":"products","_id":"2585","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
2550	2016-05-26 00:42:32.907445	2016-06-05 19:44:52.162532	farm	products	{"category_ids":[15,64,112],"title":"ПЕДИГРИ сух.д/собак крупных пород говядина 13 кг.","price":1664,"unit":"шт","properties":{"home_animal_ids":[93],"weight_ids":[107]}}	{"_index":"farm","_type":"products","_id":"2550","_version":1,"_shards":{"total":2,"successful":1,"failed":0},"created":true}
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: woto
--

SELECT pg_catalog.setval('products_id_seq', 2865, true);


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
20160603173351
20160603173353
20160605164817
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
93	farm	home_animal_ids	{"title":"Собаки"}	92	2016-05-26 02:12:11.593668	2016-05-26 02:12:40.900108	1
55	farm	animal_ids	{"title":"Кролики, нутрии","thumbnail":"/farm/animals/zayac.png"}	27	2016-05-25 21:53:47.916986	2016-05-26 08:12:20.886585	\N
94	farm	home_animal_ids	{"title":"Кошки"}	92	2016-05-26 02:13:12.257148	2016-05-26 02:13:12.257148	2
64	farm	category_ids	{"title":"Дом. животные","options":["home_animal_ids","weight_ids"]}	15	2016-05-25 23:37:05.181193	2016-05-26 04:52:12.202376	\N
88	farm	weight_ids	{"title":"Масса корма"}	\N	2016-05-26 02:06:06.561527	2016-05-26 04:38:34.394917	0
95	farm	home_animal_ids	{"title":"Попугаи"}	92	2016-05-26 02:13:21.291922	2016-05-26 06:39:22.465532	0
112	farm	category_ids	{"title":"Корма","options":["home_animal_ids","weight_ids"]}	64	2016-05-26 04:45:45.916291	2016-05-26 04:54:04.472819	0
113	farm	category_ids	{"title":"Прочие товары","options":["home_animal_ids"]}	64	2016-05-26 05:03:31.231132	2016-05-26 05:45:06.981307	1
92	farm	home_animal_ids	{"title":"Домашнее животное"}	\N	2016-05-26 02:11:21.054572	2016-05-26 04:41:09.554483	1
27	farm	animal_ids	{"title":"Животное"}	\N	2016-05-17 04:08:13.206045	2016-05-26 04:42:11.066464	2
15	farm	category_ids	{"title":"Корневая","options":["animal_ids"]}	\N	2016-05-17 04:03:40.650057	2016-05-26 05:01:47.497352	3
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

SELECT pg_catalog.setval('trees_id_seq', 126, true);


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

