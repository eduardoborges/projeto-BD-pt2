--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-09-25 11:27:54 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 17354)
-- Name: cinema; Type: SCHEMA; Schema: -; Owner: eduardoborges
--

CREATE SCHEMA cinema;


-- ALTER SCHEMA cinema OWNER TO eduardoborges;

SET search_path = cinema, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 192 (class 1259 OID 17410)
-- Name: clientes; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE clientes (
    cpf character varying(11) NOT NULL,
    telefone_residencial character varying(45) NOT NULL,
    telefone_celular character varying(45) NOT NULL,
    id_endereco integer NOT NULL,
    nome character varying(45) NOT NULL
);


ALTER TABLE clientes OWNER TO eduardoborges;

--
-- TOC entry 209 (class 1259 OID 17532)
-- Name: clientes_vip_id_cliente_VIP_sequence; Type: SEQUENCE; Schema: cinema; Owner: eduardoborges
--

CREATE SEQUENCE "clientes_vip_id_cliente_VIP_sequence"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "clientes_vip_id_cliente_VIP_sequence" OWNER TO eduardoborges;

--
-- TOC entry 198 (class 1259 OID 17480)
-- Name: clientes_vip; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE clientes_vip (
    "id_cliente_VIP" integer DEFAULT nextval('"clientes_vip_id_cliente_VIP_sequence"'::regclass) NOT NULL,
    status character(1) NOT NULL,
    "data_ultimoPagamento" date NOT NULL,
    cpf_cliente character varying(11) NOT NULL
);


ALTER TABLE clientes_vip OWNER TO eduardoborges;

--
-- TOC entry 206 (class 1259 OID 17523)
-- Name: enderecos_id_endereco_sequence; Type: SEQUENCE; Schema: cinema; Owner: eduardoborges
--

CREATE SEQUENCE enderecos_id_endereco_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enderecos_id_endereco_sequence OWNER TO eduardoborges;

--
-- TOC entry 191 (class 1259 OID 17405)
-- Name: enderecos; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE enderecos (
    id_endereco integer DEFAULT nextval('enderecos_id_endereco_sequence'::regclass) NOT NULL,
    rua character varying(45),
    numero character varying(45),
    bairro character varying(45),
    cidade character varying(45) NOT NULL,
    estado character varying(45) NOT NULL,
    cep character varying(45),
    complemento character varying(45),
    referencia character varying(45)
);


ALTER TABLE enderecos OWNER TO eduardoborges;

--
-- TOC entry 200 (class 1259 OID 17505)
-- Name: filmes_id_filme_sequence; Type: SEQUENCE; Schema: cinema; Owner: eduardoborges
--

CREATE SEQUENCE filmes_id_filme_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE filmes_id_filme_sequence OWNER TO eduardoborges;

--
-- TOC entry 186 (class 1259 OID 17355)
-- Name: filmes; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE filmes (
    id_filme integer DEFAULT nextval('filmes_id_filme_sequence'::regclass) NOT NULL,
    nome character varying(45) NOT NULL,
    duracao integer NOT NULL,
    diretor character varying(45) NOT NULL,
    classificacao integer NOT NULL
);


ALTER TABLE filmes OWNER TO eduardoborges;

--
-- TOC entry 199 (class 1259 OID 17490)
-- Name: filmes_possui_generos; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE filmes_possui_generos (
    id_filme integer NOT NULL,
    id_genero integer NOT NULL
);


ALTER TABLE filmes_possui_generos OWNER TO eduardoborges;

--
-- TOC entry 193 (class 1259 OID 17420)
-- Name: funcionarios; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE funcionarios (
    cpf character varying(11) NOT NULL,
    nome character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    data_admissao date NOT NULL,
    salario_base double precision NOT NULL,
    telefone_residencial character varying(45),
    telefone_celular character varying(45),
    id_endereco integer NOT NULL
);


ALTER TABLE funcionarios OWNER TO eduardoborges;

--
-- TOC entry 196 (class 1259 OID 17460)
-- Name: funcionarios_gerente; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE funcionarios_gerente (
    id_funcionario_gerente integer NOT NULL,
    setor character varying(45) NOT NULL,
    adicional double precision NOT NULL,
    cpf_funcionario character varying(11) NOT NULL
);


ALTER TABLE funcionarios_gerente OWNER TO eduardoborges;

--
-- TOC entry 197 (class 1259 OID 17470)
-- Name: funcionarios_vendedor; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE funcionarios_vendedor (
    id_funcionario_vendedor integer NOT NULL,
    comissao integer NOT NULL,
    cpf_funcionario character varying(11) NOT NULL
);


ALTER TABLE funcionarios_vendedor OWNER TO eduardoborges;

--
-- TOC entry 201 (class 1259 OID 17508)
-- Name: generos_id_genero_sequence; Type: SEQUENCE; Schema: cinema; Owner: eduardoborges
--

CREATE SEQUENCE generos_id_genero_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE generos_id_genero_sequence OWNER TO eduardoborges;

--
-- TOC entry 187 (class 1259 OID 17360)
-- Name: generos; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE generos (
    id_genero integer DEFAULT nextval('generos_id_genero_sequence'::regclass) NOT NULL,
    nome character varying(45) NOT NULL
);


ALTER TABLE generos OWNER TO eduardoborges;

--
-- TOC entry 202 (class 1259 OID 17511)
-- Name: horarios_id_horario_sequence; Type: SEQUENCE; Schema: cinema; Owner: eduardoborges
--

CREATE SEQUENCE horarios_id_horario_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE horarios_id_horario_sequence OWNER TO eduardoborges;

--
-- TOC entry 188 (class 1259 OID 17365)
-- Name: horarios; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE horarios (
    id_horario integer DEFAULT nextval('horarios_id_horario_sequence'::regclass) NOT NULL,
    data_hora timestamp without time zone NOT NULL
);


ALTER TABLE horarios OWNER TO eduardoborges;

--
-- TOC entry 208 (class 1259 OID 17529)
-- Name: ingressos_id_ingresso_sequence; Type: SEQUENCE; Schema: cinema; Owner: eduardoborges
--

CREATE SEQUENCE ingressos_id_ingresso_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingressos_id_ingresso_sequence OWNER TO eduardoborges;

--
-- TOC entry 195 (class 1259 OID 17445)
-- Name: ingressos; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE ingressos (
    id_ingresso integer DEFAULT nextval('ingressos_id_ingresso_sequence'::regclass) NOT NULL,
    id_sessao integer NOT NULL,
    id_venda integer NOT NULL,
    preco double precision NOT NULL
);


ALTER TABLE ingressos OWNER TO eduardoborges;

--
-- TOC entry 205 (class 1259 OID 17520)
-- Name: poltronas_id_sequence; Type: SEQUENCE; Schema: cinema; Owner: eduardoborges
--

CREATE SEQUENCE poltronas_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poltronas_id_sequence OWNER TO eduardoborges;

--
-- TOC entry 203 (class 1259 OID 17514)
-- Name: salas_id_sala_sequence; Type: SEQUENCE; Schema: cinema; Owner: eduardoborges
--

CREATE SEQUENCE salas_id_sala_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salas_id_sala_sequence OWNER TO eduardoborges;

--
-- TOC entry 189 (class 1259 OID 17370)
-- Name: salas; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE salas (
    id_sala integer DEFAULT nextval('salas_id_sala_sequence'::regclass) NOT NULL,
    capacidade integer NOT NULL,
    numero integer NOT NULL
);


ALTER TABLE salas OWNER TO eduardoborges;

--
-- TOC entry 204 (class 1259 OID 17517)
-- Name: sessoes_id_sessao_sequence; Type: SEQUENCE; Schema: cinema; Owner: eduardoborges
--

CREATE SEQUENCE sessoes_id_sessao_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sessoes_id_sessao_sequence OWNER TO eduardoborges;

--
-- TOC entry 190 (class 1259 OID 17375)
-- Name: sessoes; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE sessoes (
    id_sessao integer DEFAULT nextval('sessoes_id_sessao_sequence'::regclass) NOT NULL,
    id_filme integer NOT NULL,
    id_horario integer NOT NULL,
    id_sala integer NOT NULL
);


ALTER TABLE sessoes OWNER TO eduardoborges;

--
-- TOC entry 207 (class 1259 OID 17526)
-- Name: vendas_id_venda_sequence; Type: SEQUENCE; Schema: cinema; Owner: eduardoborges
--

CREATE SEQUENCE vendas_id_venda_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vendas_id_venda_sequence OWNER TO eduardoborges;

--
-- TOC entry 194 (class 1259 OID 17430)
-- Name: vendas; Type: TABLE; Schema: cinema; Owner: eduardoborges
--

CREATE TABLE vendas (
    id_venda integer DEFAULT nextval('vendas_id_venda_sequence'::regclass) NOT NULL,
    data timestamp without time zone,
    cpf_cliente character varying(11) NOT NULL,
    cpf_funcionario character varying(11) NOT NULL
);


ALTER TABLE vendas OWNER TO eduardoborges;

