cd "/Users/Marco/Google Drive/HEC/empi/proj/"
use "dbOld.dta", clear
gen ponderated = CR * note
egen total_CR = sum(CR), by(ID)
egen summed = sum(ponderated), by(ID)
gen moyenne = summed/total_CR
drop ponderated summed
gsort -moyenne

//collapse (first) sexe moyenne total_CR etat debut matu_ecole matu_nom, by(ID)
//drop if matu_ecole != "Gymnase de Burier, La Tour-de-Peilz"

/*
preserve
drop if etat != "R�ussi(e)"
collapse (first) moyenne fin sexe, by(ID)
collapse (mean) moyenne, by(sexe  fin)

restore
*/


gen sci = .
replace sci = 0 if ///
cours == "Applied Organizational Behavior and Management I (->2013)" | ///
cours == "Approche g�n�rale du management" | ///
cours == "Aspects juridiques du financement d'entreprise" | ///
cours == "Asset Management: Th�orie et Pratique (->2014)" | ///
cours == "Atelier entrepreneuriat et si on essayait ..." | ///
cours == "Business English" | ///
cours == "Business Processes and Information Systems" | ///
cours == "Commerce (->2013)" | ///
cours == "Commerce international et int�gration europ�enne (->2014)" | ///
cours == "Communication marketing (->2010)" | ///
cours == "Communication, r�daction et rh�torique (->2010)" | ///
cours == "Comportement Organisationnel et Management Appliqu� (->2014)" | ///
cours == "Comportement Organisationnel et Management Appliqu�s (->2009)" | ///
cours == "Comportement Organisationnel et Management Appliqu�s I (->2010)" | ///
cours == "Comportement Organisationnel et Management Appliqu�s II (->2010)" | ///
cours == "Comportement du consommateur (->2012)" | ///
cours == "Comportement du consommateur (->2013)" | ///
cours == "Comportement organisationnel" | ///
cours == "Consumer Behavior (->2014)" | ///
cours == "Corporate sustainability: The environmental perspective" | ///
cours == "Cours IDHEAP : Management du sport (->2010)" | ///
cours == "Cours IDHEAP : Management du sport - SOMIT- (->2010)" | ///
cours == "Cyberespace et Internet" | ///
cours == "Doing business in emerging markets : enseignement (->2014)" | ///
cours == "Doing business in emerging markets: voyage (->2012)" | ///
cours == "Doing business in emerging markets: voyage (->2014)" | ///
cours == "Dramaturgie pour le monde professionnel" | ///
cours == "Droit des affaires I" | ///
cours == "Droit des affaires II" | ///
cours == "Droit des soci�t�s" | ///
cours == "Droit des soci�t�s : partie g�n�rale (->2013)" | ///
cours == "D�veloppement International (->2009)" | ///
cours == "D�veloppement de nouveaux produits (->2012)" | ///
cours == "D�veloppement de nouveaux produits (->2014)" | ///
cours == "Economie internationale du tourisme (->2010)" | ///
cours == "Economie internationale du tourisme (->2013)" | ///
cours == "Ecriture et accroche (->2013)" | ///
cours == "Entrepreneuriat (->2011)" | ///
cours == "Ethique et Marketing" | ///
cours == "GRH: de la Pratique � la Th�orie (->2011)" | ///
cours == "Gestion de projets" | ///
cours == "Gestion des Ressources Humaines: Th�orie et Pratique" | ///
cours == "Gestion des ressources humaines (->2011)" | ///
cours == "Histoire de la pens�e �conomique" | ///
cours == "Histoire de la pens�e �conomique (->2014)" | ///
cours == "Human Branding" | ///
cours == "Integrated Marketing Communication" | ///
cours == "International Development (->2010)" | ///
cours == "Introduction au droit de l'entreprise (->2010)" | ///
cours == "Introduction au syst�me d'assurances sociales en Suisse (->2014)" | ///
cours == "Introduction � l'�thique des affaires" | ///
cours == "Introduction � l'�thique des affaires (->2010)" | ///
cours == "Introduction � la gestion immobili�re" | ///
cours == "Introduction � la gestion immobili�re (->2013)" | ///
cours == "Judgment and Decision Making" | ///
cours == "L'�criture strat�gique (->2014)" | ///
cours == "La banque priv�e en pratique" | ///
cours == "La pr�voyance professionnelle suisse" | ///
cours == "La pr�voyance professionnelle suisse (->2012)" | ///
cours == "Le droit de l'entreprise, partie g�n�rale" | ///
cours == "Le droit de l'entreprise, partie sp�ciale" | ///
cours == "Les essentiels et la bo�te � outils du futur entrepreneur" | ///
cours == "Les essentiels et la bo�te � outils du futur entrepreneur (->2014)" | ///
cours == "Management Control and Management Control Systems" | ///
cours == "Management Control and Management Control Systems (->2013)" | ///
cours == "Management des forces de vente" | ///
cours == "Management et marketing des services (->2009)" | ///
cours == "Manufacturing History (->2010)" | ///
cours == "Marketing Communication (->2012)" | ///
cours == "Marketing Research" | ///
cours == "Marketing Research (->2011)" | ///
cours == "Marketing des Services (->2013)" | ///
cours == "Marketing industriel" | ///
cours == "Marketing industriel (->2012)" | ///
cours == "Marketing strat�gique" | ///
cours == "Mondialisation et d�veloppement (->2014)" | ///
cours == "Monnaie et finance internationales (->2011)" | ///
cours == "Monnaie et finance internationales (->2014)" | ///
cours == "New product and service development" | ///
cours == "Personal Development" | ///
cours == "Personal Development (->02.2013)" | ///
cours == "Persuasion et communication (->2012)" | ///
cours == "Persuasion et communication - printemps - orientation sur la rh�torique (->2014)" | ///
cours == "Principes de marketing" | ///
cours == "Principes de politique d'entreprise" | ///
cours == "Processus and services SI (->2011)" | ///
cours == "Processus et services SI (->2010)" | ///
cours == "Pr�vention et gestion des conflits juridiques" | ///
cours == "Seminar : Real Estate Management (->2012)" | ///
cours == "Services Marketing (->2011)" | ///
cours == "Services Marketing (->2014)" | ///
cours == "Strategic Marketing (online) (->2012)" | ///
cours == "Syst�mes d'information" | ///
cours == "Syst�mes d'information (->2012)" | ///
cours == "S�minaire: Jugement et prise de d�cision" | ///
cours == "S�minaire: La gestion immobili�re en pratique" | ///
cours == "S�minaire: La gestion immobili�re en pratique (->2013)"
replace sci = 1 if ///
cours == "Analyse de la d�cision" | ///
cours == "Analyse �conomique : macro�conomie" | ///
cours == "Analyse �conomique : micro�conomie" | ///
cours == "Applied Operations Management (->2012)" | ///
cours == "Economie politique (->2010)" | ///
cours == "Economie politique I" | ///
cours == "Economie politique II" | ///
cours == "El�ments de programmation (->2011)" | ///
cours == "El�ments de programmation (10-11)" | ///
cours == "El�ments de programmation (2014)" | ///
cours == "Essentials of Investments (->2014)" | ///
cours == "Finance d'entreprise (->2009)" | ///
cours == "Finance d'entreprise (->2010)" | ///
cours == "Finance d'entreprise (->2013)" | ///
cours == "Finance d'entreprise (->2014)" | ///
cours == "Finance d'entreprise et finance empirique (->2011)" | ///
cours == "Finance des march�s (->2009)" | ///
cours == "Finance des march�s (->2012)" | ///
cours == "Finance des march�s (->2014)" | ///
cours == "Finances publiques" | ///
cours == "Fondements psychologiques d'�conomie (->2012)" | ///
cours == "Fondements psychologiques d'�conomie (->2014)" | ///
cours == "Gestion des op�rations I" | ///
cours == "Gestion des op�rations II (->2012)" | ///
cours == "Gestion du risque (->2014)" | ///
cours == "Industrial Organization (BSc)" | ///
cours == "Introduction to Supply Chain Management (->2010)" | ///
cours == "Introduction � la logique" | ///
cours == "Introduction � la logique I (->2012)" | ///
cours == "Introduction � la logique II (->2012)" | ///
cours == "Macro�conomie II" | ///
cours == "Macro�conomie Quantitative" | ///
cours == "Math�matiques (->2010)" | ///
cours == "Math�matiques I" | ///
cours == "Math�matiques II" | ///
cours == "Math�matiques de la finance" | ///
cours == "Math�matiques de la finance (->2010)" | ///
cours == "Microeconomics II" | ///
cours == "Micro�conomie II (->2009)" | ///
cours == "Micro�conomie appliqu�e : concurrence et d�r�glementation" | ///
cours == "Mod�les informatiques" | ///
cours == "Mod�les informatiques (->2011)" | ///
cours == "Mod�les informatiques (10-11)" | ///
cours == "Mod�les informatiques (2014)" | ///
cours == "M�thodes Empiriques en Management et en Economie" | ///
cours == "Notions et principes g�n�raux de l'informatique (->2010)" | ///
cours == "Operations Strategy (->2012)" | ///
cours == "Organisation Industrielle (->2014)" | ///
cours == "Practical Operations Management" | ///
cours == "Principes de finance" | ///
cours == "Programmation par objets" | ///
cours == "Programmation par objets (->2012)" | ///
cours == "Programmation par objets (->2013)" | ///
cours == "Psychological Foundations of Economics (->2010)" | ///
cours == "Statistics and Econometrics II" | ///
cours == "Statistique (->2010)" | ///
cours == "Statistique I" | ///
cours == "Statistique II" | ///
cours == "Statistique et �conom�trie I" | ///
cours == "Statistique et �conom�trie I (->2014)" | ///
cours == "Statistique et �conom�trie II (->2013)" | ///
cours == "Statistique et �conom�trie appliqu�es: introduction" | ///
cours == "S�minaire de politique macro�conomique (->2011)" | ///
cours == "S�minaire: Analyse de la d�cision appliqu�e" | ///
cours == "Th�orie des jeux (->2009)" | ///
cours == "Th�orie et politique mon�taires" | ///
cours == "Th�orie et politique mon�taires I (->2012)" | ///
cours == "Th�orie et politique mon�taires II (->2009)"
replace sci = 2 if ///
cours == "Centenaire HEC I (->2011)" | ///
cours == "Centenaire HEC II (->2011)" | ///
cours == "Comptabilit� financi�re I" | ///
cours == "Comptabilit� financi�re II" | ///
cours == "Comptabilit� financi�re approfondie" | ///
cours == "Comptabilit� financi�re approfondie (->2011)" | ///
cours == "Comptes de groupe et contr�le externe" | ///
cours == "Comptes de groupe et contr�le externe (->2014)" | ///
cours == "Contr�le interne (->2014)" | ///
cours == "Cours de cl�ture: Jeu d'Entreprise ERPSim" | ///
cours == "Entrepreneurial finance and the new venture funding process (->2014)" | ///
cours == "Etudes Marketing (->2010)" | ///
cours == "Fiscalit� (->2014)" | ///
cours == "Neurosciences et prise de d�cision" | ///
cours == "Principes de comptabilit� et de gestion (->2010)" | ///
cours == "Rapport de stage I (->2010)" | ///
cours == "Risque et assurance (->2009)" | ///
cours == "Stage de management (->2015)" | ///
cours == "Valorisation d'entreprise" | ///
cours == "Venture Challenge"
gen year = .

