CREATE  TABLE CONSULTATIE ( ID_CONSULTATIE  NUMBER NOT NULL CONSTRAINT PK_CONSULTATIE PRIMARY KEY,ID_PACIENT NUMBER NOT NULL,ID_SERVICIU NUMBER NOT NULL,ID_ANGAJAT NUMBER NOT NULL,
DATA  DATE NOT NULL,DURATA NUMBER(3) NOT NULL,PRET NUMBER NOT NULL);

insert into CONSULTATIE values (4000,2000,5000,3000, to_date('12-09-2022','dd-mm-yyyy'), 60, 110);
insert into CONSULTATIE values (4001,2001,5001,3001, to_date('30-06-2018','dd-mm-yyyy'), 60, 38);
insert into CONSULTATIE values (4002,2002,5002,3002, to_date('12-02-2022','dd-mm-yyyy'), 60, 185);
insert into CONSULTATIE values (4003,2003,5003,3003, to_date('28-07-2019','dd-mm-yyyy'), 45, 84);
insert into CONSULTATIE values (4004,2004,5004,3004, to_date('19-07-2018','dd-mm-yyyy'), 30, 150);
insert into CONSULTATIE values (4005,2005,5005,3005, to_date('22-04-2020','dd-mm-yyyy'), 60, 40);
insert into CONSULTATIE values (4006,2006,5006,3006, to_date('11-05-2021','dd-mm-yyyy'), 45, 100);
insert into CONSULTATIE values (4007,2007,5007,3007, to_date('28-07-2029','dd-mm-yyyy'), 40, 170);
insert into CONSULTATIE values (4008,2008,5008,3008, to_date('30-03-2019','dd-mm-yyyy'), 40, 150);
insert into CONSULTATIE values (4009,2009,5009,3009, to_date('19-02-2020','dd-mm-yyyy'), 35, 250);



select * from consultatie;

alter table consultatie
add constraint CONSULTATIE_FK foreign key (ID_PACIENT)
  references PACIENTI (ID_PACIENT);

alter table consultatie
add constraint CONSULTATIE_FK_S foreign key (ID_SERVICIU)
  references SERVICII (ID_SERVICIU);

alter table consultatie
add constraint CONSULTATIE_FK_A foreign key (ID_ANGAJAT)
  references ANGAJATI (ID_ANGAJAT);
  
alter table consultatie add detalii_consultatie varchar2(2000);
alter table consultatie modify detalii_consultatie varchar2(1000);
alter table consultatie drop column detalii_consultatie;

create table PACIENTI
(
  id_pacient     NUMBER(6) not null CONSTRAINT PK_PACIENTI PRIMARY KEY,
  prenume VARCHAR2(20),
  nume   VARCHAR2(20),
  cnp VARCHAR2(13),
  telefon        VARCHAR2(20),
  data_nastere   DATE,
  sex            VARCHAR2(1)
)
;
INSERT INTO PACIENTI VALUES(2000,'Alina','Popa',2900708345406,'0751088518',to_date('18-08-1997', 'dd-mm-yyyy'),'F');
INSERT INTO PACIENTI VALUES(2001,'Andrei','Popa',1235897653154,'0744592373',to_date('19-05-1997', 'dd-mm-yyyy'),'M');
INSERT INTO PACIENTI VALUES(2002,'Mihai','Popescu',1940624343418,'0745137167',to_date('07-09-1997', 'dd-mm-yyyy'),'M');
INSERT INTO PACIENTI VALUES(2003,'George','Nita',1921223159991,'0723544240',to_date('23-12-2003', 'dd-mm-yyyy'),'M');
INSERT INTO PACIENTI VALUES(2004,'Ioana','Nita',2940613265749,'0744573850',to_date('04-12-2000', 'dd-mm-yyyy'),'F');
INSERT INTO PACIENTI VALUES(2005,'Alexandru','Adam',1940717186348,'0762430002',to_date('21-02-2006', 'dd-mm-yyyy'),'M');
INSERT INTO PACIENTI VALUES(2006,'Elena','Mihoc',2950701188833,'0722690230',to_date('30-12-1998', 'dd-mm-yyyy'),'F');
INSERT INTO PACIENTI VALUES(2007,'Maria','Bostan',6011208137009,'0722363028',to_date('14-09-2001', 'dd-mm-yyyy'),'F');
INSERT INTO PACIENTI VALUES(2008,'Miruna','Adam',4540717186348,'0762430009',to_date('11-03-1993', 'dd-mm-yyyy'),'F');
INSERT INTO PACIENTI VALUES(2009,'Alin','Mare',3420701188833,'0765690990',to_date('30-10-1998', 'dd-mm-yyyy'),'M');
INSERT INTO PACIENTI VALUES(2010,'Daria','Ionescu',4201208137009,'0765341028',to_date('01-01-2003', 'dd-mm-yyyy'),'F');

