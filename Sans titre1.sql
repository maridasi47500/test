select * from projet;
select * from rochesql.projet;
select nomemp from employe where numemp=2;
select 1 from dual;
select 2 + 2 from dual;
select sysdate from dual;
select codecours, libellecours 
from cours;
-- numeros des employes qui se sont inscrits � un s�minaire
select numemp fron inscrit;
select distinct numemp from inscrit;

--code des cours pour lesquels il y a un s�minaire
select distinct codecours from seminaire;
select * from employe where 1=1;
select * from employe where 1=2;
select numemp, nomemp, salaire from employe where salaire = 10000;
select nomemp, salaire from employe where numemp = 2;
select nomemp, salaire from employe where numemp = 50;
-- quel sont les cours codes et libell�s qui durent plus de 3 jours ?
select distinct codecours, libellecours from cours where nbjours >3;
--quels sont les projets (code et nom) qui ont d�marr� le 17 janvier 2019 ?
select codeprojet, nomprojet from projet where debutproj = '07/01/2019';
--salaire entre 10000 et 30000
select numemp, nomemp, salaire from employe where salaire between 10000 and 11000;
--numero des emplyes qui se sont inscrits � une s�minaire en octobre 2019
select distinct numemp
from inscrit
where to_char(dateinscrit, 'MM/YYYY') = '10/2019';
--diapo 33
select numemp, nomemp, salaire 
from employe 
where nomemp 
in('Dupont','RIVIERE'); 

--nom et salaire des employes dont le nom commence par g
select nomemp, salaire from employe where nomemp like 'G%';
--nom et salaire des employes dont le nom a un E en deuxieme position 
select nomemp, salaire from employe where nomemp like '_E%';
--nom des employes dont le poste est c17 et donyt le xsalaire est superieur a 11000
select nomemp from employe where poste = 'C17' and salaire > 11000;
-- nomd es employes dont le poste est c17 ou b14
select nomemp from employe where poste = 'C17' or poste = 'B14';

--employes numero nomemp salaire code du projet qui travaillent sur le projet pr1 
--sans conditions de salaire  ou qui travaillent sur le projet de code pr2 avec un salaire >10000
select numemp, nomemp, salaire, codeprojet from employe where codeprojet = 'PR1' or (codeprojet = 'PR2' and salaire > 10000);
select * from employe where salaire not between 10000 and 11000;
select * from employe where salaire between 10000 and 11000;
select 'bonjour' from dual where 1=1;
select 'bonjour' from dual where null=null;
select 'bonjour' from dual where null=0;
select 'bonjour' from dual where null='';

--nom salaire et poste des emplyes dont la prime est nulle
select numemp, nomemp, salaire, poste, prime
from employe
where prime IS null;
select numemp, nomemp, salaire, poste, prime
from employe
where not prime IS null and not prime = 0;
--code seminaire(sem) libelle cours(cours), nbjours (cours)de chaque seminaire
select codesemi, libellecours, nbjours 
from seminaire inner join cours
on seminaire.codecours = cours.codecours;
--code seminaire libelle cours de chaque seminaire
select distinct seminaire.datedebutsem, seminaire.codesemi, cours.libellecours 
from cours inner join seminaire
on seminaire.codecours = cours.codecours;
--codesemi codecours datedebutsem nbjours des seminaires du cours br035
select codesemi, datedebutsem, nbjours 
from seminaire inner join cours
on seminaire.codecours = cours.codecours and seminaire.codecours = 'BR035';
--code des seminaires ou se sont inscrits les employes travaillant sur le projet font le code est �gal � PR1
select distinct codesemi 
from inscrit inner join employe
on employe.numemp = inscrit.numemp
where employe.codeprojet = 'PR1';

--numero nom et pr�nom des employ�s qui onyt particip� � un s�minaire un lundi codejour=LU
select employe.numemp, prenomemp, nomemp 
from employe inner join participer 
on employe.numemp = participer.numemp and participer.codejour='LU';

