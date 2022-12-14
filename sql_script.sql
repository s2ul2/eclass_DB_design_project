use eclass_real2;

CREATE TABLE class
(
	c_id                 VARCHAR(20) NOT NULL,
	c_name               VARCHAR(20) NOT NULL,
	p_name               VARCHAR(20) NOT NULL,
	tuition_fee          INTEGER NOT NULL,
	p_id                 VARCHAR(20) NOT NULL
);

ALTER TABLE class
ADD PRIMARY KEY (c_id);

CREATE TABLE hw
(
	c_id                 VARCHAR(20) NOT NULL,
	h_id                 VARCHAR(20) NOT NULL,
	start                DATE NOT NULL,
	end                  DATE NOT NULL,
	h_content            VARCHAR(40) NULL
);

ALTER TABLE hw
ADD PRIMARY KEY (c_id,h_id);

CREATE TABLE lecture
(
	c_id                 VARCHAR(20) NOT NULL,
	week                 INTEGER NOT NULL,
    time                 INTEGER NOT NULL,
	l_content            VARCHAR(40) NULL
);

ALTER TABLE lecture
ADD PRIMARY KEY (c_id,week,time);

CREATE TABLE lecture_resource
(
	w_id                 INTEGER NOT NULL,
	title                VARCHAR(20) NOT NULL,
	w_content            VARCHAR(100) NULL,
	w_date               DATE NOT NULL,
	p_id                 VARCHAR(20) NOT NULL
);

ALTER TABLE lecture_resource
ADD PRIMARY KEY (w_id);

CREATE TABLE member
(
	school_id            VARCHAR(20) NOT NULL,
	id                   VARCHAR(20) NOT NULL,
	pw                   VARCHAR(20) NOT NULL,
	register_date        DATE NULL
);

ALTER TABLE member
ADD PRIMARY KEY (school_id);

CREATE UNIQUE INDEX idindex ON member(id);

CREATE TABLE perform
(
	s_id                 VARCHAR(20) NOT NULL,
	c_id                 VARCHAR(20) NOT NULL,
	h_id                 VARCHAR(20) NOT NULL,
	h_check              VARCHAR(10) NOT NULL
);


ALTER TABLE perform
ADD PRIMARY KEY (c_id,h_id,s_id);

CREATE TABLE professor
(
	p_id                 VARCHAR(20) NOT NULL,
	p_name               VARCHAR(20) NOT NULL
);

ALTER TABLE professor
ADD PRIMARY KEY (p_id);

CREATE TABLE regist
(
	s_id                 VARCHAR(20) NOT NULL,
	c_id                 VARCHAR(20) NOT NULL
);


ALTER TABLE regist
ADD PRIMARY KEY (c_id,s_id);

CREATE TABLE student
(
	s_id                 VARCHAR(20) NOT NULL,
	s_name               VARCHAR(20) NOT NULL,
	major                VARCHAR(20) NULL
);

ALTER TABLE student
ADD PRIMARY KEY (s_id);

CREATE TABLE watch
(
	s_id                 VARCHAR(20) NOT NULL,
	c_id                 VARCHAR(20) NOT NULL,
	week                 INTEGER NOT NULL,
	time                 INTEGER NOT NULL,
	l_check              VARCHAR(10) NOT NULL
);

ALTER TABLE watch
ADD PRIMARY KEY (s_id,c_id,week,time);

ALTER TABLE class
ADD FOREIGN KEY (p_id) REFERENCES professor (p_id);

ALTER TABLE hw
ADD FOREIGN KEY (c_id) REFERENCES class (c_id);

ALTER TABLE lecture
ADD FOREIGN KEY (c_id) REFERENCES class (c_id);

ALTER TABLE lecture_resource
ADD FOREIGN KEY (p_id) REFERENCES professor (p_id);

ALTER TABLE perform
ADD FOREIGN KEY (c_id, h_id) REFERENCES hw (c_id, h_id);

ALTER TABLE perform
ADD FOREIGN KEY (s_id) REFERENCES student (s_id);

ALTER TABLE professor
ADD FOREIGN KEY (p_id) REFERENCES member (school_id);

ALTER TABLE regist
ADD FOREIGN KEY (c_id) REFERENCES class (c_id);

ALTER TABLE regist
ADD FOREIGN KEY (s_id) REFERENCES student (s_id);

ALTER TABLE student
ADD FOREIGN KEY (s_id) REFERENCES member (school_id);

ALTER TABLE watch
ADD FOREIGN KEY (s_id) REFERENCES student (s_id);

ALTER TABLE watch
ADD FOREIGN KEY (c_id, week, time) REFERENCES lecture (c_id, week, time);

ALTER TABLE professor ADD CONSTRAINT ck_id CHECK(p_id LIKE 'p%');
ALTER TABLE student ADD CONSTRAINT ck_id2 CHECK(s_id NOT LIKE 'p%');
ALTER TABLE watch ADD CONSTRAINT ck_l_check CHECK(l_check in ('??????', '?????????', '??????', '??????'));
ALTER TABLE perform ADD CONSTRAINT ck_h_check CHECK(h_check in ('??????', '?????????', '????????????'));