--
-- TOC entry 2512 (class 0 OID 17410)
-- Dependencies: 192
-- Data for Name: clientes; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) FROM stdin;
06275412836	1124442563	941643443	203	Dr. Allison Rico
99121470731	2623104902	966134115	204	Sra. Isabella Vale Jr.
56745892677	7624377021	943382591	205	Emília Clara Barreto
30147135206	5832408061	919892780	206	Sra. Elizabeth Faro Neto
72692475364	2934131158	994351601	207	Ziraldo Santiago Marin
29391344992	3421585769	979483784	208	Laura Rafaela Ortega Sobrinho
98637421121	9234255314	951455364	209	Dr. Demian Faro Sobrinho
42858651655	7735804554	948565950	210	David Franco Maldonado Neto
46677008231	6226011350	912218539	211	Sophie Alessandra Zaragoça Jr.
56606368960	3434563795	963523233	212	Emanuel Thiago Beltrão Neto
99919222968	9620822426	971184709	213	Dr. Henrique das Neves Sobrinho
04694194232	3122393344	953951413	214	Srta. Alexa Ariadna Aragão Jr.
71755146469	4930139332	905377935	215	Sr. Josué Bittencourt Torres
41804971073	5923529734	947388778	216	Santiago Santana Saraiva
34812822815	5527813305	971079981	217	Giovane Queirós Serra Sobrinho
00781753139	6122876332	981080994	218	Dr. Rafael Ortiz Filho
43251170830	3626339874	995728660	219	Sr. Luciano Daniel das Dores Jr.
28920149135	9221352649	940641177	220	Luciano Franco Maia
89671476198	3127817375	992819393	221	Sr. Cristóvão Leonardo da Cruz
49834931409	4738363716	972387451	222	Valentina Paulina Paes
54908402000	7224976292	991109185	223	Dr. Luis Campos Dias Neto
60346699363	7821755732	928012717	224	Srta. Taís Pâmela Neves Filho
40832391662	7334867545	939245195	225	Nádia Pedrosa Padilha Jr.
72646758235	2538937011	989719667	226	Sra. Carla Verdugo Fonseca
45060520307	5727843437	906958621	227	Dr. Ivan Benjamin Caldeira
07328820446	4138411860	927685185	228	Joana Jasmin Paes Neto
63607679452	7128577164	979120549	229	Dr. Inácio Vega
47692812420	1821923204	969922374	230	Isabella Rivera Franco
48900884239	6424079257	942307877	231	Noelí Toledo Sobrinho
77844517093	6828243419	976518119	232	Dr. Isabel Balestero
41168565332	1832732131	939254179	233	Melissa Matias
08415586809	9627379208	925289899	234	Dr. Fernando Beltrão Filho
48362684860	1924988302	923069570	235	Abril Josefina Padrão Jr.
33471127330	6221455459	978654542	236	Sr. Horácio Joaquin Delatorre Jr.
51432476750	4929357075	993171909	237	Sofia Espinoza Sandoval Filho
91873381735	1321839375	985760902	238	Rafaela Martines
99015904855	6138170018	929070838	239	Martinho Campos Soto Jr.
05632430154	3335710496	992189066	240	Manuel Soares Solano Jr.
71603568964	4735791476	991359421	241	Antonieta Joana Rivera Sobrinho
52361625059	3533122515	994389160	242	Julieta Tábata Carrara
32010193059	3422680974	946671345	243	Rebeca Michele Verdara
17895280627	6628371496	966913402	244	Agostinho Aragão Montenegro Filho
36741287647	5329018615	949124889	245	José Agostinho Carmona Sobrinho
93113604060	7934401989	998619860	246	Dr. Carolina Tessália Grego Filho
24782227604	1822608788	997754618	247	Sra. Luciana Domingues Gomes Sobrinho
37760256388	7336065399	941445281	248	Dr. Ricardo Leonardo Mendonça Jr.
76152110939	8230613955	915580511	249	Máximo Correia Jr.
47374304552	4233271601	999462568	250	Gabriela Jasmin Marques
20627060498	6736038404	959126972	251	Sr. Evandro Demian Velasques
38976824865	8738069407	909495828	252	Sr. Rafael Inácio Leon
\.


--
-- TOC entry 2518 (class 0 OID 17480)
-- Dependencies: 198
-- Data for Name: clientes_vip; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) FROM stdin;
51	1	1981-11-16	06275412836
52	2	1989-10-28	56745892677
53	5	1974-10-26	72692475364
54	1	1972-11-25	98637421121
55	4	2006-11-15	46677008231
56	4	1998-02-08	99919222968
57	2	2016-02-09	71755146469
58	4	1981-04-15	34812822815
59	2	1998-07-17	43251170830
60	5	2016-10-15	89671476198
61	5	2002-05-06	54908402000
62	2	2013-12-21	40832391662
63	4	1998-07-21	45060520307
64	3	1987-10-11	63607679452
65	5	2000-10-08	48900884239
66	2	1989-02-14	41168565332
67	5	1980-06-06	48362684860
68	2	1996-10-12	51432476750
69	1	1987-03-16	99015904855
70	5	1990-11-19	71603568964
71	3	1989-02-10	32010193059
72	3	1978-12-22	36741287647
73	2	1986-11-02	24782227604
74	5	1975-06-12	76152110939
75	3	1989-06-24	20627060498
\.


--
-- TOC entry 2534 (class 0 OID 0)
-- Dependencies: 209
-- Name: clientes_vip_id_cliente_VIP_sequence; Type: SEQUENCE SET; Schema: cinema; Owner: eduardoborges
--

SELECT pg_catalog.setval('"clientes_vip_id_cliente_VIP_sequence"', 75, true);


--
-- TOC entry 2511 (class 0 OID 17405)
-- Dependencies: 191
-- Data for Name: enderecos; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) FROM stdin;
203	de Oliveira Street	67	Santa	LuanaVille	Rio Grande do Norte	82914	1º Andar	1º Andar
204	Sales Street	56	Santa	MelVille	Minas Gerais	16147	F	Bc. 4 Ap. 97
205	Maia Street	76	Santa	IvanVille	Paraná	88506	Anexo	6º Andar
206	Furtado Street	68	Vila	TeobaldoVille	Acre	97897	Bc. 48 Ap. 80	Bloco A
207	Fernandes Street	32	São	PedroVille	Mato Grosso do Sul	47183	Bc. 6 Ap. 41	Apto 8
208	Gomes Street	35	Porto	BiancaVille	Amapá	03735	Bc. 66 Ap. 71	Apto 6
209	Santiago Street	77	Vila	EvertonVille	Pernambuco	60016	Bc. 1 Ap. 90	Bloco B
210	Delatorre Street	80	Vila	EmílioVille	Distrito Federal	71383	688º Andar	F
211	Mendes Street	71	Santa	MáximoVille	Pará	47160	Bloco C	Bloco C
212	Mendes Street	54	São	RenataVille	Minas Gerais	79945	Apto 88	F
213	Gonçalves Street	39	Porto	FernandoVille	Pernambuco	93488	Bc. 3 Ap. 38	Apto 898
214	Velasques Street	42	Vila	AlexaVille	Bahia	55677	Bc. 8 Ap. 47	Apto 725
215	Sepúlveda Street	28	Santa	RebecaVille	Pernambuco	18561	Apto 7	337º Andar
216	Rosa Street	46	Porto	CarolinaVille	Goiás	73255	Bc. 22 Ap. 36	Bloco B
217	Ferraz Street	29	Santa	MaitêVille	Acre	43423	Bloco B	Apto 2
218	Gonçalves Street	12	São	ChristianVille	Roraima	67509	F	Apto 9904
219	de Oliveira Street	30	Porto	SimonVille	Goiás	23419	Bloco A	Bc. 5 Ap. 89
220	Sales Street	99	Porto	MiguelVille	Alagoas	42020	Apto 87	Bc. 74 Ap. 14
221	Lozano Street	74	São	BiancaVille	Bahia	42485	386º Andar	Apto 930
222	Romero Street	71	Vila	AlonsoVille	Bahia	72117	Bc. 1 Ap. 46	Bloco A
223	Faria Street	16	Santa	MadalenaVille	Pernambuco	80772	Apto 6608	Fundos
224	Guerra Street	89	Santa	NoelíVille	São Paulo	55152	776º Andar	Bloco C
225	Santana Street	79	Santa	JoséVille	Distrito Federal	43440	449º Andar	F
226	Fidalgo Street	71	Vila	EmílioVille	Mato Grosso do Sul	43205	Apto 76	Fundos
227	Oliveira Street	37	Porto	ThalissaVille	Acre	50255	F	Apto 93
228	Matias Street	97	Porto	JulianaVille	Rio Grande do Norte	38280	Bc. 5 Ap. 83	Bloco A
229	Santana Street	97	Porto	HortênciaVille	Mato Grosso	02907	Bc. 6 Ap. 86	Bloco B
230	Serrano Street	60	São	AlessandraVille	Ceará	94919	Bc. 4 Ap. 55	Apto 6
231	Teles Street	13	Santa	MiaVille	Rio de Janeiro	52982	6º Andar	Apto 59
232	Prado Street	71	Vila	RicardoVille	Sergipe	59355	Apto 4	7º Andar
233	Leal Street	36	Porto	AndresVille	São Paulo	52506	Bc. 67 Ap. 49	3º Andar
234	Fontes Street	14	São	PauloVille	Goiás	95804	Apto 43	Fundos
235	Beltrão Street	67	Santa	InácioVille	Piauí	68029	Bloco B	Bloco A
236	Fonseca Street	41	Santa	SofiaVille	Pernambuco	41646	Bloco B	9º Andar
237	Medina Street	53	Vila	ValériaVille	Tocantins	98070	F	060º Andar
238	Medina Street	82	Porto	BiancaVille	Sergipe	01554	Bc. 95 Ap. 22	Fundos
239	Soto Street	14	Santa	VitóriaVille	Ceará	78246	Bloco A	Bc. 1 Ap. 44
240	Duarte Street	76	Santa	JerônimoVille	Minas Gerais	35253	Apto 2	Apto 8575
241	Guerra Street	30	Porto	DemianVille	Minas Gerais	68407	Apto 1	Bloco A
242	Prado Street	10	São	MalenaVille	Pará	57689	Apto 753	F
243	Marinho Street	51	Santa	JoãoVille	Amazonas	51363	Bc. 59 Ap. 62	968º Andar
244	Vale Street	13	Santa	IanVille	Rio Grande do Sul	97978	40º Andar	Bloco C
245	Montenegro Street	70	São	AlmaVille	Goiás	38790	F	Fundos
246	Verdugo Street	21	Porto	AriadnaVille	Goiás	32443	Bloco B	F
247	Delvalle Street	37	São	FátimaVille	Amazonas	29329	Bloco A	Bc. 04 Ap. 57
248	Roque Street	62	Porto	MarianaVille	Alagoas	06433	Apto 2	Bloco A
249	Batista Street	33	Santa	SofiaVille	Rio Grande do Norte	18548	Bloco B	Bc. 55 Ap. 99
250	Carrara Street	68	São	RicardoVille	Pará	96149	Bloco C	577º Andar
251	Velasques Street	45	Vila	IreneVille	Rondônia	80038	Apto 50	F
252	Marés Street	88	Porto	FernandoVille	Pará	37107	193º Andar	9º Andar
\.


