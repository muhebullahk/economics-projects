cap log close
set more off
clear
set matsize 800
************************************************************************************************************************
************************************************************************************************************************
**************************************									  **********************************************
**************************************        PART I: DIRECTORIES         **********************************************
**************************************							          **********************************************
************************************************************************************************************************
************************************************************************************************************************

*Working directory:
global my_direc = "C:\Users\freylejer\OneDrive - UNBC\AP_UNBC\ECON712_Winter_2026\Problem Set 1\STATA\" 


*Data:
global data = "C:\Users\freylejer\OneDrive - UNBC\AP_UNBC\ECON712_Winter_2026\Problem Set 1\STATA\Data\" 

*Store tables here:
global tables= "C:\Users\freylejer\OneDrive - UNBC\AP_UNBC\ECON712_Winter_2026\Problem Set 1\Solutions\"


cd "$my_direc"

log using "C:\Users\freylejer\OneDrive - UNBC\AP_UNBC\ECON712_Winter_2026\Problem Set 1\STATA\PS1_empirical" , replace

************************************************************************************************************************
************************************************************************************************************************
**************************************									  **********************************************
**************************************        PART II: Data cleaning      **********************************************
**************************************							          **********************************************
************************************************************************************************************************
************************************************************************************************************************

forvalues i=1(1)12{
	local data_file="$data"+"LFS_"+"`i'"+"_2025.tab"
	local save_file="$data"+"LFS_"+"`i'"+"_2025.dta"
	import delimited "`data_file'", delimiter(tab) clear
	save "`save_file'", replace
}


use "$data\LFS_1_2025.dta"

forvalues i=2(1)12{
	local data_file="$data"+"LFS_"+"`i'"+"_2025.dta"
	append using "`data_file'"

}

save "$data\LFS_2025.dta",replace


drop if hrlyearn==0 | hrlyearn==.
drop if age_12==01 | age_12==02 | age_12==11 | age_12==12 


************************************************************************************************************************
************************************************************************************************************************
**************************************									  **********************************************
**************************************       PART III: Summary Statistics **********************************************
**************************************							          **********************************************
************************************************************************************************************************
************************************************************************************************************************
eststo clear
generate BA=0
replace BA=1 if educ>4
generate female=0
replace female=1 if gender==2
generate ln_wage=log(hrlyearn)
generate immigrant=0
replace immigrant=1 if immig<3
generate age1=0
replace age1=1 if age_12==04
generate age2=0
replace age2=1 if age_12==05
generate age3=0
replace age3=1 if age_12==06
generate age4=0
replace age4=1 if age_12==07
generate age5=0
replace age5=1 if age_12==08
generate age6=0
replace age6=1 if age_12==09
generate age7=0
replace age7=1 if age_12==10
gen const=1

local vars ln_wage tenure female immigrant age1 age2 age3 age4 age5 age6 age7

foreach v of local vars {

    * Mean for BA = 0
    quietly reg `v' const if BA==0,noconstant 
    eststo `v'_0, title("")

    * Mean for BA = 1
    quietly reg `v' const if BA==1,noconstant 
    eststo `v'_1, title("")

    * Difference (regression)
    quietly reg `v' i.BA
    eststo `v'_diff, title("")

}



estout ln_wage_0 ln_wage_1 ln_wage_diff using "$tables\table1.tex", replace cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
    collabels(none)  label  rename(1.BA "const") keep(const) style(tex)   ///
	title(Comparison of individual characteristics BA vs. no-BA) ///
	 starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(const "Ln(wage)") ///
	prehead("\begin{table}[t]" "\begin{center}"  "\caption{@title}" "\label{table1}" "\resizebox{.82\textwidth}{!}{%" "\begin{tabular}{llll}" ///
	"\hline" "\hline") posthead(" Variable & No BA & BA & Diff \\" "\hline") postfoot("\hline")
	
estout tenure_0 tenure_1 tenure_diff using "$tables\table1.tex", append cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
    collabels(none) label rename(1.BA "const") keep(const) style(tex)   ///
	mlabels(, span prefix(\multicolumn{@span}{c}{) suffix(})) starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(const "tenure (months)") 
		
	
estout female_0 female_1 female_diff using "$tables\table1.tex", append cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
    collabels(none) label rename(1.BA "const") keep(const) style(tex)   ///
	mlabels(, span prefix(\multicolumn{@span}{c}{) suffix(})) starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(const "female")
	
	
estout immigrant_0 immigrant_1 immigrant_diff using "$tables\table1.tex", append cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
    collabels(none) label rename(1.BA "const") keep(const) style(tex)   ///
	mlabels(, span prefix(\multicolumn{@span}{c}{) suffix(})) starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(const "immigrant")
	