select seminaire.codesemi, cours.codecours, seminaire.datedebutsem, cours.nbjours
from seminaire inner join cours
on seminaire.codecours=cours.codecours
where cours.codecours ='BR035';
--code des seminaires ou se sont inscrits les employes travaillant sur le projet dont le code est egal a PR1
select distinct inscrit.codesemi
from employe inner join inscrit
on employe.numemp = inscrit.numemp
where employe.codeprojet = 'PR1';
--numero ,nom et pr�nom des employ�s qui ont particip� � un s�minaire un lundi (codejour="LU")
--distinct
select distinct employe.numemp, employe.nomemp, employe.prenomemp
from participer inner join employe
on participer.numemp = employe.numemp;
-- cours : 1 primary key(codecurs) numemp + codesemi(1 key), (2 f key) numemp, code semi

--code cours libell� cours des cours o� se sont inscrits 
--les employ�s travaillant sur le projet dont le code est �gal � PR1
select distinct cours.codecours, cours.libellecours
from cours inner join inscrit
on inscrit.codesemi = seminaire.codesemi
where cours.codecours = seminaire.codecours
from inscrit inner join employe;
/*
on r�cup�re les employes travaillant sur le projet PR1 (Table Employe)
on va r�cup�rer leurs inscriptions (jointure entre employe et inscrit)
cela va nous permettre de r�cup�rer les codesemi sur lesquels ils se sonr inscrits
on va chercher les seminaires auxquels ils correspondent pour pouvoir r�cup�rer les codecours
jointure entre inscrit et seminaire
grace aux codecours de la table semaine on va recuperer les libelles des cours
jointure entre seminaire et cours
distinct car plusieurs employes trabaillant sur pr1 ont pu s'inscrire azux memes cours
*/
select distinct cours.codecours, cours.libellecours
from employe inner join inscrit
on employe.numemp = inscrit.numemp
inner join seminaire
on inscrit.codesemi = seminaire.codesemi
inner join cours 
on seminaire.codecours = cours.codecours
where employe.codeprojet='PR1';

--numero nom pr�nom des employes dont le nom correspond � un libell� de cours (ex : Monsieur SQL)
select distinct numemp, nomemp, prenomemp
from employe inner join cours
on employe.nomemp = cours.libellecours;

--numero, nom, et prenom des employes qui se sont inscrits � un s�minaire apr�s la date de d�but du projet PR5
select numemp, nomemp, prenomemp
from employe inner join projet 
on employe.codeprojet = projet.codeprojet
where projet.codeprojet = 'PR5'

from projet inner join inscrit
on inscrit.dateinscrit > projet.debutproj

from employe inner join inscrit
on employe.numemp = inscrit.numemp
where inscrit.dateinscrit;
/*on recupere les inscriptions posterieures � la date de d�but du projet PR5

*/
select *
from inscrit inner join projet
on inscrit.dateinscrit > projet.debutproj
where projet.codeprojet = 'PR5';
--on va aller chercher maintenant les noms et prenoms dans la table employes avec un distinct car un employe a pus'inscrire � plusieurs s�minaires apr�s le d�but du projet PR5
select employe.numemp, employe.prenomemp 
from inscrit inner join projet 
on inscrit.dateinscrit > projet.debutproj 
inner join employe
on inscrit.numemp = employe.numemp
where projet.codeprojet = 'PR5';

/*liste des employes
numemp nomemp prenomemp salaire codeprojet nomprojet
quelle requete faut il ecrire pour afficher 2 resultats
*/
select employe.numemp, employe.nomemp, employe.prenomemp, employe.salaire, projet.codeprojet, projet.nomprojet
from projet inner join employe
on projet.codeprojet = employe.codeprojet
where employe.codeprojet IS NULL;
--cette requete est fausse car il manque tous les employes qui ne travaillent pas sur un projet
-- on doit faire une jointure externe o� la table employ� sera la table dominante car on veut retourner tous les employ�s
-- y compris ceux qui n'ont pas de projet
select employe.numemp, employe.nomemp, employe.prenomemp, employe.salaire, employe.codeprojet, projet.nomprojet
from projet left join employe
on employe.codeprojet = projet.codeprojet;
--ou
select employe.numemp, employe.nomemp, employe.prenomemp, employe.salaire, projet.codeprojet, projet.nomprojet
from projet right join employe
on projet.codeprojet = employe.codeprojet;

/*
afficher les noms des employes dont le numero est sup � 17 avec les codes des seminaires auxquels ils se sont inscrits. 
--Si un employ� ne s'est inscrit � aucun s�minaire, son nom doit --apparaitre. 
*/
-- rajouter le libellecours : propagation des jointures externes