--
-- TOC entry 2535 (class 0 OID 0)
-- Dependencies: 206
-- Name: enderecos_id_endereco_sequence; Type: SEQUENCE SET; Schema: cinema; Owner: eduardoborges
--

SELECT pg_catalog.setval('enderecos_id_endereco_sequence', 252, true);


--
-- TOC entry 2506 (class 0 OID 17355)
-- Dependencies: 186
-- Data for Name: filmes; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY filmes (id_filme, nome, duracao, diretor, classificacao) FROM stdin;
1	Ut quibusdam aut.	98	Dr. Luciano Alan Duarte	18
2	Non quaerat dignissimos voluptatem qui.	69	Giovana Ornela Marés	13
3	Possimus qui sint nisi.	72	Dr. Bruno Emiliano Reis	16
4	Consectetur quia dolorem iste ullam in.	154	Simão Kevin Verdara	13
5	Voluptatem provident fugiat in.	126	Rodrigo Escobar de Aguiar	10
6	Omnis et totam voluptatibus sapiente ea.	74	Dr. Agustina Espinoza Bezerra Neto	10
7	Maxime alias velit sed.	235	Fábio Sales de Souza	16
8	Deserunt corrupti similique adipisci.	71	Dr. Ivan Guerra Serra Jr.	0
11	Rerum possimus aut.	31	Sra. Joana Taís Duarte Filho	13
12	Ducimus accusantium saepe.	236	Dr. Guilherme Serra Filho	21
13	Voluptatem magni omnis.	115	Diego Jimenes Jimenes Neto	0
14	Omnis adipisci labore nobis.	174	Luis Burgos Sobrinho	10
15	Ipsum et veritatis.	200	Agustina Jasmin Padrão Filho	16
16	Ut tempore repudiandae consequatur adipisci.	135	Dr. Giovana Regina Godói	16
17	Atque delectus vel.	203	Norma Valéria Grego Filho	21
18	Voluptatibus labore quia nihil.	185	Srta. Sophie Chaves Escobar Neto	0
19	Reprehenderit aperiam quia est aut sed.	189	Ziraldo das Neves Carrara Neto	16
20	Occaecati eius voluptate blanditiis.	129	Olívia Ferreira	18
21	Tenetur nisi itaque et.	193	Sebastião Paz Neto	16
22	Et omnis eos sed et.	179	Beatriz Silvana Assunção Sobrinho	21
23	Voluptatem rerum labore sit.	34	Srta. Mia Serra Filho	0
25	Laudantium repudiandae iusto ut.	68	Sr. Antônio Marques	16
26	Incidunt quos rerum harum.	68	Vitória Santana Fernandes	18
27	Ad ea deleniti non qui.	84	Rebeca D'ávila Sandoval	21
28	Optio sequi voluptas voluptatum et.	192	Leandro Barreto Jr.	18
29	Voluptas qui sit dignissimos illum.	235	Aaron Prado Saraiva Neto	10
30	Quidem aliquam repellendus at.	160	Everton Paulo Beltrão Neto	21
31	Beatae et dolores voluptates.	208	João Delgado Jr.	0
32	Illum est qui quis blanditiis.	240	Fabiana Feliciano	10
33	Qui iusto nam perferendis esse.	78	Sra. Alma Abreu Padrão	0
34	Vel illum ipsam.	50	Eduardo Campos Delvalle	18
35	Quaerat qui quae.	85	Isadora Meireles Sobrinho	0
36	Impedit repellat dolor.	137	Emílio Emiliano Sepúlveda Jr.	0
37	Aut et consequatur est.	99	Ariadna Branco	18
38	Laudantium praesentium alias.	125	Sofia Sara Ferreira	10
39	Maiores dolores corporis labore voluptate.	222	Sra. Noelí Perez Filho	0
40	Delectus est dolores quis optio.	166	Srta. Abril Lira	13
41	Alias hic et iste quia.	151	Valéria Michele Mendonça Sobrinho	16
42	Placeat vel nihil.	185	Sr. Andres Sales Faria Filho	21
43	Corrupti quam sed et possimus earum.	84	Dr. Fernando Kevin Dias Sobrinho	0
44	Aut vitae eius praesentium.	124	Fátima Padrão Lutero Sobrinho	18
45	Molestiae alias minus possimus officia.	219	Srta. Beatriz Emília Ortega	16
46	Minus sit repellat laboriosam.	157	Allison das Neves	16
47	Optio dolorum rerum sit.	147	Pedro Pereira Lozano Jr.	21
48	Laborum occaecati consectetur.	143	Dr. Malena Manuela Santiago Jr.	13
49	Et sequi qui impedit.	173	Santiago Lovato Tamoio	18
50	Aut sit rerum laborum.	221	Dr. Violeta Marinho	18
\.


--
-- TOC entry 2536 (class 0 OID 0)
-- Dependencies: 200
-- Name: filmes_id_filme_sequence; Type: SEQUENCE SET; Schema: cinema; Owner: eduardoborges
--

SELECT pg_catalog.setval('filmes_id_filme_sequence', 50, true);


--
-- TOC entry 2519 (class 0 OID 17490)
-- Dependencies: 199
-- Data for Name: filmes_possui_generos; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY filmes_possui_generos (id_filme, id_genero) FROM stdin;
1	11
2	18
3	18
4	14
5	28
6	34
7	34
8	4
11	2
12	37
13	6
14	4
15	30
16	46
17	2
18	9
19	12
20	35
21	28
22	40
23	39
25	37
26	22
27	10
28	43
29	49
30	41
31	24
32	26
33	39
34	30
35	36
36	6
37	48
38	50
39	34
40	32
41	34
42	37
43	33
44	20
45	42
46	36
47	50
48	38
49	38
50	9
\.


--
-- TOC entry 2513 (class 0 OID 17420)
-- Dependencies: 193
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) FROM stdin;
86452762915	Sra. Paulina Uchoa das Neves Sobrinho	rassuncao@bittencourt.com	1974-05-19	3095.7800000000002	5326892401	984595457	203
53967805689	Sr. Jácomo Fábio Ferminiano Filho	lzaragoca@gmail.com	1981-05-16	3015.75	8339378376	947357598	204
06036290756	Noelí Chaves Filho	pena.kevin@yahoo.com	1986-02-03	2399.63000000000011	5434463439	935661903	205
19439094230	Dr. Carlos Daniel Zamana	valdez.agostinho@yahoo.com	1980-12-11	3902.44999999999982	1832517591	901305712	206
11281614947	Sr. Mateus Guilherme Valdez Sobrinho	giovane76@yahoo.com	1976-06-08	4756.1899999999996	4130101499	969508106	207
22795363747	Camila Bezerra Jr.	agostinho.rodrigues@gmail.com	1987-10-22	2191.90999999999985	1137721333	989539883	208
99742270031	Sr. Manuel David Oliveira Neto	mdias@hotmail.com	1992-04-28	2665.19999999999982	5321503058	918998785	209
54913567276	Agostinho Zaragoça Maia Jr.	christopher00@hotmail.com	1987-01-18	2550.30000000000018	1234085236	992190438	210
10237157918	Sra. Manuela Sara D'ávila	martinho95@hotmail.com	2007-12-29	4776.64000000000033	1738028365	957847042	211
68395045573	Sr. Bruno Anderson Roque Neto	isabel.vieira@yahoo.com	1980-09-21	3954.11000000000013	9824126759	999143918	212
97864565808	Estêvão Delvalle Jr.	mdominato@maldonado.com	1979-03-07	2598.40000000000009	4929973061	970436679	213
92022316487	Sr. Lucas Grego da Silva	pacheco.malena@estrada.org	1971-04-21	986.840000000000032	1725736114	997400263	214
29752709419	Renata Gusmão	duarte.santiago@gmail.com	2013-05-23	1450.78999999999996	3239501415	941066027	215
17776757233	Júlia Ávila da Rosa Neto	dias.jacomo@yahoo.com	2008-04-01	4491.42000000000007	1639376875	927052693	216
79846400764	Miranda Espinoza Pontes	yesteves@velasques.com	1992-03-09	1375.6400000000001	5335572228	989515499	217
09334603925	Sr. Luciano Aragão Sobrinho	rcarmona@oliveira.com	2007-09-30	1231.1400000000001	3435183236	933351464	218
18681877720	Leandro Saraiva Pena Sobrinho	vila.mateus@dasilva.com	1980-12-07	3744.51000000000022	8726065228	903852049	219
20691789606	Giovana Salgado Estrada	pereira.olivia@gmail.com	2016-04-27	1386.09999999999991	3533006000	951552762	220
63023835799	Abgail Aragão	camila.fonseca@ortiz.biz	1973-06-11	4403.72999999999956	7637361056	944830380	221
91139341472	Alma Olívia Lozano	rbarros@hotmail.com	2003-09-19	1500.3900000000001	5229347155	966136573	222
83743448815	Paulina Padilha Casanova	amanda18@gmail.com	2011-01-06	1953.75	3838950246	992373283	223
52514190584	Dr. Pedro Luis Urias	luciano48@colaco.com	1976-05-09	2834.88000000000011	1825681084	980390024	224
41087033594	Laura Ramos Soto	sramos@caldeira.com	1991-01-19	4174.71000000000004	1333932632	941682307	225
65113335070	Sra. Carolina Suzana Martines Jr.	sepulveda.jacomo@yahoo.com	1985-12-14	3779.09000000000015	6425186704	960417438	226
93341972501	Eduardo da Silva	tferminiano@ferreira.com	1980-05-09	4153.03999999999996	2120516695	921151919	227
51664963880	Norma Barros Neto	violeta.valentin@yahoo.com	1981-11-18	3877.44999999999982	2435362967	982780052	228
89329632408	Dr. Amanda Santana	cazevedo@ferreira.com	1973-05-23	4151.94999999999982	2827009833	913120605	229
75484666848	Srta. Amélia Solano	xfeliciano@jimenes.org	2015-04-19	2569.9699999999998	9322012680	971124734	230
09590464297	Srta. Abril Velasques Jr.	lfurtado@yahoo.com	1994-11-22	2849.15999999999985	8532807099	941115023	231
60054995728	Dr. Hortência da Cruz	madalena99@yahoo.com	1983-08-01	1823.43000000000006	9125031109	914308122	232
13895884081	Dr. Sebastião Beltrão Mendonça	btorres@gmail.com	2015-07-23	1894.72000000000003	4520587896	964581978	233
82704888442	Sra. Suzana Jasmin Gomes Sobrinho	ibeltrao@campos.info	2011-10-21	3432.67000000000007	2933713835	981028211	234
40615805582	Sra. Ana Norma Sepúlveda	sergio11@yahoo.com	1981-06-17	1906.96000000000004	7138149376	935317576	235
94308904170	Isaac Esteves Aranda Sobrinho	eescobar@abreu.org	1971-04-18	3443.36000000000013	1436472259	964935170	236
00757838278	Sr. Vicente Elias Leon Neto	agostinho.teles@yahoo.com	2013-10-06	4029.30000000000018	9339617331	970589680	237
89475852387	Sr. Evandro Lovato Salgado	mendonca.rebeca@gmail.com	1992-04-05	1579.98000000000002	4630614755	922856655	238
22814212443	Luana Manuela Chaves Filho	dferminiano@branco.com	1978-07-08	3429.98000000000002	9621527677	917467905	239
85635978681	Alonso Zaragoça Campos Sobrinho	antonieta30@hotmail.com	1991-03-20	1559.00999999999999	4435233474	973459873	240
96184744968	Dr. Laura Melissa Ramos Sobrinho	miguel82@sales.com	1995-03-25	1673.73000000000002	2628284291	968925881	241
56269831040	Kevin Toledo	horacio43@yahoo.com	2017-02-01	1521.8599999999999	4231464602	944627782	242
72668212405	Sr. Luciano Cruz Uchoa	wfaria@gmail.com	2017-07-13	983.289999999999964	7633762665	933457833	243
03305768282	Dr. Samuel Branco Jr.	sophie60@gmail.com	1995-09-23	4574.78999999999996	2222643683	925977873	244
02155734557	Sr. Alan Toledo	amanda14@hotmail.com	1972-09-15	2737.59000000000015	7423260770	970718209	245
90083305122	Sr. Dante Santana	kbalestero@gmail.com	1995-09-19	2214.69000000000005	7437615158	991085383	246
01974517136	Dr. Hernani Galvão Filho	zamana.sofia@ferraz.org	1997-02-20	2796.67000000000007	8335137351	973970174	247
41133267033	Dr. Paulina Nádia Rocha	fabiana.jimenes@leal.com	2010-01-24	1346.78999999999996	8629919830	902258274	248
63229715810	Sra. Alma Ferreira	alexandre.maldonado@hotmail.com	1982-11-02	3393.0300000000002	4329817671	945823794	249
53756605205	Carla Ramos	ketlin09@yahoo.com	1992-05-25	2454.32999999999993	5325176680	901159633	250
49449323755	Clara Faria Santana	tfurtado@gmail.com	1980-03-03	2396.38999999999987	7438570719	944999599	251
48190568248	Sr. Alonso Abreu Sobrinho	luciano56@yahoo.com	2009-07-01	4845.5600000000004	3739186019	915248288	252
\.


