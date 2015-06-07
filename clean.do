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
drop if etat != "Réussi(e)"
collapse (first) moyenne fin sexe, by(ID)
collapse (mean) moyenne, by(sexe  fin)

restore
*/


gen sci = .
replace sci = 0 if ///
cours == "Applied Organizational Behavior and Management I (->2013)" | ///
cours == "Approche générale du management" | ///
cours == "Aspects juridiques du financement d'entreprise" | ///
cours == "Asset Management: Théorie et Pratique (->2014)" | ///
cours == "Atelier entrepreneuriat et si on essayait ..." | ///
cours == "Business English" | ///
cours == "Business Processes and Information Systems" | ///
cours == "Commerce (->2013)" | ///
cours == "Commerce international et intégration européenne (->2014)" | ///
cours == "Communication marketing (->2010)" | ///
cours == "Communication, rédaction et rhétorique (->2010)" | ///
cours == "Comportement Organisationnel et Management Appliqué (->2014)" | ///
cours == "Comportement Organisationnel et Management Appliqués (->2009)" | ///
cours == "Comportement Organisationnel et Management Appliqués I (->2010)" | ///
cours == "Comportement Organisationnel et Management Appliqués II (->2010)" | ///
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
cours == "Droit des sociétés" | ///
cours == "Droit des sociétés : partie générale (->2013)" | ///
cours == "Développement International (->2009)" | ///
cours == "Développement de nouveaux produits (->2012)" | ///
cours == "Développement de nouveaux produits (->2014)" | ///
cours == "Economie internationale du tourisme (->2010)" | ///
cours == "Economie internationale du tourisme (->2013)" | ///
cours == "Ecriture et accroche (->2013)" | ///
cours == "Entrepreneuriat (->2011)" | ///
cours == "Ethique et Marketing" | ///
cours == "GRH: de la Pratique à la Théorie (->2011)" | ///
cours == "Gestion de projets" | ///
cours == "Gestion des Ressources Humaines: Théorie et Pratique" | ///
cours == "Gestion des ressources humaines (->2011)" | ///
cours == "Histoire de la pensée économique" | ///
cours == "Histoire de la pensée économique (->2014)" | ///
cours == "Human Branding" | ///
cours == "Integrated Marketing Communication" | ///
cours == "International Development (->2010)" | ///
cours == "Introduction au droit de l'entreprise (->2010)" | ///
cours == "Introduction au système d'assurances sociales en Suisse (->2014)" | ///
cours == "Introduction à l'éthique des affaires" | ///
cours == "Introduction à l'éthique des affaires (->2010)" | ///
cours == "Introduction à la gestion immobilière" | ///
cours == "Introduction à la gestion immobilière (->2013)" | ///
cours == "Judgment and Decision Making" | ///
cours == "L'écriture stratégique (->2014)" | ///
cours == "La banque privée en pratique" | ///
cours == "La prévoyance professionnelle suisse" | ///
cours == "La prévoyance professionnelle suisse (->2012)" | ///
cours == "Le droit de l'entreprise, partie générale" | ///
cours == "Le droit de l'entreprise, partie spéciale" | ///
cours == "Les essentiels et la boîte à outils du futur entrepreneur" | ///
cours == "Les essentiels et la boîte à outils du futur entrepreneur (->2014)" | ///
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
cours == "Marketing stratégique" | ///
cours == "Mondialisation et développement (->2014)" | ///
cours == "Monnaie et finance internationales (->2011)" | ///
cours == "Monnaie et finance internationales (->2014)" | ///
cours == "New product and service development" | ///
cours == "Personal Development" | ///
cours == "Personal Development (->02.2013)" | ///
cours == "Persuasion et communication (->2012)" | ///
cours == "Persuasion et communication - printemps - orientation sur la rhétorique (->2014)" | ///
cours == "Principes de marketing" | ///
cours == "Principes de politique d'entreprise" | ///
cours == "Processus and services SI (->2011)" | ///
cours == "Processus et services SI (->2010)" | ///
cours == "Prévention et gestion des conflits juridiques" | ///
cours == "Seminar : Real Estate Management (->2012)" | ///
cours == "Services Marketing (->2011)" | ///
cours == "Services Marketing (->2014)" | ///
cours == "Strategic Marketing (online) (->2012)" | ///
cours == "Systèmes d'information" | ///
cours == "Systèmes d'information (->2012)" | ///
cours == "Séminaire: Jugement et prise de décision" | ///
cours == "Séminaire: La gestion immobilière en pratique" | ///
cours == "Séminaire: La gestion immobilière en pratique (->2013)"
replace sci = 1 if ///
cours == "Analyse de la décision" | ///
cours == "Analyse économique : macroéconomie" | ///
cours == "Analyse économique : microéconomie" | ///
cours == "Applied Operations Management (->2012)" | ///
cours == "Economie politique (->2010)" | ///
cours == "Economie politique I" | ///
cours == "Economie politique II" | ///
cours == "Eléments de programmation (->2011)" | ///
cours == "Eléments de programmation (10-11)" | ///
cours == "Eléments de programmation (2014)" | ///
cours == "Essentials of Investments (->2014)" | ///
cours == "Finance d'entreprise (->2009)" | ///
cours == "Finance d'entreprise (->2010)" | ///
cours == "Finance d'entreprise (->2013)" | ///
cours == "Finance d'entreprise (->2014)" | ///
cours == "Finance d'entreprise et finance empirique (->2011)" | ///
cours == "Finance des marchés (->2009)" | ///
cours == "Finance des marchés (->2012)" | ///
cours == "Finance des marchés (->2014)" | ///
cours == "Finances publiques" | ///
cours == "Fondements psychologiques d'économie (->2012)" | ///
cours == "Fondements psychologiques d'économie (->2014)" | ///
cours == "Gestion des opérations I" | ///
cours == "Gestion des opérations II (->2012)" | ///
cours == "Gestion du risque (->2014)" | ///
cours == "Industrial Organization (BSc)" | ///
cours == "Introduction to Supply Chain Management (->2010)" | ///
cours == "Introduction à la logique" | ///
cours == "Introduction à la logique I (->2012)" | ///
cours == "Introduction à la logique II (->2012)" | ///
cours == "Macroéconomie II" | ///
cours == "Macroéconomie Quantitative" | ///
cours == "Mathématiques (->2010)" | ///
cours == "Mathématiques I" | ///
cours == "Mathématiques II" | ///
cours == "Mathématiques de la finance" | ///
cours == "Mathématiques de la finance (->2010)" | ///
cours == "Microeconomics II" | ///
cours == "Microéconomie II (->2009)" | ///
cours == "Microéconomie appliquée : concurrence et déréglementation" | ///
cours == "Modèles informatiques" | ///
cours == "Modèles informatiques (->2011)" | ///
cours == "Modèles informatiques (10-11)" | ///
cours == "Modèles informatiques (2014)" | ///
cours == "Méthodes Empiriques en Management et en Economie" | ///
cours == "Notions et principes généraux de l'informatique (->2010)" | ///
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
cours == "Statistique et économétrie I" | ///
cours == "Statistique et économétrie I (->2014)" | ///
cours == "Statistique et économétrie II (->2013)" | ///
cours == "Statistique et économétrie appliquées: introduction" | ///
cours == "Séminaire de politique macroéconomique (->2011)" | ///
cours == "Séminaire: Analyse de la décision appliquée" | ///
cours == "Théorie des jeux (->2009)" | ///
cours == "Théorie et politique monétaires" | ///
cours == "Théorie et politique monétaires I (->2012)" | ///
cours == "Théorie et politique monétaires II (->2009)"
replace sci = 2 if ///
cours == "Centenaire HEC I (->2011)" | ///
cours == "Centenaire HEC II (->2011)" | ///
cours == "Comptabilité financière I" | ///
cours == "Comptabilité financière II" | ///
cours == "Comptabilité financière approfondie" | ///
cours == "Comptabilité financière approfondie (->2011)" | ///
cours == "Comptes de groupe et contrôle externe" | ///
cours == "Comptes de groupe et contrôle externe (->2014)" | ///
cours == "Contrôle interne (->2014)" | ///
cours == "Cours de clôture: Jeu d'Entreprise ERPSim" | ///
cours == "Entrepreneurial finance and the new venture funding process (->2014)" | ///
cours == "Etudes Marketing (->2010)" | ///
cours == "Fiscalité (->2014)" | ///
cours == "Neurosciences et prise de décision" | ///
cours == "Principes de comptabilité et de gestion (->2010)" | ///
cours == "Rapport de stage I (->2010)" | ///
cours == "Risque et assurance (->2009)" | ///
cours == "Stage de management (->2015)" | ///
cours == "Valorisation d'entreprise" | ///
cours == "Venture Challenge"
gen year = .