select nomemp, inscrit.codesemi, cours.libellecours
from employe right join inscrit
on inscrit.numemp = employe.numemp
left join seminaire
on inscrit.codesemi = seminaire.codesemi
left join cours 
on seminaire.codecours=cours.codecours
where employe.numemp > 17;

--mon drh aimerait avoir liste employes avec le no, le nom, le prenom et le no du superieur le nom du superieur et le prenom d
--du superieur hierarchique
--1 dupont pierre duchatel mireille
-----------------------------------------------------------
--on on recupere les cours qui datent de l'uml 
select cours.codecours, cours.libellecours, seminaire.codesemi, seminaire.datedebutsem
from cours inner join seminaire 
on seminaire.codecours = cours.codecours 
where cours.libellecours LIKE '%UML%'
and seminaire.datedebutsem >= '30/04/2019'
and seminaire.datedebutsem <='31/05/2019';

--on va rechercher les seminaires correspondant � ces cours


--on ne garde que les seminaires de mai et les seminaires qui commencent en mai 2019


-----------------------------------------------------------
select cours.codecours, cours.libellecours, seminaire.codesemi, seminaire.datedebutsem
from cours inner join seminaire 
on seminaire.codecours = cours.codecours 
where cours.libellecours LIKE '%UML%'
and seminaire.datedebutsem between '30/04/2019' and '31/05/2019';
--nomemp, numemp, prenomemp, supe
select numemp, nomemp, prenomemp, superieur, nomemp, prenomemp
from employer inner join employe;
--confusion des tables utilisaton des alias
--emp sera la lias sur la table qui sert � trouver les employes
-- sup sera l'alias sur la table qui sert � trouver les sup�rieurs des employ�s
--alias sur la colonne sup numemp
--prenomsup alias sur la colonne sup.prenomsup
select emp.numemp, emp.nomemp, emp.prenomemp, emp.superieur, sup.nomemp nomsup, sup.prenomemp prenomsup
from employe emp left join employe sup
on emp.superieur=sup.numemp;
--on fait une jointure externe car un employe peut ne pas avoir de superieur hierarchique
--liste des employes qui ne se sont pas inscrits � un s�minaire
select employe.numemp, employe.nomemp, employe.prenomemp
from employe left join inscrit
on employe.numemp = inscrit.numemp
where inscrit.numemp is null;
select * from inscrit where numemp = 21;

--c'est ka liste des employes a laquelle on retire (soustraction)

select nomemp, prenomemp, salaire
from employe
order by salaire desc, nomemp;
--aficher les employes numemp nomemp prenomemp, codeprojet, prime, tri�s sur la valeur de prime en ordre croissant
--que remrque t on pour les primes) null
--afficher les employ�s ,umemp ,nomemp, pr�nomemp, codeprojet, nomprojet, salaire, tri�s sur le codeprojet
select employe.numemp, employe.nomemp, employe.prenomemp, employe.codeprojet, employe.prime
from employe
order by prime;
--en ordre croissant et le salaire en ordre d�croissant
--aficher les noms des employes tries sur le codeprojet
select employe.numemp, employe.nomemp, employe.prenomemp, employe.codeprojet, employe.prime
from employe left join projet 
on employe.codeprojet = projet.codeprojet
order by projet.codeprojet, salaire desc;
select projet.codeprojet, projet.nomprojet, projet.debutproj
from projet
order by projet.finprevue;
--trouver le gain de chaqye employe numemp nomemp 
--select numemp, nomemp, salaire, prime, total
select 1+coalesce(null, 7) from dual;
select numemp, nomemp, salaire, prime, salaire+coalesce(prime, 0) total
from employe;
create table test01 (num_integer, nom varchar(50));
select * from test01;
select * from user_tab_cols where table_name='TEST01';