--
-- TOC entry 2516 (class 0 OID 17460)
-- Dependencies: 196
-- Data for Name: funcionarios_gerente; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) FROM stdin;
1	RH	931.340000000000032	29752709419
2	Gerência	936.580000000000041	53756605205
3	Venda	1104.5	60054995728
4	Gerência	1072.33999999999992	96184744968
5	RH	499.629999999999995	96184744968
6	Venda	329.920000000000016	10237157918
7	Venda	638.379999999999995	97864565808
8	Gerência	1221.40000000000009	60054995728
9	RH	503.740000000000009	18681877720
10	Venda	376.730000000000018	41133267033
11	Gerência	396.720000000000027	97864565808
12	Venda	1485.90000000000009	40615805582
13	Venda	1296.77999999999997	00757838278
14	Gerência	1493.09999999999991	89329632408
15	RH	406.920000000000016	00757838278
16	Gerência	1272.25999999999999	93341972501
17	Gerência	1091.43000000000006	79846400764
18	RH	1240.04999999999995	03305768282
19	Gerência	1178.56999999999994	03305768282
20	Gerência	371.04000000000002	41087033594
21	Venda	427.610000000000014	53967805689
22	Venda	995.409999999999968	92022316487
23	RH	388.649999999999977	41087033594
24	RH	345.550000000000011	48190568248
25	RH	1400.40000000000009	53967805689
\.


--
-- TOC entry 2517 (class 0 OID 17470)
-- Dependencies: 197
-- Data for Name: funcionarios_vendedor; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) FROM stdin;
1	5	86452762915
2	1	06036290756
3	10	19439094230
4	10	11281614947
5	10	22795363747
6	5	99742270031
7	1	54913567276
8	5	68395045573
9	10	17776757233
10	1	09334603925
11	10	20691789606
12	1	63023835799
13	10	91139341472
14	5	83743448815
15	5	52514190584
16	10	65113335070
17	10	51664963880
18	1	75484666848
19	10	09590464297
20	5	13895884081
21	5	82704888442
22	10	94308904170
23	5	89475852387
24	5	22814212443
25	1	85635978681
26	5	56269831040
27	5	72668212405
28	5	02155734557
29	5	90083305122
30	5	01974517136
31	10	63229715810
32	1	49449323755
\.


--
-- TOC entry 2507 (class 0 OID 17360)
-- Dependencies: 187
-- Data for Name: generos; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY generos (id_genero, nome) FROM stdin;
1	Ferreira
2	Colaço
3	Uchoa
4	Martines
5	Carmona
6	Ortega
7	Carmona
8	Galvão
9	Chaves
10	Barreto
11	Sales
12	Valentin
13	Ramos
14	Leal
15	Vieira
16	Rocha
17	Galvão
18	Serrano
19	Vasques
20	Quintana
21	Mascarenhas
22	das Neves
23	Matos
24	Chaves
25	Dias
26	Santiago
27	Aguiar
28	Delgado
29	Vega
30	Dias
31	Pereira
32	Sales
33	Guerra
34	Gomes
35	Lira
36	Rodrigues
37	Rangel
38	Estrada
39	Flores
40	Sanches
41	Ferreira
42	Reis
43	Rocha
44	Padrão
45	Godói
46	Serrano
47	Correia
48	Delgado
49	Romero
50	Vieira
\.


--
-- TOC entry 2537 (class 0 OID 0)
-- Dependencies: 201
-- Name: generos_id_genero_sequence; Type: SEQUENCE SET; Schema: cinema; Owner: eduardoborges
--

SELECT pg_catalog.setval('generos_id_genero_sequence', 50, true);


--
-- TOC entry 2508 (class 0 OID 17365)
-- Dependencies: 188
-- Data for Name: horarios; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY horarios (id_horario, data_hora) FROM stdin;
1	2006-06-20 07:54:58
2	1978-02-06 15:32:03
3	2005-05-06 06:44:15
4	1970-07-06 00:46:37
5	1994-06-15 20:50:18
6	1993-04-03 01:46:06
7	2007-11-20 16:56:22
8	2004-06-23 13:13:39
9	2008-04-29 17:50:42
10	2005-05-06 02:25:55
11	1983-06-26 20:55:43
12	2004-10-16 03:48:16
13	2012-03-30 08:47:32
14	1995-03-04 04:25:46
15	1972-09-13 00:45:09
16	1976-04-19 09:20:47
17	2010-04-10 07:11:45
18	1974-12-02 16:17:38
19	2001-11-18 13:18:31
20	1977-02-25 17:23:42
21	2001-09-18 16:24:53
22	2012-07-28 03:53:43
23	1979-07-07 19:05:34
24	2015-04-29 21:42:32
25	2002-12-04 13:27:05
26	1973-06-06 09:12:55
27	1983-03-17 02:20:31
28	1975-12-04 12:48:34
29	2016-09-02 03:08:31
30	2000-05-27 17:26:54
31	1971-03-07 13:11:30
32	1992-10-11 20:02:52
33	2016-06-09 07:55:47
34	1989-08-25 02:21:18
35	1984-06-30 23:15:57
36	2007-10-16 01:17:25
37	2008-04-12 00:19:46
38	2010-08-04 07:58:02
39	1970-06-15 16:17:40
40	1976-02-11 16:30:57
41	1979-02-03 05:49:51
42	1989-09-30 15:46:22
43	1983-12-21 13:18:14
44	1990-09-26 22:35:29
45	1997-01-26 05:37:09
46	2010-04-02 05:23:38
47	2003-10-22 04:16:48
48	2004-09-22 01:01:20
49	1971-12-19 15:16:21
50	1979-01-28 15:29:23
\.


--
-- TOC entry 2538 (class 0 OID 0)
-- Dependencies: 202
-- Name: horarios_id_horario_sequence; Type: SEQUENCE SET; Schema: cinema; Owner: eduardoborges
--

SELECT pg_catalog.setval('horarios_id_horario_sequence', 50, true);