replace year = 1 if ///
cours == "Approche générale du management" | ///
cours == "Comptabilité financière I" | ///
cours == "Comptabilité financière II" | ///
cours == "Economie politique (->2010)" | ///
cours == "Economie politique I" | ///
cours == "Eléments de programmation (->2011)" | ///
cours == "Eléments de programmation (10-11)" | ///
cours == "Eléments de programmation (2014)" | ///
cours == "Introduction au droit de l'entreprise (->2010)" | ///
cours == "Le droit de l'entreprise, partie générale" | ///
cours == "Le droit de l'entreprise, partie spéciale" | ///
cours == "Mathématiques (->2010)" | ///
cours == "Mathématiques I" | ///
cours == "Mathématiques II" | ///
cours == "Modèles informatiques" | ///
cours == "Modèles informatiques (->2011)" | ///
cours == "Modèles informatiques (10-11)" | ///
cours == "Modèles informatiques (2014)" | ///
cours == "Notions et principes généraux de l'informatique (->2010)" | ///
cours == "Principes de comptabilité et de gestion (->2010)" | ///
cours == "Statistique (->2010)" | ///
cours == "Statistique I" | ///
cours == "Statistique II"
replace year = 2 if ///
cours == "Analyse de la décision" | ///
cours == "Analyse économique : macroéconomie" | ///
cours == "Analyse économique : microéconomie" | ///
cours == "Business English" | ///
cours == "Comportement organisationnel" | ///
cours == "Comptes de groupe et contrôle externe" | ///
cours == "Comptes de groupe et contrôle externe (->2014)" | ///
cours == "Contrôle interne (->2014)" | ///
cours == "Droit des affaires I" | ///
cours == "Economie politique II" | ///
cours == "Gestion des opérations I" | ///
cours == "Gestion du risque (->2014)" | ///
cours == "Principes de finance" | ///
cours == "Principes de marketing" | ///
cours == "Statistique et économétrie I" | ///
cours == "Statistique et économétrie I (->2014)" | ///
cours == "Statistique et économétrie II (->2013)" | ///
cours == "Statistique et économétrie appliquées: introduction" | ///
cours == "Systèmes d'information" | ///
cours == "Systèmes d'information (->2012)"
replace year = 3 if ///
cours == "Applied Operations Management (->2012)" | ///
cours == "Applied Organizational Behavior and Management I (->2013)" | ///
cours == "Aspects juridiques du financement d'entreprise" | ///
cours == "Asset Management: Théorie et Pratique (->2014)" | ///
cours == "Atelier entrepreneuriat et si on essayait ..." | ///
cours == "Business Processes and Information Systems" | ///
cours == "Centenaire HEC I (->2011)" | ///
cours == "Centenaire HEC II (->2011)" | ///
cours == "Commerce (->2013)" | ///
cours == "Commerce international et intégration européenne (->2014)" | ///
cours == "Communication marketing (->2010)" | ///
cours == "Communication, rédaction et rhétorique (->2010)" | ///
cours == "Comportement Organisationnel et Management Appliqué (->2014)" | ///
cours == "Comportement Organisationnel et Management Appliqués (->2009)" | ///
cours == "Comportement Organisationnel et Management Appliqués I (->2010)" | ///
cours == "Comportement Organisationnel et Management Appliqués II (->2010)" | ///
cours == "Comportement du consommateur (->2012)" | ///
cours == "Comportement du consommateur (->2013)" | ///
cours == "Comptabilité financière approfondie" | ///
cours == "Comptabilité financière approfondie (->2011)" | ///
cours == "Consumer Behavior (->2014)" | ///
cours == "Corporate sustainability: The environmental perspective" | ///
cours == "Cours IDHEAP : Management du sport (->2010)" | ///
cours == "Cours IDHEAP : Management du sport - SOMIT- (->2010)" | ///
cours == "Cours de clôture: Jeu d'Entreprise ERPSim" | ///
cours == "Cyberespace et Internet" | ///
cours == "Doing business in emerging markets : enseignement (->2014)" | ///
cours == "Doing business in emerging markets: voyage (->2012)" | ///
cours == "Doing business in emerging markets: voyage (->2014)" | ///
cours == "Dramaturgie pour le monde professionnel" | ///
cours == "Droit des affaires II" | ///
cours == "Droit des sociétés" | ///
cours == "Droit des sociétés : partie générale (->2013)" | ///
cours == "Développement International (->2009)" | ///
cours == "Développement de nouveaux produits (->2012)" | ///
cours == "Développement de nouveaux produits (->2014)" | ///
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
cours == "Finance des marchés (->2009)" | ///
cours == "Finance des marchés (->2012)" | ///
cours == "Finance des marchés (->2014)" | ///
cours == "Finances publiques" | ///
cours == "Fiscalité (->2014)" | ///
cours == "Fondements psychologiques d'économie (->2012)" | ///
cours == "Fondements psychologiques d'économie (->2014)" | ///
cours == "GRH: de la Pratique à la Théorie (->2011)" | ///
cours == "Gestion de projets" | ///
cours == "Gestion des Ressources Humaines: Théorie et Pratique" | ///
cours == "Gestion des opérations II (->2012)" | ///
cours == "Gestion des ressources humaines (->2011)" | ///
cours == "Histoire de la pensée économique" | ///
cours == "Histoire de la pensée économique (->2014)" | ///
cours == "Human Branding" | ///
cours == "Industrial Organization (BSc)" | ///
cours == "Integrated Marketing Communication" | ///
cours == "International Development (->2010)" | ///
cours == "Introduction au système d'assurances sociales en Suisse (->2014)" | ///
cours == "Introduction to Supply Chain Management (->2010)" | ///
cours == "Introduction à l'éthique des affaires" | ///
cours == "Introduction à l'éthique des affaires (->2010)" | ///
cours == "Introduction à la gestion immobilière" | ///
cours == "Introduction à la gestion immobilière (->2013)" | ///
cours == "Introduction à la logique" | ///
cours == "Introduction à la logique I (->2012)" | ///
cours == "Introduction à la logique II (->2012)" | ///
cours == "Judgment and Decision Making" | ///
cours == "L'écriture stratégique (->2014)" | ///
cours == "La banque privée en pratique" | ///
cours == "La prévoyance professionnelle suisse" | ///
cours == "La prévoyance professionnelle suisse (->2012)" | ///
cours == "Les essentiels et la boîte à outils du futur entrepreneur" | ///
cours == "Les essentiels et la boîte à outils du futur entrepreneur (->2014)" | ///
cours == "Macroéconomie II" | ///
cours == "Macroéconomie Quantitative" | ///
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
cours == "Marketing stratégique" | ///
cours == "Mathématiques de la finance" | ///
cours == "Mathématiques de la finance (->2010)" | ///
cours == "Microeconomics II" | ///
cours == "Microéconomie II (->2009)" | ///
cours == "Microéconomie appliquée : concurrence et déréglementation" | ///
cours == "Mondialisation et développement (->2014)" | ///
cours == "Monnaie et finance internationales (->2011)" | ///
cours == "Monnaie et finance internationales (->2014)" | ///
cours == "Méthodes Empiriques en Management et en Economie" | ///
cours == "Neurosciences et prise de décision" | ///
cours == "New product and service development" | ///
cours == "Operations Strategy (->2012)" | ///
cours == "Organisation Industrielle (->2014)" | ///
cours == "Personal Development" | ///
cours == "Personal Development (->02.2013)" | ///
cours == "Persuasion et communication (->2012)" | ///
cours == "Persuasion et communication - printemps - orientation sur la rhétorique (->2014)" | ///
cours == "Practical Operations Management" | ///
cours == "Principes de politique d'entreprise" | ///
cours == "Processus and services SI (->2011)" | ///
cours == "Processus et services SI (->2010)" | ///
cours == "Programmation par objets" | ///
cours == "Programmation par objets (->2012)" | ///
cours == "Programmation par objets (->2013)" | ///
cours == "Prévention et gestion des conflits juridiques" | ///
cours == "Psychological Foundations of Economics (->2010)" | ///
cours == "Rapport de stage I (->2010)" | ///
cours == "Risque et assurance (->2009)" | ///
cours == "Seminar : Real Estate Management (->2012)" | ///
cours == "Services Marketing (->2011)" | ///
cours == "Services Marketing (->2014)" | ///
cours == "Stage de management (->2015)" | ///
cours == "Statistics and Econometrics II" | ///
cours == "Strategic Marketing (online) (->2012)" | ///
cours == "Séminaire de politique macroéconomique (->2011)" | ///
cours == "Séminaire: Analyse de la décision appliquée" | ///
cours == "Séminaire: Jugement et prise de décision" | ///
cours == "Séminaire: La gestion immobilière en pratique" | ///
cours == "Séminaire: La gestion immobilière en pratique (->2013)" | ///
cours == "Théorie des jeux (->2009)" | ///
cours == "Théorie et politique monétaires" | ///
cours == "Théorie et politique monétaires I (->2012)" | ///
cours == "Théorie et politique monétaires II (->2009)" | ///
cours == "Valorisation d'entreprise"