replace year = 1 if ///
cours == "Approche g�n�rale du management" | ///
cours == "Comptabilit� financi�re I" | ///
cours == "Comptabilit� financi�re II" | ///
cours == "Economie politique (->2010)" | ///
cours == "Economie politique I" | ///
cours == "El�ments de programmation (->2011)" | ///
cours == "El�ments de programmation (10-11)" | ///
cours == "El�ments de programmation (2014)" | ///
cours == "Introduction au droit de l'entreprise (->2010)" | ///
cours == "Le droit de l'entreprise, partie g�n�rale" | ///
cours == "Le droit de l'entreprise, partie sp�ciale" | ///
cours == "Math�matiques (->2010)" | ///
cours == "Math�matiques I" | ///
cours == "Math�matiques II" | ///
cours == "Mod�les informatiques" | ///
cours == "Mod�les informatiques (->2011)" | ///
cours == "Mod�les informatiques (10-11)" | ///
cours == "Mod�les informatiques (2014)" | ///
cours == "Notions et principes g�n�raux de l'informatique (->2010)" | ///
cours == "Principes de comptabilit� et de gestion (->2010)" | ///
cours == "Statistique (->2010)" | ///
cours == "Statistique I" | ///
cours == "Statistique II"
replace year = 2 if ///
cours == "Analyse de la d�cision" | ///
cours == "Analyse �conomique : macro�conomie" | ///
cours == "Analyse �conomique : micro�conomie" | ///
cours == "Business English" | ///
cours == "Comportement organisationnel" | ///
cours == "Comptes de groupe et contr�le externe" | ///
cours == "Comptes de groupe et contr�le externe (->2014)" | ///
cours == "Contr�le interne (->2014)" | ///
cours == "Droit des affaires I" | ///
cours == "Economie politique II" | ///
cours == "Gestion des op�rations I" | ///
cours == "Gestion du risque (->2014)" | ///
cours == "Principes de finance" | ///
cours == "Principes de marketing" | ///
cours == "Statistique et �conom�trie I" | ///
cours == "Statistique et �conom�trie I (->2014)" | ///
cours == "Statistique et �conom�trie II (->2013)" | ///
cours == "Statistique et �conom�trie appliqu�es: introduction" | ///
cours == "Syst�mes d'information" | ///
cours == "Syst�mes d'information (->2012)"
replace year = 3 if ///
cours == "Applied Operations Management (->2012)" | ///
cours == "Applied Organizational Behavior and Management I (->2013)" | ///
cours == "Aspects juridiques du financement d'entreprise" | ///
cours == "Asset Management: Th�orie et Pratique (->2014)" | ///
cours == "Atelier entrepreneuriat et si on essayait ..." | ///
cours == "Business Processes and Information Systems" | ///
cours == "Centenaire HEC I (->2011)" | ///
cours == "Centenaire HEC II (->2011)" | ///
cours == "Commerce (->2013)" | ///
cours == "Commerce international et int�gration europ�enne (->2014)" | ///
cours == "Communication marketing (->2010)" | ///
cours == "Communication, r�daction et rh�torique (->2010)" | ///
cours == "Comportement Organisationnel et Management Appliqu� (->2014)" | ///
cours == "Comportement Organisationnel et Management Appliqu�s (->2009)" | ///
cours == "Comportement Organisationnel et Management Appliqu�s I (->2010)" | ///
cours == "Comportement Organisationnel et Management Appliqu�s II (->2010)" | ///
cours == "Comportement du consommateur (->2012)" | ///
cours == "Comportement du consommateur (->2013)" | ///
cours == "Comptabilit� financi�re approfondie" | ///
cours == "Comptabilit� financi�re approfondie (->2011)" | ///
cours == "Consumer Behavior (->2014)" | ///
cours == "Corporate sustainability: The environmental perspective" | ///
cours == "Cours IDHEAP : Management du sport (->2010)" | ///
cours == "Cours IDHEAP : Management du sport - SOMIT- (->2010)" | ///
cours == "Cours de cl�ture: Jeu d'Entreprise ERPSim" | ///
cours == "Cyberespace et Internet" | ///
cours == "Doing business in emerging markets : enseignement (->2014)" | ///
cours == "Doing business in emerging markets: voyage (->2012)" | ///
cours == "Doing business in emerging markets: voyage (->2014)" | ///
cours == "Dramaturgie pour le monde professionnel" | ///
cours == "Droit des affaires II" | ///
cours == "Droit des soci�t�s" | ///
cours == "Droit des soci�t�s : partie g�n�rale (->2013)" | ///
cours == "D�veloppement International (->2009)" | ///
cours == "D�veloppement de nouveaux produits (->2012)" | ///
cours == "D�veloppement de nouveaux produits (->2014)" | ///
cours == "Economie internationale du tourisme (->2010)" | ///
cours == "Economie internationale du tourisme (->2013)" | ///
cours == "Ecriture et accroche (->2013)" | ///
cours == "Entrepreneurial finance and the new venture funding process (->2014)" | ///
cours == "Entrepreneuriat (->2011)" | ///
cours == "Essentials of Investments (->2014)" | ///
cours == "Ethique et Marketing" | ///
cours == "Etudes Marketing (->2010)" | ///
cours == "Finance d'entreprise (->2009)" | ///
cours == "Finance d'entreprise (->2010)" | ///
cours == "Finance d'entreprise (->2013)" | ///
cours == "Finance d'entreprise (->2014)" | ///
cours == "Finance d'entreprise et finance empirique (->2011)" | ///
cours == "Finance des march�s (->2009)" | ///
cours == "Finance des march�s (->2012)" | ///
cours == "Finance des march�s (->2014)" | ///
cours == "Finances publiques" | ///
cours == "Fiscalit� (->2014)" | ///
cours == "Fondements psychologiques d'�conomie (->2012)" | ///
cours == "Fondements psychologiques d'�conomie (->2014)" | ///
cours == "GRH: de la Pratique � la Th�orie (->2011)" | ///
cours == "Gestion de projets" | ///
cours == "Gestion des Ressources Humaines: Th�orie et Pratique" | ///
cours == "Gestion des op�rations II (->2012)" | ///
cours == "Gestion des ressources humaines (->2011)" | ///
cours == "Histoire de la pens�e �conomique" | ///
cours == "Histoire de la pens�e �conomique (->2014)" | ///
cours == "Human Branding" | ///
cours == "Industrial Organization (BSc)" | ///
cours == "Integrated Marketing Communication" | ///
cours == "International Development (->2010)" | ///
cours == "Introduction au syst�me d'assurances sociales en Suisse (->2014)" | ///
cours == "Introduction to Supply Chain Management (->2010)" | ///
cours == "Introduction � l'�thique des affaires" | ///
cours == "Introduction � l'�thique des affaires (->2010)" | ///
cours == "Introduction � la gestion immobili�re" | ///
cours == "Introduction � la gestion immobili�re (->2013)" | ///
cours == "Introduction � la logique" | ///
cours == "Introduction � la logique I (->2012)" | ///
cours == "Introduction � la logique II (->2012)" | ///
cours == "Judgment and Decision Making" | ///
cours == "L'�criture strat�gique (->2014)" | ///
cours == "La banque priv�e en pratique" | ///
cours == "La pr�voyance professionnelle suisse" | ///
cours == "La pr�voyance professionnelle suisse (->2012)" | ///
cours == "Les essentiels et la bo�te � outils du futur entrepreneur" | ///
cours == "Les essentiels et la bo�te � outils du futur entrepreneur (->2014)" | ///
cours == "Macro�conomie II" | ///
cours == "Macro�conomie Quantitative" | ///
cours == "Management Control and Management Control Systems" | ///
cours == "Management Control and Management Control Systems (->2013)" | ///
cours == "Management des forces de vente" | ///
cours == "Management et marketing des services (->2009)" | ///
cours == "Manufacturing History (->2010)" | ///
cours == "Marketing Communication (->2012)" | ///
cours == "Marketing Research" | ///
cours == "Marketing Research (->2011)" | ///
cours == "Marketing des Services (->2013)" | ///
cours == "Marketing industriel" | ///
cours == "Marketing industriel (->2012)" | ///
cours == "Marketing strat�gique" | ///
cours == "Math�matiques de la finance" | ///
cours == "Math�matiques de la finance (->2010)" | ///
cours == "Microeconomics II" | ///
cours == "Micro�conomie II (->2009)" | ///
cours == "Micro�conomie appliqu�e : concurrence et d�r�glementation" | ///
cours == "Mondialisation et d�veloppement (->2014)" | ///
cours == "Monnaie et finance internationales (->2011)" | ///
cours == "Monnaie et finance internationales (->2014)" | ///
cours == "M�thodes Empiriques en Management et en Economie" | ///
cours == "Neurosciences et prise de d�cision" | ///
cours == "New product and service development" | ///
cours == "Operations Strategy (->2012)" | ///
cours == "Organisation Industrielle (->2014)" | ///
cours == "Personal Development" | ///
cours == "Personal Development (->02.2013)" | ///
cours == "Persuasion et communication (->2012)" | ///
cours == "Persuasion et communication - printemps - orientation sur la rh�torique (->2014)" | ///
cours == "Practical Operations Management" | ///
cours == "Principes de politique d'entreprise" | ///
cours == "Processus and services SI (->2011)" | ///
cours == "Processus et services SI (->2010)" | ///
cours == "Programmation par objets" | ///
cours == "Programmation par objets (->2012)" | ///
cours == "Programmation par objets (->2013)" | ///
cours == "Pr�vention et gestion des conflits juridiques" | ///
cours == "Psychological Foundations of Economics (->2010)" | ///
cours == "Rapport de stage I (->2010)" | ///
cours == "Risque et assurance (->2009)" | ///
cours == "Seminar : Real Estate Management (->2012)" | ///
cours == "Services Marketing (->2011)" | ///
cours == "Services Marketing (->2014)" | ///
cours == "Stage de management (->2015)" | ///
cours == "Statistics and Econometrics II" | ///
cours == "Strategic Marketing (online) (->2012)" | ///
cours == "S�minaire de politique macro�conomique (->2011)" | ///
cours == "S�minaire: Analyse de la d�cision appliqu�e" | ///
cours == "S�minaire: Jugement et prise de d�cision" | ///
cours == "S�minaire: La gestion immobili�re en pratique" | ///
cours == "S�minaire: La gestion immobili�re en pratique (->2013)" | ///
cours == "Th�orie des jeux (->2009)" | ///
cours == "Th�orie et politique mon�taires" | ///
cours == "Th�orie et politique mon�taires I (->2012)" | ///
cours == "Th�orie et politique mon�taires II (->2009)" | ///
cours == "Valorisation d'entreprise"