select *from pacienti;





alter table pacienti add constraint pacienti_unique unique(cnp);
alter table pacienti disable constraint pacienti_unique;
alter table pacienti dROP constraint pacienti_unique;
alter table pacienti
  add constraint data_nastere
  check (data_nastere IS NOT NULL);


create table ANGAJATI
(
  id_angajat     NUMBER(6) not null CONSTRAINT PK_ANGAJATI PRIMARY KEY,
  prenume        VARCHAR2(20),
  nume           VARCHAR2(25),
  telefon        VARCHAR2(20),
  data_angajare  DATE,
  salariul       NUMBER(8,2),
  id_laborator NUMBER(4)
)
;

alter table angajati
add constraint angajati_FK foreign key (ID_LABORATOR)
  references LABORATOARE (ID_LABORATOR);

insert into ANGAJATI values (3000, 'Ana', 'Andrici', '0766547987', to_date('12-01-2017', 'dd-mm-yyyy'),3700, 6000);
insert into ANGAJATI values (3001, 'Florin', 'Lupu', '0734589709', to_date('10-02-2017', 'dd-mm-yyyy'),3500, 6001);
insert into ANGAJATI values (3002, 'Andra', 'Ene', '0798764579', to_date('25-11-2015', 'dd-mm-yyyy'),2700, 6002);
insert into ANGAJATI values (3003, 'Maria', 'Roca', '0709876890', to_date('25-11-2015', 'dd-mm-yyyy'),2700, 6003);
insert into ANGAJATI values (3004, 'Liliana', 'Andrici', '0789987678', to_date('12-04-2019', 'dd-mm-yyyy'),4200, 6004);
insert into ANGAJATI values (3005, 'Radu', 'Popescu', '0723345987', to_date('07-09-2020', 'dd-mm-yyyy'),3700, 6005);
insert into ANGAJATI values (3006, 'Andreea', 'Apostol', '0723456982', to_date('29-10-2021', 'dd-mm-yyyy'),2900, 6006);
insert into ANGAJATI values (3007, 'Marius', 'Ionescu', '07776598034', to_date('16-06-2020', 'dd-mm-yyyy'),3900, 6007);
insert into ANGAJATI values (3008, 'Mircea', 'Popa', '0798678234', to_date('19-07-2019', 'dd-mm-yyyy'),4000, 6008);
insert into ANGAJATI values (3009, 'Iulia', 'Neagu', '0745698259', to_date('30-03-2018', 'dd-mm-yyyy'),4500, 6009);

select * from angajati;