--
-- TOC entry 2515 (class 0 OID 17445)
-- Dependencies: 195
-- Data for Name: ingressos; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY ingressos (id_ingresso, id_sessao, id_venda, preco) FROM stdin;
1201	21	599	21.9899999999999984
1202	13	533	11.9900000000000002
1203	37	551	14.9900000000000002
1204	2	560	14.9900000000000002
1205	37	558	21.9899999999999984
1206	18	536	21.9899999999999984
1207	26	528	21.9899999999999984
1208	8	620	14.9900000000000002
1209	2	620	11.9900000000000002
1210	30	539	21.9899999999999984
1211	12	613	21.9899999999999984
1212	28	555	21.9899999999999984
1213	38	547	11.9900000000000002
1214	19	536	21.9899999999999984
1215	20	610	21.9899999999999984
1216	19	602	21.9899999999999984
1217	8	612	11.9900000000000002
1218	40	512	21.9899999999999984
1219	37	561	21.9899999999999984
1220	31	641	21.9899999999999984
1221	9	534	21.9899999999999984
1222	31	605	14.9900000000000002
1223	20	649	11.9900000000000002
1224	6	624	14.9900000000000002
1225	28	555	14.9900000000000002
1226	38	591	14.9900000000000002
1227	12	623	21.9899999999999984
1228	5	600	11.9900000000000002
1229	40	504	21.9899999999999984
1230	29	570	14.9900000000000002
1231	3	613	21.9899999999999984
1232	38	505	11.9900000000000002
1233	2	560	21.9899999999999984
1234	12	528	11.9900000000000002
1235	23	516	21.9899999999999984
1236	19	635	14.9900000000000002
1237	8	576	21.9899999999999984
1238	24	652	14.9900000000000002
1239	17	559	11.9900000000000002
1240	34	653	11.9900000000000002
1241	2	628	14.9900000000000002
1242	17	609	21.9899999999999984
1243	26	583	21.9899999999999984
1244	41	529	14.9900000000000002
1245	9	562	21.9899999999999984
1246	29	615	14.9900000000000002
1247	19	623	11.9900000000000002
1248	5	606	14.9900000000000002
1249	34	543	21.9899999999999984
1250	28	616	11.9900000000000002
1251	12	507	11.9900000000000002
1252	41	618	21.9899999999999984
1253	23	527	11.9900000000000002
1254	36	578	14.9900000000000002
1255	38	508	14.9900000000000002
1256	33	533	21.9899999999999984
1257	40	607	21.9899999999999984
1258	12	558	21.9899999999999984
1259	18	650	11.9900000000000002
1260	20	580	14.9900000000000002
1261	30	545	21.9899999999999984
1262	29	648	11.9900000000000002
1263	22	539	21.9899999999999984
1264	38	528	14.9900000000000002
1265	16	604	21.9899999999999984
1266	39	544	14.9900000000000002
1267	15	637	21.9899999999999984
1268	5	572	14.9900000000000002
1269	38	582	11.9900000000000002
1270	33	617	21.9899999999999984
1271	24	565	14.9900000000000002
1272	5	590	21.9899999999999984
1273	24	534	14.9900000000000002
1274	9	550	11.9900000000000002
1275	9	551	21.9899999999999984
1276	3	553	14.9900000000000002
1277	36	582	14.9900000000000002
1278	39	517	21.9899999999999984
1279	41	584	21.9899999999999984
1280	24	512	11.9900000000000002
1281	38	652	14.9900000000000002
1282	23	597	14.9900000000000002
1283	22	504	14.9900000000000002
1284	4	640	14.9900000000000002
1285	41	631	11.9900000000000002
1286	19	604	11.9900000000000002
1287	37	611	21.9899999999999984
1288	39	642	21.9899999999999984
1289	2	578	14.9900000000000002
1290	20	524	14.9900000000000002
1291	20	563	21.9899999999999984
1292	30	538	21.9899999999999984
1293	17	569	14.9900000000000002
1294	33	542	11.9900000000000002
1295	24	572	14.9900000000000002
1296	16	556	21.9899999999999984
1297	9	564	14.9900000000000002
1298	40	641	21.9899999999999984
1299	5	630	14.9900000000000002
1300	16	622	21.9899999999999984
1301	14	608	11.9900000000000002
1302	20	537	11.9900000000000002
1303	34	616	11.9900000000000002
1304	15	602	11.9900000000000002
1305	22	535	11.9900000000000002
1306	30	509	11.9900000000000002
1307	16	615	11.9900000000000002
1308	17	510	11.9900000000000002
1309	24	538	21.9899999999999984
1310	30	548	21.9899999999999984
1311	22	568	14.9900000000000002
1312	24	642	21.9899999999999984
1313	38	620	11.9900000000000002
1314	17	513	14.9900000000000002
1315	27	585	14.9900000000000002
1316	22	613	11.9900000000000002
1317	13	554	14.9900000000000002
1318	17	642	11.9900000000000002
1319	9	508	21.9899999999999984
1320	33	523	14.9900000000000002
1321	13	640	14.9900000000000002
1322	29	649	14.9900000000000002
1323	5	597	21.9899999999999984
1324	5	597	21.9899999999999984
1325	8	648	21.9899999999999984
1326	24	541	11.9900000000000002
1327	28	532	11.9900000000000002
1328	17	645	21.9899999999999984
1329	17	546	14.9900000000000002
1330	28	628	11.9900000000000002
1331	12	639	11.9900000000000002
1332	39	532	21.9899999999999984
1333	24	620	11.9900000000000002
1334	15	565	11.9900000000000002
1335	23	585	11.9900000000000002
1336	23	594	14.9900000000000002
1337	32	517	21.9899999999999984
1338	12	638	14.9900000000000002
1339	12	539	14.9900000000000002
1340	6	567	14.9900000000000002
1341	8	547	11.9900000000000002
1342	41	599	21.9899999999999984
1343	15	600	11.9900000000000002
1344	18	505	14.9900000000000002
1345	22	650	21.9899999999999984
1346	7	607	14.9900000000000002
1347	4	512	11.9900000000000002
1348	24	628	21.9899999999999984
1349	34	514	14.9900000000000002
1350	41	577	11.9900000000000002
1351	24	573	21.9899999999999984
1352	13	581	21.9899999999999984
1353	4	554	21.9899999999999984
1354	18	527	21.9899999999999984
1355	3	570	14.9900000000000002
1356	29	519	11.9900000000000002
1357	9	508	21.9899999999999984
1358	29	558	14.9900000000000002
1359	27	635	14.9900000000000002
1360	12	604	21.9899999999999984
1361	20	531	21.9899999999999984
1362	4	610	21.9899999999999984
1363	30	599	14.9900000000000002
1364	30	629	14.9900000000000002
1365	29	567	14.9900000000000002
1366	17	563	21.9899999999999984
1367	12	539	11.9900000000000002
1368	20	597	21.9899999999999984
1369	22	616	21.9899999999999984
1370	24	529	21.9899999999999984
1371	20	643	21.9899999999999984
1372	40	508	14.9900000000000002
1373	20	592	11.9900000000000002
1374	5	598	14.9900000000000002
1375	24	596	21.9899999999999984
1376	39	614	14.9900000000000002
1377	12	598	21.9899999999999984
1378	12	651	14.9900000000000002
1379	29	603	14.9900000000000002
1380	38	619	11.9900000000000002
1381	23	597	21.9899999999999984
1382	40	619	14.9900000000000002
1383	12	635	14.9900000000000002
1384	37	609	11.9900000000000002
1385	8	583	21.9899999999999984
1386	40	524	11.9900000000000002
1387	3	637	11.9900000000000002
1388	2	515	21.9899999999999984
1389	38	638	11.9900000000000002
1390	36	517	11.9900000000000002
1391	9	644	14.9900000000000002
1392	23	650	14.9900000000000002
1393	23	533	21.9899999999999984
1394	39	578	21.9899999999999984
1395	21	616	14.9900000000000002
1396	8	533	11.9900000000000002
1397	34	641	21.9899999999999984
1398	28	590	21.9899999999999984
1399	14	576	14.9900000000000002
1400	7	522	21.9899999999999984
1401	3	616	14.9900000000000002
1402	38	590	11.9900000000000002
1403	12	632	21.9899999999999984
1404	15	617	14.9900000000000002
1405	40	547	21.9899999999999984
1406	21	636	14.9900000000000002
1407	33	639	21.9899999999999984
1408	36	632	21.9899999999999984
1409	21	590	21.9899999999999984
1410	5	562	11.9900000000000002
1411	2	567	11.9900000000000002
1412	30	575	21.9899999999999984
1413	24	511	14.9900000000000002
1414	28	559	14.9900000000000002
1415	27	519	11.9900000000000002
1416	28	533	11.9900000000000002
1417	26	630	11.9900000000000002
1418	32	574	21.9899999999999984
1419	24	641	11.9900000000000002
1420	21	621	21.9899999999999984
1421	31	592	14.9900000000000002
1422	4	653	21.9899999999999984
1423	31	544	11.9900000000000002
1424	22	513	14.9900000000000002
1425	3	555	11.9900000000000002
1426	13	564	11.9900000000000002
1427	36	626	14.9900000000000002
1428	34	568	21.9899999999999984
1429	30	596	14.9900000000000002
1430	2	547	14.9900000000000002
1431	6	561	14.9900000000000002
1432	16	580	14.9900000000000002
1433	31	571	11.9900000000000002
1434	41	616	14.9900000000000002
1435	31	603	11.9900000000000002
1436	32	568	14.9900000000000002
1437	14	632	11.9900000000000002
1438	26	581	14.9900000000000002
1439	31	631	11.9900000000000002
1440	16	651	11.9900000000000002
1441	36	520	11.9900000000000002
1442	6	584	21.9899999999999984
1443	3	567	21.9899999999999984
1444	14	602	14.9900000000000002
1445	36	594	21.9899999999999984
1446	32	635	21.9899999999999984
1447	35	638	14.9900000000000002
1448	24	554	21.9899999999999984
1449	41	593	21.9899999999999984
1450	21	569	14.9900000000000002
1451	22	620	11.9900000000000002
1452	40	568	21.9899999999999984
1453	34	622	21.9899999999999984
1454	38	513	11.9900000000000002
1455	27	525	14.9900000000000002
1456	12	538	21.9899999999999984
1457	14	581	14.9900000000000002
1458	12	607	11.9900000000000002
1459	13	569	14.9900000000000002
1460	16	647	11.9900000000000002
1461	27	625	14.9900000000000002
1462	14	567	14.9900000000000002
1463	9	626	21.9899999999999984
1464	20	652	14.9900000000000002
1465	27	573	11.9900000000000002
1466	31	563	11.9900000000000002
1467	38	604	11.9900000000000002
1468	17	539	11.9900000000000002
1469	2	589	21.9899999999999984
1470	23	626	14.9900000000000002
1471	13	506	21.9899999999999984
1472	39	645	14.9900000000000002
1473	41	599	11.9900000000000002
1474	7	583	11.9900000000000002
1475	9	527	21.9899999999999984
1476	13	522	14.9900000000000002
1477	5	511	14.9900000000000002
1478	26	545	21.9899999999999984
1479	31	645	14.9900000000000002
1480	18	589	14.9900000000000002
1481	30	592	11.9900000000000002
1482	13	604	21.9899999999999984
1483	36	627	21.9899999999999984
1484	13	553	11.9900000000000002
1485	17	592	11.9900000000000002
1486	17	610	11.9900000000000002
1487	15	552	14.9900000000000002
1488	34	573	11.9900000000000002
1489	40	617	11.9900000000000002
1490	13	507	21.9899999999999984
1491	3	632	21.9899999999999984
1492	30	556	11.9900000000000002
1493	26	601	11.9900000000000002
1494	24	562	21.9899999999999984
1495	31	545	11.9900000000000002
1496	26	647	11.9900000000000002
1497	12	544	14.9900000000000002
1498	39	622	21.9899999999999984
1499	19	536	14.9900000000000002
1500	24	600	14.9900000000000002
1501	18	524	14.9900000000000002
1502	13	562	11.9900000000000002
1503	15	652	21.9899999999999984
1504	38	556	11.9900000000000002
1505	12	559	14.9900000000000002
1506	4	626	14.9900000000000002
1507	7	569	21.9899999999999984
1508	29	597	11.9900000000000002
1509	16	582	21.9899999999999984
1510	2	644	11.9900000000000002
1511	23	555	11.9900000000000002
1512	26	504	11.9900000000000002
1513	40	586	21.9899999999999984
1514	22	622	14.9900000000000002
1515	37	615	21.9899999999999984
1516	27	541	11.9900000000000002
1517	2	576	21.9899999999999984
1518	8	520	21.9899999999999984
1519	19	653	21.9899999999999984
1520	24	639	11.9900000000000002
1521	26	550	11.9900000000000002
1522	3	630	14.9900000000000002
1523	39	592	11.9900000000000002
1524	30	571	21.9899999999999984
1525	39	555	21.9899999999999984
1526	35	555	14.9900000000000002
1527	4	600	14.9900000000000002
1528	14	641	11.9900000000000002
1529	34	638	11.9900000000000002
1530	40	514	21.9899999999999984
1531	40	633	21.9899999999999984
1532	24	583	11.9900000000000002
1533	22	597	21.9899999999999984
1534	8	638	14.9900000000000002
1535	38	634	14.9900000000000002
1536	41	604	21.9899999999999984
1537	7	518	14.9900000000000002
1538	24	548	21.9899999999999984
1539	16	652	14.9900000000000002
1540	8	567	14.9900000000000002
1541	6	586	21.9899999999999984
1542	24	555	21.9899999999999984
1543	15	649	11.9900000000000002
1544	28	546	21.9899999999999984
1545	30	628	14.9900000000000002
1546	13	641	21.9899999999999984
1547	19	582	11.9900000000000002
1548	15	613	14.9900000000000002
1549	17	525	11.9900000000000002
1550	8	520	11.9900000000000002
1551	28	514	11.9900000000000002
1552	31	607	11.9900000000000002
1553	29	621	14.9900000000000002
1554	41	620	14.9900000000000002
1555	15	537	21.9899999999999984
1556	14	619	14.9900000000000002
1557	8	539	11.9900000000000002
1558	8	598	14.9900000000000002
1559	27	621	14.9900000000000002
1560	40	546	14.9900000000000002
1561	8	625	21.9899999999999984
1562	28	504	21.9899999999999984
1563	37	512	21.9899999999999984
1564	14	562	11.9900000000000002
1565	5	646	11.9900000000000002
1566	17	634	14.9900000000000002
1567	14	616	14.9900000000000002
1568	21	562	11.9900000000000002
1569	28	586	21.9899999999999984
1570	28	532	11.9900000000000002
1571	13	586	21.9899999999999984
1572	19	600	21.9899999999999984
1573	38	554	11.9900000000000002
1574	8	632	21.9899999999999984
1575	40	619	21.9899999999999984
1576	6	586	21.9899999999999984
1577	14	570	11.9900000000000002
1578	22	541	11.9900000000000002
1579	17	581	21.9899999999999984
1580	3	644	21.9899999999999984
1581	8	620	11.9900000000000002
1582	38	608	14.9900000000000002
1583	34	602	11.9900000000000002
1584	8	606	21.9899999999999984
1585	13	593	14.9900000000000002
1586	2	543	11.9900000000000002
1587	37	573	14.9900000000000002
1588	33	619	21.9899999999999984
1589	23	521	11.9900000000000002
1590	39	583	21.9899999999999984
1591	6	554	14.9900000000000002
1592	36	609	11.9900000000000002
1593	16	597	21.9899999999999984
1594	23	516	14.9900000000000002
1595	38	641	11.9900000000000002
1596	26	537	11.9900000000000002
1597	41	569	11.9900000000000002
1598	39	523	21.9899999999999984
1599	28	637	14.9900000000000002
1600	33	627	11.9900000000000002
1601	31	528	14.9900000000000002
1602	32	534	21.9899999999999984
1603	34	573	14.9900000000000002
1604	17	599	11.9900000000000002
1605	8	511	21.9899999999999984
1606	26	582	21.9899999999999984
1607	26	552	14.9900000000000002
1608	12	526	21.9899999999999984
1609	31	571	21.9899999999999984
1610	31	593	11.9900000000000002
1611	32	636	21.9899999999999984
1612	17	523	14.9900000000000002
1613	7	590	14.9900000000000002
1614	19	505	21.9899999999999984
1615	21	618	11.9900000000000002
1616	19	519	11.9900000000000002
1617	39	615	14.9900000000000002
1618	39	577	11.9900000000000002
1619	41	570	14.9900000000000002
1620	19	542	21.9899999999999984
1621	27	612	11.9900000000000002
1622	22	570	11.9900000000000002
1623	36	614	11.9900000000000002
1624	40	514	14.9900000000000002
1625	38	507	21.9899999999999984
1626	24	509	14.9900000000000002
1627	23	561	14.9900000000000002
1628	32	572	11.9900000000000002
1629	7	555	11.9900000000000002
1630	18	583	14.9900000000000002
1631	22	547	11.9900000000000002
1632	13	535	11.9900000000000002
1633	26	508	21.9899999999999984
1634	32	553	11.9900000000000002
1635	5	618	14.9900000000000002
1636	39	556	21.9899999999999984
1637	37	644	21.9899999999999984
1638	22	554	14.9900000000000002
1639	6	545	21.9899999999999984
1640	29	542	14.9900000000000002
1641	37	594	11.9900000000000002
1642	31	520	11.9900000000000002
1643	2	608	11.9900000000000002
1644	36	564	21.9899999999999984
1645	39	623	14.9900000000000002
1646	34	552	11.9900000000000002
1647	12	620	11.9900000000000002
1648	39	543	11.9900000000000002
1649	12	523	14.9900000000000002
1650	15	569	21.9899999999999984
1651	32	619	21.9899999999999984
1652	24	519	11.9900000000000002
1653	14	625	14.9900000000000002
1654	33	613	14.9900000000000002
1655	34	548	14.9900000000000002
1656	36	633	14.9900000000000002
1657	29	534	21.9899999999999984
1658	36	514	11.9900000000000002
1659	16	539	14.9900000000000002
1660	29	564	21.9899999999999984
1661	8	613	14.9900000000000002
1662	9	524	21.9899999999999984
1663	2	596	11.9900000000000002
1664	38	537	11.9900000000000002
1665	22	579	21.9899999999999984
1666	9	519	14.9900000000000002
1667	26	586	14.9900000000000002
1668	21	624	11.9900000000000002
1669	27	528	14.9900000000000002
1670	17	526	11.9900000000000002
1671	36	543	11.9900000000000002
1672	15	561	14.9900000000000002
1673	8	586	14.9900000000000002
1674	17	612	21.9899999999999984
1675	3	580	14.9900000000000002
1676	32	602	11.9900000000000002
1677	19	646	11.9900000000000002
1678	30	644	11.9900000000000002
1679	33	549	11.9900000000000002
1680	41	566	11.9900000000000002
1681	19	646	21.9899999999999984
1682	19	566	11.9900000000000002
1683	3	507	11.9900000000000002
1684	18	612	21.9899999999999984
1685	29	583	11.9900000000000002
1686	20	639	11.9900000000000002
1687	19	590	11.9900000000000002
1688	21	586	11.9900000000000002
1689	29	509	21.9899999999999984
1690	30	535	11.9900000000000002
1691	38	545	14.9900000000000002
1692	21	621	11.9900000000000002
1693	20	507	11.9900000000000002
1694	34	574	21.9899999999999984
1695	26	505	11.9900000000000002
1696	17	645	11.9900000000000002
1697	9	629	21.9899999999999984
1698	40	604	14.9900000000000002
1699	23	513	21.9899999999999984
1700	38	648	14.9900000000000002
\.