create table test02 ("num" integer, "nom" varchar(50));
select * from test02;
select * from user_tab_cols where table_name='TEST02';
-- codesemi, codecours, libellecours, njjours, datedebut, datefin, jour d�but, jour fin de chaque s�minaire
select codesemi, codecours, libellecours, njjours, datedebut, datefin, datedebutsem, datefinsem 
from seminaire left join cours
on cours.codesemi ;
--nombre de jours correpondant au s�minaire
--code semi code cours libelle cours nb jours datedebut datefunb jour debut joui fin de chaque seminaire
--ma date de fin de seminaire n'existe pas mais on poeut la calculer � l'aide
--de la date de debut de seminaire table seminaire
--du nombre de jours du cours correspondant au seminaire colonne nbjours de la table cours
select seminaire.codesemi, cours.codecours, cours.libellecours, seminaire.datedebutsem, seminaire.datedebutsem+cours.nbjours-1 datefin
from seminaire inner join cours
on seminaire.codecours=cours.codecours;
--et si on veut rajouter le jour de debut et le jour de fin on va utiliser les fonctions dates de oracle
select seminaire.codesemi, cours.codecours, cours.libellecours, seminaire.datedebutsem, seminaire.datedebutsem+cours.nbjours-1 datefin, to_char(seminaire.datedebutsem, 'Day') jourdebut, to_char(seminaire.datedebutsem+cours.nbjours-1, 'Day') jourfin
from seminaire inner join cours
on seminaire.codecours=cours.codecours
order by datefin;
select max(salaire) from employe;
select nomemp, salaire
from employe
where salaire = max(employe.salaire);
--nom emp autant de lignes qu'il y a dans la table, valeur horizontale
--1 seule valeur pour la colonne salaire valeur verticale
--on ne peut pas comparer une valeur verticale avec une valeur horizontale
--dansun select on ne peut pas associer une valeur verticale � une valeur horizontale sans fonction de regroupement

--comment savoir qui a le plus gros salaire
select round(avg(salaire), 2) moyennesalaire, round(avg(prime),2) primemoyenne from employe;
select count(*) nbemployes from employe where prime is not null;
--ATTENTION � ce que l'on veut
select avg(coalesce(prime,0)) moyenneprime, avg(prime) moyenneprimeceuxquitouchent
from employe;
--on sait qu'il peut y avoir plusieurs employes par poste donc on est obliges de compter le nombre de valeurs diff�rentes de poste.

select count(distinct poste)
from employe;
--quelle est la plus petite prime accordee � un employ� ?
select min(prime) from employe;
select avg(salaire) moyennesalaire, avg(prime) primemoyenne 
from employe;
select avg(prime) from employe;
--combien y a-t-il d'employ�s dans le poste A12 
select count(employe.poste) nbemploye
from employe
where employe.poste='A12';
--combien y a-t-il d'employ�s touchant une prime
select count(employe.prime) 
from employe
where prime>0 and prime is not null;
--Dans combien de postes sont r�partis les employ�s
select  count(employe.poste)
from employe;
--quel est le plus petit gain(salaire+prime)
select min(employe.salaire+coalesce(employe.prime,0)) pluspetitgain from employe;
--on est obliges de passeer par coalesce car il faut prendre en compte les emplyes ne touchzant pas de prime

--quelle est la duree moyenne en nombre de jours des projets MoyenneJours
select avg(projet.finprevue-projet.debutproj) MoyenneJours from projet;

--quels sont les seminaires qui traitent de sql ou il y a moins de 3 inscrits codeinscrit codecours libellecours datedebut datefin
select seminaire.codesemi, cours.codecours, cours.libellecours, seminaire.datedebutsem
from inscrit left join seminaire
on inscrit.codesemi = seminaire.codesemi
left join cours
on seminaire.codecours = cours.codecours 
where cours.libellecours = '%SQL%';


--diap69
select forme,couleur
from monensemble2
group by forme, couleur;
--on regroupe par code projet
--on compte � l'int�rieur de chaque groupe

select codeprojet, count(*) nbemployes
from employe
group by codeprojet;
--si on ne veut pas retourner des null, 
select codeprojet, count(*) nbemployes
from employe
where codeprojet is not null
group by codeprojet;
select coalesce(codeprojet, 'Aucun') codeprojet, count(*) nbemployes
from employe
group by codeprojet
order by nbemployes desc;

--trouver la somme des salaires par poste (poste somme)
select sum(employe.salaire), employe.poste
from employe
group by employe.poste;

select sum(employe.salaire), employe.poste
from employe
order by employe.salaire;

--trouver le nombre de s�minaires par cours (codecours, nombre)
--on regruope les employes par poste on fait la somme des salaires
select poste, sum(salaire) sommesalaireposte
from employe
group by poste;

--le tri doit s'effectuer sur la somme on peut utiliser l'alias
select poste, sum(salaire) sommesalaireposte
from employe
group by poste
order by sommesalaireposte;

--nombre de seminaires par cours
select seminaire.codecours, count(codesemi)
from seminaire