gen canton = .
replace canton = 1 if ///
matu_ecole == "'Aargauische Kantonsschule Baden" | ///
matu_ecole == "Alte Kantonsschule Aarau"
replace canton = 4 if ///
matu_ecole == "Regionales Gymnasium Laufental-Thierstein, Laufen"
replace canton = 5 if ///
matu_ecole == "Gymnasium am M�nsterplatz, Basel"
replace canton = 6 if ///
matu_ecole == "Bern-Neufeld, Wirtschaftsgymnasium" | ///
matu_ecole == "Gymnase Fran�ais, Bienne" | ///
matu_ecole == "Gymnasium Alpenstrasse / Gymn. rue des Alpes, Biel" | ///
matu_ecole == "Gymnasium Burgdorf" | ///
matu_ecole == "Gymnasium Kirchenfeld, Bern" | ///
matu_ecole == "Gymnasium K�niz-Lerbermatt" | ///
matu_ecole == "Gymnasium Oberaargau, Langenthal" | ///
matu_ecole == "Gymnasium Thun-Schadau" | ///
matu_ecole == "Gymnasium Thun-Seefeld" | ///
matu_ecole == "Seeland Gymnasium, Biel-Bienne"
replace canton = 7 if ///
matu_ecole == "Coll�ge St.-Michel / Koll. St.Michael, Fribourg" | ///
matu_ecole == "Coll�ge Ste-Croix / Gymn. Heiligkreuz, Fribourg" | ///
matu_ecole == "Coll�ge de Gambach, Fribourg" | ///
matu_ecole == "Coll�ge du Sud, Bulle" | ///
matu_ecole == "Institut La Gruy�re, Gruy�res"
replace canton = 8 if ///
matu_ecole == "Coll�ge Calvin, Gen�ve" | ///
matu_ecole == "Coll�ge Clapar�de, Conches" | ///
matu_ecole == "Coll�ge Rousseau, Gen�ve" | ///
matu_ecole == "Coll�ge Sismondi, Gen�ve" | ///
matu_ecole == "Coll�ge Voltaire, Gen�ve" | ///
matu_ecole == "Coll�ge de Candolle, Gen�ve" | ///
matu_ecole == "Coll�ge de Saussure, Petit-Lancy" | ///
matu_ecole == "Coll�ge de Sta�l, Gen�ve" | ///
matu_ecole == "Coll�ge du L�man, Versoix" | ///
matu_ecole == "Coll�ge et Ecole de Comm. Andr�-Chavanne, Gen�ve" | ///
matu_ecole == "Coll�ge et Ecole de Comm. Emilie-Gourd, Gen�ve" | ///
matu_ecole == "Coll�ge et Ecole de Comm. Nicolas Bouvier, Gen�ve" | ///
matu_ecole == "Coll�ge pour adultes Alice-Rivaz, Gen�ve" | ///
matu_ecole == "EPSU (Ecole de pr�paration et soutien universitair" | ///
matu_ecole == "Ecole Bilingue, Gen�ve, Nyon, Ch�ne-Bougeries" | ///
matu_ecole == "Ecole B�n�dict, Gen�ve" | ///
matu_ecole == "Ecole Internationale, Gen�ve" | ///
matu_ecole == "Institut Florimont, Petit-Lancy" | ///
matu_ecole == "Nouvelle Ecole Moser, Ch�ne-Bougeries"
replace canton = 10 if ///
matu_ecole == "Klosterschule Disentis/Must�r"
replace canton = 11 if ///
matu_ecole == "Coll�ge-Lyc�e St-Charles, Porrentruy" | ///
matu_ecole == "Lycee cantonal et Ecole sup�rieure de commerce, Po"
replace canton = 12 if ///
matu_ecole == "Kantonsschule Luzern"
replace canton = 13 if ///
matu_ecole == "Lycee Blaise-Cendrars, La-Chaux-de-Fonds" | ///
matu_ecole == "Lycee Denis-de-Rougemont, Neuch�tel" | ///
matu_ecole == "Lycee Jean-Piaget, Neuch�tel"
replace canton = 15 if ///
matu_ecole == "Stiftung Schweiz. Sportmittelschule Engelberg"
replace canton = 16 if ///
matu_ecole == "Kantonsschule am Burggraben, St.Gallen"
replace canton = 17 if ///
matu_ecole == "Kantonsschule Schaffhausen"
replace canton = 18 if ///
matu_ecole == "Kantonsschule/Kollegium - Kfm.Berufsschule, Schwyz"
replace canton = 20 if ///
matu_ecole == "Kantonsschule Romanshorn"
replace canton = 21 if ///
matu_ecole == "Collegio Papio, Ascona" | ///
matu_ecole == "Liceo Galileo Galilei S.A., Paradiso" | ///
matu_ecole == "Liceo Sant'Anna, Lugano" | ///
matu_ecole == "Liceo cantonale, Bellinzona" | ///
matu_ecole == "Liceo cantonale, Locarno" | ///
matu_ecole == "Liceo cantonale, Mendrisio" | ///
matu_ecole == "Liceo di Lugano 1, Lugano" | ///
matu_ecole == "Liceo di Lugano 2, Savosa" | ///
matu_ecole == "Scuola cant. di commercio, Bellinzona"
replace canton = 22 if ///
matu_ecole == "Kantonale Mittelschule Uri, Altdorf"
replace canton = 23 if ///
matu_ecole == "Centre de formation Nemesis, Monthey" | ///
matu_ecole == "Coll�ge de l'Abbaye, Saint-Maurice" | ///
matu_ecole == "Ecole Ardevaz, Sion" | ///
matu_ecole == "Ecole sup�rieure de commerce, Sion" | ///
matu_ecole == "Kollegium Spiritus Sanctus, Brig" | ///
matu_ecole == "Lehrerseminar, Institut St.Ursula, Brig" | ///
matu_ecole == "Les Nouveaux Buissonets, Sierre" | ///
matu_ecole == "Lycee-Coll�ge de La Planta, Sion" | ///
matu_ecole == "Lycee-Coll�ge des Creusets, Sion" | ///
matu_ecole == "Lyc�e Coll�ge 'Le Chablais', Monthey"
replace canton = 24 if ///
matu_ecole == "Coll�ge Champittet, Pully" | ///
matu_ecole == "Coll�ge Pierre Viret, Lausanne" | ///
matu_ecole == "Ec. nouvelle de la Suisse Romande, Lausanne" | ///
matu_ecole == "Ecole Le Cap, Lausanne" | ///
matu_ecole == "Ecole Lemania, Lausanne" | ///
matu_ecole == "Ecole Moser, Nyon" | ///
matu_ecole == "Ecole Roche, Lausanne" | ///
matu_ecole == "Ecole des Arches, Lausanne" | ///
matu_ecole == "Ecole du Flon, Lausanne" | ///
matu_ecole == "Ecole internat. La Ch�taigneraie, Founex" | ///
matu_ecole == "Gymnase Auguste-Piccard, Lausanne" | ///
matu_ecole == "Gymnase Provence, Lausanne" | ///
matu_ecole == "Gymnase d'Yverdon, Cheseaux-Noreaz" | ///
matu_ecole == "Gymnase de Beaulieu, Lausanne" | ///
matu_ecole == "Gymnase de Burier, La Tour-de-Peilz" | ///
matu_ecole == "Gymnase de Chamblandes, Pully" | ///
matu_ecole == "Gymnase de Morges, Morges" | ///
matu_ecole == "Gymnase de Nyon, Nyon" | ///
matu_ecole == "Gymnase de la Cit� Lausanne" | ///
matu_ecole == "Gymnase du Bugnon, Lausanne" | ///
matu_ecole == "Gymnase du soir, Lausanne" | ///
matu_ecole == "Gymnase intercantonale de la Broye, Payerne" | ///
matu_ecole == "Institut Cath. Mont-Olivet, Lausanne" | ///
matu_ecole == "Institut Gamma, Lausanne" | ///
matu_ecole == "PREP, Lausanne"
replace canton = 25 if ///
matu_ecole == "Kantonsschule Zug"
replace canton = 26 if ///
matu_ecole == "Kantonsschule Hohe Promenade, Z�rich" | ///
matu_ecole == "Kantonsschule Hottingen, Z�rich" | ///
matu_ecole == "Kantonsschule Rychenberg, Winterthur" | ///
matu_ecole == "Kantonsschule Z�rcher Oberland, Wetzikon" | ///
matu_ecole == "Kantonsschule Z�rich-Oerlikon"
replace canton = . if ///
matu_ecole == "Autre �cole" | ///
matu_ecole == "Ecole suisse non codifi�e" | ///
matu_ecole == "Ecole �trang�re" | ///
matu_ecole == "Schweizerschule, Bogota / Ecole suisse, Bogota" | ///
matu_ecole == "Selbststudium / Autodidacte"


cleanchars, in("�") out("e")  vlab vval 
cleanchars, in("�") out("e")  vlab vval 
cleanchars, in("�") out("a")  vlab vval 
cleanchars, in("�") out("u")  vlab vval 


/*
** gen legal_year
gen legal_year = .
gen duration = fin - debut

egen last_year = max(year), by(ID)


replace legal_year = debut + year
replace legal_year = debut + year - 1 if duration == last_year
*/


save "db.dta", replace