--
-- TOC entry 2539 (class 0 OID 0)
-- Dependencies: 208
-- Name: ingressos_id_ingresso_sequence; Type: SEQUENCE SET; Schema: cinema; Owner: eduardoborges
--

SELECT pg_catalog.setval('ingressos_id_ingresso_sequence', 1700, true);


--
-- TOC entry 2540 (class 0 OID 0)
-- Dependencies: 205
-- Name: poltronas_id_sequence; Type: SEQUENCE SET; Schema: cinema; Owner: eduardoborges
--

SELECT pg_catalog.setval('poltronas_id_sequence', 1, false);


--
-- TOC entry 2509 (class 0 OID 17370)
-- Dependencies: 189
-- Data for Name: salas; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY salas (id_sala, capacidade, numero) FROM stdin;
1	1	4
2	1	4
3	4	5
10	10	10
4	16	12
5	16	12
6	16	12
7	16	12
8	44	9
9	31	4
11	72	1
12	53	7
13	13	8
14	29	7
15	90	9
16	92	3
17	89	10
18	88	1
19	67	0
20	24	7
21	56	3
22	100	6
23	13	7
24	58	9
25	49	7
26	29	4
27	34	8
28	28	5
29	45	1
30	96	5
31	41	8
32	83	3
33	11	5
34	14	9
35	15	3
36	86	3
37	73	6
38	43	7
39	10	37
40	4	48
41	86	1
42	96	2
43	83	3
44	52	4
45	35	5
46	60	6
47	59	7
48	47	8
49	49	9
50	63	10
51	41	11
52	50	12
53	59	13
54	67	14
55	61	15
\.


