import excel "/Users/Marco/Google Drive/HEC/empi/proj/Lalive_Etu_BSc_II_Exa_MSc_Year_II.xlsx", sheet("Sheet1") firstrow
rename Sexe sex
encode(sex), gen(sexe)
drop sex
rename Dbut debut
rename Fin fin
rename Cours cours
rename Note note
rename Year legal_year
rename Etat etat
destring ID, replace
destring debut, replace
destring fin, replace
destring note, replace
destring legal_year, replace
destring CR, replace

save "dbOld.dta", replace
