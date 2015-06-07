log using "log.smcl", replace
use "/Users/Marco/Google Drive/HEC/empi/proj/db.dta", clear


//label list cours_id

** drops people 
** quantiles
egen n = count(note), by(cours legal_year)
egen i = rank(note),  by(cours legal_year) field
gen quant = 1-(i-1)/n
drop n i


** ponderated over all years
gen ponderated = CR * quant
egen summed = sum(ponderated), by(ID)
gen quant_moyenne = summed/total_CR
drop ponderated summed


*drops
//drop if total_CR < 120 //fail in first year

** ponderated grade average for first year
gen tmp_ponderated = CR * note if year == 1
gen tmp_CR = CR if year == 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen moyenne_1 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

** ponderated quant average for first year
gen tmp_ponderated = CR * quant if year == 1
gen tmp_CR = CR if year == 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen quant_1 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * quant if year == 2
gen tmp_CR = CR if year == 2
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen quant_2 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * quant if year == 3
gen tmp_CR = CR if year == 3
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen quant_3 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

//diff between course result and current year avg
gen delta = .
replace delta = quant - quant_1 if year == 1 
replace delta = quant - quant_2 if year == 2 
replace delta = quant - quant_3 if year == 3 



** PASTE GROUPS
gen tmp_ponderated = CR * delta if sci == 0 & year == 1
gen tmp_CR = CR if sci == 0 & year == 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_OTH1 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if sci == 1 & year == 1
gen tmp_CR = CR if sci == 1 & year == 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_SCI1 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if sci == 2 & year == 1
gen tmp_CR = CR if sci == 2 & year == 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_MIX1 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if (sci == 0 | sci==2) & year == 1
gen tmp_CR = CR if (sci == 0 | sci==2) & year == 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_NONSCI1 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if sci == 0 & year == 2
gen tmp_CR = CR if sci == 0 & year == 2
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_OTH2 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if sci == 1 & year == 2
gen tmp_CR = CR if sci == 1 & year == 2
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_SCI2 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if sci == 2 & year == 2
gen tmp_CR = CR if sci == 2 & year == 2
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_MIX2 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if sci == 0 & year != 1
gen tmp_CR = CR if sci == 0 & year != 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_OTH23 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if sci == 1 & year != 1
gen tmp_CR = CR if sci == 1 & year != 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_SCI23 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if sci == 2 & year != 1
gen tmp_CR = CR if sci == 2 & year != 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_MIX23 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if year == 2
gen tmp_CR = CR if year == 2
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_2 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if year == 3
gen tmp_CR = CR if year == 3
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_3 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * delta if year == 2 | year == 3
gen tmp_CR = CR if year == 2 | year == 3
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen delta_23 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * note if year == 2
gen tmp_CR = CR if year == 2
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen moyenne_2 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * note if year == 3
gen tmp_CR = CR if year == 3
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen moyenne_3 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * note if year == 2 | year == 3
gen tmp_CR = CR if year == 2 | year == 3
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen moyenne_23 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * quant if year == 2 | year == 3
gen tmp_CR = CR if year == 2 | year == 3
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen quant_23 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * quant if sci == 0 & year != 1
gen tmp_CR = CR if sci == 0 & year != 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen quant_OTH23 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * quant if sci == 1 & year != 1
gen tmp_CR = CR if sci == 1 & year != 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen quant_SCI23 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed

gen tmp_ponderated = CR * quant if sci == 2 & year != 1
gen tmp_CR = CR if sci == 2 & year != 1
egen tmp_total_CR = sum(tmp_CR) , by(ID)
egen tmp_summed = sum(tmp_ponderated), by(ID)
gen quant_MIX23 = tmp_summed/tmp_total_CR
drop tmp_ponderated tmp_CR tmp_total_CR tmp_summed
** END PASTE

** dummies

**tmp
global tmp "etat"
rename $tmp tmp
encode tmp, gen($tmp)
drop tmp

** BSc
global tmp "BSc"
rename $tmp tmp
encode tmp, gen($tmp)
drop tmp

** MSc
global tmp "MSc"
rename $tmp tmp
encode tmp, gen($tmp)
drop tmp


** matu_lieu
global tmp "matu_lieu"
rename $tmp tmp
encode tmp, gen($tmp)
drop tmp