create table SERVICII
(
  id_serviciu       NUMBER(6) not null constraint pk_servicii PRIMARY KEY,
  denumire_serviciu VARCHAR2(50),
  descriere       VARCHAR2(2000),
  pret        NUMBER(8,2)
)
;
insert into SERVICII values(5000,'Consultatie genetica',' proces de comunicare prin care specialistul genetician“sf?tuie?te pacien?ii ?i/sau rudele lor cu risc pentru o boal?
ce poate fi ereditar? în leg?tur? cu efectele bolii,
 probabilitatea apari?iei sau transmiterii ei în familie ?i c?ile prin care aceasta poate fi prevenit? sau ameliorat?”',110);
insert into SERVICII values(5001,'Determinarea factorului Rh','nu este necesar? o preg?tire prealabil?; sunt utile informa?ii asupra unor tratamente perfuzabile cu solu?ii macromoleculare
 efectuate premerg?tor determin?rii, transfuzii în ultimele 120 zile',38);
insert into SERVICII values(5002,'ARN Viral SARS-CoV-2','Test diagnostic COVID-19 RT-PCR (Coronavirus) este disponibil toate centrele din ?ar? ?i se poate efectua atât la cerere, cât ?i 
în baza unei program?ri',185);
insert into SERVICII values(5003,'Alimente amestec (fx5)','Alimente amestec (fx5) cuprinde testarea de IgE specifice pentru:albus de ou, lapte de vaca, peste, grau, arahide, soia.',84);
insert into SERVICII values(5004,'Set anual de analize','Setul de analize uzuale este conceput astfel incat sa evalueze principalele functii ale organismului',150);
insert into SERVICII values(5005,'Determinare grup sangvin (A,B,O)','Nu necesita o pregatire prealabila.',40);
insert into SERVICII values(5006,'Examen citologic al frotiului sanguin','Examenul citologic al frotiului sanguin este o componenta esentiala a 
evaluarii pacientilor cu boli hematologice si nehematologice,
deoarece aduce informatii importante pentru diagnosticul pozitiv sau diferential al acestor afectiuni.',100);
insert into SERVICII values(5007,'Test alergologic ALEX-MADx IgE','specific pentru 282 de alergeni',170);
insert into SERVICII values(5008,'Panel 2 respirator','testeaza aeroalergeni ( praf, polen de anin, mesteacan, stejar, ierburi, par de cal, caine,pisica, hamster, iepure)',150);
insert into SERVICII values(5009,'Panel 1 mixt','testeaza alergeni respiratori, alimentari si de origine animala ( de exemplu: praf, grau,
alun, polen, par sau piele de caine si pisica, ou, lapte, arahide, soia)',250);
select * from servicii;

create table LOCATIE
(
  id_locatie NUMBER(4) not null constraint pk_locatie PRIMARY KEY,
  oras       VARCHAR2(30),
  strada      VARCHAR2(25),
  numar   NUMBER(3)
);

insert into LOCATIE values (1000, 'Bucuresti', 'Cuza Voda', 53);
insert into LOCATIE values (1001, 'Bucuresti', 'Margeanului', 44);
insert into LOCATIE values (1002, 'Bucuresti', 'Saradei', 42);
insert into LOCATIE values (1003, 'Iasi', 'Teiul Doamnei', 12);
insert into LOCATIE values (1004, 'Iasi', 'Pacurari', 121);
insert into LOCATIE values (1005, 'Iasi', 'Vasile Lupu', 15);
insert into LOCATIE values (1006, 'Iasi', 'Oastei', 2);
insert into LOCATIE values (1007, 'Iasi', 'Teiul Doamnei', 12);
insert into LOCATIE values (1008, 'Brasov', 'Berzei', 13);
insert into LOCATIE values (1009, 'Brasov', 'Aurel Vlaicu', 103);
insert into LOCATIE values (1010, 'Cluj-Napoca', 'Nordului', 67);
insert into LOCATIE values (1011, 'Cluj-Napoca', 'Teiului', 92);

select *from locatie;

create table LABORATOARE
(
  id_laborator      NUMBER(4) not null constraint pk_laboratoare PRIMARY KEY,
  denumire VARCHAR2(30),
  id_locatie           NUMBER(4)
)
;

alter table laboratoare
add constraint lab_fk foreign key (id_locatie) references locatie(id_locatie);
alter table laboratoare rename to laborator;
alter table laborator rename to laboratoare;


insert into LABORATOARE values (6000, 'Sante', 1000);
insert into LABORATOARE values (6001, 'Sante', 1001);
insert into LABORATOARE values (6002, 'Sanedyvo', 1002);
insert into LABORATOARE values (6003, 'Anclin', 1003);
insert into LABORATOARE values (6004, 'Sanedyvo', 1004);
insert into LABORATOARE values (6005, 'Regina Maria', 1005);
insert into LABORATOARE values (6006, 'Bioclinica', 1006);
insert into LABORATOARE values (6007, 'Sante', 1007);
insert into LABORATOARE values (6008, 'Anclin', 1008);
insert into LABORATOARE values (6009, 'Bioclinica', 1009);


select *from laboratoare;

UPDATE angajati SET salariul=salariul+300 WHERE salariul<3000 ;
SELECT * FROM angajati;


update consultatie set pret=pret/2 where id_consultatie>4005; 
select* from consultatie;

delete from consultatie where data<to_date('01-01-2020','dd-mm-yyyy');  
select* from consultatie;

update locatie set oras='Cluj' where lower(oras)='cluj-napoca'; 
select * from locatie;

update pacienti set nume=upper(nume);
select * from pacienti;

select * from servicii where lower(denumire_serviciu) like  'p%';

select id_consultatie, (sysdate-data)/7 saptamani from consultatie;

drop table consultatie cascade constraints;
flashback table consultatie to before drop;
select * from consultatie;

select * from consultatie where data>to_date('01-01-2020','dd-mm-yyyy') and pret>100;

select c.id_consultatie,c.id_pacient,c.id_serviciu,c.id_angajat,c.data,c.durata,c.pret, p.nume,p.prenume 
from consultatie c, pacienti p where c.id_pacient=p.id_pacient;

select l.id_laborator,l.denumire,l.id_locatie,loc.oras from laboratoare l,locatie loc where l.id_locatie=loc.id_locatie and upper(loc.oras)='BUCURESTI'; 

select id_locatie,strada,numar from locatie where oras like 'B%';

select * from angajati where upper(nume)='ANDRICI';
select * from angajati where lower(nume)='andrici';
select * from angajati where initcap(nume)='Andrici';

select min(data) cea_mai_veche, max(data) cea_mai_recenta from consultatie;

select max(pret) pret_maxim,min(pret) pret_minim,sum(pret) profitul from servicii;

select nume, prenume, telefon, sex,floor((sysdate-data_nastere)/365) varsta from pacienti where floor((sysdate-data_nastere)/365)>18 order by varsta;

select denumire from laboratoare 
union 
select oras from locatie;

select* from consultatie where data>=to_date('01-01-2019','dd-mm-yyyy') and data<=to_date('31-12-2020','dd-mm-yyyy')
minus 
select * from consultatie where data in(to_date('30-03-2019','dd-mm-yyyy'),to_date('19-02-2020','dd-mm-yyyy'));


select * from angajati where salariuL>3700
intersect 
select * from angajati where data_angajare>to_date('01-01-2020','dd-mm-yyyy');

select * from pacienti where data_nastere>to_date('31-12-2000','dd-mm-yyyy')
intersect
select * from pacienti where upper(sex)='F';

select denumire_serviciu,pret from servicii where pret>150
union
select denumire_serviciu,pret from servicii where pret<50;

SELECT pret,
CASE WHEN pret>=200 THEN 0.15
WHEN pret between 100 and 199 THEN 0.1
WHEN pret<100 THEN 0.05 END discount
FROM consultatie;

select * from angajati where salariul>(select salariul from angajati where data_angajare=to_date('12-01-2017','dd-mm-yyyy'));

select * from laboratoare l,locatie loc where l.id_locatie=loc.id_locatie and upper(loc.oras)='BRASOV'
union
select * from laboratoare l,locatie loc where l.id_locatie=loc.id_locatie and upper(loc.oras)='IASI';

create synonym loc for locatie;
create synonym lab for laboratoare;
select * from user_synonyms;

create or replace view vpacienti 
as select * from pacienti where upper(sex)='F';
update vpacienti set nume=upper(nume);
select * from vpacienti; 

SELECT * FROM pacienti WHERE lower(nume) = 'popa';
CREATE INDEX index_prenume ON pacienti (LOWER(nume));

select id_consultatie, data from consultatie where extract(year from data) in (2022);

create sequence secventa  start with 1 increment by 1 maxvalue 100 nocycle;

SELECT oras,
DECODE (UPPER(oras) , 'BUCURESTI' , 'B','BRASOV', 'BV', 'IASI' , 'IS','necunoscut') COD_ORAS
FROM locatie;

select count(a.id_angajat) from angajati a, laboratoare l, locatie loc
where a.id_laborator=l.id_laborator and l.id_locatie=loc.id_locatie and upper(loc.oras)='BUCURESTI';

select * from angajati where salariul between 3000 and 4500
minus
select * from angajati where salariul in (3700, 4200);