estout age1_0 age1_1 age1_diff using "$tables\table1.tex", append cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
    collabels(none) label rename(1.BA "const") keep(const) style(tex)  ///
	mlabels(, span prefix(\multicolumn{@span}{c}{) suffix(})) starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(const "Age 30-34")
	
estout age2_0 age2_1 age2_diff using "$tables\table1.tex", append cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
   collabels(none) label rename(1.BA "const") keep(const) style(tex)   ///
	mlabels(, span prefix(\multicolumn{@span}{c}{) suffix(})) starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(const "Age 35-39")
	
estout age3_0 age3_1 age3_diff using "$tables\table1.tex", append cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
    collabels(none) label rename(1.BA "const") keep(const) style(tex)  ///
	mlabels(, span prefix(\multicolumn{@span}{c}{) suffix(})) starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(const "Age 40-44")
	
estout age4_0 age4_1 age4_diff using "$tables\table1.tex", append cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
    collabels(none) label rename(1.BA "const") keep(const) style(tex)   ///
	mlabels(, span prefix(\multicolumn{@span}{c}{) suffix(})) starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(const "Age 45-49")
	
estout age5_0 age5_1 age5_diff using "$tables\table1.tex", append cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
    collabels(none) label rename(1.BA "const") keep(const) style(tex)   ///
	mlabels(, span prefix(\multicolumn{@span}{c}{) suffix(})) starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(const "Age 50-54")
	
estout age6_0 age6_1 age6_diff using "$tables\table1.tex", append cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
    collabels(none) label rename(1.BA "const") keep(const) style(tex)   ///
	mlabels(, span prefix(\multicolumn{@span}{c}{) suffix(})) starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(const "Age 55-59")
	
estout age7_0 age7_1 age7_diff using "$tables\table1.tex", append cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
    collabels(none) label rename(1.BA "const") keep(const) style(tex)   ///
	mlabels(, span prefix(\multicolumn{@span}{c}{) suffix(})) starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(const "Age 60-64") ///
	postfoot("\hline" "\hline"  "\end{tabular}}" "\end{center}" "\captionsetup{font={scriptsize}}" "\captionsetup{width=0.80\textwidth}" "\captionsetup{skip=0pt}" "\caption*{Note: This table displays average characteristics for individuals with and without a BA, defined as a four year University degree. The source are author's own calculations from the Canadian Labour Force Survey }}" "\end{table}") 





************************************************************************************************************************
************************************************************************************************************************
**************************************									  **********************************************
**************************************        PART IV: Regression         **********************************************
**************************************							          **********************************************
************************************************************************************************************************
************************************************************************************************************************

reg ln_wage i.BA 
eststo model1, title("(1)")

reghdfe ln_wage i.BA, absorb(i.age_12) 
eststo model2, title("(2)")

reghdfe ln_wage i.BA tenure, absorb(i.age_12) 
eststo model3, title("(3)")

reghdfe ln_wage i.BA tenure female, absorb(i.age_12) 
eststo model4, title("(4)")

reghdfe ln_wage i.BA tenure female immigrant, absorb(i.age_12) 
eststo model5, title("(5)")



estout model1 model2 model3 model4 model5 using "$tables\table2.tex", replace cells(mean(fmt(%9.3f)) b(star fmt(%9.3f)) se(par fmt(%9.3f))) ///
    collabels(none) label  drop(_cons 0.BA) style(tex)  title(Returns to Finishing a four-year university degree) ///
	mlabels(, span prefix(\multicolumn{@span}{c}{) suffix(})) starlevels(* 0.1 ** 0.05 *** 0.01) varlabels(1.BA "4-year Degree") ///
	prehead("\begin{table}[t]" "\begin{center}"  "\caption{@title}" "\label{table1}" "\resizebox{.82\textwidth}{!}{%" "\begin{tabular}{llllll}" "\hline" "\hline") /// 
	posthead("\hline") prefoot("\hline" "Age Group FE & No & Yes & Yes & Yes & Yes \\")  ///
	stats(N , fmt(%9.3f %9.3f %9.3f %9.0f) labels("Obs.")) ///
	postfoot("\hline" "\hline"  "\end{tabular}}" "\end{center}" "\captionsetup{font={scriptsize}}" "\captionsetup{width=0.80\textwidth}" "\captionsetup{skip=0pt}" "\caption*{Note: This table displays the returns to finishing a four-year degree or higher. The source are author's own calculations from the Canadian Labour Force Survey }}" "\end{table}") 
	
	
	
	
cap log close
	
	
	
	
	
	
	
	
	
	