// put every underrepresented group in 0 (others)
by ID, sort: gen nvals = _n == 1 
egen count = sum(nvals), by($tmp)
replace $tmp = 0 if count < 20
drop nvals count

** matu_ecole
global tmp "matu_ecole"
rename $tmp tmp
encode tmp, gen($tmp)
drop tmp

// put every underrepresented group in 0 (others)
by ID, sort: gen nvals = _n == 1 
egen count = sum(nvals), by($tmp)
replace $tmp = 0 if count < 20
drop nvals count


** matu_nom
global tmp "matu_nom"
rename $tmp tmp
encode tmp, gen($tmp)
drop tmp

// put every underrepresented group in 0 (others)
by ID, sort: gen nvals = _n == 1 
egen count = sum(nvals), by($tmp)
replace $tmp = 0 if count < 20
drop nvals count


preserve
	ds(ID), not
	collapse (first) `r(varlist)', by(ID)
	
	
	tab2 sexe debut
	tab2 sexe debut if etat != 3

	latabstat moyenne_1 moyenne_2 moyenne_3 moyenne, by(debut) s(mean sd) long
	latabstat moyenne_1 moyenne_2 moyenne_3 moyenne if etat !=3, by(debut) s(mean sd) long
	latabstat moyenne_1 moyenne_2 moyenne_3 moyenne if etat ==3, by(debut) s(mean sd) long
	


	reg quant_SCI23 delta_SCI1 delta_MIX1, robust
	reg quant_SCI23 delta_OTH1 delta_MIX1, robust
	
	reg quant_MIX23 delta_SCI1 delta_MIX1, robust
	reg quant_MIX23 delta_OTH1 delta_MIX1, robust
	
	reg quant_OTH23 delta_SCI1 delta_MIX1, robust
	reg quant_OTH23 delta_OTH1 delta_MIX1, robust

	gsort -moyenne
	
	
	** plot **
	replace etat = 2 if etat == 1
	collapse (mean) moyenne (sem) se = moyenne, by(debut etat)
		gen plus = moyenne + 1.96*se
		gen minus = moyenne - 1.96*se
		twoway ///
		(line moyenne debut if etat==2,sort lwidth(thick) lcolor("0 153 153")) ///
		(line moyenne debut if etat==3, sort lwidth(thick) lcolor("153 0 0")) ///
		(rcap plus minus debut, color(black)) ///
		, scheme(s2color) legend(order(1 "Failed" 2 "Graduated")) ///
		xtitle("Beginning year") ytitle("GPA")
		graph export "moyenne.eps", replace
restore

** graphs **

hist delta, saving(g0, replace)
hist delta_SCI1, saving(g1, replace)
hist delta_MIX1, saving(g2, replace)
hist delta_OTH1, saving(g3, replace)
graph combine g0.gph g1.gph g2.gph g3.gph
graph export "deltas.eps", replace
latabstat delta delta_SCI1 delta_MIX1 delta_OTH1, by(debut) s(mean sd) long

corrtex delta_OTH1 delta_OTH23 delta_SCI1 delta_SCI23 delta_MIX1 delta_MIX23, file(correlation.tex) replace
 
 
encode(cours), gen(cours_id)

** tables **

* by cours
preserve

	drop cours CR legal_year sci year
	reshape wide note delta quant, i(ID) j(cours_id)
	gen fini = etat == 3
	gen vieuxCours = debut <= 2010

	global y = "delta_SCI23"
	global x "delta_SCI1 delta_MIX1"
	global params "i.sexe ib(2010).debut"
	reg $y $x  $params, robust
	outreg2 using sci23, label replace dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_OTH1 delta_MIX1"
	reg $y $x  $params, robust
	outreg2 using sci23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_SCI1 delta_OTH1"
	reg $y $x  $params, robust
	outreg2 using sci23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_SCI1"
	reg $y $x  $params, robust
	outreg2 using sci23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_MIX1"
	reg $y $x  $params, robust
	outreg2 using sci23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_OTH1"
	reg $y $x  $params, robust
	outreg2 using sci23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)

	global y = "delta_MIX23"
	global x "delta_SCI1 delta_MIX1"
	global params "i.sexe ib(2010).debut"
	reg $y $x  $params, robust
	outreg2 using mix23, label replace dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_OTH1 delta_MIX1"
	reg $y $x  $params, robust
	outreg2 using mix23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_SCI1 delta_OTH1"
	reg $y $x  $params, robust
	outreg2 using mix23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_SCI1"
	reg $y $x  $params, robust
	outreg2 using mix23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_MIX1"
	reg $y $x  $params, robust
	outreg2 using mix23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_OTH1"
	reg $y $x  $params, robust
	outreg2 using mix23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)

	
	global y = "delta_OTH23"
	global x "delta_SCI1 delta_MIX1"
	global params "i.sexe ib(2010).debut"
	reg $y $x  $params, robust
	outreg2 using oth23, label replace dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_OTH1 delta_MIX1"
	reg $y $x  $params, robust
	outreg2 using oth23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_SCI1 delta_OTH1"
	reg $y $x  $params, robust
	outreg2 using oth23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_SCI1"
	reg $y $x  $params, robust
	outreg2 using oth23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_MIX1"
	reg $y $x  $params, robust
	outreg2 using oth23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_OTH1"
	reg $y $x  $params, robust
	outreg2 using oth23, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global y = "quant_2"
	global x "delta_SCI1 delta_MIX1"
	global params "i.sexe ib(2010).debut"
	reg $y $x  $params, robust
	outreg2 using quant2, label replace dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_OTH1 delta_MIX1"
	reg $y $x  $params, robust
	outreg2 using quant2, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_SCI1 delta_OTH1"
	reg $y $x  $params, robust
	outreg2 using quant2, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_SCI1"
	reg $y $x  $params, robust
	outreg2 using quant2, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_MIX1"
	reg $y $x  $params, robust
	outreg2 using quant2, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)
	global x "delta_OTH1"
	reg $y $x  $params, robust
	outreg2 using quant2, label append dec(3) tex(frag pr) drop(ib(2010).debut i.sexe)

	
	global x "delta_SCI1 delta_MIX1"
	global params "i.sexe ib(2010).debut"
	
	reg quant_2 $x  $params , robust
	outreg2 using results2, label replace dec(3) tex(frag pr) drop(ib(2010).debut)
	reg moyenne_2 $x $params , robust 
	outreg2 using results2, label append dec(3) tex(frag pr) drop(ib(2010).debut)
	reg quant_3 $x  $params , robust 
	outreg2 using results3, label replace dec(3) tex(frag pr) drop(ib(2010).debut)
	reg moyenne_3 $x $params , robust 
	outreg2 using results3, label append dec(3) tex(frag pr) drop(ib(2010).debut)
	

	
	global params "i.sexe ib(2010).debut"
	reg quant_2 $x  $params if vieuxCours == 1, robust 
	outreg2 using robu2, label replace dec(3) tex(frag pr) drop(ib(2010).debut)
	global params "i.sexe ib(2011).debut"
	reg quant_2 $x  $params if vieuxCours == 0, robust 
	outreg2 using robu2, label append dec(3) tex(frag pr) drop(ib(2010).debut)

	global params "i.sexe ib(2010).debut"
	reg quant_3 $x  $params if vieuxCours == 1, robust 
	outreg2 using robu3, label replace dec(3) tex(frag pr) drop(ib(2010).debut)
	global params "i.sexe ib(2011).debut"
	reg quant_3 $x  $params if vieuxCours == 0, robust 
	outreg2 using robu3, label append dec(3) tex(frag pr) drop(ib(2010).debut)
	
	global params "i.sexe ib(52).matu_nom" //eco
	reg moyenne $params, robust 
	outreg2 using matu, label replace dec(3) tex(frag pr)
	global params "i.sexe ib(52).matu_nom ib(2010).debut" //eco
	reg moyenne $params, robust
	outreg2 using matu, label append dec(3) tex(frag pr)  drop(ib(2010).debut)
	global params "i.sexe ib(52).matu_nom" //eco
	reg moyenne $params if etat == 3, robust 
	outreg2 using matu, label append dec(3) tex(frag pr)
	global params "i.sexe ib(52).matu_nom ib(2010).debut" //eco
	eststo clear
	eststo: reg moyenne $params if etat == 3, robust
	outreg2 using matu, label append dec(3) tex(frag pr)  drop(ib(2010).debut)
	esttab using matu.csv, replace wide plain se label

	logit fini $params , robust
	outreg2 using matuLogit, label replace dec(3) tex(frag pr)  drop(ib(2010).debut)
	margins, dydx(*) atmeans post
	outreg2 using matuLogit, label append dec(3) tex(frag pr)  drop(ib(2010).debut)

	
	global params "i.sexe ib(51).matu_lieu" //Suisse
	reg moyenne $params , robust 
	outreg2 using lieu, label replace dec(3) tex(frag pr) 
	global params "i.sexe ib(51).matu_lieu ib(2010).debut" //Suisse
	reg moyenne $params, robust 
	outreg2 using lieu, label append dec(3) tex(frag pr) drop(ib(2010).debut)
	global params "i.sexe ib(51).matu_lieu" //Suisse
	
	reg moyenne $params if etat == 3, robust 
	outreg2 using lieu, label append dec(3) tex(frag pr) 
	global params "i.sexe ib(51).matu_lieu ib(2010).debut" //Suisse
	eststo clear
	eststo: reg moyenne $params if etat == 3, robust 
	outreg2 using lieu, label append dec(3) tex(frag pr)  drop(ib(2010).debut)
	esttab using pays.csv, replace wide plain se label
	
	logit fini $params , robust 
	outreg2 using lieuLogit, label replace dec(3) tex(frag pr)  drop(ib(2010).debut)
	margins, dydx(*) atmeans post
	outreg2 using lieuLogit, label append dec(3) tex(frag pr)  drop(ib(2010).debut)

	global params "i.sexe ib(44).matu_ecole ib(2010).debut" //Auguste (plus mauvais)
	reg moyenne $params , robust 
	outreg2 using ecole, label replace dec(3) tex(frag pr)  drop(ib(2010).debut)
	reg moyenne $params if etat == 3, robust 
	outreg2 using ecole, label append dec(3) tex(frag pr)  drop(ib(2010).debut)

	/*
	global params "i.sexe ib(3).BSc" // management
	reg moyenne_2 $params , robust 
	outreg2 using BSc, label replace dec(3) tex(frag pr)
	reg moyenne_3 $params , robust 
	outreg2 using BSc, label append dec(3) tex(frag pr)

	
	global params "i.sexe ib(11).MSc" //act
	eststo clear
	eststo: reg moyenne $params , robust
	esttab using master.csv, replace wide plain se label
	*/
	
	global params "delta_SCI1 delta_MIX1 ib(2011).debut"
	logit fini $params, robust 
	outreg2 using logit, label replace dec(3) tex(frag pr)
	global params "delta_OTH1 ib(2011).debut"
	logit fini $params, robust 
	outreg2 using logit, append  dec(3) tex(frag pr)
	margins, dydx(*) atmeans post
	outreg2 using logit, label append dec(3) tex(frag pr)
	
	global params "i.sexe"
	
	**paste

	reg quant_2 delta6 delta51 delta95 delta121 delta139 delta148 delta170 $params, robust
	outreg2 using coursOld, label replace dec(3) tex(frag pr)

	reg quant_3 delta6 delta51 delta95 delta121 delta139 delta148 delta170 $params, robust
	//reg quant_23 delta6 delta51 delta95 delta121 delta139 delta148 delta170 $params, robust

	/*
	reg quant_2 delta6 delta25 delta26 delta52 delta55 delta103 delta104 delta122 delta123 delta131 delta171 delta172 $params, robust
	reg quant_3 delta6 delta25 delta26 delta52 delta55 delta103 delta104 delta122 delta123 delta131 delta171 delta172 $params, robust
	reg quant_23 delta6 delta25 delta26 delta52 delta55 delta103 delta104 delta122 delta123 delta131 delta171 delta172 $params, robust
	*/
	reg quant_2 delta6 delta25 delta26 delta52 delta57 delta103 delta104 delta122 delta123 delta133 delta171 delta172 $params, robust
	outreg2 using coursNew, label replace dec(3) tex(frag pr)
	reg quant_3 delta6 delta25 delta26 delta52 delta57 delta103 delta104 delta122 delta123 delta133 delta171 delta172 $params, robust
	//reg quant_23 delta6 delta25 delta26 delta52 delta57 delta103 delta104 delta122 delta123 delta133 delta171 delta172 $params, robust

	**end paste

restore

log close
translate log.smcl log.pdf