--
-- TOC entry 2541 (class 0 OID 0)
-- Dependencies: 203
-- Name: salas_id_sala_sequence; Type: SEQUENCE SET; Schema: cinema; Owner: eduardoborges
--

SELECT pg_catalog.setval('salas_id_sala_sequence', 55, true);


--
-- TOC entry 2510 (class 0 OID 17375)
-- Dependencies: 190
-- Data for Name: sessoes; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY sessoes (id_sessao, id_filme, id_horario, id_sala) FROM stdin;
2	1	1	1
3	2	2	2
4	3	3	3
5	4	4	4
6	5	5	5
7	6	6	6
8	7	7	7
9	8	8	8
12	11	11	11
13	12	12	12
14	13	13	13
15	14	14	14
16	15	15	15
17	16	16	16
18	17	17	17
19	18	18	18
20	19	19	19
21	20	20	20
22	21	21	21
23	22	22	22
24	23	23	23
26	25	25	25
27	26	26	26
28	27	27	27
29	28	28	28
30	29	29	29
31	30	30	30
32	31	31	31
33	32	32	32
34	33	33	33
35	34	34	34
36	35	35	35
37	36	36	36
38	37	37	37
39	38	38	38
40	39	39	39
41	40	40	40
\.


--
-- TOC entry 2542 (class 0 OID 0)
-- Dependencies: 204
-- Name: sessoes_id_sessao_sequence; Type: SEQUENCE SET; Schema: cinema; Owner: eduardoborges
--

SELECT pg_catalog.setval('sessoes_id_sessao_sequence', 50, true);


--
-- TOC entry 2514 (class 0 OID 17430)
-- Dependencies: 194
-- Data for Name: vendas; Type: TABLE DATA; Schema: cinema; Owner: eduardoborges
--

COPY vendas (id_venda, data, cpf_cliente, cpf_funcionario) FROM stdin;
504	2012-02-17 20:15:27	72692475364	86452762915
505	2006-02-11 11:33:12	00781753139	91139341472
506	1978-12-09 05:33:08	33471127330	54913567276
507	2014-05-14 06:14:10	00781753139	20691789606
508	1992-02-12 16:13:38	48362684860	93341972501
509	2006-04-29 15:16:44	77844517093	82704888442
510	2013-09-06 15:26:28	40832391662	99742270031
511	2013-07-04 01:56:40	63607679452	22814212443
512	2002-08-23 04:36:59	42858651655	29752709419
513	1992-06-19 05:52:34	98637421121	68395045573
514	1976-06-30 09:25:24	28920149135	03305768282
515	1981-11-29 19:01:26	29391344992	22814212443
516	1976-09-22 10:21:57	42858651655	11281614947
517	2017-07-17 10:18:50	63607679452	02155734557
518	2004-07-31 10:20:34	06275412836	11281614947
519	2013-03-08 15:59:17	36741287647	11281614947
520	2005-01-31 21:58:59	72692475364	54913567276
521	1971-01-30 18:04:32	72646758235	85635978681
522	1999-05-10 07:33:53	34812822815	56269831040
523	2010-09-30 04:19:07	29391344992	63229715810
524	1971-04-09 11:10:12	34812822815	00757838278
525	1980-10-22 08:48:00	48900884239	22814212443
526	1980-08-13 15:32:07	32010193059	11281614947
527	1970-06-23 18:20:58	40832391662	49449323755
528	1983-01-06 07:02:08	43251170830	09590464297
529	2017-04-16 03:24:37	46677008231	00757838278
530	1973-12-20 06:48:21	54908402000	17776757233
531	1984-02-14 13:52:10	60346699363	09590464297
532	1977-06-28 15:06:19	28920149135	49449323755
533	2004-09-10 13:05:31	54908402000	20691789606
534	2005-03-04 13:27:42	56745892677	29752709419
535	1981-12-16 05:34:02	40832391662	99742270031
536	1978-08-02 22:00:48	54908402000	41133267033
537	1973-03-19 23:56:27	24782227604	00757838278
538	1979-01-28 17:48:07	91873381735	48190568248
539	1998-12-17 13:33:28	08415586809	48190568248
540	2017-03-13 19:36:05	51432476750	68395045573
541	2009-07-05 01:15:37	91873381735	51664963880
542	1995-06-27 22:29:40	34812822815	10237157918
543	1991-10-20 17:59:53	45060520307	82704888442
544	1993-08-16 17:56:45	05632430154	40615805582
545	2013-04-20 17:47:19	43251170830	10237157918
546	1992-08-02 05:00:17	76152110939	85635978681
547	2009-07-01 15:23:17	99015904855	17776757233
548	1990-04-14 14:01:14	91873381735	99742270031
549	1988-08-09 05:24:09	08415586809	96184744968
550	1973-07-04 21:19:05	49834931409	19439094230
551	2014-01-06 10:37:24	24782227604	56269831040
552	1989-08-17 16:48:53	38976824865	56269831040
553	1974-08-26 22:16:31	45060520307	00757838278
554	1993-08-16 09:44:05	52361625059	22795363747
555	2003-08-06 23:10:00	51432476750	93341972501
556	1988-06-01 03:59:27	00781753139	83743448815
557	2006-01-06 10:43:58	38976824865	13895884081
558	1990-02-14 23:16:58	77844517093	93341972501
559	1984-03-23 16:41:29	04694194232	18681877720
560	1982-07-19 07:36:18	98637421121	09590464297
561	1983-07-14 05:21:41	07328820446	06036290756
562	2008-06-07 15:26:31	43251170830	92022316487
563	2016-07-24 03:43:34	43251170830	06036290756
564	1989-12-06 06:02:29	89671476198	53756605205
565	2006-05-22 19:36:31	32010193059	96184744968
566	1997-05-07 04:25:02	99121470731	89475852387
567	2009-07-05 11:48:07	47692812420	53967805689
568	2006-09-02 22:38:10	45060520307	53967805689
569	1985-08-05 06:56:17	99015904855	79846400764
570	1981-08-18 16:19:07	42858651655	83743448815
571	1972-04-16 12:25:41	71603568964	41087033594
572	2016-11-04 11:09:13	32010193059	96184744968
573	1970-05-27 20:25:24	30147135206	83743448815
574	1980-01-10 12:55:26	71755146469	79846400764
575	1977-08-03 10:56:11	99015904855	91139341472
576	1979-01-15 22:00:51	93113604060	92022316487
577	2004-01-27 15:27:26	60346699363	68395045573
578	1999-04-26 21:08:27	72646758235	96184744968
579	1975-01-01 13:16:51	04694194232	03305768282
580	2004-06-09 23:33:53	99015904855	53967805689
581	1982-08-22 23:37:07	41168565332	85635978681
582	1973-04-21 14:24:43	05632430154	54913567276
583	1981-08-28 14:31:55	52361625059	29752709419
584	2003-11-10 23:48:45	56606368960	51664963880
585	1993-03-30 20:51:15	63607679452	18681877720
586	1997-05-29 10:41:12	76152110939	79846400764
587	1977-09-05 17:36:31	52361625059	85635978681
588	1988-01-23 01:23:35	30147135206	02155734557
589	1986-10-04 22:41:42	42858651655	09334603925
590	1988-11-27 07:26:40	42858651655	90083305122
591	1989-05-08 12:37:16	51432476750	53967805689
592	2010-03-08 05:45:22	29391344992	99742270031
593	1985-02-10 15:54:18	99919222968	60054995728
594	1971-12-07 15:11:02	24782227604	52514190584
595	1987-12-28 13:07:57	60346699363	13895884081
596	1971-10-25 21:06:03	72646758235	53967805689
597	2017-04-15 02:24:47	89671476198	97864565808
598	1976-09-27 20:21:00	56606368960	10237157918
599	2000-08-03 19:26:23	40832391662	63023835799
600	1992-11-23 11:21:16	33471127330	49449323755
601	1990-06-23 03:05:23	91873381735	60054995728
602	1972-01-12 08:22:53	41804971073	51664963880
603	1979-06-19 15:25:49	43251170830	20691789606
604	2003-12-03 06:49:02	89671476198	65113335070
605	2015-01-14 00:40:04	48362684860	89329632408
606	2012-04-12 02:29:22	28920149135	20691789606
607	1996-10-10 19:52:56	47692812420	65113335070
608	1982-03-13 06:09:10	45060520307	85635978681
609	2008-07-13 23:05:53	56745892677	91139341472
610	2010-04-26 02:22:12	56606368960	65113335070
611	1974-08-24 06:57:57	06275412836	40615805582
612	1992-06-10 14:11:36	07328820446	63023835799
613	1994-09-18 07:00:41	93113604060	00757838278
614	2008-02-08 14:37:07	63607679452	09334603925
615	1985-10-29 07:36:58	30147135206	97864565808
616	2006-12-27 21:01:48	34812822815	96184744968
617	2008-02-15 13:22:13	32010193059	09590464297
618	2013-01-11 01:16:24	34812822815	99742270031
619	1988-04-30 20:52:45	37760256388	40615805582
620	2000-09-07 09:10:02	41168565332	75484666848
621	1992-12-08 18:01:48	56606368960	53756605205
622	1990-10-06 00:53:50	37760256388	22814212443
623	2002-02-28 05:31:28	60346699363	91139341472
624	2009-05-08 02:44:54	45060520307	65113335070
625	2015-05-11 19:46:31	71603568964	94308904170
626	1980-08-30 19:48:26	47374304552	96184744968
627	2009-07-01 09:36:57	00781753139	41087033594
628	1980-12-28 11:25:10	42858651655	68395045573
629	1993-07-30 21:10:14	42858651655	00757838278
630	1997-05-22 20:40:26	45060520307	97864565808
631	2007-01-26 15:50:35	37760256388	96184744968
632	1994-12-05 21:21:03	38976824865	89475852387
633	1982-07-14 14:17:08	28920149135	17776757233
634	2005-07-07 22:50:28	17895280627	29752709419
635	1987-02-05 17:24:03	76152110939	41087033594
636	1973-08-24 16:15:54	32010193059	22795363747
637	2010-08-12 05:38:24	49834931409	89475852387
638	2007-07-02 22:48:53	17895280627	03305768282
639	1984-10-14 21:09:44	29391344992	09334603925
640	1997-03-29 10:22:10	34812822815	01974517136
641	2012-02-03 13:22:46	38976824865	29752709419
642	2013-01-22 22:48:03	33471127330	09334603925
643	2009-05-06 19:46:27	91873381735	03305768282
644	1991-10-20 19:13:52	45060520307	02155734557
645	1976-01-08 04:17:47	07328820446	49449323755
646	1995-06-18 12:13:58	30147135206	83743448815
647	1974-06-01 16:23:40	05632430154	06036290756
648	1987-09-13 12:20:55	98637421121	11281614947
649	2005-01-08 18:46:27	43251170830	53756605205
650	2003-11-17 07:44:33	28920149135	29752709419
651	2007-02-13 02:24:46	54908402000	54913567276
652	1991-06-21 16:56:47	89671476198	72668212405
653	1989-10-02 02:38:35	93113604060	68395045573
\.


