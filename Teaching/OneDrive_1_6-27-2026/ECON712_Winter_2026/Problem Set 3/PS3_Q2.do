************************************************************************************************************
************************************************************************************************************
*********** Author: Leandro Freylejer
***********
*********** Description: Master File to Run results in 
***********
*********** Last updated: 9/21/2022
************************************************************************************************************

cap log close
set more off
clear all
set matsize 800


************************************************************************************************************
*******                                      Global Directories                                      *******
************************************************************************************************************
log using "Q2_log", replace

global mydirec="C:\Users\freylejer\OneDrive - UNBC\AP_UNBC\ECON712_Winter_2026\Problem Set 3"

cd "$mydirec"

use "card.dta"

*** PART I, i ***

reg educ exper expersq black south smsa reg662 reg663 reg664 ///
               reg665 reg666 reg667 reg668 reg669
predict d_tilde, resid

* Residualise nearc4 on X_c  →  z_tilde
reg nearc4  exper expersq black south smsa reg662 reg663 reg664 reg665 ///
               reg666 reg667 reg668 reg669
predict z_tilde, resid

* Residualise lwage on X_c  →  y_tilde

reg lwage  exper expersq black south smsa reg662 reg663 reg664 reg665 ///
               reg666 reg667 reg668 reg669
predict y_tilde, resid


*** PART I, ii ***

reg d_tilde z_tilde
local b_fs = string(_b[z_tilde], "%6.4f")

reg y_tilde z_tilde
local b_rf = string(_b[z_tilde], "%6.4f")

twoway (scatter d_tilde z_tilde, msize(tiny) mcolor(gs10)) ///
       (lfit    d_tilde z_tilde, lcolor(black) lwidth(medthick)), ///
       xtitle("Residualised nearc4 ")            ///
       ytitle("Residualised education ")          ///
       title("First Stage (FWL)")                            ///
       note("Slope = `b_fs'", size(small))                   ///
       legend(off)
quietly graph export "PS3_Q2a_FirstStage.png", replace width(1200)

* Reduced-form scatter: y_tilde on z_tilde
twoway (scatter y_tilde z_tilde, msize(tiny) mcolor(gs10)) ///
       (lfit    y_tilde z_tilde, lcolor(black) lwidth(medthick)), ///
       xtitle("Residualised nearc4 ")            ///
       ytitle("Residualised log wage ")           ///
       title("Reduced Form (FWL)")                           ///
       note("Slope = `b_rf'", size(small))                   ///
       legend(off)
quietly graph export "PS3_Q2a_ReducedForm.png", replace width(1200)


*** PART I, iii ***

reg educ nearc4 exper expersq black south smsa reg662 reg663 reg664 reg665 ///
               reg666 reg667 reg668 reg669
test nearc4
display "F-stat on nearc4 = " %6.2f r(F) "  (p = " %5.3f r(p) ")"


***** PART II *****


reg lwage educ exper black south married smsa, robust
eststo OLS


ivreg2 lwage (educ = nearc4)  exper  black south married smsa, first ffirst robust
eststo tsls
matrix first=e(first)
estadd scalar F1=first[4,1]



estout OLS tsls using "PS3_Q2b_Card_Table57.tex",                 ///
    replace                                                         ///
    style(tex)                                                      ///
    cells(b(star fmt(%9.4f)) se(par fmt(%9.4f)))                   ///
    starlevels(* 0.10 ** 0.05 *** 0.01)                            ///
    stats(F1 N r2,                                                     ///
          labels("F-test" "Observations" "\$R^2\$")                         ///
          fmt(%9.0f %9.0f %9.3f))                                         ///
    mlabels("OLS" "2SLS")                                          ///
    collabels(none)                                                 ///
    keep(educ exper black south married smsa)                               ///
    prehead(                                                        ///
        "\begin{table}[H]"                                          ///
        "\begin{center}"                                            ///
        "\caption{Replication Table 57}"                                          ///
        "\resizebox{.57\textwidth}{!}{%"                            ///
        "\begin{tabular}{lll}"                                      ///
        "\hline" "\hline"                                           ///
    )                                                               ///
      postfoot(                                                        ///
        "\hline" "\hline"                                           ///
        "\end{tabular}}"                                             ///
        "\end{center}"                                              ///  
        "\captionsetup{font={scriptsize}}"                          ///
        "\captionsetup{width=0.80\textwidth}"                       ///
        "\captionsetup{skip=0pt}"                                   ///
        "\caption*{\scriptsize Notes: Heteroscedasticity-robust standard errors in parentheses." ///
        "Controls: region dummies, and a constant."                 ///
        "Instrument in 2SLS: \texttt{nearc4} (proximity to 4-year college)." ///
        "* \$p<0.10\$, ** \$p<0.05\$, *** \$p<0.01\$.}"           ///
        "\end{table}"                                               ///
    )

cap log close
