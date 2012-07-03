--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bus_stops; Type: TABLE; Schema: public; Owner: unwlrbgljmaqxx; Tablespace: 
--

CREATE TABLE bus_stops (
    id integer NOT NULL,
    lat numeric(10,7) NOT NULL,
    lng numeric(10,7) NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.bus_stops OWNER TO unwlrbgljmaqxx;

--
-- Name: bus_stops_id_seq; Type: SEQUENCE; Schema: public; Owner: unwlrbgljmaqxx
--

CREATE SEQUENCE bus_stops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bus_stops_id_seq OWNER TO unwlrbgljmaqxx;

--
-- Name: bus_stops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unwlrbgljmaqxx
--

ALTER SEQUENCE bus_stops_id_seq OWNED BY bus_stops.id;


--
-- Name: bus_stops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unwlrbgljmaqxx
--

SELECT pg_catalog.setval('bus_stops_id_seq', 1045, true);


--
-- Name: intended_trips; Type: TABLE; Schema: public; Owner: unwlrbgljmaqxx; Tablespace: 
--

CREATE TABLE intended_trips (
    id integer NOT NULL,
    "on" integer NOT NULL,
    from_stop_id integer NOT NULL,
    to_stop_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.intended_trips OWNER TO unwlrbgljmaqxx;

--
-- Name: intended_trips_id_seq; Type: SEQUENCE; Schema: public; Owner: unwlrbgljmaqxx
--

CREATE SEQUENCE intended_trips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.intended_trips_id_seq OWNER TO unwlrbgljmaqxx;

--
-- Name: intended_trips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unwlrbgljmaqxx
--

ALTER SEQUENCE intended_trips_id_seq OWNED BY intended_trips.id;


--
-- Name: intended_trips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unwlrbgljmaqxx
--

SELECT pg_catalog.setval('intended_trips_id_seq', 35, true);


--
-- Name: users; Type: TABLE; Schema: public; Owner: unwlrbgljmaqxx; Tablespace: 
--

CREATE TABLE users (
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(50),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(50),
    last_sign_in_ip character varying(50),
    confirmation_token character varying(50),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying(50),
    id integer NOT NULL,
    role character varying(50)
);


ALTER TABLE public.users OWNER TO unwlrbgljmaqxx;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: unwlrbgljmaqxx
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO unwlrbgljmaqxx;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unwlrbgljmaqxx
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unwlrbgljmaqxx
--

SELECT pg_catalog.setval('users_id_seq', 48, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: unwlrbgljmaqxx
--

ALTER TABLE ONLY bus_stops ALTER COLUMN id SET DEFAULT nextval('bus_stops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: unwlrbgljmaqxx
--

ALTER TABLE ONLY intended_trips ALTER COLUMN id SET DEFAULT nextval('intended_trips_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: unwlrbgljmaqxx
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: bus_stops; Type: TABLE DATA; Schema: public; Owner: unwlrbgljmaqxx
--

COPY bus_stops (id, lat, lng, name) FROM stdin;
1	18.9074970	72.8183740	Afghan Church Colaba
2	18.9108890	72.8252880	Colaba Bus Station Colaba
3	18.9172590	72.8272000	Sasoon Dock Colaba
4	18.9196260	72.8294540	Strand Cinema Colaba
5	18.9227680	72.8317700	Electric House/Colaba Depot Colaba
6	18.9263200	72.8325710	Dr.S.P.Mukherji Chowk Colaba
7	18.9332150	72.8360760	Hutatma Chowk Siddharth College Fort
8	18.9371650	72.8343030	Khadi Bhandar Fort
9	18.9405790	72.8349760	CST Fort
10	18.9462900	72.8323960	G.T. Hospital Dhobitalao
11	18.9472970	72.8268220	Chira Bazar Girgaon
12	18.9489710	72.8254880	Dabool Church Girgaon
13	18.9512610	72.8234040	Thakurdwar Girgaon
14	18.9545390	72.8260870	Kasturba Gandhi Chowk C.P.Tank
15	18.9535230	72.8087260	Sukh Sagar Opera House
16	18.9506810	72.8050080	Shital Baug Walkeshwar
17	18.9496430	72.8036060	White House Walkeshwar
18	18.9469680	72.8008360	Raj Bhavan Walkeshwar
19	18.9462770	72.7993770	Teen Batti Walkeshwar
20	18.9469010	72.7991050	Manav Mandir Walkeshwar
21	19.1120840	72.9350150	Kannamwar Nagar No 1 Vikhroli East
22	19.1096840	72.9314060	Vikhroli Station Road Vikhroli East
23	19.1115720	72.9324720	R.Tagor Nagar Udyan/Vikhroli Bridge Vikhroli East
24	19.1127950	72.9313830	Tagore Nagar Post Office Vidyavihar East
25	19.1225400	72.9292060	Tagore Nagar No.5 Vikhroli East
26	19.1220720	72.9257800	Gandhi Nagar Vikhroli West
27	19.1264840	72.9197750	IIT Market Powai
28	19.1242370	72.9174590	IIT Main Gate Powai
29	19.1221400	72.9091960	Punch Kutir Powai
30	19.1197920	72.8929010	E.S.I.S.Local Office Powai
31	19.1099780	72.8893490	Chandivli Village Chandivli
32	19.1042320	72.8882630	State Bank Andheri East
33	19.1022990	72.8872600	Saki Naka Andheri East
34	19.1061720	72.8837600	Rationing Shop Andheri East
35	19.1067180	72.8794890	Marol Naka Andheri East
36	19.1078950	72.8756610	Rationing Office Andheri East
37	19.1083630	72.8733940	Marol Pipe Lines Andheri East
38	19.1096770	72.8692940	J.B.Nagar Andheri East
39	19.1109820	72.8663320	Sangam Cinema Andheri East
40	19.1062570	72.8560390	Chakala Andheri East
41	19.1164350	72.8532500	Prakash Studio Andheri East
42	19.1180720	72.8502520	Agarkar Chowk Andheri East
43	19.1225710	72.8551960	Dhobi Ghat Andheri East
44	19.1194810	72.8593110	Pump House Andheri East
45	19.1203540	72.8605590	Aghadi Nagar Andheri East
46	19.1198510	72.8620080	Sher E Punjab Colony Marol
47	19.1201730	72.8652070	Gurudwar Chowk Marol
48	19.1205810	72.8664590	Canossa School Andheri East
49	19.1239580	72.8706630	Holy Spirit Hospital Marol
50	19.1279060	72.8725270	Takshila Jogeshwari East
51	19.1304780	72.8742200	Model Town Jogeshwari East
52	19.1321060	72.8754390	Poonam Nagar Jogeshwari East
53	19.1345120	72.8754050	Ashirvad Medical Stores Jogeshwari East
54	19.1360610	72.8720390	Green Fields Jogeshwari East
55	19.0461900	72.8183700	Father Agnel Ashram Bandra West
56	19.0493880	72.8199620	Municipal Garden Bandra West
57	19.0511270	72.8213470	Sea Face Bandra West
58	19.0539220	72.8223390	Prarthanalaya Bandra West
59	19.0553790	72.8309790	St.Peter Church Bandra West
60	19.0558360	72.8341930	Bandra Police Station/New Talkies Bandra West
61	19.0542070	72.8378830	P.Mohd.Rafi Chowk Bandra West
62	19.0550470	72.8401000	Bandra Bus Station West
63	19.0577740	72.8384820	Bandra Talao Bandra West
64	19.0607700	72.8365770	Bandra Talkies Bandra West
65	19.0622500	72.8303990	Pali Hill Market Khar West
66	19.0658290	72.8302630	L.I.C.Colony Bandra West
67	19.0679500	72.8300640	Dr.Ambedkar Road Bandra West
68	19.0692330	72.8259100	Petit Girls School Khar West
69	19.0705590	72.8275530	Chuim Village Bandra West
70	19.0594060	72.8343430	Moti Mahal Bandra West
71	19.1783350	72.9546500	Mulund Sonapur Mulund West
72	19.1731260	72.9555560	Mulund Station Mulund West
73	19.1749670	72.9511320	Mulund Garden Mulund West
74	19.1735120	72.9438890	Johnson And Johnson Co. Mulund West
75	19.1684310	72.9410180	Ralli Wolf Mulund West
76	19.1517530	72.9385990	Bhandup Police Station Bhandup West
77	19.1440680	72.9350300	Bhandup Station Road West Bhandup West
78	19.1355590	72.9300970	Mangatram Petrolpump Bhandup West
79	19.1275820	72.9261940	Dockyard Colony Kanjurmarg West
80	19.1240180	72.9255740	Huma Talkies Kanjurmarg West
81	19.1107200	72.8800890	Marol Village Marol
82	19.1224470	72.8835990	Goregaon Check Naka No 2 Marol
83	19.1325500	72.8841400	Maroshi Naka /Picnic Point Goregaon East
84	19.1392900	72.8803440	Modern Bakery/Reservior Goregaon East
85	19.1455450	72.8780570	Aarey Hospital/Municipal School Goregaon East
86	19.1515240	72.8766770	Unit No 6/Aareymarket Goregaon East
87	19.1578830	72.8746330	Unit No 2 and 3 Goregaon East
88	19.1613710	72.8710830	Fire Brigade/Agri.Indu Goregaon East
89	19.1623260	72.8619990	Goregaon Check Naka No 1 Goregaon East
90	19.1656970	72.8628510	Virwani Estate/Sarvodaya Nagar Goregaon East
91	19.1678940	72.8635440	General A.K.Vaidya Marg Naka Dindoshi
92	19.1680970	72.8651040	Mhada Colony (Dindoshi) Dindoshi
93	19.1802020	72.8643580	Kurar Village Malad East
94	19.1816470	72.8635050	Pushpa Park Malad East
95	19.1921630	72.8664700	Bandongri Kandivli East
96	19.2048160	72.8725890	B.H.A.D.Colony Kandivli East
97	19.2083080	72.8722970	Dattani Park Kandivli East
98	19.2185200	72.8715520	Magathane Tel.Exchange Kandivli East
99	19.2175840	72.8711440	Magathane Depot Borivli East
100	19.2223590	72.8709000	Devipada Borivli East
101	18.9676130	72.8246320	Mumbai Central Depot Mumbai Central East
102	18.9672320	72.8268170	Alexandra Cinema Nagpada
103	18.9699050	72.8299120	Christ Church School Nagpada
104	18.9718310	72.8326110	A.H.Ansari Chowk Nagpada
105	18.9786560	72.8321760	Byculla Station West Byculla West
106	18.9820470	72.8317920	S Bridge/Mandlik Chowk Byculla West
107	18.9953080	72.8316800	Bawla Masjid Arthur Road
108	18.9966200	72.8314480	Lower Parel Station Lower Parel
109	18.9997420	72.8378760	Lower Parel Workshop Lower Parel
110	19.0084850	72.8337570	Sant Rohidas Chowk Elphistone Road
111	19.0150730	72.8370770	Dadar Police Station Dadar West
112	19.0170060	72.8384060	Shardashram Dadar West
113	19.0185580	72.8405260	Kabutarkhana Dadar West
114	19.0252380	72.8407330	Ram Ganesh Gadkari Chowk Shivaji Park
115	19.0304530	72.8414480	Citylight Cinema Dadar West
116	19.0355960	72.8425820	Shitaladevi Temple Mahim
117	19.0455510	72.8389960	Mahim
118	19.0530820	72.8453930	Kala Nagar Bandra East
119	19.0541010	72.8487670	R.B.I.Bank Bandra East
120	19.0606940	72.8580090	Tata Colony Bandra East
121	19.0648880	72.8609000	Bharat Nagar Bandra Kurlacomplex
122	19.0677890	72.8647580	Diamond Market Bandra Kurla Complex
123	19.0714800	72.8705500	Kurla Telephone Stores Bandra Kurla Complex
124	19.0757890	72.8728870	Kapadia Nagar Kurla West
125	19.0753630	72.8769280	Kurla Depot Kurla West
126	19.0735330	72.8797490	Buddha Nagar Kurla West
127	19.0709120	72.8792190	Mehtab Lane Kurla West
128	19.0872440	72.9191790	Ghatkopar Bus Station Ghatkopar West
129	19.0884880	72.9180030	Laxmi Nagar Ghatkopar West
130	19.0917640	72.9119230	Nityanand Nagar Ghatkopar West
131	19.0911710	72.9100430	Gopal Bhuvan Ghatkopar West
132	19.0883490	72.9080850	Ghatkopar Station West Ghatkopar West
133	19.0902620	72.9082610	Sarvodaya Hospital Ghatkopar West
134	19.0883480	72.9030630	Ghatkopar Pipe Line Ghatkopar West
135	19.0880790	72.9010690	Ghatkopar Police Station Ghatkopar West
136	19.0872480	72.8987570	Chirag Nagar Ghatkopar West
137	19.0867330	72.8972040	Narayan Nagar Ghatkopar West
138	19.0852250	72.8912190	Mukund Co./ P.W.D.Office Vidyavihar West
139	19.0849110	72.8872860	Kamani Vidyavihar West
140	19.0864840	72.8813690	Bial Bazar Kurla West
141	19.0916440	72.8831700	Jarimari Kurla West
142	19.0969870	72.8846680	Safed Pool Andheri East
143	19.1007320	72.8862560	Vijay Printing Press Andheri East
144	19.1123720	72.8612920	Darpan Cinema/ Sai Service Andheri East
145	19.1244280	72.8580590	Shankarwadi Jogeshwari East
146	19.1313290	72.8528320	Ismail Yusuf College Jogeshwari East
147	19.1360270	72.8549620	Jogeshwai Police Station Jogeshwari East
148	19.1441750	72.8585140	Jay Coach Jogeshwari East
149	19.1474880	72.8601170	Mahananda Dairy Goregaon East
150	19.1522680	72.8607090	Vanrai/ Mhada Colony Goregaon East
151	19.2264570	72.8712970	Omkareshwar Mandir Borivli East
152	19.2261110	72.8656910	Borivli Station East Borivli East
153	19.2299910	72.8660440	Daulat Nagar Borivli East
154	19.2462610	72.8714610	Dahisar Station Road East Dahisar East
155	19.2517740	72.8749210	Novelty Silk Mill Dahisar East
156	19.2517400	72.8777140	Ketaki Pada Dahisar East
157	19.0970780	72.8487100	State Bank Vile Parle West
158	19.1124020	72.8322220	Sukhmani Hsg.Soc Vile Parle West
159	19.1099820	72.8399120	Gagandeep/Erla Masjid Juhu
160	19.1120060	72.8420270	New India Qtrs Andheri West
161	19.1133590	72.8439660	Gulshan Bldg Andheri West
162	19.1129670	72.8458230	Amber Oscar Cinema Andheri West
163	19.1166960	72.8487000	Andheri Station Andheri West
164	19.1195690	72.8490110	Andheri Market Andheri West
165	19.1246910	72.8499960	Amboli Naka Andheri West
166	19.1309230	72.8509160	Farookh Vidyalaya Jogeshwari West
167	19.1337220	72.8516900	Jogeshwari Bus Station Jogeshwari West
168	19.1337990	72.8323850	Jogeshwari Telephone Exchange Jogeshwari West
169	19.1444070	72.8470410	Ajit Glass Factory Goregaon West
170	19.1465780	72.8473160	Oshiwara Bridge Oshiwara
171	19.1492390	72.8483890	Ram Mandir Goregaon West
172	19.1486380	72.8472570	Best Nagar Goregaon West
173	19.1500540	72.8404350	Goregaon Depot Oshiwara
174	19.1575640	72.8400530	Shastri Nagar (Linkroad Goregaon W)
175	19.1634400	72.8406380	Bangur Ngr Police Chowky/Post Office Goregaon West
176	19.1657770	72.8408800	Bangur Nagar Goregaon West
177	19.1760860	72.8415580	Chincholi Bunder Road Malad West
178	19.1808180	72.8407170	Kachpada Malad West
179	19.1842170	72.8401340	Evershine Nagar /Grass Pals Hospital Malad West
180	19.1912960	72.8399240	Mith Chowky Malad West
181	19.1914790	72.8290540	Malwani Sonapur Malad West
182	19.1920410	72.8247330	Fire Brigade/Kharodi Colony Malad West
183	19.1864930	72.8266710	Malwani Block No 5/Police Stn. Malwani
184	19.1828650	72.8248130	Malwani Block No 6 Malwani
185	18.9097970	72.8184430	Backbay Depot Backbay
186	18.9109930	72.8189850	Dhobi Ghat Backbay
187	18.9118830	72.8175060	Administrative Office (Gad) Backbay
188	18.9133940	72.8175500	G.D.Somani School Backbay
189	18.9125070	72.8203690	President Hotel Backbay
190	18.9182140	72.8256770	Badhwar Park Backbay
191	18.9206640	72.8267950	State Bank / Lalit Bldg. Backbay
192	18.9259410	72.8274250	Y.B.Chawan Pratishthan Mantralaya
193	18.9332150	72.8360760	Hutatma Chowk (Meyoroad) Fort
194	18.9533310	72.8343880	Jackeria Masjid Bhendi Bazaar
195	18.9625490	72.8333260	Johar Chowk Bhendi Bazaar
196	18.9618920	72.8321530	Dr.M.Iqbal Chowk Bhendi Bazaar
197	18.9683400	72.8326690	A.H.Ansari Chowk/New Nagpada Byculla East
198	18.9729250	72.8364490	Byculla Station E Byculla East
199	18.9801450	72.8346880	Jijamata Udyan Byculla East
200	18.9909510	72.8360060	Sant Jagnade Chowk Lalbaug
201	19.0052010	72.8396240	Madkebuwa Chowk Parel
202	19.0097270	72.8417520	Hindmata Cinema Parel
203	19.0250440	72.8528040	Jagatdev.N.Varma Chowk/Kapole Niwas
204	19.0278020	72.8571130	Maheshwari Udyan Kings Circle
205	19.0343120	72.8586090	Gandhi Market Kings Circle
206	19.0374830	72.8596870	Lokmanya Tilak Hospital Sion East
207	19.0437880	72.8626890	Rani Laxmibai Chowk/Sion Barrier Sion West
208	19.0640640	72.8732310	Lion Park Kurla West
209	19.0701020	72.8750270	Gol Building Kurla West
210	19.0721360	72.8752730	Anjanabai Magar Kurla West
211	19.0786650	72.8791870	Old Agra Road Kurla West
212	19.0828810	72.8829700	Sheetal Cinema Kurla West
213	19.0942450	72.9138230	Shreyas Cinema Ghatkopar West
214	19.0992990	72.9179600	Anacin Company Vikhroli West
215	19.1029180	72.9204730	Vikhroli Depot Vidyavihar West
216	18.9350010	72.8424930	Ballard Pier Fort
217	18.9353090	72.8391410	New Custom House Fort
218	18.9533740	72.8205550	Gaiwadi Girgaon
219	18.9553570	72.8161510	Pt.Paluskar Chowk Opera House
220	18.9720290	72.8228010	Nair Hospital Mumbai Central East
221	18.9799630	72.8276830	Sant Gadge Maharaj Chowk Satrasta
222	18.9844490	72.8308300	Kasturba Gandhi Hospital Satrasta
223	18.9898120	72.8351900	Ganesh Talkies Lalbaug
224	18.9959151	72.8368110	Bharatmata Cinema Parel
225	18.9998290	72.8378250	Parel Workshop Parel
226	19.0119540	72.8421110	Shindewadi Dadar East
227	19.0137250	72.8444590	Chitra Cinema Dadar West
228	19.0188470	72.8471090	Khodadad Circle Dadar East
229	19.0222810	72.8505190	Ruia College Dadar East
230	18.9296060	72.8290670	Ahilyabai Holkar Chowk Churchgate
231	18.9399520	72.8275680	Income Tax Office Marine Lines East
232	18.9434760	72.8264090	Marine Lines Station(Kala Niketan)
233	18.9434760	72.8264090	Marine Lines Station Marine Lines East
234	18.9486120	72.8225330	S.K.Patil Garden Charni Road Stn. East
235	18.9810840	72.8238050	Mahalaxmi Station Mahalaxmi West
236	18.9853520	72.8241070	Famous Studio Worli
237	18.9948360	72.8262590	Phoenix Mill Elphistone Road
238	18.9972920	72.8274510	K.V.Yadav Chowk Lower Parel
239	18.9995790	72.8284790	Toddy Co/Empire Dyeing Elphistone Road
240	19.0026120	72.8299050	Kamla Mill Elphistone Road
241	19.0121910	72.8363860	Kamgar Stadium Elphistone Road
242	19.0157370	72.8395610	Mhatre Pen Company Dadar West
243	19.0193940	72.8414600	Dadar Station W Dadar West
244	19.0229900	72.8447500	Zarapkar Stores Dadar West
245	19.0256610	72.8456220	Girls School Dadar West
246	19.0281630	72.8464430	Ruparel College Dadar West
247	19.0306600	72.8471190	Matunga Station West Mahim West
248	19.0357090	72.8425240	Shitaladevi Temple Marg Mahim West
249	19.0402980	72.8469130	Mahim Station
250	19.0446220	72.8486720	Mahim Phatak Mahim West
251	19.0452930	72.8442460	Machhimar Nagar Mahim West
252	19.0478390	72.8507830	Dharavi T Junction/Tapase Chowk Dharavi
253	18.9523810	72.7984600	Darya Mahal Napean Sea Road
254	18.9541240	72.7995470	Petit Hall Napean Sea Road
255	18.9628550	72.8046540	Mukesh Chowk Napean Sea Road
256	18.9625470	72.8078700	Godrej Chowk Nana Chowk
257	18.9602930	72.8137010	August Kranti Maidan Nana Chowk
258	18.9608870	72.8149430	Grant Road Bridge Grant Road East
259	18.9607480	72.8196030	Novelty Cinema/Dr Bhadkamkar Road Grant Road East
260	18.9609970	72.8233200	Play House Bhendi Bazaar
261	18.9578770	72.8264650	Alankar Talkies Bhendi Bazaar
262	18.9540000	72.8324730	Vijay Vallabh Chowk Bhendi Bazaar
263	18.9579210	72.8286350	Gol Mandir Bhendi Bazaar
264	18.9293840	72.8255330	Mantralaya Mantralaya
265	18.9616570	72.8179060	Dr.Bhadkamkar Road Grant Road East
266	19.1332950	72.9291570	Birla Company Bhandup West
267	19.1331150	72.8977770	Jaibhim Nagar Powai
268	19.1332570	72.8897920	Filter Pada Powai
269	19.1483920	72.8797610	Central Dairy Goregaon East
270	19.1509290	72.8800320	Unit No 7(Aareycolony)
271	19.1846480	72.8529230	Malad Station W(Sainath Road)
272	19.1893180	72.8531190	N.L.Vidyalaya Malad West
273	19.1911110	72.8531160	Milap Talkies Kandivli West
274	19.1939140	72.8541350	Shankar Galli/Hitavardhak Hall Kandivli West
275	19.2011240	72.8559320	Dena Bank Kandivli West
276	19.2022170	72.8502660	Kandivli Village Kandivli West
277	19.2063290	72.8467640	Dahanukar Wadi Kandivli West
278	19.2089610	72.8308420	Hindustan Steel Company Kandivli West
279	19.2168250	72.8349460	Saibaba Mandir Charkop
280	19.2291880	72.8362800	Gorai Bridge Gorai
281	19.2275380	72.8387790	Suvidhya School Gorai
282	19.1175480	72.8481970	Andheri Station (Kumkum) Andheri West
283	19.1170530	72.8312740	Juhu Prabhat Juhu
284	19.1196040	72.8263470	Versova Link Road Juhu
285	19.1248160	72.8223630	Seven Bungalows Garden Andheri West
286	19.1258630	72.8198370	Picnic Cottage Versova
287	19.1285510	72.8172920	Machhalimar Versova
288	18.9681430	72.8156590	Vasantrao Naik Chowk Tardeo
289	18.9714660	72.8151230	Air Condition Market Tardeo
290	18.9766750	72.8113580	Vatsalabai Desai Chowk Hajiali
291	18.9856890	72.8142160	Nehru Planetarium Worli
292	18.9901430	72.8146530	Poonam Chamber/Shivsagar Estate Worli
293	18.9932610	72.8156600	S.T.Office /Lovegrove Worli
294	18.9970710	72.8176750	Acharya Atre Chowk Worli
295	19.0009470	72.8160850	Poddar Hospital Worli
296	19.0054070	72.8184870	Doordarshan Worli
297	19.0122760	72.8243660	Babasaheb Worlikar Chowk Worli
298	19.0154880	72.8285040	Agar Bazar Prabhadevi
299	19.0182830	72.8360340	P.Thakre Chowk Dadar West
300	19.0437870	72.8626880	Rani Laxmibai Chowk Sion East
301	19.0506350	72.8705530	Everard Nagar Chunabhatti
302	19.0545810	72.8805270	Priyadarshani(R.C.F.) Chunabhatti
303	19.0554380	72.8825150	Suman Nagar Chembur East
304	19.0585560	72.8863400	S.G.Barve Marg Naka Chembur East
305	19.0629180	72.8897880	Postal Colony Chembur West
306	19.0682630	72.8993150	Amar Mahal Chembur West
307	19.0739680	72.9016770	Glass Factory Ghatkopar East
308	19.0833420	72.9088960	Jain Mandir Ghatkopar East
309	19.0819870	72.9139900	Shivner Chowk/Ganesh Mandir Ghatkopar East
310	19.0837690	72.9162320	Pant Nagar Ghatkopar East
311	19.0859430	72.9171340	Police Station Pant Nagar Ghatkopar East
312	19.0870380	72.9179490	Marathi Vidyalaya Ghatkopar East
313	19.0860490	72.9200490	Ghatkopar Depot/Casuarina Ghatkopar West
314	19.0920000	72.9244860	Godrej Soap Co. Vikhroli East
315	19.0919820	72.9245600	Godrej Co. Vikhroli East
316	19.1037620	72.9300460	Vikhroli Village Vikhroli East
317	19.1783270	72.9474750	Govardhan Nagar/Gabriel Co. Mulund West
318	19.1760810	72.9424490	Hindustan Chowk Mulund West
319	19.1756280	72.9416320	Mulund Colony Mulund West
320	19.1756050	72.9408780	Powai Chowk Mulund West
321	19.1751860	72.9404370	Jay Shastri Nagar Mulund West
322	19.1580290	72.9387000	Asian Paint Bhandup West
323	19.1542630	72.9388440	Shangrila Company Bhandup West
324	19.0934650	72.8747620	Sahar Police Station Andheri East
325	19.0994740	72.8757630	Sahar Air India Hotel
326	19.1008610	72.8704770	Warehouse Andheri East
327	19.1025200	72.8627070	Sahar P and T Colony No 1 Andheri East
328	19.1052820	72.8607230	Chakala Cigarette Factory Andheri East
329	19.1059510	72.8588110	Parshiwada Andheri East
330	19.1061070	72.8567540	Bahar Cinema Andheri East
331	19.1075480	72.8530720	Garware Chowk/ Koldongri No.2 Andheri East
332	19.1082790	72.8513940	Shivaji Chowk Andheri East
333	19.1111920	72.8498580	Vijay Nagar Society Andheri East
334	19.0796520	72.8478050	Vakola Police Station Santacruz East
335	19.0798970	72.8528720	Vakola Pipe Lines Santacruz East
336	19.0805700	72.8585300	Military Camp Santacruz East
337	19.0756820	72.8625090	Kalina Kurla West
338	19.0728990	72.8657110	Amar Brass And Steel Company Kurla West
339	19.0744550	72.8700390	Metro Playing Cards Kalina
340	19.0958530	72.9153410	Dargah Vikhroli West
341	19.1049080	72.9221160	Godrej Co Vikhroli West
342	19.1085910	72.9246850	Asha And Usha Vikhroli West
343	19.1123390	72.9263930	Vikhroli Station Road Vikhroli West
344	19.1154690	72.9265150	Military Canteen/Cipla Vikhroli West
345	19.1202580	72.9259920	Hindustan Company Vikhroli West
346	19.1309480	72.9278390	Ciba Company Kanjurmarg West
347	19.1681290	72.9419670	Post And Telegraphs Mulund West
348	19.1728280	72.9510540	Kalidas Natyagruh Mulund West
349	18.9332150	72.8360760	Hutatma Chowk (O.C.S.) Fort
350	18.9420420	72.8300330	Azad Maidan Fort
351	18.9567080	72.8098750	Babulnath Road Babulnath
352	18.9716220	72.8097280	Jaslok Hospital Peddar Road
353	19.0015320	72.8202160	Gandhi Maidan Worli
354	19.0053510	72.8234690	Com.P.K.Kurne Chowk Worli
355	19.0245860	72.8366340	Ranade Road Dadar West
356	19.0535300	72.8310470	Mahim Koliwada Mahim
357	19.0519120	72.8267250	Hill Road Garden Bandra West
358	19.0489840	72.8279490	Unit Trust Of India Bandra West
359	19.2029360	72.8581370	Kandivli Station West Kandivli West
360	19.2024630	72.8515670	Umbrella Company Kandivli West
361	19.2024360	72.8471270	Vaishali Bhavan Kandivli West
362	19.2077390	72.8373790	Yadav Nagar Kandivli West
363	19.2070860	72.8495250	Datta Mandir(Dahanukar Wadi) Kandivli West
364	19.0498150	72.8599630	Dharavi Depot Dharavi
365	19.0497200	72.8562650	Dharavi Pila Bungalow Dharavi
366	19.0529570	72.8454950	Kala Nagar(Mhada Office) Bandra East
367	19.0555770	72.8466340	M.I.G.Colony(Kala Nagar) Bandra East
368	19.0575910	72.8468810	Gandhi Nagar Bandra East
369	19.0603530	72.8484020	Kherwadi/ Chetna College Bandra East
370	19.1973260	72.8601640	Kandivli Bus Station
371	19.1998990	72.8596780	E.S.I.S.Hospital Kandivli East
372	19.1997380	72.8645760	Grovel Company Kandivli East
373	19.2000350	72.8767130	Hanuman Nagar Kandivli East
374	19.1987890	72.8804950	Tractor Gate No 3/Vasahospital Kandivli East
375	19.1971480	72.8832580	Gautam Nagar Kandivli East
376	18.9657170	72.8168720	Grant Road Station West
377	18.9660180	72.8179090	Sonawala Building Grant Road West
378	19.1489340	72.8404930	Oshiwara Depot Oshiwara
379	19.1451420	72.8407290	Anand Nagar Oshiwara
380	19.1412740	72.8412830	Behram Baug Jogeshwari West
381	19.1413110	72.8388060	Adarsh Nagar Oshiwara
382	19.1370710	72.8373000	Lokhandwala Complex Junction Oshiwara
383	19.1346250	72.8363000	Monginis Cake Company Andheri West
384	19.1315880	72.8350230	Laxmi Industrial Estate Andheri West
385	19.1269510	72.8346600	Jeevan Nagar Oshiwara
386	19.1249380	72.8335030	Indian Oil Nagar Andheri West
387	19.1246840	72.8359850	Dhake Colony Andheri West
388	19.1238600	72.8401300	Andheri Sports Complex Andheri West
389	19.1132740	72.8485870	Gokhale Bridge Andheri West
390	19.1125200	72.8550240	Jumbo Darshan Andheri East
391	19.0788810	72.9129960	Ramabai Nagar Ghatkopar East
392	19.0767030	72.9102220	Nalanda Society Ghatkopar East
393	19.0738570	72.9069710	R T O Office Ghatkopar East
394	19.0498260	72.8270100	John Baptist Road Bandra West
395	19.0512010	72.8262970	Mac Queens Hotel Bandra West
396	19.0621200	72.8361690	National College Bandra West
397	19.0625930	72.8350580	C.H.Vidyalaya Bandra West
398	19.0705790	72.8274210	Chuim Village/Sheri Village Khar West
399	19.0710730	72.8227950	Amrut Housing Society Khar West
400	19.0726470	72.8238220	Khar Danda Khar West
401	19.0734930	72.8255160	Dandpada Khar West
402	19.0797010	72.8512550	Datta Mandir(Vakola) Santacruz East
403	19.1048580	72.8334600	Mangal Building Juhu
404	19.1051370	72.8399470	Dr.Cooper Hospital Juhu
405	19.1004490	72.8395010	Mithibai College Juhu
406	19.1002000	72.8413420	Vile Parle Vile Parle West
407	19.1047270	72.8425010	Golden Tobacco Vile Parle West
408	19.1069880	72.8432080	Erla Vile Parle West
409	19.1095830	72.8442400	Erla Bridge Vile Parle West
410	19.1129670	72.8458230	Amber Oscar Cinema(2) Andheri West
411	19.1545260	72.8426340	Motilal Nagar Block No 8(H.S.Rupwate Goregaon W)
412	19.1551830	72.8449680	Motilal Nagar Post Office Goregaon West
413	19.1554240	72.8484300	Siddharth Nagar(Sabde Marg Goregaon W)
414	19.1568660	72.8495470	Jawahar Nagar Goregaon West
415	19.1571140	72.8523790	Jain Mandir Goregaon West
416	19.2573500	72.8814310	Golden Chemicals Dahisar East
417	19.2554600	72.8811180	Dahisar Check Naka East Dahisar East
418	18.9767270	72.8302700	Sundar Galli Byculla West
419	18.9790690	72.8284720	Garlic Co. Byculla West
420	18.9944530	72.8190800	Jijamata Nagar Worli
421	19.0909090	72.8732180	Chatrapati Shivaji Int.Airport(Nipt) Andheri East
422	19.1148300	72.8657710	Nelco Andheri East
423	19.1669730	72.9400840	Hoechst Co./Fedco Farmacy Mulund West
424	19.1302560	72.8834180	Seepz Village Andheri East
425	19.1299530	72.8791640	Mahakali Caves Marol
426	19.1321040	72.8796950	Kamlistan Studio Marol
427	19.1332190	72.8776370	Durga Nagar Jogeshwari East
428	19.1371250	72.8675840	Majas Depot/Shyam Nagar Jogeshwari East
429	19.1392120	72.8667390	Shyam Nagar Jogeshwari East
430	19.1395900	72.8641750	Datta Tekdi/Shiv Tekadi Jogeshwari East
431	19.1410800	72.8612000	Pratap Nagar(Majas)
432	19.1169010	72.9264810	Paper Mill Vikhroli West
433	19.1139310	72.9102470	Hiranandani Garden Powai
434	19.1227200	72.8665550	Domnic School Jogeshwari East
435	19.1254690	72.8688240	Tolani College
436	18.9652460	72.8135930	Bhatia Hospital Worli
437	19.0560060	72.8884370	Umarshi Bappa Chowk Chembur East
438	19.0562890	72.8921350	Chembur Naka/Swami Vivekanand Chowk. Chembur West
439	19.0595150	72.8940920	Shanti Baug Chembur East
440	19.0628300	72.8964820	Krishna Baug/ Fine Arts Auditorium Chembur East
441	19.0624340	72.8990070	Dr.Ambedkar Garden Chembur East
442	19.0599180	72.8993290	10th Road Chembur West
443	19.0519470	72.9035790	Maitri Park Deonar
444	19.0504480	72.9054970	R.K.Studio Deonar
445	19.0496950	72.9094760	Deonar Depot Deonar
446	19.0495100	72.9131150	Punjab Wadi Deonar
447	19.0487710	72.9161790	Telecom Factory Deonar
448	19.1214290	72.8417460	Bhavans College Andheri West
449	19.1232740	72.8332490	D.N.Nagar/Barfiwala Vidyalaya Andheri West
450	19.1207960	72.8327880	Esic Nagar Andheri West
451	19.0141760	72.8342320	Jakhadevi/ Dadar Police Station Prabhadevi
452	19.0665900	72.8465810	Cardinal Gracious School Khar East
453	19.0707710	72.8469940	Maratha Colony Santacruz East
454	19.0721060	72.8578460	Vidya Nagari Kalina
455	19.0790880	72.8767600	Shanti Nagar Kurla West
456	19.0798650	72.8731960	New Air India Quarters Kurla West
457	19.0783880	72.8606520	Military Outpost Kalina
458	19.0799160	72.8542950	Vakola Masjid Santacruz East
459	19.0850390	72.8448580	New Agripada Santacruz East
460	19.0871830	72.8448930	Milan Sub Way Vile Parle East
461	19.0906450	72.8475790	Vile Parle Sub Way East
462	19.0904110	72.8577290	Terminal Building Vile Parle East
463	19.0960890	72.8534270	Dayaldas Rd/Gujarat Society Vile Parle East
464	19.0971480	72.8473850	Vile Parle Station East
465	19.0942400	72.8459860	Vile Parle Railway Crossing
466	19.0917110	72.8461630	Azad Nagar Vile Parle East
467	19.0865470	72.8396400	Milan Talkies Santacruz West
468	19.0842910	72.8391850	Khira Nagar/Bombay Garage Santacruz West
469	19.0820270	72.8390850	Santacruz Stn.Road/Kashibai Hosp Santacruz West
470	19.0826620	72.8366520	Santacruz Police Station Santacruz West
471	19.0722470	72.8349160	Arya Samaj Mandir Santacruz West
472	19.0725250	72.8344700	Ramkrishna Mission Khar West
473	19.0640370	72.8352970	Khar Telephone Exchange Khar West
474	19.0586940	72.9195810	Municipal Colony Deonar
475	19.0597580	72.9141640	Govandi Stn.Road West Govandi East
476	19.0645570	72.9115000	Gautam Nagar Govandi West
477	19.0585520	72.9094280	Samrat Ashok Nagar Govandi East
478	19.0518250	72.9081540	Dukes Company Deonar
479	19.0538690	72.9009420	Reserve Bank Colony Chembur East
480	19.0553880	72.8956060	Sanduwadi Chembur East
481	19.0560320	72.8935560	Kumbhar Wada Chembur East
482	19.0452930	72.8442460	Machhimar Ngr/Raheja Hospital Mahim
483	19.0768380	72.8780980	Kalpana Talkies Kurla West
484	19.0887320	72.9010940	Maneklal Mun.School Ghatkopar West
485	19.0903820	72.9003000	Jagruti Nagar/Buddha Nagar Ghatkopar West
486	19.0948910	72.9041940	Barve Nagar/Municipal School No 3 Ghatkopar West
487	19.0933250	72.9041330	Babu Genu Market Ghatkopar West
488	19.0911920	72.9041790	Ram Bhavan Ghatkopar West
489	19.1611240	72.8546870	Goregaon Station Goregaon East
490	19.1623730	72.8567480	Peru Baug Goregaon East
491	19.1621680	72.8600990	St.Pius Church Goregaon East
492	19.1690490	72.8709610	Gokuldham Dindoshi
493	19.1694920	72.8748840	Gokuldham Market Dindoshi
494	19.1696360	72.8820950	Wagheshwari Mandir Dindoshi
495	19.1667330	72.8821460	Hanuman Nagar Dindoshi
496	19.1845660	72.8530030	Malad Station W(Kasturba Road)
497	19.1830870	72.8523190	Malad Station Road West
498	19.1879500	72.8528080	Marve Road Naka/ Swami Shivanand Chowk Malad West
499	19.1879760	72.8513770	Choksi Hospital Malad West
500	19.1871140	72.8461710	Adarsh Dairy Malad West
501	19.1898660	72.8445160	Orlem Well Malad West
502	19.1865720	72.8398270	Orlem Church Malad West
503	19.1923540	72.8217770	Kharodi Village Malad West
504	19.1920280	72.8186980	Malwani Akashwani Malwani
505	19.1919780	72.8160550	Malwani Church Malwani
506	19.1921820	72.8144890	Marve Naka/Marve Village Madh
507	19.0644040	72.8381010	Old Khar Khar West
508	19.0694440	72.8405680	Khar Station Road Khar West
509	19.0721290	72.8386000	Khar Police Stn/Sacred Heart School Khar West
510	19.0731700	72.8386540	St.Teresa Convent School Khar West
511	19.0795210	72.8387360	Santacruz Station Road Santacruz West
512	19.0882950	72.8397000	Santacruz Depot Santacruz West
513	19.0918140	72.8407930	Nanavati Hospital Vile Parle West
514	19.1179380	72.8323400	New D.N.Nagar/ M.I.G.Colony (Juhu)
515	19.1412890	72.8402220	Scout Camp Oshiwara
516	19.1532590	72.8468580	Vivek Vidhyalaya Goregaon West
517	19.2177370	72.8688040	Special Steel/Rajendra Nagar Borivli East
518	19.2177130	72.8629570	Rajendra Nagar Borivli East
519	19.2198750	72.8654970	Dattapada Phatak Borivli East
520	19.2303910	72.8778370	Dhobi Ghat Borivli East
521	19.2322940	72.8791150	Abhinav Nagar Borivli East
522	18.9879360	72.8414170	Shrawan Yeshwante Chowk Kala Chowky
523	18.9881070	72.8377000	Hakoba Kala Chowky
524	18.9879230	72.8361740	Shantaram Pujare Chowk Kala Chowky
525	18.9959150	72.8368100	Bharatmata Cinema Curry Road
526	19.0357090	72.8425240	Shitaladevi Temple Marg Mahim
527	19.0989350	72.8562910	Sambhaji Nagar Vile Parle East
528	19.1015990	72.8564080	Hanuman Road Vile Parle East
529	19.2332540	72.8619380	Ram Mandir Borivli West
530	19.2348870	72.8616710	Bhagwati Hospital Borivli West
531	19.2419370	72.8624280	Shivaji Nagar Dahisar West
532	19.2436070	72.8626640	Mary Immaculate School Dahisar West
533	19.2464150	72.8631050	Nava Gaon Dahisar West
534	19.2472870	72.8636640	Kandar Pada Dahisar West
535	19.1453060	72.8380000	Goregaon Police Stationn Goregaon West
536	19.1615820	72.8497490	Filmistan Goregaon West
537	19.1662370	72.8500110	Patkar College Goregaon West
538	19.1681460	72.8500830	Madina Manzil Goregaon West
539	19.1730400	72.8515000	Chincholi Phatak/Sarvodaya B.School Malad West
540	19.1787300	72.8521360	New Era Talkies Malad West
541	19.2031700	72.8571840	Kandivli Station Road West Kandivli West
542	19.2163110	72.8576000	Poisar Depot Kandivli West
543	19.2198280	72.8613590	Ram Baug/Shastri Nagar Kandivli West
544	19.2179190	72.8599710	Kora Kendra Kandivli West
545	19.2221390	72.8624020	Borivli Jail West Borivli West
546	19.2239520	72.8630080	Dharamshi Hall Borivli West
547	19.2257450	72.8635330	Borivli Station West
548	19.2317520	72.8621210	Pai Nagar Borivli West
549	18.9497010	72.8291730	Kalbadevi Bhuleshwar
550	18.9517460	72.8298990	Bhuleshwar Bhuleshwar
551	19.0504340	72.8659770	Central Labour Institute Sion East
552	19.0538870	72.8675540	Vrindavan Chowk Sion East
553	19.0531240	72.8679580	Chunabhatti Chunabhatti
554	19.0541870	72.8714680	Chunabhatti Garden Chunabhatti
555	19.0546340	72.8754360	Tata Colony Chunabhatti
556	19.0553410	72.8790010	Marathi Vidnyan Parishad Chunabhatti
557	19.0561920	72.8811070	Shivshrusti Kurla East
558	19.0574010	72.8830780	Kurla S.T.Depot Kurla East
559	19.0618120	72.8837080	Kamgar Nagar Kurla East
560	19.0633040	72.8813550	Nehru Nagar Kurla East
561	18.9675810	72.8041840	Parsi General Hospital Napean Sea Road
562	18.9702620	72.8055520	Breach Candy Hospital Napean Sea Road
563	18.9728860	72.8067500	Mafatlal Park Napean Sea Road
564	18.9746260	72.8089220	Mahalaxmi Temple Napean Sea Road
565	19.0604010	72.8458630	Kherwadi Junction Khar East
566	19.1827380	72.8552950	Malad Station E(Poddar Park) Malad East
567	19.1834880	72.8554280	Dr.Suchak Chowk Malad East
568	19.1833280	72.8592990	S.K.Patil Arogyadham(Malad E) Malad East
569	19.1831450	72.8690770	Hira Park Malad East
570	19.1808270	72.8843000	Jijamata Vidyalaya Malad East
571	19.0663050	72.8799960	Kurla Station
572	19.0599390	72.8851100	Thakkar Bappa Colony Kurla East
573	19.0561120	72.8883850	Umarshi Bappa Chowk/Swastik Chamber Chembur East
574	19.0544990	72.8900180	Bhakti Bhavan Chembur West
575	19.0532410	72.8917640	Basant Park/Sukhi Nivas Chembur East
576	19.0506390	72.8915970	Navjeevan Society Chembur East
577	19.0477730	72.8912460	Jhamamal Chowk Chembur East
578	19.0486880	72.8980750	R.C.F.Colony/Golf Club Chembur East
579	19.0490970	72.9032310	Basant Talkies Chembur West
580	19.0492960	72.9058220	Panjarapol Deonar
581	18.9441600	72.7968770	Band Stand Walkeshwar
582	18.9785130	72.8200850	Race Course/Zenith Company Satrasta
583	18.9297080	72.8349260	Old Custom House Fort
584	19.0589990	72.8254660	D Monte Garden Bandra West
585	19.0593850	72.8244650	Peri Cross Road Bandra West
586	19.0614870	72.8225200	Police Superintendent. Office Bandra West
587	19.0690730	72.8227060	Sherli Gaothan Khar West
588	19.0745950	72.8296290	18th Road Khar West
589	19.0743520	72.8317940	16th and 17th Road Khar West
590	19.0845140	72.8354310	Balkanji Bari School Santacruz West
591	19.0838110	72.8313430	Lido Cinema Santacruz West
592	19.0837660	72.8288940	Juhu Koliwada Juhu
593	19.0890190	72.8304180	Royal Hotel Santacruz West
594	19.0945950	72.8289730	Juhu Beach Juhu
595	19.0982690	72.8298260	Theosophical Society Santacruz West
596	19.1070290	72.8297770	Juhu Bus Station Juhu
597	19.1106500	72.8317060	Bharatiya Arogya Nidhi Hospital Juhu
598	19.1237290	72.8285800	Versova View J.V.P.D.
599	19.1261020	72.8278190	Four Bungalows Market Andheri West
600	19.1259590	72.8285350	Four Bungalows Andheri West
601	19.1267610	72.8227480	Seven Bungalows Bus Stn. Andheri West
602	18.9684430	72.8450670	Dockyard Road Station Dockyard Road
603	18.9684340	72.8451000	Central Rly Goods Dockyard Road
604	18.9567780	72.8425860	Wadi Bunder
605	18.9549750	72.8421170	Princess Dock
606	18.9526930	72.8416170	Loha Bhavan Sandhurst Road East
607	18.9496080	72.8408410	Carnac Bunder Sandhurst Road East
608	18.9493810	72.8371340	Musafir Khana Mahatma Phule Market
609	18.9872810	72.8417560	Azad Flour Mill Kala Chowky
610	18.9926960	72.8422360	Saibaba Road Parel
611	19.0001450	72.8466310	Parel Village/St.Gora Kumbhar Chk. Sewree
612	19.0091340	72.8474840	Naigaon Police Colony Parel
613	19.0115370	72.8484400	Spring Mill Dadar East
614	19.0149010	72.8426010	Swami Narayan Chowk Dadar East
615	19.0214300	72.8462600	Hindu Colony Dadar East
616	19.0229490	72.8481490	Raja Shivaji High School Dadar East
617	19.0213300	72.8531570	Five Gardens Dadar West
618	19.0241710	72.8568980	Don Bosco Kings Circle
619	19.0543060	72.8667650	Maharashtra Weight Bridge Sion East
620	19.0575910	72.8688520	Kurla Level Crossing Kurla West
621	19.1005710	72.8889050	Lokmanya Tilak Nagar Asalpha Village
622	19.0981560	72.8921630	Mohili Village Asalpha Village
623	19.0967180	72.8966910	Asalpha Village Ghatkopar West
624	19.0960180	72.8982340	Jambhulpada Ghatkopar West
625	19.1758540	72.8639490	Noorani Masjid (Pathanwadi) Malad East
626	19.2492480	72.8754910	Garten Pada Dahisar East
627	19.2442300	72.8756410	Gawade Nagar Borivli East
628	19.2441030	72.8778150	Fish Market Borivli East
629	18.9991270	72.8502710	Sewree Naka Sewree
630	19.0031700	72.8421340	Haffkine Institute Parel
631	19.0502070	72.8359920	Telephone Exchange Bandra West
632	19.0507950	72.8357780	Akshaya Bandra West
633	19.0520450	72.8328710	Parijat Bandra West
634	19.0505520	72.8287730	Mount Carmel Church Bandra West
635	19.1591540	72.8526340	Goregaon Bus Station Goregaon West
636	19.1588370	72.8478810	Ram Baug Goregaon West
637	19.1586050	72.8439890	Ganpati Stores Goregaon West
638	19.1587000	72.8373760	Hari Niketan Society Goregaon West
639	19.1600830	72.8365820	Ayyappa Mandir Goregaon West
640	19.1296790	72.8308070	R.T.O./New Vikas Housing Society Andheri West
641	19.1337460	72.8324210	Telephone Exchange Oshiwara
642	19.1362180	72.8334010	Shree Swami Samarth Nagar
643	19.1031580	72.8540280	Hanuman Society Bldg No.5 Vile Parle East
644	19.1048860	72.8535840	Subhash Marg Parle East
645	19.1400450	72.8335580	Oriental Bank/S.Samarth Nagar Market Andheri West
646	19.1417470	72.8337010	Shree Swami Samarth Nagar Extension
647	19.1434520	72.8335830	Bhutta Tower Oshiwara
648	19.1993860	72.8294520	Ekta Nagar Malad West
649	19.2031990	72.8308270	Kandivli Indu Estate/Ganesh Nagar Kandivli West
650	19.2135800	72.8325110	Bank Of Maharasthra Charkop
651	18.9743940	72.8400050	Anjeerwadi Mazgaon
652	18.9765290	72.8395870	Mustafa Bazar/Savlya Tandel Chowk Mazgaon
653	18.9856270	72.8419910	Ghodpdeo Kala Chowky
654	18.9898850	72.8441920	Kalachowky Police Station Kala Chowky
655	18.9898830	72.8463290	Tank Bunder Sewree
656	18.9918400	72.8480350	Jackeria Bunder Sewree
657	18.9960720	72.8480350	Jubilee Mills Sewree
658	19.0015250	72.8531690	Shivaji Nagar Sewree
659	19.0058970	72.8524920	Dnyaneshwar Nagar Sewree
660	19.0095970	72.8536010	Kidwai Nagar Wadala West
661	19.0132690	72.8505110	Sahakar Nagar Wadala West
662	19.0147720	72.8460790	Sharda Cinema Dadar East
663	19.0454360	72.8391280	Mahim Bus Station Mahim
664	19.2094860	72.8581710	Kandivli Telephone Exchange Kandivli West
665	19.2132400	72.8479970	Mahavir Nagar Extension Kandivli West
666	19.2013060	72.8302760	Ganesh Chowk Kandivli West
667	19.2146640	72.8294760	Indian Education School Charkop
668	19.2132280	72.8285870	Hanuman Mandir Charkop
669	19.2278640	72.8409480	Gorai Depot Gorai
670	19.2271500	72.8440640	Gorai Radio Centre Gorai
671	19.2263740	72.8471460	M.H.B.Colony Gorai
672	19.2257020	72.8498770	Don Bosco Borivli West
673	19.2251220	72.8524680	Vazira Naka Borivli West
674	19.2250720	72.8546020	Babhai Naka Borivli West
675	19.2261760	72.8609150	Maharashtra Nagar Borivli West
676	19.2248190	72.8616290	Diamond Cinema Borivli West
677	19.1123570	72.9369050	Kannamwar Nagar Hospital Vikhroli East
678	19.1130200	72.9378760	Kannamwar Nagar Building No 150 Vikhroli East
679	19.1135600	72.9389170	Kannamwar Nagar Building 175 Vikhroli East
680	19.1160160	72.9367560	Kannamwar Nagar No 2 Vikhroli East
681	18.9978000	72.8409870	Mahatma Gandhi Hospital Parel
682	19.0015430	72.8411960	K.E.M.Hospital Parel
683	19.0042220	72.8425620	Tata Hospital Parel
684	19.0135390	72.8548950	Madhav Nagar Wadala West
685	19.0145380	72.8554150	Azad Nagar Wadala West
686	19.0278370	72.8597740	Wadala Gate No 4 Wadala West
687	19.0301150	72.8587000	Amulakh High School Wadala West
688	19.0322480	72.8571860	Matunga Police Station Kings Circle
689	19.0394130	72.8640780	Sardar Nagar No 2 Antop Hill
690	19.0336150	72.8664320	Antop Hill Church Wadala East
691	19.0321830	72.8629420	C.G.S.Dispensary Antop Hill
692	19.0313000	72.8646520	Kane Nagar Antop Hill
693	19.0280580	72.8657480	Antop Hill Wadala East
694	19.0229070	72.8630200	Indian Oil Depot Antop Hill
695	19.0199380	72.8635910	Wadala Fly Over Bridge Wadala East
696	19.0163970	72.8629840	Nadkarni Park Police Station Wadala East
697	19.0862680	72.8291390	Juhu Tara Juhu
698	19.1132150	72.8311040	Utpal Sanghavi School Juhu
699	19.0998110	72.9106690	Kaju Pada/Ganesh Maidan Ghatkopar West
700	19.1151440	72.8679700	Marol Depot Andheri East
701	19.2195560	72.8676180	Datta Pada Borivli East
702	19.1553110	72.9341170	Milind Nagar Bhandup West
703	19.1439300	72.9371470	Hanuman Mandir Bhandup West
704	19.1507000	72.9374460	Khot Road Bhandup West
705	19.1693310	72.8501320	Sunder Nagar Malad West
706	19.1753120	72.8444090	Madhur Colony Goregaon West
707	19.2046970	72.8763830	Samata Nagar Bus Stn. Kandivli East
708	19.2056160	72.8760870	Samata Nagar Building No 3and5 Kandivli East
709	19.2545080	72.8720910	Anand Nagar No.1 Dahisar East
710	19.2545080	72.8720910	Anand Nagar Dahisar East
711	19.2549820	72.8702710	Sudhindra Nagar Dahisar East
712	19.2536110	72.8693410	Anand Hospital Dahisar East
713	19.1092230	72.8676140	Charatsingh Colony Andheri East
714	19.1092200	72.8649470	R.B.I.Colony Andheri East
715	19.1122490	72.8632130	Chakala (Satamwadi) Andheri East
716	19.1699930	72.9656850	Mhada Bus Station Mulund East
717	19.1680830	72.9648980	Mhada Office (Mulund E)
718	19.1698160	72.9626820	Arunodaya Nagar Mulund East
719	19.1704440	72.9627540	I.E.S.Vidyalaya Mulund East
720	19.1710070	72.9633390	Holy Angle Vidyalaya Mulund East
721	19.1713440	72.9625100	Gawan Pada Mulund East
722	19.1719420	72.9602350	Municipal Hospital Mulund East
723	19.1709730	72.9573760	Mulund Station Mulund East
724	19.1696430	72.9566740	Ganesh Talkies Mulund East
725	19.1686500	72.9560460	Vrudhi Siddhi Soc.(Mulund E)
726	19.1678500	72.9551970	Chitragan Society Mulund East
727	19.0881080	72.8945230	Employment Exchange Ghatkopar West
728	19.0801260	72.9035510	Rajawadi Hospital Ghatkopar East
729	19.0784490	72.9029910	Income Tax Office Ghatkopar East
730	19.0696810	72.9013750	Chheda Nagar Chembur West
731	19.2391960	72.8723910	Ganesh Nagar Borivli East
732	19.2386960	72.8743440	Anurag Society Borivli East
733	19.2377430	72.8771350	Ashok Van Borivli East
734	19.2401400	72.8784000	Dongre Wadi Borivli East
735	19.0188470	72.8471090	Khodadad Circle (Dadarworkshop) Dadar East
736	19.0150190	72.8534200	Wadala Depot Wadala West
737	18.9965170	72.8123410	Worli Dairy Worli
738	19.0040430	72.8137400	Worli Sea Face (S) Worli
739	19.0008080	72.8148560	Flora Hotel Worli
740	18.9951070	72.8230530	Gandhi Nagar Worli
741	18.9971680	72.8226910	Shree Ram Mill Worli
742	18.9971620	72.8247910	Gopikrishna Piramal Hospital Lower Parel
743	18.9973820	72.8293700	Dawn Mill Lower Parel
744	19.0057600	72.8474230	Best Colony Bhoiwada
745	19.0059020	72.8513170	T.B.Hospital Sewree
746	19.0188470	72.8471090	Khodadad Circle (Pritamhotel) Dadar East
747	19.0243110	72.8491720	Poddar College Dadar East
748	19.0272450	72.8500900	Matunga Station East
749	19.0297880	72.8543400	Post Office Matunga East
750	19.0294450	72.8527190	Pioneer High School Matunga East
751	19.0321210	72.8538840	Matunga Rly Phatak East Matunga East
752	19.0397340	72.8501690	Estrella Battery/Shahu Nagar Dharavi
753	19.0446220	72.8486720	Mahim Phatak Dharavi
754	19.0467650	72.8487630	Dharavi Fly Over Bridge Dharavi
755	19.0437870	72.8626880	Rani Laxmibai Chowk/Roopam Cinema Sion East
756	19.1248090	72.8473830	Filmalaya Andheri West
757	19.1248030	72.8432030	Amboli Village Andheri West
758	19.1253450	72.8404890	Pallavi Building Andheri West
759	19.1285900	72.8403560	Azad Nagar Andheri West
760	19.1292800	72.8373600	Ju Chandra Housing Society Andheri West
761	19.1298380	72.8349340	Bele Villa Hospital Andheri West
762	19.1375790	72.8350230	Lokhandwala Complex Oshiwara
763	19.1974230	72.8804260	Alika Nagar Junction Kandivli East
764	18.9257200	72.8257960	Vidhan Bhawan Mantralaya
765	18.9250450	72.8200790	N.C.P.A. Mantralaya
766	18.9561330	72.8285350	Gulal Wadi/Yadnik Chowk C.P.Tank
767	18.9614220	72.8287490	Two Tanks Bhendi Bazaar
768	18.9666640	72.8288790	Hasrat Mohani Chowk Nagpada
769	18.9759200	72.8241170	Agripada Nagpada
770	19.0097860	72.8213120	Passport Office Worli
771	19.0127870	72.8313090	Khedgalli Prabhadevi
772	19.0248800	72.8969370	Polychem Company Chembur East
773	19.0274400	72.8958400	Bhikaji Damaji Patil Marg Chembur West
774	19.0319960	72.8959150	Calico Mills Chembur West
775	19.0352070	72.8943150	Shankar Mandir Chembur East
776	19.0375150	72.8935150	Vasi Naka(Chembur) Chembur East
777	19.0425240	72.8922700	Aziz Baug Chembur West
778	19.0466110	72.8912860	Marawali Church Chembur East
779	19.0625590	72.8989620	Dr.Ambedkar Garden/Chembur Station West
780	19.0634260	72.9024360	Subhash Nagar Chembur East
781	19.0623960	72.9044050	Acharya Marathe College Chembur West
782	19.1848320	72.9476520	Vaishali Nagar Mulund West
783	19.1840790	72.9487090	Keva Fragranes/Model Town Mulund West
784	19.1669010	72.9503260	Urban Co.Op.Bank Mulund West
785	19.1672250	72.9521860	Ambika Nagar Mulund West
786	19.1662140	72.9512820	Nahur Village/Mehul Cinema Mulund West
787	19.1627170	72.9478500	Sarvodaya Parshwanath Nagar Mulund West
788	19.1466720	72.9305340	Sarvodaya Nagar(Bhandup W)
789	19.1431370	72.9282190	Kokan Nagar Bhandup West
790	19.1376370	72.9268940	Maharashtra Nagar Bhandup West
791	19.2257450	72.8635330	Borivli Station West Borivli West
792	19.2294620	72.8343080	Gorai Creek Gorai
793	19.1403850	72.8463510	Sindhi Colony Jogeshwari West
794	19.1405630	72.8447520	Mehrabad Baug Jogeshwari West
795	19.1136740	72.8820380	Borosil Glass Factory Marol
796	19.1142000	72.8856820	Modern Paper Mills Marol
797	19.1256400	72.8342980	Jivan Nagar Andheri West
798	19.1456590	72.9327530	Miniland Society Bhandup West
799	19.0486200	72.8944400	Gandhi Market Chembur West
800	19.0491740	72.9007810	Wadavli Village/Borla Society Chembur East
801	19.0696010	72.9013960	Amar Mahal/Chheda Nagar Chembur West
802	19.1164470	72.9391830	Kannamwar Nagar 1 Vikhroli East
803	19.1254720	72.9402360	Kanjur Marg Village Kanjurmarg East
804	19.1482470	72.9435410	Bhandup Village Bhandup East
805	19.1487490	72.9531570	Bhandup Pumping Centre Mulund East
806	19.1635600	72.9571530	Mithaghar Mulund East
807	18.9548240	72.8181880	Prarthana Samaj/Harkishandas Hospital Tardeo
808	18.9595480	72.8202520	Railway Hotel /Charni Road Jun. Tardeo
809	18.9638180	72.8209950	Tardeo Bus Station/Rushi Mehta Chk. Tardeo
810	19.1809780	72.8506850	Anand Marg Malad West
811	19.1800390	72.8506190	Lokmanya Tilak Chowk Malad West
812	19.1797980	72.8477430	Sardar Chowk Malad W
813	19.1803040	72.8461670	Industrial Estate Malad West
814	19.1800080	72.8454990	Krishna Bldg Malad West
815	19.1791390	72.8456110	Navy Nagar Malad
816	19.1037040	72.8436720	Laxmi Talkies Vile Parle East
817	19.1056040	72.8497340	Bhutta College Vile Parle East
818	19.1083290	72.8513780	Shivaji Chowk Vile Parle East
819	19.1014620	72.8330330	Sahakari Bhandar(Juhu Hotel)
820	19.0420270	72.9433970	Dhobi Ghat Trombay
821	19.0443250	72.9415010	Cheeta Camp(Trombay) Trombay
822	19.0471340	72.9339350	Mandala Mankhurd (N)
823	19.0478820	72.9238480	Anushakti Nagar Deonar
824	19.0783770	72.9081390	Odeon Cinema Ghatkopar East
825	19.0121410	72.8192820	Worli Depot Worli
826	19.0104300	72.8196660	Municipal Colony Worli
827	19.1403290	72.9325030	Janata Market Bhandup West
828	19.1662880	72.9511910	Nahur Village Mulund West
829	19.1657230	72.9460960	St.Pius School Mulund West
830	19.1672710	72.9458580	Saidham Mulund West
831	19.1807410	72.9493940	Santoshi Mata Mandir Mulund West
832	18.9654760	72.8246120	Shuklaji Street Tardeo
833	19.0755660	72.8625920	Air India Quarters Kalina
834	19.0682630	72.8993150	Amar Mahal(2) Chembur West
835	19.1241210	72.8522950	Sat Bhakti Mandir
836	19.1276060	72.8526620	Gandhir Vidyalaya Jogeshwari East
837	19.1353460	72.8530610	Jogeshwari Station E/ Barr.Nath Pai Chowk
838	19.1356220	72.8549430	Jogeshwari Police Station Jogeshwari East
839	19.1840790	72.9487090	Swapna Nagari(Model Town) Mulund West
840	19.0121110	72.9021460	Tata Power House Chembur East
841	19.0143830	72.8974620	Lube India Company Chembur East
842	19.0173380	72.8955090	Refineries Chembur East
843	19.0221750	72.8956960	Bharat Petroleum Chembur East
844	18.9547360	72.8086570	Babulnath Babulnath
845	18.9656870	72.8468900	Mazgaon Dock Mahul
846	19.0387740	72.8862720	Jawahar School Mahul
847	19.0421100	72.8880370	Jijamata Nagar Mahul
848	19.0645840	72.8975800	Chembur Level Crossing/Shell Bridg Chembur West
849	19.0858900	72.8941110	Guru Nanak Nagar Vidyavihar West
850	19.1764550	72.9462900	Agarwal Municipal Hospital Mulund West
851	19.2025530	72.8304880	Ganesh Society Kandivli West
852	18.9368600	72.8397030	Caltex Petrol Pump Fort
853	18.9388980	72.8400560	Indira Dock Fort
854	18.9689890	72.8374070	Mazgaon Court Mazgaon
855	18.9759750	72.8372360	Masiana Hospital/Rustom Baug Byculla East
856	18.9797220	72.8491600	I.C.I. Reay Road East
857	18.9823870	72.8589860	Tata Oil Mill/ Hindustan Lever Reay Road East
858	18.9861590	72.8574820	Hay Bunder Reay Road East
859	18.9897410	72.8558320	Hindustan Lever Reay Road East
860	18.9933430	72.8543440	Coal Bunder Cotton Green East
861	18.9947030	72.8535180	Gadi Adda Wadala East
862	19.0020480	72.8593870	Bharat Petroleum Colony Wadala East
863	19.0045620	72.8601750	Bharat Petroleum Wadala East
864	19.0116660	72.8610770	B.P.T.Colony Wadala East
865	19.0145540	72.8621940	B.P.T.Hospital Wadala East
866	19.0468260	72.8765970	Shanti Nagar(Truck Terminal) Anik
867	19.0472150	72.8791710	Truck Terminal Main Gate Anik
868	19.0507890	72.8817980	Anik Depot Wadala East
869	19.1264520	72.8802720	Seepz Bus Station Andheri East
870	19.0862630	72.8368110	Shastri Nagar Santacruz West
871	19.1363850	72.8107200	Gangabhuwan Versova
872	19.0479500	72.9272460	Mankhurd Station Road Mankhurd (N)
873	19.0188320	72.8497240	Parsi Colony Wadala West
874	19.0262520	72.8571840	V.J.T.I.College Kings Circle
875	19.0201670	72.8567570	Wadala Church Wadala West
876	19.0559110	72.9118600	Govandi Bus Station Govandi East
877	19.0567700	72.9154960	Govandi Stn.Rd East /Patwardhan School Govandi East
878	19.0317740	72.8419350	Dhairyavan Chowk Matunga West
879	19.0305910	72.8471420	Matunga Station West
880	19.1043320	72.8304030	Saraswat Bank(Parulekar Rd Juhu)
881	19.2295290	72.8623140	Borivli Telephone Exchange Borivli West
882	19.0477940	72.9255440	Childrens Home Anushakti Nagar
883	19.0548710	72.8435820	Bhaskar Court Bandra East
884	19.0558960	72.8430500	Bandra Station East
885	19.1845660	72.8530030	Malad Station W(Anand Marg) Malad West
886	19.1881350	72.8144280	Hamala Main Gate/N.I.S/Family Gate Malad West
887	19.1850020	72.8126680	Hamala K.V.School/F Colony Malad West
888	19.1826800	72.8083500	J.J.Hosp.Nursing Society Malad West
889	19.1810300	72.8051680	Marshal Wadi/Vihir(Aksa) Madh
890	19.1761110	72.8047020	Aksa Village Madh
891	19.1711040	72.8036950	Aksa Beach Madh
892	19.1632530	72.7969140	Malati Cottage(Erangal) Madh
893	19.1596680	72.7954560	Erangal Beach/I.N.S.Hamla Malad West
894	19.1578820	72.7927960	Bhati Village Madh
895	19.1546470	72.7940690	Master Wadi Madh
896	19.1514570	72.7949120	Madh Beach/Madh Church Madh
897	19.1488220	72.7965660	Madh Market Madh
898	19.1447260	72.7969440	Madh Temple Madh
899	19.0278370	72.8597740	Wadala Gate No 4/Siwsschool
900	19.0252760	72.8602600	Wadala Gate No 2U
901	18.9626480	72.8347760	Umerkhadi Dongri
902	18.9630190	72.8375090	Noorbaug Dongri
903	18.9676010	72.8397220	Tadwadi Dongri
904	18.9698390	72.8360540	Byculla Police Station Byculla East
905	19.0600310	72.8446640	Kherwadi Police Station Bandra East
906	18.9300990	72.8227610	International Hotel Churchgate
907	18.9314000	72.8233890	Government College Churchgate
908	18.9385670	72.8247860	Zaveri Mahal Marine Lines East
909	18.9433270	72.8237610	Successeria Bldg. Churchgate
910	18.9457850	72.8222240	Gymkhana Marine Lines East
911	18.9482780	72.8196690	Taraporewala Aquarium Marine Lines East
912	18.9492100	72.8195440	Swimming Pool Marine Lines East
913	19.0835970	72.8976030	Navsena Gate/Kirol Village(Vidyavihar)
914	19.0834780	72.8954480	Indira Nagar/Khalai Village Vidyavihar West
915	19.1261480	72.8631220	Income Tax Colony Jogeshwari East
916	19.1261000	72.8631940	Datta Mandir(Income Tax Colony) Jogeshwari East
917	19.1255640	72.8686930	Tolani College Jogeshwari East
918	19.1483350	72.8591390	Nirlon Industrial Estate Goregaon East
919	19.1549730	72.8597470	Cama Industrial Estate Jogeshwari East
920	19.1553800	72.8586200	Dani Iron Steel Goregaon East
921	19.1572990	72.8560030	Ishwarbhai Patel Road Goregaon East
922	19.1591440	72.8558590	Swati Studio Goregaon East
923	19.1612380	72.8546050	Goregaon Station East Goregaon East
924	19.1680960	72.8563410	Pandurang Wadi Goregaon East
925	19.1578820	72.8747100	Unit No 10
926	19.1491780	72.8697600	Dairy Research Institute Goregaon East
927	19.1480040	72.8708750	Karim Bungalows Goregaon East
928	19.0655240	72.8427720	Bandra Rly.Terminal Bandra East
929	19.0686870	72.8425280	Khar Station E Khar East
930	19.0189880	72.8321170	Kirti College/India United Mill
931	19.0328390	72.8386340	National(Hinduja) Hospital Mahim
932	19.1166960	72.8487000	Andheri Station West Andheri West
933	19.1280900	72.9285500	Kanjurmarg Station West Kanjurmarg West
934	19.0920600	72.8512310	Centaur Hotel/Airport Vile Parle East
935	18.9569580	72.8275540	Moti Cinema Bhendi Bazaar
936	18.9576910	72.8250150	Khetwadi Dongri
937	19.1717850	72.9430160	Bombay Oxygen Mulund West
938	19.1545260	72.8760460	Chotha Kashmir/Observatory Point Goregaon East
939	19.2137590	72.8241290	Charkop Village Charkop
940	19.2140360	72.8274100	Jivan Sandeep Bldg. Charkop
941	19.2152270	72.8281940	Ekveera Vidyalaya Charkop
942	19.1008610	72.8704770	Om Nagar(Ware House) Andheri East
943	18.9691880	72.8404170	Maharana Pratap Chowk Mazgaon
944	18.9612510	72.8387580	Sandhurst Stn. Road Sandhurst Road East
945	18.9596640	72.8385000	Chinch Bunder Mazgaon
946	18.9577010	72.8333130	Khambekar Street Dongri
947	19.1224470	72.8835990	Goregaon Check Naka No.2 Marol
948	19.1409440	72.7949770	Pascal Wadi Madh
949	19.1563450	72.7931750	Kamal Baug/14Th Bungalows Madh
950	19.2472810	72.8652470	Dahisar Bridge Dahisar West
951	19.2498620	72.8660290	Dahisar Market Dahisar East
952	18.9688920	72.8440600	B.P.T.Colony Mazgaon
953	18.9703810	72.8455680	Best Power House(Kussara) Mazgaon
954	18.9756960	72.8450120	Darukhana Dockyard Road
955	19.1815700	72.8635510	Old Pushpa Park
956	19.1820080	72.8550790	Malad Station E Malad East
957	19.2108090	72.8267770	Associated Capsule Kandivli West
958	19.1102480	72.8295540	Hare Ram Hare Krishna Juhu
959	19.1115490	72.8282670	Brahmakund/Sumati School Juhu
960	19.0053900	72.8278200	Bombay Dyeing Worli
961	18.9617690	72.8306650	Cafe Paradise Grant Road East
962	18.9612340	72.8252250	Anjuman College Grant Road East
963	19.1650790	72.9489470	Goshala Road Mulund West
964	19.1648410	72.9467630	Ashirvad Building Mulund West
965	19.1704430	72.9595820	Hanuman Chowk Mulund East
966	19.0168910	72.8520180	Vitthal Mandir/Wadala Market Wadala West
967	19.0614930	72.8874350	Everest Co.Op.Society Kurla West
968	19.0650280	72.8952820	Shell Colony /Samaj Mandir Hall Chembur East
969	19.0647430	72.8932490	Sahakar Nagar(Chembur)
970	19.0652870	72.9025570	Chembur Station Road No 1 Chembur West
971	19.0994530	72.9156470	Industrial Estate Vikhroli West
972	18.9405790	72.8349760	CST (Bhatia Baug) Fort
973	19.1640130	72.8825490	Santosh Nagar Dindoshi
974	19.1005210	72.9137120	Amrut Nagar Vikhroli West
975	19.1273970	72.9296820	Mansukh Dyeing Company Kanjurmarg East
976	19.1285770	72.9322450	Ankur Hospital Bhandup East
977	19.1302970	72.9321130	Paras Chemist Bhandup East
978	19.1333040	72.9323290	Datar Colony Bhandup East
979	19.1356520	72.9341740	Adarsh Vidyalaya Bhandup East
980	19.1407700	72.9390000	Bhandup Station Bhandup East
981	19.1732030	72.8597880	Geetanjai Bldg. Malad East
982	19.1759560	72.8573490	Ashok Hospital Malad East
983	19.1740590	72.8555340	Desai Municipal Hospital Malad East
984	19.1761190	72.8547780	Jitendra Marg Malad East
985	19.1120030	72.8927860	Kamani Oil Industries Chandivli
986	19.0180240	72.8586460	Wadala Station West Wadala West
987	19.2468380	72.8663470	Kanjur Village Dahisar West
988	19.2455890	72.8664110	Municipal Hospital Dahisar West
989	19.2437410	72.8664200	Dahisar Station West Dahisar West
990	19.2411890	72.8663090	Gomant Nagar Dahisar West
991	19.2297940	72.8631720	Borivli Bus Station West Borivli West
992	19.1674940	72.8748790	Hindustan Petrolum Colony Dindoshi
993	19.1664680	72.8733990	Housing Colony Dindoshi
994	19.1670610	72.8725440	Yashashri Building (Dindoshi)
995	19.1774450	72.8210620	Malwani Block No 7 Malwani
996	19.0483840	72.8274640	Bandra Reclamation Bus Station Bandra West
997	19.0642230	72.8531130	Bharat Nagar Bandra East
998	19.0631780	72.8491370	M.Gandhi Vidya Mandir Bandra East
999	19.0620420	72.8460510	Bluilding 46 Bandra East
1000	18.9316340	72.8359630	Mumbai Central Station/Reserve Bank
1001	19.0542070	72.8378830	
1002	19.0326470	72.8932570	H.P.Nagar Mahul
1003	19.0793230	72.9045980	Zulelal Chowk Ghatkopar East
1004	19.0790040	72.9057310	Maheshwari Dham Ghatkopar East
1005	19.0796210	72.9067800	Bank Of Maharasthra/Odeon Cinema Ghatkopar East
1006	19.0814860	72.9102560	R.B.Mehta Road/Chartered Bank(Ghatkopar E)
1007	19.2489330	72.8774300	Suhasini Pawaskar Marg Dahisar East
1008	19.0990610	72.9112110	Jagdusha Nagar Ghatkopar West
1009	19.0976580	72.9094440	Gelda Nagar Ghatkopar West
1010	19.0922590	72.9081260	Krupa Bldg Ghatkopar West
1011	18.9546120	72.8122220	Wilson College Nana Chowk
1012	19.0591580	72.8273620	Master Vinayak Road Bandra West
1013	19.2352410	72.8540110	Shanti Ashram
1014	19.2335810	72.8531870	Eksar Koliwada Borivli West
1015	19.2319200	72.8524570	Eksar Village Borivli West
1016	19.2267290	72.8540290	C.K.P.Colony Borivli West
1017	19.2398750	72.8570400	Citizen Bank Borivli West
1018	19.2448920	72.8577490	Holy Cross Road Borivli West
1019	19.2461760	72.8573290	Rushi Complex Dahisar West
1020	19.2267400	72.8574540	Prasanna Soc.(Chandavarkar Marg Borivali W)
1021	19.1381470	72.9262170	Ekta Nagar Bhandup West
1022	19.1386280	72.9247420	Bhandup Peoples School Bhandup West
1023	19.1391130	72.9222410	Pratap Nagar(Bhandup W)
1024	19.0973940	72.8518980	Mahant Road Vile Parle East
1025	19.0293410	72.8379860	Gandhi Swimming Pool Shivaji Park
1026	19.0813360	72.8890580	St.Joseph Tech.School Vidyavihar West
1027	19.0826260	72.8859520	Holy Cross Rd/Premier Vidyavihar West
1028	19.1507490	72.9425330	Kasturi Vidyalaya Bhandup West
1029	19.1503150	72.9437730	Usha Nagar Bhandup West
1030	19.1581480	72.9443190	Subhash Nagar Bhandup West
1031	19.2184700	72.8577410	Gokhale Vidyalaya Shimpoli
1032	19.2195280	72.8517740	Ganesh Mandir/Kastur Park Borivli West
1033	19.2189020	72.8494510	Shimpoli Village Shimpoli
1034	19.2167720	72.8459950	Prapti Society Shimpoli
1035	19.2169390	72.8471180	Yashkripa Building (Shimpoli)
1036	19.2297230	72.8521130	Yogi Nagar
1037	19.2289240	72.8501480	Jayraj Nagar Borivli West
1038	19.2146690	72.8483970	Satya Nagar Poisar
1039	19.2150390	72.8501210	Mahavir Dham Poisar
1040	19.2162100	72.8510210	Saibaba Nagar Kandivli West
1041	19.2164080	72.8538910	Saibaba Mandir Kandivli West
1042	19.0567560	72.8339410	Municipal Office/Bhabha Hospital Bandra West
1043	19.0609960	72.8345560	Patkar Road Bandra West
1044	19.0002940	72.8531740	Sewree Station West Sewree
1045	19.0479960	72.9221320	Indraprasta Anushakti Nagar
\.


--
-- Data for Name: intended_trips; Type: TABLE DATA; Schema: public; Owner: unwlrbgljmaqxx
--

COPY intended_trips (id, "on", from_stop_id, to_stop_id, user_id) FROM stdin;
3	1	178	341	4
4	2	37	235	5
5	2	950	918	6
6	1	885	163	7
7	1	52	755	8
8	1	885	396	9
9	1	447	40	11
10	1	139	108	13
11	1	762	108	16
12	1	441	224	21
13	1	417	682	22
14	1	396	421	24
15	1	388	350	25
16	1	306	289	26
17	1	227	90	29
18	1	97	869	30
19	1	176	106	31
20	3	1013	382	32
21	1	870	445	33
22	1	42	105	35
23	1	428	296	36
24	1	511	37	37
25	1	182	345	38
26	1	956	860	34
27	1	149	315	41
28	1	151	38	42
29	1	137	67	43
30	1	675	770	44
31	1	1011	40	45
32	1	97	314	46
33	1	517	148	47
34	1	763	932	48
35	1	285	240	12
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: unwlrbgljmaqxx
--

COPY users (email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, id, role) FROM stdin;
prateetisingh@gmail.com	$2a$10$7/oI4QnExVD.6b5CqxFZU.cv3FcSygBaNNQ4iys8mQyTSvdq4pcU.	\N	\N	\N	1	2012-07-02 10:13:11	2012-07-02 10:13:11	221.135.137.72	221.135.137.72	\N	2012-07-02 10:13:11	2012-07-02 10:07:24	\N	38	\N
hiteshkmehta@gmail.com	$2a$10$ksNaMk6rMdsPWKGMSjDKy.hmFbFTLThYhWU5evALikSlea3/L.ed6	\N	\N	\N	1	2012-07-02 09:15:57	2012-07-02 09:15:57	203.197.78.162	203.197.78.162	\N	2012-07-02 09:15:57	2012-07-02 09:15:13	\N	26	\N
sanket.mehta7@gmail.com	$2a$10$3wEi8LtjabCcroDW3ZefZeMTGmQLe1P7RWM596c6/xDsZEowS4eCS	\N	\N	\N	0	\N	\N	\N	\N	RuGP7jz4S33TYPu3dRxR	\N	2012-07-02 05:49:19	\N	5	\N
makwana_kinjal11@yahoo.co.in	$2a$10$4Ji4wKpJuTau1VuxegvH1e/IlLVSvZhLpV5D6EfeARjYMOcTWhO5K	\N	\N	\N	0	\N	\N	\N	\N	4sUDgmAa4y3UZqLmVqjP	\N	2012-07-02 06:09:41	\N	6	\N
gazal24@gmail.com	$2a$10$vP4Vx61CpEz5aWNqgHroSerY8orzCCS6rU4oqCh/ooAzWg/FuGZPi	\N	\N	\N	0	\N	\N	\N	\N	X9kf5JLphWskkrGJf8yA	\N	2012-07-02 06:51:46	\N	7	\N
sammohanaalva@gmail.com	$2a$10$WLhhI7O98Hcno0KxiihjgeTStavBmVnYcvGvFo0O0bUJivR/folKi	\N	\N	\N	1	2012-07-02 09:26:55	2012-07-02 09:26:55	93.186.23.80	93.186.23.80	\N	2012-07-02 09:26:55	2012-07-02 09:24:37	\N	32	\N
deepu.kalidindi@gmail.com	$2a$10$5E4pXqoHS3ipiMTGwgp9p.DQnjCJOJlABkDozRnW37dHVlIEzmNgG	\N	\N	\N	1	2012-07-02 06:54:21	2012-07-02 06:54:21	180.148.38.240	180.148.38.240	\N	2012-07-02 06:54:21	2012-07-02 06:52:51	\N	8	\N
anishmg@gmail.com	$2a$10$Im4r2TAGuEPEXPL7z415MOJrv1jTbpskf5l99wp.MdYD5zQVtSesO	\N	\N	\N	0	\N	\N	\N	\N	H9PszCfz6kDVmUVs4QPG	\N	2012-07-02 07:01:18	\N	9	\N
deepaknopany@hotmail.com	$2a$10$WymxKP.HW83RsKjKafAjmOK53pG4IkQk2bHorHvhs2YzklEcgpASq	\N	\N	\N	1	2012-07-02 09:17:09	2012-07-02 09:17:09	59.182.124.183	59.182.124.183	\N	2012-07-02 09:17:09	2012-07-02 07:55:28	\N	17	\N
ajsamuels@gmail.com	$2a$10$KFfMUAhrROnSCxXvp4c3H.RB3a9oOJhKUJpR4dCi6eFMysWjTqj8C	\N	\N	\N	1	2012-07-02 07:13:38	2012-07-02 07:13:38	180.222.215.7	180.222.215.7	\N	2012-07-02 07:13:38	2012-07-02 07:12:31	\N	11	\N
arjun.siva@gmail.com	$2a$10$FtFdaZ4LkaCRtIRo69cxDu3qksWGc7i3n9cHK8zhMef6JLJaVsj/e	\N	\N	\N	0	\N	\N	\N	\N	qwBJDg6z3EBq3bhbyVxx	\N	2012-07-02 07:23:01	\N	13	\N
lipika.kumaran@gmail.com	$2a$10$4esewFRi5ySzpBkorCGGO.E8fC2ykvSVQLb0Q8.mee5I77fk3obD6	\N	\N	\N	0	\N	\N	\N	\N	kUruGkp4V1253yfRGzqX	\N	2012-07-02 12:26:18	\N	43	\N
martinmanofoz@gmail.com	$2a$10$.lV1qSCkBhCS4Wov3GuxkegEY7fo8.BUyR7iXZPoiQtmj6loHzaNG	\N	\N	\N	0	\N	\N	\N	\N	xYHtjYydJZkHyRqggpCF	\N	2012-07-02 07:35:45	\N	15	\N
emailnazneen@gmail.com	$2a$10$WJdP30rjrvlOkM1pXt/iiOEJ5QUtzAo8efA3kbfRbRCAzNXbEUq1a	\N	\N	\N	1	2012-07-02 09:17:13	2012-07-02 09:17:13	115.249.242.17	115.249.242.17	\N	2012-07-02 09:17:13	2012-07-02 09:15:25	\N	27	\N
meenakshi.vora@gmail.com	$2a$10$G6jikiO1Fn2fxCbo6o9cau0cQhVwrTnBgRJ0C5R9oI9uxEd/oQGJm	\N	\N	\N	1	2012-07-02 07:39:52	2012-07-02 07:39:52	155.126.8.16	155.126.8.16	\N	2012-07-02 07:39:52	2012-07-02 07:35:21	\N	14	\N
anasdalvi1@gmail.com	$2a$10$xYfOlTr7if/4vEUUtVl9Y.KDb.bRPYW/.sALhJe1Zoys8CPH6a36W	\N	\N	\N	0	\N	\N	\N	\N	zqpFFz9EXzr44qzMZsX5	\N	2012-07-02 07:40:44	\N	16	\N
mohankrishn@gmail.com	$2a$10$awZcI6Xhr22hnrYe5UuMR.82NiHsPQBCqc46aVXuQftW8b4c6BVdi	\N	\N	\N	1	2012-07-02 07:43:18	2012-07-02 07:43:18	164.100.111.69	164.100.111.69	\N	2012-07-02 07:43:18	2012-07-02 07:10:32	\N	10	\N
parameswarankg@yahoo.co.in	$2a$10$e9Nlhwdo/YIJXR1OLcwSoO/RxS7VlO6Wt9363LndJMOmyivXA8fEe	\N	\N	\N	0	\N	\N	\N	\N	rsDMHbatrJenyccUVTgj	\N	2012-07-02 07:57:06	\N	18	\N
udayand@gmail.com	$2a$10$67Z8AXdEd7E4gCxrf8E67..mO3uZIFGo0nxKpKSkqdXyF9n5UY4wK	\N	\N	\N	0	\N	\N	\N	\N	w5jjt9DakgDn22idpfAW	\N	2012-07-02 08:12:29	\N	19	\N
gaurav7475@gmail.com	$2a$10$WfqJbh2eNj2T6QoR4sJzJ.UfT.mjeZq9ePTxFPtzVs0qmMlyTimNq	\N	\N	\N	0	\N	\N	\N	\N	4fGuQYnyh9XnEc1VDZyJ	\N	2012-07-02 08:15:26	\N	20	\N
shaveday@gmail.com	$2a$10$ls4PvRqgYT7H.epqupojCO2FM.LGMMasbjTJly9pFpjjbzCkANm4u	\N	\N	\N	0	\N	\N	\N	\N	MHyd9zoEgHXcFQwwmAW6	\N	2012-07-02 08:20:00	\N	21	\N
euphemist.in@gmail.com	$2a$10$FPWx7GLt1GEVHe5WrstRxO.4ko47yy6fmjlUqW9nfpYaIaj8bwQra	\N	\N	\N	0	\N	\N	\N	\N	VbcHD2bVnjAzN8YsSwKj	\N	2012-07-02 08:22:03	\N	22	\N
mybcs11@gmail.com	$2a$10$/X7CJ7.e2j.SAmlnubhtCuvfBzRuS6LlILuZcb9C2FtyuoJ9iZYN2	\N	\N	\N	0	\N	\N	\N	\N	7fyZeNqpEx8SPUZkW1xK	\N	2012-07-02 08:36:36	\N	23	\N
harshitthakkar@hotmail.com	$2a$10$jLRtOJfY1WuNmEpbBD7UEOdnisWaErUUciLW13R/dwuZyQwGuuKN2	\N	\N	\N	1	2012-07-02 10:08:30	2012-07-02 10:08:30	114.143.78.106	114.143.78.106	\N	2012-07-02 10:08:30	2012-07-02 10:07:23	\N	37	\N
suneel168@gmail.com	$2a$10$jv3cwDs0ioEZsv7XREQtU.ljMKggtcutLSlmh3.lJ7e2BfcmNuEfO	\N	\N	\N	1	2012-07-02 08:44:39	2012-07-02 08:44:39	125.22.62.130	125.22.62.130	\N	2012-07-02 08:44:39	2012-07-02 08:44:05	\N	25	\N
ratoola@gmail.com	$2a$10$BOHnAtFx78TL0W8dx2cTG.y.fiMm0PvS8i20sDoy5.e0O9fAsv84u	\N	\N	\N	1	2012-07-02 09:39:29	2012-07-02 09:39:29	203.115.64.98	203.115.64.98	\N	2012-07-02 09:39:29	2012-07-02 09:38:45	\N	33	\N
nihalaniprashant@yahoo.co.in	$2a$10$79X6wV2UIkiQe0T39Fkz7O214goyzZI8b3T5OfySPLxqbn37IOqxy	\N	\N	\N	1	2012-07-02 08:48:29	2012-07-02 08:48:29	203.92.47.34	203.92.47.34	\N	2012-07-02 08:48:29	2012-07-02 08:39:39	\N	24	\N
coolkaran007@gmail.com	$2a$10$whvtmhzkKzM4UQgUe/WlxO0CzjD8.wSCm0n0NF.nzTOj67I8ridQG	\N	\N	\N	1	2012-07-02 09:19:22	2012-07-02 09:19:22	207.126.248.6	207.126.248.6	\N	2012-07-02 09:19:22	2012-07-02 09:18:17	\N	28	\N
shelhandon@gmail.com	$2a$10$Mnh48c4I0XPOSzwnPFYW5.o/MpeMJaR03ZFUE.U17bkeTNAunYg9i	\N	\N	\N	1	2012-07-02 09:21:04	2012-07-02 09:21:04	221.135.84.106	221.135.84.106	\N	2012-07-02 09:21:04	2012-07-02 09:20:21	\N	29	\N
jayshree.kr@gmail.com	$2a$10$Zn0Y37o5GT0Erjzc2jrBd.bAze8QMyafb6NOF4GOCcnk1w8kmEfhu	\N	\N	\N	0	\N	\N	\N	\N	xxZbVDqzgqvVVxtRqt7v	\N	2012-07-02 09:24:30	\N	31	\N
satnat@vsnl.net	$2a$10$vhzvSvZC5QvLGx7JpDHKYuwOMSd8SbYJVXbaKpZb8MmSzgsj9lqQi	\N	\N	\N	0	\N	\N	\N	\N	2fKp2MY7VGz39JkmeGMz	\N	2012-07-02 09:53:40	\N	35	\N
piyush.pr@gmail.com	$2a$10$JboSIYD6SiV7l0/xKEy2NeMDmFzKYMWxCHepdMczt2L7l6a2K/jhu	\N	\N	\N	1	2012-07-02 09:24:43	2012-07-02 09:24:43	115.249.14.137	115.249.14.137	\N	2012-07-02 09:24:43	2012-07-02 09:23:02	\N	30	\N
ajay.singh.82@gmail.com	$2a$10$0QWu5JsDLHpVmZHMRoQOg.jfuzcSbR/c.gG/uxadleCRqK5.0gLgm	\N	\N	\N	1	2012-07-02 09:55:12	2012-07-02 09:55:12	121.244.73.4	121.244.73.4	\N	2012-07-02 09:55:12	2012-07-02 09:53:10	\N	34	\N
jainritu@hotmail.com	$2a$10$g4bkCUjD.RWYNDTOhnPThufoX5w8pkFALJlwmoFXjPYx5jLwhTHsC	\N	\N	\N	1	2012-07-02 10:22:10	2012-07-02 10:22:10	42.105.44.183	42.105.44.183	\N	2012-07-02 10:22:10	2012-07-02 10:06:56	\N	36	\N
mariemalls@gmail.com	$2a$10$1B6zXhl4pbJGdxb8nSmlmOC49uCXGMG01H7l840maaN2DZEt0Js4i	\N	\N	\N	1	2012-07-02 10:12:59	2012-07-02 10:12:59	115.111.79.34	115.111.79.34	\N	2012-07-02 10:12:59	2012-07-02 10:12:40	\N	39	\N
vishaljc@gmail.com	$2a$10$98eRbFwtoSdRixTCSryzKeypjf57Ewa29VQtP33X2MGlaS4Uu3zYO	\N	\N	\N	1	2012-07-02 10:15:45	2012-07-02 10:15:45	223.230.9.160	223.230.9.160	\N	2012-07-02 10:15:45	2012-07-02 10:13:24	\N	40	\N
deeptimittal2004@gmail.com	$2a$10$z8RCSLi7gBeMvO/PQzzLkO.d.ZUJNgBKyfVYrxVcNjH5uNwWveyge	\N	\N	\N	0	\N	\N	\N	\N	Zs4Ya5FxVU1SdTKxjyFr	\N	2012-07-02 10:36:22	\N	41	\N
svs@svs.io	$2a$10$ZEmCbNONk6i5.3MD1IptPu50aYQIIBI4NtZhhTC37cC/hGmoiwnu.	\N	\N	\N	3	2012-07-02 12:11:10	2012-07-02 07:35:15	49.248.105.194	122.170.64.86	\N	2012-07-02 05:34:02	2012-07-02 05:33:09	\N	4	\N
sbhansali83@gmail.com	$2a$10$YIySjq3TVUrQ7KQqEu.sjuTBDcK.52mmPFi33f0lcRTwb7qvymp7m	\N	\N	\N	1	2012-07-02 11:03:07	2012-07-02 11:03:07	61.12.23.202	61.12.23.202	\N	2012-07-02 11:03:07	2012-07-02 11:00:53	\N	42	\N
mehul.shah@iciciventure.com	$2a$10$lu2FBI/OpXRq1mGYf1/n6.bD7hdHGHZPy8M9AhWTKEMj7w1H5TgY2	\N	\N	\N	0	\N	\N	\N	\N	8q8uqgtaSkeqToxhYKzK	\N	2012-07-02 17:16:33	\N	44	\N
sameerphatak28@gmail.com	$2a$10$4.bLMJF9mX.PVA1Qr.aY4eYl5FFTeHKYwcApy3YJN/.e1HTxkJi0u	\N	\N	\N	0	\N	\N	\N	\N	xqXFyUNny4z26ryfMRXe	\N	2012-07-02 17:33:47	\N	45	\N
tejas.610@gmail.com	$2a$10$f9Ro1rdQcH/uFT766TAbtuGVmM9dXdfKJKE6AiSAcXLVSWgBIKRPW	\N	\N	\N	0	\N	\N	\N	\N	H6Y2EqsRiQqyXGKdLAYo	\N	2012-07-02 17:49:56	\N	46	\N
msshanbhag@gmail.com	$2a$10$.nCKp54OlBC7XsiKQ2nPIeL1Cn1yEiz23VEA/rjWOL0qTR0w1G2DG	\N	\N	\N	1	2012-07-03 04:19:03	2012-07-03 04:19:03	1.39.54.28	1.39.54.28	\N	2012-07-03 04:19:03	2012-07-03 04:17:26	\N	47	\N
sanjayjbhatia@yahoo.com	$2a$10$mFQknMKcd9kKhF.z0uWe/.fVudkKtdbuwGQJ.9589tvI7USmLjgNy	\N	\N	\N	0	\N	\N	\N	\N	yd9oGRsqMo4QsHKpZJMs	\N	2012-07-03 04:24:22	\N	48	\N
ritika168@gmail.com	$2a$10$0fLGLZQBiT5YsV0WfHJ6xOKG5nggvopx8uzOQeENymCC.4RnpYp9u	\N	\N	2012-07-03 04:32:03	2	2012-07-03 04:32:03	2012-07-02 07:28:09	14.97.0.134	14.97.130.216	\N	2012-07-02 07:28:09	2012-07-02 07:13:36	\N	12	\N
\.


--
-- Name: bus_stops_pkey; Type: CONSTRAINT; Schema: public; Owner: unwlrbgljmaqxx; Tablespace: 
--

ALTER TABLE ONLY bus_stops
    ADD CONSTRAINT bus_stops_pkey PRIMARY KEY (id);


--
-- Name: intended_trips_pkey; Type: CONSTRAINT; Schema: public; Owner: unwlrbgljmaqxx; Tablespace: 
--

ALTER TABLE ONLY intended_trips
    ADD CONSTRAINT intended_trips_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: unwlrbgljmaqxx; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_intended_trips_from_stop; Type: INDEX; Schema: public; Owner: unwlrbgljmaqxx; Tablespace: 
--

CREATE INDEX index_intended_trips_from_stop ON intended_trips USING btree (from_stop_id);


--
-- Name: index_intended_trips_to_stop; Type: INDEX; Schema: public; Owner: unwlrbgljmaqxx; Tablespace: 
--

CREATE INDEX index_intended_trips_to_stop ON intended_trips USING btree (to_stop_id);


--
-- Name: index_intended_trips_user; Type: INDEX; Schema: public; Owner: unwlrbgljmaqxx; Tablespace: 
--

CREATE INDEX index_intended_trips_user ON intended_trips USING btree (user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: unwlrbgljmaqxx
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM unwlrbgljmaqxx;
GRANT ALL ON SCHEMA public TO unwlrbgljmaqxx;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