--
-- TOC entry 2543 (class 0 OID 0)
-- Dependencies: 207
-- Name: vendas_id_venda_sequence; Type: SEQUENCE SET; Schema: cinema; Owner: eduardoborges
--

SELECT pg_catalog.setval('vendas_id_venda_sequence', 653, true);


--
-- TOC entry 2360 (class 2606 OID 17414)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cpf);


--
-- TOC entry 2372 (class 2606 OID 17484)
-- Name: clientes_vip clientes_vip_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY clientes_vip
    ADD CONSTRAINT clientes_vip_pkey PRIMARY KEY ("id_cliente_VIP");


--
-- TOC entry 2358 (class 2606 OID 17409)
-- Name: enderecos enderecos_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY enderecos
    ADD CONSTRAINT enderecos_pkey PRIMARY KEY (id_endereco);


--
-- TOC entry 2348 (class 2606 OID 17359)
-- Name: filmes filmes_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY filmes
    ADD CONSTRAINT filmes_pkey PRIMARY KEY (id_filme);


--
-- TOC entry 2374 (class 2606 OID 17494)
-- Name: filmes_possui_generos filmes_possui_generos_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY filmes_possui_generos
    ADD CONSTRAINT filmes_possui_generos_pkey PRIMARY KEY (id_filme, id_genero);


--
-- TOC entry 2368 (class 2606 OID 17464)
-- Name: funcionarios_gerente funcionarios_gerente_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY funcionarios_gerente
    ADD CONSTRAINT funcionarios_gerente_pkey PRIMARY KEY (id_funcionario_gerente);


--
-- TOC entry 2362 (class 2606 OID 17424)
-- Name: funcionarios funcionarios_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (cpf);


--
-- TOC entry 2370 (class 2606 OID 17474)
-- Name: funcionarios_vendedor funcionarios_vendedor_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY funcionarios_vendedor
    ADD CONSTRAINT funcionarios_vendedor_pkey PRIMARY KEY (id_funcionario_vendedor);


--
-- TOC entry 2350 (class 2606 OID 17364)
-- Name: generos generos_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY generos
    ADD CONSTRAINT generos_pkey PRIMARY KEY (id_genero);


--
-- TOC entry 2352 (class 2606 OID 17369)
-- Name: horarios horarios_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY horarios
    ADD CONSTRAINT horarios_pkey PRIMARY KEY (id_horario);


--
-- TOC entry 2366 (class 2606 OID 17449)
-- Name: ingressos ingressos_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY ingressos
    ADD CONSTRAINT ingressos_pkey PRIMARY KEY (id_ingresso);


--
-- TOC entry 2354 (class 2606 OID 17374)
-- Name: salas salas_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY salas
    ADD CONSTRAINT salas_pkey PRIMARY KEY (id_sala);


--
-- TOC entry 2356 (class 2606 OID 17379)
-- Name: sessoes sessoes_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY sessoes
    ADD CONSTRAINT sessoes_pkey PRIMARY KEY (id_sessao);


--
-- TOC entry 2364 (class 2606 OID 17434)
-- Name: vendas vendas_pkey; Type: CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id_venda);


--
-- TOC entry 2378 (class 2606 OID 17415)
-- Name: clientes fk_cliente_enderecos1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT fk_cliente_enderecos1 FOREIGN KEY (id_endereco) REFERENCES enderecos(id_endereco);


--
-- TOC entry 2386 (class 2606 OID 17485)
-- Name: clientes_vip fk_clientes_vip_cliente1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY clientes_vip
    ADD CONSTRAINT fk_clientes_vip_cliente1 FOREIGN KEY (cpf_cliente) REFERENCES clientes(cpf);


--
-- TOC entry 2387 (class 2606 OID 17495)
-- Name: filmes_possui_generos fk_filmes_has_generos_filmes1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY filmes_possui_generos
    ADD CONSTRAINT fk_filmes_has_generos_filmes1 FOREIGN KEY (id_filme) REFERENCES filmes(id_filme);


--
-- TOC entry 2388 (class 2606 OID 17500)
-- Name: filmes_possui_generos fk_filmes_has_generos_generos1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY filmes_possui_generos
    ADD CONSTRAINT fk_filmes_has_generos_generos1 FOREIGN KEY (id_genero) REFERENCES generos(id_genero);


--
-- TOC entry 2379 (class 2606 OID 17425)
-- Name: funcionarios fk_funcionario_enderecos1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY funcionarios
    ADD CONSTRAINT fk_funcionario_enderecos1 FOREIGN KEY (id_endereco) REFERENCES enderecos(id_endereco);


--
-- TOC entry 2384 (class 2606 OID 17465)
-- Name: funcionarios_gerente fk_funcionarios_gerente_funcionarios1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY funcionarios_gerente
    ADD CONSTRAINT fk_funcionarios_gerente_funcionarios1 FOREIGN KEY (cpf_funcionario) REFERENCES funcionarios(cpf);


--
-- TOC entry 2385 (class 2606 OID 17475)
-- Name: funcionarios_vendedor fk_funcionarios_vendedor_funcionarios1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY funcionarios_vendedor
    ADD CONSTRAINT fk_funcionarios_vendedor_funcionarios1 FOREIGN KEY (cpf_funcionario) REFERENCES funcionarios(cpf);


--
-- TOC entry 2382 (class 2606 OID 17450)
-- Name: ingressos fk_ingressos_sessoes1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY ingressos
    ADD CONSTRAINT fk_ingressos_sessoes1 FOREIGN KEY (id_sessao) REFERENCES sessoes(id_sessao);


--
-- TOC entry 2383 (class 2606 OID 17455)
-- Name: ingressos fk_ingressos_vendas1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY ingressos
    ADD CONSTRAINT fk_ingressos_vendas1 FOREIGN KEY (id_venda) REFERENCES vendas(id_venda);


--
-- TOC entry 2375 (class 2606 OID 17380)
-- Name: sessoes fk_sessoes_filmes; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY sessoes
    ADD CONSTRAINT fk_sessoes_filmes FOREIGN KEY (id_filme) REFERENCES filmes(id_filme);


--
-- TOC entry 2376 (class 2606 OID 17385)
-- Name: sessoes fk_sessoes_horarios1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY sessoes
    ADD CONSTRAINT fk_sessoes_horarios1 FOREIGN KEY (id_horario) REFERENCES horarios(id_horario);


--
-- TOC entry 2377 (class 2606 OID 17390)
-- Name: sessoes fk_sessoes_salas1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY sessoes
    ADD CONSTRAINT fk_sessoes_salas1 FOREIGN KEY (id_sala) REFERENCES salas(id_sala);


--
-- TOC entry 2380 (class 2606 OID 17435)
-- Name: vendas fk_venda_cliente1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY vendas
    ADD CONSTRAINT fk_venda_cliente1 FOREIGN KEY (cpf_cliente) REFERENCES clientes(cpf);


--
-- TOC entry 2381 (class 2606 OID 17440)
-- Name: vendas fk_venda_funcionario1; Type: FK CONSTRAINT; Schema: cinema; Owner: eduardoborges
--

ALTER TABLE ONLY vendas
    ADD CONSTRAINT fk_venda_funcionario1 FOREIGN KEY (cpf_funcionario) REFERENCES funcionarios(cpf);


-- Completed on 2017-09-25 11:27:54 -03

--
-- PostgreSQL database dump complete
--