gen canton = .
replace canton = 1 if ///
matu_ecole == "'Aargauische Kantonsschule Baden" | ///
matu_ecole == "Alte Kantonsschule Aarau"
replace canton = 4 if ///
matu_ecole == "Regionales Gymnasium Laufental-Thierstein, Laufen"
replace canton = 5 if ///
matu_ecole == "Gymnasium am Münsterplatz, Basel"
replace canton = 6 if ///
matu_ecole == "Bern-Neufeld, Wirtschaftsgymnasium" | ///
matu_ecole == "Gymnase Français, Bienne" | ///
matu_ecole == "Gymnasium Alpenstrasse / Gymn. rue des Alpes, Biel" | ///
matu_ecole == "Gymnasium Burgdorf" | ///
matu_ecole == "Gymnasium Kirchenfeld, Bern" | ///
matu_ecole == "Gymnasium Köniz-Lerbermatt" | ///
matu_ecole == "Gymnasium Oberaargau, Langenthal" | ///
matu_ecole == "Gymnasium Thun-Schadau" | ///
matu_ecole == "Gymnasium Thun-Seefeld" | ///
matu_ecole == "Seeland Gymnasium, Biel-Bienne"
replace canton = 7 if ///
matu_ecole == "Collège St.-Michel / Koll. St.Michael, Fribourg" | ///
matu_ecole == "Collège Ste-Croix / Gymn. Heiligkreuz, Fribourg" | ///
matu_ecole == "Collège de Gambach, Fribourg" | ///
matu_ecole == "Collège du Sud, Bulle" | ///
matu_ecole == "Institut La Gruyère, Gruyères"
replace canton = 8 if ///
matu_ecole == "Collège Calvin, Genève" | ///
matu_ecole == "Collège Claparède, Conches" | ///
matu_ecole == "Collège Rousseau, Genève" | ///
matu_ecole == "Collège Sismondi, Genève" | ///
matu_ecole == "Collège Voltaire, Genève" | ///
matu_ecole == "Collège de Candolle, Genève" | ///
matu_ecole == "Collège de Saussure, Petit-Lancy" | ///
matu_ecole == "Collège de Staël, Genève" | ///
matu_ecole == "Collège du Léman, Versoix" | ///
matu_ecole == "Collège et Ecole de Comm. André-Chavanne, Genève" | ///
matu_ecole == "Collège et Ecole de Comm. Emilie-Gourd, Genève" | ///
matu_ecole == "Collège et Ecole de Comm. Nicolas Bouvier, Genève" | ///
matu_ecole == "Collège pour adultes Alice-Rivaz, Genève" | ///
matu_ecole == "EPSU (Ecole de préparation et soutien universitair" | ///
matu_ecole == "Ecole Bilingue, Genève, Nyon, Chêne-Bougeries" | ///
matu_ecole == "Ecole Bénédict, Genève" | ///
matu_ecole == "Ecole Internationale, Genève" | ///
matu_ecole == "Institut Florimont, Petit-Lancy" | ///
matu_ecole == "Nouvelle Ecole Moser, Chêne-Bougeries"
replace canton = 10 if ///
matu_ecole == "Klosterschule Disentis/Mustér"
replace canton = 11 if ///
matu_ecole == "Collège-Lycée St-Charles, Porrentruy" | ///
matu_ecole == "Lycee cantonal et Ecole supérieure de commerce, Po"
replace canton = 12 if ///
matu_ecole == "Kantonsschule Luzern"
replace canton = 13 if ///
matu_ecole == "Lycee Blaise-Cendrars, La-Chaux-de-Fonds" | ///
matu_ecole == "Lycee Denis-de-Rougemont, Neuchâtel" | ///
matu_ecole == "Lycee Jean-Piaget, Neuchâtel"
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
matu_ecole == "Collège de l'Abbaye, Saint-Maurice" | ///
matu_ecole == "Ecole Ardevaz, Sion" | ///
matu_ecole == "Ecole supérieure de commerce, Sion" | ///
matu_ecole == "Kollegium Spiritus Sanctus, Brig" | ///
matu_ecole == "Lehrerseminar, Institut St.Ursula, Brig" | ///
matu_ecole == "Les Nouveaux Buissonets, Sierre" | ///
matu_ecole == "Lycee-Collège de La Planta, Sion" | ///
matu_ecole == "Lycee-Collège des Creusets, Sion" | ///
matu_ecole == "Lycée Collège 'Le Chablais', Monthey"
replace canton = 24 if ///
matu_ecole == "Collège Champittet, Pully" | ///
matu_ecole == "Collège Pierre Viret, Lausanne" | ///
matu_ecole == "Ec. nouvelle de la Suisse Romande, Lausanne" | ///
matu_ecole == "Ecole Le Cap, Lausanne" | ///
matu_ecole == "Ecole Lemania, Lausanne" | ///
matu_ecole == "Ecole Moser, Nyon" | ///
matu_ecole == "Ecole Roche, Lausanne" | ///
matu_ecole == "Ecole des Arches, Lausanne" | ///
matu_ecole == "Ecole du Flon, Lausanne" | ///
matu_ecole == "Ecole internat. La Châtaigneraie, Founex" | ///
matu_ecole == "Gymnase Auguste-Piccard, Lausanne" | ///
matu_ecole == "Gymnase Provence, Lausanne" | ///
matu_ecole == "Gymnase d'Yverdon, Cheseaux-Noreaz" | ///
matu_ecole == "Gymnase de Beaulieu, Lausanne" | ///
matu_ecole == "Gymnase de Burier, La Tour-de-Peilz" | ///
matu_ecole == "Gymnase de Chamblandes, Pully" | ///
matu_ecole == "Gymnase de Morges, Morges" | ///
matu_ecole == "Gymnase de Nyon, Nyon" | ///
matu_ecole == "Gymnase de la Cité Lausanne" | ///
matu_ecole == "Gymnase du Bugnon, Lausanne" | ///
matu_ecole == "Gymnase du soir, Lausanne" | ///
matu_ecole == "Gymnase intercantonale de la Broye, Payerne" | ///
matu_ecole == "Institut Cath. Mont-Olivet, Lausanne" | ///
matu_ecole == "Institut Gamma, Lausanne" | ///
matu_ecole == "PREP, Lausanne"
replace canton = 25 if ///
matu_ecole == "Kantonsschule Zug"
replace canton = 26 if ///
matu_ecole == "Kantonsschule Hohe Promenade, Zürich" | ///
matu_ecole == "Kantonsschule Hottingen, Zürich" | ///
matu_ecole == "Kantonsschule Rychenberg, Winterthur" | ///
matu_ecole == "Kantonsschule Zürcher Oberland, Wetzikon" | ///
matu_ecole == "Kantonsschule Zürich-Oerlikon"
replace canton = . if ///
matu_ecole == "Autre école" | ///
matu_ecole == "Ecole suisse non codifiée" | ///
matu_ecole == "Ecole étrangère" | ///
matu_ecole == "Schweizerschule, Bogota / Ecole suisse, Bogota" | ///
matu_ecole == "Selbststudium / Autodidacte"


cleanchars, in("é") out("e")  vlab vval 
cleanchars, in("è") out("e")  vlab vval 
cleanchars, in("à") out("a")  vlab vval 
cleanchars, in("ù") out("u")  vlab vval 


/*
** gen legal_year
gen legal_year = .
gen duration = fin - debut

egen last_year = max(year), by(ID)


replace legal_year = debut + year
replace legal_year = debut + year - 1 if duration == last_year
*/


save "db.dta", replace