##############################  ????????? ?????? #######################################

# ?????? ??????
INSERT INTO member VALUES('20192643', 'sjse2000', 'sjs130', '2020-03-01');
INSERT INTO member VALUES('20192644', 'tjwlstmf', 'sjs130', '2020-03-01');
INSERT INTO member VALUES('20192645', 'tjwlstmf123', 'sjs130', '2020-03-01');
INSERT INTO member VALUES('p01', 'sjsjsj', 'sjs130', '2020-03-01');
INSERT INTO member VALUES('p02', 'sj', 'sjs130', '2020-03-01');
INSERT INTO member VALUES('p03', 'kkk', 'sjs130', '2020-03-01');
INSERT INTO member VALUES('p04', 'dasf', 'sjs130', '2020-03-01');
INSERT INTO member VALUES('20192646', 'adflkadrlk', 'sjs130', '2020-03-01');

# ?????? ??????
INSERT INTO professor VALUES('p01', '?????????');
INSERT INTO professor VALUES('p02', '?????????');
INSERT INTO professor VALUES('p03', '?????????');
INSERT INTO professor VALUES('p04', '?????????');
# ?????? ??????
INSERT INTO student VALUES('20192643', '?????????', '??????');
INSERT INTO student VALUES('20192644', '??????', '??????');
INSERT INTO student VALUES('20192645', '???', '??????');
INSERT INTO student VALUES('20192646', '?????????', NULL);

# ?????? ??????
INSERT INTO class VALUES('c01', '????????????', '?????????', 30000, 'p01');
INSERT INTO class VALUES('c02', '?????????', '?????????', 40000, 'p03');
INSERT INTO class VALUES('c03', '???????????????', '?????????', 50000, 'p02');
INSERT INTO class VALUES('c04', '??????', '?????????', 50000, 'p04');

# ????????????
INSERT INTO regist VALUES('20192643', 'c01');
INSERT INTO regist VALUES('20192643', 'c02');
INSERT INTO regist VALUES('20192644', 'c01');
INSERT INTO regist VALUES('20192644', 'c02');
INSERT INTO regist VALUES('20192645', 'c01');
INSERT INTO regist VALUES('20192645', 'c02');
INSERT INTO regist VALUES('20192645', 'c03');

# ?????? ??????
INSERT INTO lecture VALUES('c01', 14, 1,  "????????????????");
INSERT INTO lecture VALUES('c01', 14, 2,  "??????????????????");
INSERT INTO lecture VALUES('c01', 15, 1,  "????????????");
INSERT INTO lecture VALUES('c02', 14, 1,  "SQL??????");
INSERT INTO lecture VALUES('c02', 14, 2,  "SQL ??????");
INSERT INTO lecture VALUES('c03', 14, 1,  "C?????????");
INSERT INTO lecture VALUES('c03', 14, 2,  "C?????? ??????");
INSERT INTO lecture VALUES('c04', 14, 1,  "?????????");
INSERT INTO lecture VALUES('c04', 14, 2,  "????????????");

# ?????? ??????
INSERT INTO watch VALUES('20192643', 'c01', 14, 1, '??????');
INSERT INTO watch VALUES('20192643', 'c01', 14, 2, '??????');
INSERT INTO watch VALUES('20192644', 'c01', 14, 1, '?????????');
INSERT INTO watch VALUES('20192645', 'c03', 14, 1, '??????');
INSERT INTO watch VALUES('20192645', 'c02', 14, 1, '??????');

# ?????? ??????
INSERT INTO hw VALUES('c01', 'h01', '2021-12-01', '2021-12-10',  "???????????? ??????1");
INSERT INTO hw VALUES('c01', 'h02', '2021-12-11', '2021-12-30',  "???????????? ??????2");
INSERT INTO hw VALUES('c02', 'h01', '2021-12-01', '2021-12-10',  "????????? ??????1");
INSERT INTO hw VALUES('c02', 'h02', '2021-12-11', '2021-12-30',  "????????? ??????2");

# ?????? ??????
INSERT INTO perform VALUES('20192643', 'c01', 'h01', '??????');
INSERT INTO perform VALUES('20192644', 'c01', 'h01', '??????');
INSERT INTO perform VALUES('20192643', 'c02', 'h01', '????????????');
INSERT INTO perform VALUES('20192645', 'c01', 'h02', '?????????');
INSERT INTO perform VALUES('20192646', 'c02', 'h01', '??????');
INSERT INTO perform VALUES('20192644', 'c02', 'h02', '????????????');


# ?????????????????? ?????????
INSERT INTO lecture_resource VALUES(1, '?????? ????????????', '???????????? ??????', '2021-12-10', 'p01');
INSERT INTO lecture_resource VALUES(2, '?????? ????????????', '??????????????? ??????', '2021-12-10', 'p01');
INSERT INTO lecture_resource VALUES(3, '????????? ????????????', NULL, '2021-12-10', 'p02');