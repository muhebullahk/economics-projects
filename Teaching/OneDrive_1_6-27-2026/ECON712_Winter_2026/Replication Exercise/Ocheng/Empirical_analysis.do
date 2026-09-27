/**************************************************************************
* Project:     ECON 712: Applied Econometrics
* Term:        Winter 2026
* Deliverable: Replication Excercise
* Author:      Ocheng Abel
* Supervisor:  Dr. Leandro Freylejer
*
* Purpose:     Replicable workflow: setup → import → clean → analysis → output
* Created:     January 2026
* 
**************************************************************************/

version 19.0
clear all
set more off
set linesize 120

/**************************************************************************
* USER SETTINGS: FOLDERS / PATHS
*  
**************************************************************************/
* Root folder for this problem set
global Cleaned"C:\Users\abelo\OneDrive\APPLICATION TO CANADA 2024\Winter January 2026 reading materials\Replication Exercise\Carbon_tax\Cleaned_datasets"

* Subfolders
global Log  "$Raw/Logs"


/**************************************************************************
* 1) LOGGING
**************************************************************************/
* Close any open log (prevents "log already open" errors)
cap log close _all

* Timestamp for unique log name
local cdate : display %tdCCYY-NN-DD date(c(current_date), "DMY")
local ctime = subinstr("`c(current_time)'", ":", "", .)
local stamp = "`cdate'_`ctime'"

* Open log (text format is easy to submit/read)
log using "$Log\Empirical_analysis.log", text replace

display "=============================================================="
display "ECON 712: Applied Econometrics | Winter 2026 | Replication Excercise"
display "Author: Ocheng Abel | Supervisor: Dr. Leandro Freylejer"
display "Run started: " c(current_date) " at " c(current_time)
display "Stata version: " c(stata_version)
display "Working directory Raw: $Raw"
display "=============================================================="






//Combined dataset
use "$Cleaned/IPCC_emission_GDP_Popn.dta", clear


//Statistics for BC
*keep if inrange(Year, 1990, 2016)


//Province-level summary statistics for taxed region (BC) and control provinces 1990–2016
preserve
keep if P_group == "Taxed"
sort Category
tabstat C02_Mt, by(Category) stat(mean sd min max) format(%9.2f)
restore


//Province-level summary statistics for taxed region (BC) and control provinces 1990–2016
preserve
keep if P_group == "Control"
sort Category
tabstat C02_Mt, by(Category) stat(mean sd min max) format(%9.2f)
restore

//Province-level summary statistics for taxed region (BC) and control provinces 1990–2016
preserve
keep if P_group == "Taxed"
tabstat Popn_Mn, stat(mean sd min max) format(%9.2f)
restore


//Province-level summary statistics for taxed region (BC) and control provinces 1990–2016
preserve
keep if P_group == "Control"
tabstat Popn_Mn,stat(mean sd min max) format(%9.2f)
restore

//Province-level summary statistics for taxed region (BC) and control provinces 1990–2016
preserve
keep if P_group == "Taxed"
tabstat GDP_bn, stat(mean sd min max) format(%9.2f)
restore


//Province-level summary statistics for taxed region (BC) and control provinces 1990–2016
preserve
keep if P_group == "Control"
tabstat GDP_bn,stat(mean sd min max) format(%9.2f)
restore

*===============================================================================
*DID Regression
*===============================================================================

//Creating treatment

gen treat = Province=="British Columbia"
gen post  = Year>=2008
gen tax   = treat*post

//Check for non zeros
summarize C02_Mt Popn_Mn GDP_bn
count if C02_Mt <= 0
count if Popn_Mn   <= 0
count if GDP_bn <= 0


tab Category if C02_Mt==0
tab Province if C02_Mt==0

*Logging while catering for Zero C02_Mt
gen l_emiss = .
replace l_emiss = ln(C02_Mt) if C02_Mt>0

gen l_pop = ln(Popn_Mn)
gen l_gdp = ln(GDP_bn)

encode Province, gen(prov_id)

*==============================================================================
*BASELINE DiD
*==============================================================================

// Regression for Total (reghdfe)
preserve
keep if Category=="Total"

* (Optional) check missing l_emiss
count if missing(l_emiss)

* IMPORTANT: lags require xtset
xtset prov_id Year



* reghdfe with province + year fixed effects
reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

* Long-run (equilibrium) effect
nlcom _b[tax]/(1-_b[L.l_emiss])

restore


//Regression for Transportaion

preserve
keep if Category=="Transport"

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Fugitive Sources

preserve
keep if Category=="Fugitive Sources" & C02_Mt>0

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore



//Regression for Total Energy

preserve
keep if Category=="Total Energy" & C02_Mt>0

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore




//Regression for Total Industrial Processes and Product Use

preserve
keep if Category=="Total Industrial Processes and Product Use" & C02_Mt>0

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore




//Regression for Total Agriculture

preserve
keep if Category=="Total Agriculture" & C02_Mt>0

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore



//Regression for Total Waste

preserve
keep if Category=="Total Waste" & C02_Mt>0

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])

restore



*==============================================================*
* Figure 1A: Aggregate CO2 emissions, Pretis-style
*==============================================================*

preserve

*-----------------------------*
* 1. Keep aggregate emissions
*-----------------------------*
keep if Category == "Total"
keep if inrange(Year, 1990, 2015)

* Exclude territories if not part of replication sample
drop if inlist(Province, "Yukon", "Northwest Territories", "Nunavut")

*-----------------------------*
* 2. Baseline mean: 1990-2007
*-----------------------------*
bysort Province: egen base_mean = mean(cond(inrange(Year, 1990, 2007), C02_Mt, .))

* Percentage change relative to 1990-2007 average
gen pct_change = 100 * (C02_Mt - base_mean) / base_mean

* BC indicator
gen bc = Province == "British Columbia"

*-----------------------------*
* 3. Save province-level data
*-----------------------------*
tempfile provdata rocdata
save `provdata', replace

*-----------------------------*
* 4. Rest of Canada mean + CI
*-----------------------------*
keep if bc == 0

collapse ///
    (mean) roc_mean = pct_change ///
    (sd)   roc_sd   = pct_change ///
    (count) roc_n   = pct_change, by(Year)

gen roc_se = roc_sd / sqrt(roc_n)
gen roc_lb = roc_mean - 1.96*roc_se
gen roc_ub = roc_mean + 1.96*roc_se

save `rocdata', replace

*-----------------------------*
* 5. Merge ROC series back
*-----------------------------*
use `provdata', clear
merge m:1 Year using `rocdata', nogen

* one observation per year for ROC band/mean
egen tag_year = tag(Year)

*-----------------------------*
* 6. Province abbreviations at right edge
*-----------------------------*
gen end_y = pct_change if Year == 2015 & bc == 0
gen str3 prov_lab = ""

replace prov_lab = "ab" if Province == "Alberta" & Year == 2015
replace prov_lab = "sk" if Province == "Saskatchewan" & Year == 2015
replace prov_lab = "mb" if Province == "Manitoba" & Year == 2015
replace prov_lab = "on" if Province == "Ontario" & Year == 2015
replace prov_lab = "qc" if Province == "Quebec" & Year == 2015
replace prov_lab = "nb" if Province == "New Brunswick" & Year == 2015
replace prov_lab = "ns" if Province == "Nova Scotia" & Year == 2015
replace prov_lab = "pe" if Province == "Prince Edward Island" & Year == 2015
replace prov_lab = "nl" if Province == "Newfoundland and Labrador" & Year == 2015

* Add end labels for BC and average
gen bc_end  = pct_change if Province == "British Columbia" & Year == 2015
gen roc_end = roc_mean if Year == 2015 & tag_year

gen str3 bc_lab  = "bc"  if Province == "British Columbia" & Year == 2015
gen str4 avg_lab = "avg" if Year == 2015 & tag_year

* Create vertical spacing so bc and avg do not overlap
gen bc_y  = bc_end + 2 if Province == "British Columbia" & Year == 2015
gen avg_y = roc_end - 2 if Year == 2015 & tag_year

*-----------------------------*
* 7. Build background province lines
*-----------------------------*
levelsof Province if bc == 0, local(provs)

local bgplots
foreach p of local provs {
    local bgplots `bgplots' ///
        (line pct_change Year if Province == "`p'", ///
        sort lcolor(gs12) lwidth(thin) legend(off))
}

*-----------------------------*
* 8. Draw graph
*-----------------------------*
twoway ///
    `bgplots' ///
    (rarea roc_lb roc_ub Year if tag_year, ///
        sort fcolor(eltblue%60) lcolor(eltblue) legend(off)) ///
    (line roc_mean Year if tag_year, ///
        sort lcolor(midblue) lwidth(medthick) legend(off)) ///
    (line pct_change Year if Province == "British Columbia", ///
        sort lcolor(red) lwidth(medthick) legend(off)) ///
    (scatter end_y Year if Year == 2015 & bc == 0, ///
        msymbol(none) mlabel(prov_lab) mlabcolor(gs8) mlabsize(small) mlabposition(2) legend(off)) ///
    (scatter bc_y Year if Province == "British Columbia" & Year == 2015, ///
        msymbol(none) mlabel(bc_lab) mlabcolor(red) mlabsize(small) mlabposition(3) legend(off)) ///
    (scatter avg_y Year if Year == 2015 & tag_year, ///
        msymbol(none) mlabel(avg_lab) mlabcolor(midblue) mlabsize(small) mlabposition(3) legend(off)) ///
    (pci 38 1990.8 38 1992.0, lcolor(red) lwidth(medthick)) ///
    (pci 35 1990.8 35 1992.0, lcolor(midblue) lwidth(medthick)) ///
    (pci 32 1990.8 32 1992.0, lcolor(gs12) lwidth(thin)), ///
    scheme(s1color) ///
    xline(2008, lpattern(dash) lcolor(lavender) lwidth(medthick)) ///
    yline(0, lcolor(orange) lwidth(thin)) ///
    xlabel(1990(5)2016, nogrid labsize(small)) ///
    ylabel(-30(10)40, nogrid angle(horizontal) labsize(small)) ///
    xscale(range(1990 2015)) ///
    yscale(range(-30 40)) ///
    xtitle("") ///
    ytitle("Percentage Change in Emissions", size(medsmall)) ///
    title("Aggregate", size(medium)) ///
    text(39 2008.2 "BC Carbon Tax", place(e) color(lavender) size(small)) ///
    text(20 2010.5 "Rest of" "Canada Average", place(e) color(midblue) size(small)) ///
    text(38 1992.25 "BC", place(e) color(red) size(small)) ///
    text(35 1992.25 "Rest of Canada (Average)", place(e) color(midblue) size(small)) ///
    text(32 1992.25 "Other provinces", place(e) color(gs8) size(small)) ///
    name(fig_aggregate, replace)
	
	graph export "$Cleaned/fig_aggregate.png", replace width(2000)

restore




*==============================================================*
* Figure 1B: Transportation CO2 emissions, Pretis-style
*==============================================================*

preserve

*-----------------------------*
* 1. Keep transportation emissions
*-----------------------------*
keep if Category == "Transport"
keep if inrange(Year, 1990, 2015)

* Exclude territories if not part of replication sample
drop if inlist(Province, "Yukon", "Northwest Territories", "Nunavut")

*-----------------------------*
* 2. Baseline mean: 1990-2007
*-----------------------------*
bysort Province: egen base_mean = mean(cond(inrange(Year, 1990, 2007), C02_Mt, .))

* Percentage change relative to 1990-2007 average
gen pct_change = 100 * (C02_Mt - base_mean) / base_mean

* BC indicator
gen bc = Province == "British Columbia"

*-----------------------------*
* 3. Save province-level data
*-----------------------------*
tempfile provdata rocdata
save `provdata', replace

*-----------------------------*
* 4. Rest of Canada mean + CI
*-----------------------------*
keep if bc == 0

collapse ///
    (mean) roc_mean = pct_change ///
    (sd)   roc_sd   = pct_change ///
    (count) roc_n   = pct_change, by(Year)

gen roc_se = roc_sd / sqrt(roc_n)
gen roc_lb = roc_mean - 1.96*roc_se
gen roc_ub = roc_mean + 1.96*roc_se

save `rocdata', replace

*-----------------------------*
* 5. Merge ROC series back
*-----------------------------*
use `provdata', clear
merge m:1 Year using `rocdata', nogen

* one observation per year for ROC band/mean
egen tag_year = tag(Year)

*-----------------------------*
* 6. Province abbreviations at right edge
*-----------------------------*
gen end_y = pct_change if Year == 2015 & bc == 0
gen str3 prov_lab = ""

replace prov_lab = "ab" if Province == "Alberta" & Year == 2015
replace prov_lab = "sk" if Province == "Saskatchewan" & Year == 2015
replace prov_lab = "mb" if Province == "Manitoba" & Year == 2015
replace prov_lab = "on" if Province == "Ontario" & Year == 2015
replace prov_lab = "qc" if Province == "Quebec" & Year == 2015
replace prov_lab = "nb" if Province == "New Brunswick" & Year == 2015
replace prov_lab = "ns" if Province == "Nova Scotia" & Year == 2015
replace prov_lab = "pe" if Province == "Prince Edward Island" & Year == 2015
replace prov_lab = "nl" if Province == "Newfoundland and Labrador" & Year == 2015

* Add end labels for BC and average
gen bc_end  = pct_change if Province == "British Columbia" & Year == 2015
gen roc_end = roc_mean if Year == 2015 & tag_year

gen str3 bc_lab  = "bc"  if Province == "British Columbia" & Year == 2015
gen str4 avg_lab = "avg" if Year == 2015 & tag_year

* Create vertical spacing so bc and avg do not overlap
gen bc_y  = bc_end + 2 if Province == "British Columbia" & Year == 2015
gen avg_y = roc_end - 2 if Year == 2015 & tag_year

*-----------------------------*
* 7. Build background province lines
*-----------------------------*
levelsof Province if bc == 0, local(provs)

local bgplots
foreach p of local provs {
    local bgplots `bgplots' ///
        (line pct_change Year if Province == "`p'", ///
        sort lcolor(gs12) lwidth(thin) legend(off))
}

*-----------------------------*
* 8. Draw graph
*-----------------------------*
twoway ///
    `bgplots' ///
    (rarea roc_lb roc_ub Year if tag_year, ///
        sort fcolor(eltblue%60) lcolor(eltblue) legend(off)) ///
    (line roc_mean Year if tag_year, ///
        sort lcolor(midblue) lwidth(medthick) legend(off)) ///
    (line pct_change Year if Province == "British Columbia", ///
        sort lcolor(red) lwidth(medthick) legend(off)) ///
    (scatter end_y Year if Year == 2015 & bc == 0, ///
        msymbol(none) mlabel(prov_lab) mlabcolor(gs8) mlabsize(small) mlabposition(2) legend(off)) ///
    (scatter bc_y Year if Province == "British Columbia" & Year == 2015, ///
        msymbol(none) mlabel(bc_lab) mlabcolor(red) mlabsize(small) mlabposition(3) legend(off)) ///
    (scatter avg_y Year if Year == 2015 & tag_year, ///
        msymbol(none) mlabel(avg_lab) mlabcolor(midblue) mlabsize(small) mlabposition(3) legend(off)) ///
    (pci 58 1990.8 58 1992.0, lcolor(red) lwidth(medthick)) ///
    (pci 53 1990.8 53 1992.0, lcolor(midblue) lwidth(medthick)) ///
    (pci 48 1990.8 48 1992.0, lcolor(gs12) lwidth(thin)), ///
    scheme(s1color) ///
    xline(2008, lpattern(dash) lcolor(lavender) lwidth(medthick)) ///
    yline(0, lcolor(orange) lwidth(thin)) ///
    xlabel(1990(5)2016, nogrid labsize(small)) ///
    ylabel(-20(20)60, nogrid angle(horizontal) labsize(small)) ///
    xscale(range(1990 2015)) ///
    yscale(range(-20 60)) ///
    xtitle("") ///
    ytitle("Percentage Change in Emissions", size(medsmall)) ///
    title("Sector: Transportation", size(medium)) ///
    text(58 2008.2 "BC Carbon Tax", place(e) color(lavender) size(small)) ///
    text(40 2011.0 "Rest of" "Canada Average", place(e) color(midblue) size(small)) ///
    text(58 1992.25 "BC", place(e) color(red) size(small)) ///
    text(53 1992.25 "Rest of Canada (Average)", place(e) color(midblue) size(small)) ///
    text(48 1992.25 "Other provinces", place(e) color(gs8) size(small)) ///
    name(fig_transport, replace)

graph export "$Cleaned/fig_transport.png", replace width(2000)

restore

*==============================================================*
* Figure: Stationary Combustion CO2 emissions, Pretis-style
*==============================================================*

preserve

*-----------------------------*
* 1. Keep stationary combustion emissions
*-----------------------------*
keep if Category == "Total Energy"
keep if inrange(Year, 1990, 2015)

drop if inlist(Province, "Yukon", "Northwest Territories", "Nunavut")

*-----------------------------*
* 2. Baseline mean: 1990-2007
*-----------------------------*
bysort Province: egen base_mean = mean(cond(inrange(Year, 1990, 2007), C02_Mt, .))
gen pct_change = 100 * (C02_Mt - base_mean) / base_mean
gen bc = Province == "British Columbia"

*-----------------------------*
* 3. Save province-level data
*-----------------------------*
tempfile provdata rocdata
save `provdata', replace

*-----------------------------*
* 4. Rest of Canada mean + CI
*-----------------------------*
keep if bc == 0

collapse ///
    (mean) roc_mean = pct_change ///
    (sd)   roc_sd   = pct_change ///
    (count) roc_n   = pct_change, by(Year)

gen roc_se = roc_sd / sqrt(roc_n)
gen roc_lb = roc_mean - 1.96*roc_se
gen roc_ub = roc_mean + 1.96*roc_se

save `rocdata', replace

*-----------------------------*
* 5. Merge ROC series back
*-----------------------------*
use `provdata', clear
merge m:1 Year using `rocdata', nogen

egen tag_year = tag(Year)

*-----------------------------*
* 6. Province abbreviations at right edge
*-----------------------------*
gen end_y = pct_change if Year == 2015 & bc == 0
gen str3 prov_lab = ""

replace prov_lab = "ab" if Province == "Alberta" & Year == 2015
replace prov_lab = "sk" if Province == "Saskatchewan" & Year == 2015
replace prov_lab = "mb" if Province == "Manitoba" & Year == 2015
replace prov_lab = "on" if Province == "Ontario" & Year == 2015
replace prov_lab = "qc" if Province == "Quebec" & Year == 2015
replace prov_lab = "nb" if Province == "New Brunswick" & Year == 2015
replace prov_lab = "ns" if Province == "Nova Scotia" & Year == 2015
replace prov_lab = "pe" if Province == "Prince Edward Island" & Year == 2015
replace prov_lab = "nl" if Province == "Newfoundland and Labrador" & Year == 2015

gen bc_end  = pct_change if Province == "British Columbia" & Year == 2015
gen roc_end = roc_mean if Year == 2015 & tag_year

gen str3 bc_lab  = "bc"  if Province == "British Columbia" & Year == 2015
gen str4 avg_lab = "avg" if Year == 2015 & tag_year

gen bc_y  = bc_end + 2 if Province == "British Columbia" & Year == 2015
gen avg_y = roc_end - 2 if Year == 2015 & tag_year

levelsof Province if bc == 0, local(provs)

local bgplots
foreach p of local provs {
    local bgplots `bgplots' ///
        (line pct_change Year if Province == "`p'", ///
        sort lcolor(gs12) lwidth(thin) legend(off))
}

*-----------------------------*
* 8. Draw graph
*-----------------------------*
twoway ///
    `bgplots' ///
    (rarea roc_lb roc_ub Year if tag_year, ///
        sort fcolor(eltblue%60) lcolor(eltblue) legend(off)) ///
    (line roc_mean Year if tag_year, ///
        sort lcolor(midblue) lwidth(medthick) legend(off)) ///
    (line pct_change Year if Province == "British Columbia", ///
        sort lcolor(red) lwidth(medthick) legend(off)) ///
    (scatter end_y Year if Year == 2015 & bc == 0, ///
        msymbol(none) mlabel(prov_lab) mlabcolor(gs8) mlabsize(small) mlabposition(2) legend(off)) ///
    (scatter bc_y Year if Province == "British Columbia" & Year == 2015, ///
        msymbol(none) mlabel(bc_lab) mlabcolor(red) mlabsize(small) mlabposition(3) legend(off)) ///
    (scatter avg_y Year if Year == 2015 & tag_year, ///
        msymbol(none) mlabel(avg_lab) mlabcolor(midblue) mlabsize(small) mlabposition(3) legend(off)) ///
    (pci 35 1990.8 35 1992.0, lcolor(red) lwidth(medthick)) ///
    (pci 30 1990.8 30 1992.0, lcolor(midblue) lwidth(medthick)) ///
    (pci 25 1990.8 25 1992.0, lcolor(gs12) lwidth(thin)), ///
    scheme(s1color) ///
    xline(2008, lpattern(dash) lcolor(lavender) lwidth(medthick)) ///
    yline(0, lcolor(orange) lwidth(thin)) ///
    xlabel(1990(5)2016, nogrid labsize(small)) ///
    ylabel(-40(20)40, nogrid angle(horizontal) labsize(small)) ///
    xscale(range(1990 2015)) ///
    yscale(range(-40 40)) ///
    xtitle("") ///
    ytitle("Percentage Change in Emissions", size(medsmall)) ///
    title("Stationary Combustion", size(medium)) ///
    text(35 2008.2 "BC Carbon Tax", place(e) color(lavender) size(small)) ///
    text(15 2010.5 "Rest of" "Canada Average", place(e) color(midblue) size(small)) ///
    text(35 1992.25 "BC", place(e) color(red) size(small)) ///
    text(30 1992.25 "Rest of Canada (Average)", place(e) color(midblue) size(small)) ///
    text(25 1992.25 "Other provinces", place(e) color(gs8) size(small)) ///
    name(fig_stationary, replace)

graph export "$Cleaned/fig_stationary.png", replace width(2000)

restore

*==============================================================*
* Figure: Industry CO2 emissions, Pretis-style
* Trim display vertically for cleaner fit
*==============================================================*

preserve

*-----------------------------*
* 1. Keep industry emissions
*-----------------------------*
keep if Category == "Total Industrial Processes and Product Use"
keep if inrange(Year, 1990, 2015)

drop if inlist(Province, "Yukon", "Northwest Territories", "Nunavut")

*-----------------------------*
* 2. Baseline mean: 1990-2007
*-----------------------------*
bysort Province: egen base_mean = mean(cond(inrange(Year, 1990, 2007), C02_Mt, .))
gen pct_change = 100 * (C02_Mt - base_mean) / base_mean
gen bc = Province == "British Columbia"

*-----------------------------*
* 3. Save province-level data
*-----------------------------*
tempfile provdata rocdata
save `provdata', replace

*-----------------------------*
* 4. Rest of Canada mean + CI
*-----------------------------*
keep if bc == 0

collapse ///
    (mean) roc_mean = pct_change ///
    (sd)   roc_sd   = pct_change ///
    (count) roc_n   = pct_change, by(Year)

gen roc_se = roc_sd / sqrt(roc_n)
gen roc_lb = roc_mean - 1.96*roc_se
gen roc_ub = roc_mean + 1.96*roc_se

save `rocdata', replace

*-----------------------------*
* 5. Merge ROC series back
*-----------------------------*
use `provdata', clear
merge m:1 Year using `rocdata', nogen

egen tag_year = tag(Year)

*-----------------------------*
* 6. Set display range and clip only for plotting
*-----------------------------*
local ymin = -100
local ymax = 150

gen pct_plot = pct_change
replace pct_plot = `ymax' if pct_plot > `ymax'
replace pct_plot = `ymin' if pct_plot < `ymin'

gen roc_mean_plot = roc_mean
replace roc_mean_plot = `ymax' if roc_mean_plot > `ymax'
replace roc_mean_plot = `ymin' if roc_mean_plot < `ymin'

gen roc_lb_plot = roc_lb
replace roc_lb_plot = `ymax' if roc_lb_plot > `ymax'
replace roc_lb_plot = `ymin' if roc_lb_plot < `ymin'

gen roc_ub_plot = roc_ub
replace roc_ub_plot = `ymax' if roc_ub_plot > `ymax'
replace roc_ub_plot = `ymin' if roc_ub_plot < `ymin'

*-----------------------------*
* 7. Province abbreviations at right edge
*-----------------------------*
gen end_y = pct_plot if Year == 2015 & bc == 0
gen str3 prov_lab = ""

replace prov_lab = "ab" if Province == "Alberta" & Year == 2015
replace prov_lab = "sk" if Province == "Saskatchewan" & Year == 2015
replace prov_lab = "mb" if Province == "Manitoba" & Year == 2015
replace prov_lab = "on" if Province == "Ontario" & Year == 2015
replace prov_lab = "qc" if Province == "Quebec" & Year == 2015
replace prov_lab = "nb" if Province == "New Brunswick" & Year == 2015
replace prov_lab = "ns" if Province == "Nova Scotia" & Year == 2015
replace prov_lab = "pe" if Province == "Prince Edward Island" & Year == 2015
replace prov_lab = "nl" if Province == "Newfoundland and Labrador" & Year == 2015

gen bc_end  = pct_plot if Province == "British Columbia" & Year == 2015
gen roc_end = roc_mean_plot if Year == 2015 & tag_year

gen str3 bc_lab  = "bc"  if Province == "British Columbia" & Year == 2015
gen str4 avg_lab = "avg" if Year == 2015 & tag_year

gen bc_y  = bc_end + 2 if Province == "British Columbia" & Year == 2015
gen avg_y = roc_end - 2 if Year == 2015 & tag_year

*-----------------------------*
* 8. Build background province lines
*-----------------------------*
levelsof Province if bc == 0, local(provs)

local bgplots
foreach p of local provs {
    local bgplots `bgplots' ///
        (line pct_plot Year if Province == "`p'", ///
        sort lcolor(gs12) lwidth(thin) legend(off))
}

*-----------------------------*
* 9. Draw graph
*-----------------------------*
twoway ///
    `bgplots' ///
    (rarea roc_lb_plot roc_ub_plot Year if tag_year, ///
        sort fcolor(eltblue%60) lcolor(eltblue) legend(off)) ///
    (line roc_mean_plot Year if tag_year, ///
        sort lcolor(midblue) lwidth(medthick) legend(off)) ///
    (line pct_plot Year if Province == "British Columbia", ///
        sort lcolor(red) lwidth(medthick) legend(off)) ///
    (scatter end_y Year if Year == 2015 & bc == 0, ///
        msymbol(none) mlabel(prov_lab) mlabcolor(gs8) mlabsize(small) mlabposition(2) legend(off)) ///
    (scatter bc_y Year if Province == "British Columbia" & Year == 2015, ///
        msymbol(none) mlabel(bc_lab) mlabcolor(red) mlabsize(small) mlabposition(3) legend(off)) ///
    (scatter avg_y Year if Year == 2015 & tag_year, ///
        msymbol(none) mlabel(avg_lab) mlabcolor(midblue) mlabsize(small) mlabposition(3) legend(off)) ///
    (pci 140 1990.8 140 1992.0, lcolor(red) lwidth(medthick)) ///
    (pci 132 1990.8 132 1992.0, lcolor(midblue) lwidth(medthick)) ///
    (pci 124 1990.8 124 1992.0, lcolor(gs12) lwidth(thin)), ///
    scheme(s1color) ///
    xline(2008, lpattern(dash) lcolor(lavender) lwidth(medthick)) ///
    yline(0, lcolor(orange) lwidth(thin)) ///
    xlabel(1990(5)2016, nogrid labsize(small)) ///
    ylabel(`ymin'(50)`ymax', nogrid angle(horizontal) labsize(small)) ///
    xscale(range(1990 2015)) ///
    yscale(range(`ymin' `ymax')) ///
    xtitle("") ///
    ytitle("Percentage Change in Emissions", size(medsmall)) ///
    title("Industry", size(medium)) ///
    text(130 2008.2 "BC Carbon Tax", place(e) color(lavender) size(small)) ///
    text(40 2010.5 "Rest of" "Canada Average", place(e) color(midblue) size(small)) ///
    text(140 1992.25 "BC", place(e) color(red) size(small)) ///
    text(132 1992.25 "Rest of Canada (Average)", place(e) color(midblue) size(small)) ///
    text(124 1992.25 "Other provinces", place(e) color(gs8) size(small)) ///
    name(fig_industry, replace)

graph export "$Cleaned/fig_industry.png", replace width(2000)

restore


*==============================================================*
* Figure: Fugitive CO2 emissions, Pretis-style
* Trim display vertically for cleaner fit
*==============================================================*

preserve

*-----------------------------*
* 1. Keep fugitive emissions
*-----------------------------*
keep if Category == "Fugitive Sources"
keep if inrange(Year, 1990, 2015)

drop if inlist(Province, "Yukon", "Northwest Territories", "Nunavut")

*-----------------------------*
* 2. Baseline mean: 1990-2007
*-----------------------------*
bysort Province: egen base_mean = mean(cond(inrange(Year, 1990, 2007), C02_Mt, .))
gen pct_change = 100 * (C02_Mt - base_mean) / base_mean
gen bc = Province == "British Columbia"

*-----------------------------*
* 3. Save province-level data
*-----------------------------*
tempfile provdata rocdata
save `provdata', replace

*-----------------------------*
* 4. Rest of Canada mean + CI
*-----------------------------*
keep if bc == 0

collapse ///
    (mean) roc_mean = pct_change ///
    (sd)   roc_sd   = pct_change ///
    (count) roc_n   = pct_change, by(Year)

gen roc_se = roc_sd / sqrt(roc_n)
gen roc_lb = roc_mean - 1.96*roc_se
gen roc_ub = roc_mean + 1.96*roc_se

save `rocdata', replace

*-----------------------------*
* 5. Merge ROC series back
*-----------------------------*
use `provdata', clear
merge m:1 Year using `rocdata', nogen

egen tag_year = tag(Year)

*-----------------------------*
* 6. Set display range and clip only for plotting
*-----------------------------*
local ymin = -100
local ymax = 150

gen pct_plot = pct_change
replace pct_plot = `ymax' if pct_plot > `ymax'
replace pct_plot = `ymin' if pct_plot < `ymin'

gen roc_mean_plot = roc_mean
replace roc_mean_plot = `ymax' if roc_mean_plot > `ymax'
replace roc_mean_plot = `ymin' if roc_mean_plot < `ymin'

gen roc_lb_plot = roc_lb
replace roc_lb_plot = `ymax' if roc_lb_plot > `ymax'
replace roc_lb_plot = `ymin' if roc_lb_plot < `ymin'

gen roc_ub_plot = roc_ub
replace roc_ub_plot = `ymax' if roc_ub_plot > `ymax'
replace roc_ub_plot = `ymin' if roc_ub_plot < `ymin'

*-----------------------------*
* 7. Province abbreviations at right edge
*-----------------------------*
gen end_y = pct_plot if Year == 2015 & bc == 0
gen str3 prov_lab = ""

replace prov_lab = "ab" if Province == "Alberta" & Year == 2015
replace prov_lab = "sk" if Province == "Saskatchewan" & Year == 2015
replace prov_lab = "mb" if Province == "Manitoba" & Year == 2015
replace prov_lab = "on" if Province == "Ontario" & Year == 2015
replace prov_lab = "qc" if Province == "Quebec" & Year == 2015
replace prov_lab = "nb" if Province == "New Brunswick" & Year == 2015
replace prov_lab = "ns" if Province == "Nova Scotia" & Year == 2015
replace prov_lab = "pe" if Province == "Prince Edward Island" & Year == 2015
replace prov_lab = "nl" if Province == "Newfoundland and Labrador" & Year == 2015

gen bc_end  = pct_plot if Province == "British Columbia" & Year == 2015
gen roc_end = roc_mean_plot if Year == 2015 & tag_year

gen str3 bc_lab  = "bc"  if Province == "British Columbia" & Year == 2015
gen str4 avg_lab = "avg" if Year == 2015 & tag_year

gen bc_y  = bc_end + 2 if Province == "British Columbia" & Year == 2015
gen avg_y = roc_end - 2 if Year == 2015 & tag_year

*-----------------------------*
* 8. Build background province lines
*-----------------------------*
levelsof Province if bc == 0, local(provs)

local bgplots
foreach p of local provs {
    local bgplots `bgplots' ///
        (line pct_plot Year if Province == "`p'", ///
        sort lcolor(gs12) lwidth(thin) legend(off))
}

*-----------------------------*
* 9. Draw graph
*-----------------------------*
twoway ///
    `bgplots' ///
    (rarea roc_lb_plot roc_ub_plot Year if tag_year, ///
        sort fcolor(eltblue%60) lcolor(eltblue) legend(off)) ///
    (line roc_mean_plot Year if tag_year, ///
        sort lcolor(midblue) lwidth(medthick) legend(off)) ///
    (line pct_plot Year if Province == "British Columbia", ///
        sort lcolor(red) lwidth(medthick) legend(off)) ///
    (scatter end_y Year if Year == 2015 & bc == 0, ///
        msymbol(none) mlabel(prov_lab) mlabcolor(gs8) mlabsize(small) mlabposition(2) legend(off)) ///
    (scatter bc_y Year if Province == "British Columbia" & Year == 2015, ///
        msymbol(none) mlabel(bc_lab) mlabcolor(red) mlabsize(small) mlabposition(3) legend(off)) ///
    (scatter avg_y Year if Year == 2015 & tag_year, ///
        msymbol(none) mlabel(avg_lab) mlabcolor(midblue) mlabsize(small) mlabposition(3) legend(off)) ///
    (pci 140 1990.8 140 1992.0, lcolor(red) lwidth(medthick)) ///
    (pci 132 1990.8 132 1992.0, lcolor(midblue) lwidth(medthick)) ///
    (pci 124 1990.8 124 1992.0, lcolor(gs12) lwidth(thin)), ///
    scheme(s1color) ///
    xline(2008, lpattern(dash) lcolor(lavender) lwidth(medthick)) ///
    yline(0, lcolor(orange) lwidth(thin)) ///
    xlabel(1990(5)2016, nogrid labsize(small)) ///
    ylabel(`ymin'(50)`ymax', nogrid angle(horizontal) labsize(small)) ///
    xscale(range(1990 2015)) ///
    yscale(range(`ymin' `ymax')) ///
    xtitle("") ///
    ytitle("Percentage Change in Emissions", size(medsmall)) ///
    title("Fugitive(exempt from tax)", size(medium)) ///
    text(120 2008.2 "BC Carbon Tax", place(e) color(lavender) size(small)) ///
    text(30 2010.5 "Rest of" "Canada Average", place(e) color(midblue) size(small)) ///
    text(140 1992.25 "BC", place(e) color(red) size(small)) ///
    text(132 1992.25 "Rest of Canada (Average)", place(e) color(midblue) size(small)) ///
    text(124 1992.25 "Other provinces", place(e) color(gs8) size(small)) ///
    name(fig_fugitive, replace)

graph export "$Cleaned/fig_fugitive.png", replace width(2000)

restore

*==============================================================*
* Figure: Agriculture CO2 emissions, Pretis-style (trimmed)
*==============================================================*

preserve

*-----------------------------*
* 1. Keep agriculture emissions
*-----------------------------*
keep if Category == "Total Agriculture"
keep if inrange(Year, 1990, 2015)

drop if inlist(Province, "Yukon", "Northwest Territories", "Nunavut")

*-----------------------------*
* 2. Baseline mean: 1990-2007
*-----------------------------*
bysort Province: egen base_mean = mean(cond(inrange(Year, 1990, 2007), C02_Mt, .))
gen pct_change = 100 * (C02_Mt - base_mean) / base_mean
gen bc = Province == "British Columbia"

*-----------------------------*
* 3. Save province-level data
*-----------------------------*
tempfile provdata rocdata
save `provdata', replace

*-----------------------------*
* 4. Rest of Canada mean + CI
*-----------------------------*
keep if bc == 0

collapse ///
    (mean) roc_mean = pct_change ///
    (sd)   roc_sd   = pct_change ///
    (count) roc_n   = pct_change, by(Year)

gen roc_se = roc_sd / sqrt(roc_n)
gen roc_lb = roc_mean - 1.96*roc_se
gen roc_ub = roc_mean + 1.96*roc_se

save `rocdata', replace

*-----------------------------*
* 5. Merge ROC series back
*-----------------------------*
use `provdata', clear
merge m:1 Year using `rocdata', nogen

egen tag_year = tag(Year)

*-----------------------------*
* 6. Clip only for plotting
*-----------------------------*
local ymin = -100
local ymax = 150

gen pct_plot = pct_change
replace pct_plot = `ymax' if pct_plot > `ymax'
replace pct_plot = `ymin' if pct_plot < `ymin'

gen roc_mean_plot = roc_mean
replace roc_mean_plot = `ymax' if roc_mean_plot > `ymax'
replace roc_mean_plot = `ymin' if roc_mean_plot < `ymin'

gen roc_lb_plot = roc_lb
replace roc_lb_plot = `ymax' if roc_lb_plot > `ymax'
replace roc_lb_plot = `ymin' if roc_lb_plot < `ymin'

gen roc_ub_plot = roc_ub
replace roc_ub_plot = `ymax' if roc_ub_plot > `ymax'
replace roc_ub_plot = `ymin' if roc_ub_plot < `ymin'

*-----------------------------*
* 7. Province abbreviations at right edge
*-----------------------------*
gen end_y = pct_plot if Year == 2015 & bc == 0
gen str3 prov_lab = ""

replace prov_lab = "ab" if Province == "Alberta" & Year == 2015
replace prov_lab = "sk" if Province == "Saskatchewan" & Year == 2015
replace prov_lab = "mb" if Province == "Manitoba" & Year == 2015
replace prov_lab = "on" if Province == "Ontario" & Year == 2015
replace prov_lab = "qc" if Province == "Quebec" & Year == 2015
replace prov_lab = "nb" if Province == "New Brunswick" & Year == 2015
replace prov_lab = "ns" if Province == "Nova Scotia" & Year == 2015
replace prov_lab = "pe" if Province == "Prince Edward Island" & Year == 2015
replace prov_lab = "nl" if Province == "Newfoundland and Labrador" & Year == 2015

gen bc_end  = pct_plot if Province == "British Columbia" & Year == 2015
gen roc_end = roc_mean_plot if Year == 2015 & tag_year

gen str3 bc_lab  = "bc"  if Province == "British Columbia" & Year == 2015
gen str4 avg_lab = "avg" if Year == 2015 & tag_year

gen bc_y  = bc_end + 2 if Province == "British Columbia" & Year == 2015
gen avg_y = roc_end - 2 if Year == 2015 & tag_year

*-----------------------------*
* 8. Build background province lines
*-----------------------------*
levelsof Province if bc == 0, local(provs)

local bgplots
foreach p of local provs {
    local bgplots `bgplots' ///
        (line pct_plot Year if Province == "`p'", ///
        sort lcolor(gs12) lwidth(thin) legend(off))
}

*-----------------------------*
* 9. Draw graph
*-----------------------------*
twoway ///
    `bgplots' ///
    (rarea roc_lb_plot roc_ub_plot Year if tag_year, ///
        sort fcolor(eltblue%60) lcolor(eltblue) legend(off)) ///
    (line roc_mean_plot Year if tag_year, ///
        sort lcolor(midblue) lwidth(medthick) legend(off)) ///
    (line pct_plot Year if Province == "British Columbia", ///
        sort lcolor(red) lwidth(medthick) legend(off)) ///
    (scatter end_y Year if Year == 2015 & bc == 0, ///
        msymbol(none) mlabel(prov_lab) mlabcolor(gs8) mlabsize(small) mlabposition(2) legend(off)) ///
    (scatter bc_y Year if Province == "British Columbia" & Year == 2015, ///
        msymbol(none) mlabel(bc_lab) mlabcolor(red) mlabsize(small) mlabposition(3) legend(off)) ///
    (scatter avg_y Year if Year == 2015 & tag_year, ///
        msymbol(none) mlabel(avg_lab) mlabcolor(midblue) mlabsize(small) mlabposition(3) legend(off)) ///
    (pci 140 1990.8 140 1992.0, lcolor(red) lwidth(medthick)) ///
    (pci 132 1990.8 132 1992.0, lcolor(midblue) lwidth(medthick)) ///
    (pci 124 1990.8 124 1992.0, lcolor(gs12) lwidth(thin)), ///
    scheme(s1color) ///
    xline(2008, lpattern(dash) lcolor(lavender) lwidth(medthick)) ///
    yline(0, lcolor(orange) lwidth(thin)) ///
    xlabel(1990(5)2016, nogrid labsize(small)) ///
    ylabel(`ymin'(50)`ymax', nogrid angle(horizontal) labsize(small)) ///
    xscale(range(1990 2015)) ///
    yscale(range(`ymin' `ymax')) ///
    xtitle("") ///
    ytitle("Percentage Change in Emissions", size(medsmall)) ///
    title("Agriculture", size(medium)) ///
    text(120 2008.2 "BC Carbon Tax", place(e) color(lavender) size(small)) ///
    text(25 2010.5 "Rest of" "Canada Average", place(e) color(midblue) size(small)) ///
    text(140 1992.25 "BC", place(e) color(red) size(small)) ///
    text(132 1992.25 "Rest of Canada (Average)", place(e) color(midblue) size(small)) ///
    text(124 1992.25 "Other provinces", place(e) color(gs8) size(small)) ///
    name(fig_agriculture, replace)

graph export "$Cleaned/fig_agriculture.png", replace width(2000)

restore


*==============================================================*
* Figure: Waste CO2 emissions, Pretis-style
*==============================================================*

preserve

*-----------------------------*
* 1. Keep waste emissions
*-----------------------------*
keep if Category == "Total Waste"
keep if inrange(Year, 1990, 2015)

drop if inlist(Province, "Yukon", "Northwest Territories", "Nunavut")

*-----------------------------*
* 2. Baseline mean: 1990-2007
*-----------------------------*
bysort Province: egen base_mean = mean(cond(inrange(Year, 1990, 2007), C02_Mt, .))
gen pct_change = 100 * (C02_Mt - base_mean) / base_mean
gen bc = Province == "British Columbia"

*-----------------------------*
* 3. Save province-level data
*-----------------------------*
tempfile provdata rocdata
save `provdata', replace

*-----------------------------*
* 4. Rest of Canada mean + CI
*-----------------------------*
keep if bc == 0

collapse ///
    (mean) roc_mean = pct_change ///
    (sd)   roc_sd   = pct_change ///
    (count) roc_n   = pct_change, by(Year)

gen roc_se = roc_sd / sqrt(roc_n)
gen roc_lb = roc_mean - 1.96*roc_se
gen roc_ub = roc_mean + 1.96*roc_se

save `rocdata', replace

*-----------------------------*
* 5. Merge ROC series back
*-----------------------------*
use `provdata', clear
merge m:1 Year using `rocdata', nogen

egen tag_year = tag(Year)

*-----------------------------*
* 6. Province abbreviations at right edge
*-----------------------------*
gen end_y = pct_change if Year == 2015 & bc == 0
gen str3 prov_lab = ""

replace prov_lab = "ab" if Province == "Alberta" & Year == 2015
replace prov_lab = "sk" if Province == "Saskatchewan" & Year == 2015
replace prov_lab = "mb" if Province == "Manitoba" & Year == 2015
replace prov_lab = "on" if Province == "Ontario" & Year == 2015
replace prov_lab = "qc" if Province == "Quebec" & Year == 2015
replace prov_lab = "nb" if Province == "New Brunswick" & Year == 2015
replace prov_lab = "ns" if Province == "Nova Scotia" & Year == 2015
replace prov_lab = "pe" if Province == "Prince Edward Island" & Year == 2015
replace prov_lab = "nl" if Province == "Newfoundland and Labrador" & Year == 2015

gen bc_end  = pct_change if Province == "British Columbia" & Year == 2015
gen roc_end = roc_mean if Year == 2015 & tag_year

gen str3 bc_lab  = "bc"  if Province == "British Columbia" & Year == 2015
gen str4 avg_lab = "avg" if Year == 2015 & tag_year

gen bc_y  = bc_end + 2 if Province == "British Columbia" & Year == 2015
gen avg_y = roc_end - 2 if Year == 2015 & tag_year

*-----------------------------*
* 7. Build background province lines
*-----------------------------*
levelsof Province if bc == 0, local(provs)

local bgplots
foreach p of local provs {
    local bgplots `bgplots' ///
        (line pct_change Year if Province == "`p'", ///
        sort lcolor(gs12) lwidth(thin) legend(off))
}

*-----------------------------*
* 8. Draw graph
*-----------------------------*
twoway ///
    `bgplots' ///
    (rarea roc_lb roc_ub Year if tag_year, ///
        sort fcolor(eltblue%60) lcolor(eltblue) legend(off)) ///
    (line roc_mean Year if tag_year, ///
        sort lcolor(midblue) lwidth(medthick) legend(off)) ///
    (line pct_change Year if Province == "British Columbia", ///
        sort lcolor(red) lwidth(medthick) legend(off)) ///
    (scatter end_y Year if Year == 2015 & bc == 0, ///
        msymbol(none) mlabel(prov_lab) mlabcolor(gs8) mlabsize(small) mlabposition(2) legend(off)) ///
    (scatter bc_y Year if Province == "British Columbia" & Year == 2015, ///
        msymbol(none) mlabel(bc_lab) mlabcolor(red) mlabsize(small) mlabposition(3) legend(off)) ///
    (scatter avg_y Year if Year == 2015 & tag_year, ///
        msymbol(none) mlabel(avg_lab) mlabcolor(midblue) mlabsize(small) mlabposition(3) legend(off)) ///
    (pci 140 1990.8 140 1992.0, lcolor(red) lwidth(medthick)) ///
    (pci 132 1990.8 132 1992.0, lcolor(midblue) lwidth(medthick)) ///
    (pci 124 1990.8 124 1992.0, lcolor(gs12) lwidth(thin)), ///
    scheme(s1color) ///
    xline(2008, lpattern(dash) lcolor(lavender) lwidth(medthick)) ///
    yline(0, lcolor(orange) lwidth(thin)) ///
    xlabel(1990(5)2016, nogrid labsize(small)) ///
    ylabel(-100(50)150, nogrid angle(horizontal) labsize(small)) ///
    xscale(range(1990 2015)) ///
    yscale(range(-100 150)) ///
    xtitle("") ///
    ytitle("Percentage Change in Emissions", size(medsmall)) ///
    title("Waste", size(medium)) ///
    text(120 2008.2 "BC Carbon Tax", place(e) color(lavender) size(small)) ///
    text(20 2010.5 "Rest of" "Canada Average", place(e) color(midblue) size(small)) ///
    text(140 1992.25 "BC", place(e) color(red) size(small)) ///
    text(132 1992.25 "Rest of Canada (Average)", place(e) color(midblue) size(small)) ///
    text(124 1992.25 "Other provinces", place(e) color(gs8) size(small)) ///
    name(fig_waste, replace)

graph export "$Cleaned/fig_waste.png", replace width(2000)

restore

*==============================================================*
* Figure: Share of BC CO2 Emissions by Sector
*==============================================================*

preserve

*-----------------------------*
* 1. Keep BC and relevant categories
*-----------------------------*
keep if Province == "British Columbia"
keep if inrange(Year, 1990, 2016)

keep if inlist(Category, ///
    "Transport", ///
    "Total Energy", ///
    "Total Industrial Processes and Product Use", ///
    "Total Agriculture", ///
    "Total Waste", ///
    "Fugitive Sources", ///
    "Total")

keep Year Category C02_Mt

*-----------------------------*
* 2. Create short codes
*-----------------------------*
gen code = ""
replace code = "tr"  if Category == "Transport"
replace code = "en"  if Category == "Total Energy"
replace code = "ind" if Category == "Total Industrial Processes and Product Use"
replace code = "agr" if Category == "Total Agriculture"
replace code = "was" if Category == "Total Waste"
replace code = "fug" if Category == "Fugitive Sources"
replace code = "tot" if Category == "Total"

rename C02_Mt e
drop Category

*-----------------------------*
* 3. Reshape wide
*-----------------------------*
reshape wide e, i(Year) j(code) string

*-----------------------------*
* 4. Construct stationary combustion
*-----------------------------*
gen estat = een - etr - efug

*-----------------------------*
* 5. Shares of total BC emissions
*-----------------------------*
gen sh_tr   = etr   / etot
gen sh_stat = estat / etot
gen sh_ind  = eind  / etot
gen sh_agr  = eagr  / etot
gen sh_was  = ewas  / etot
gen sh_fug  = efug  / etot

*-----------------------------*
* 6. Labels from 2015 values
*-----------------------------*
sum sh_tr if Year == 2015, meanonly
local tr = string(round(100*r(mean),1)) + "%"

sum sh_stat if Year == 2015, meanonly
local st = string(round(100*r(mean),1)) + "%"

sum sh_ind if Year == 2015, meanonly
local ind = string(round(100*r(mean),1)) + "%"

sum sh_agr if Year == 2015, meanonly
local agr = string(round(100*r(mean),1)) + "%"

sum sh_was if Year == 2015, meanonly
local was = string(round(100*r(mean),1)) + "%"

sum sh_fug if Year == 2015, meanonly
local fug = string(round(100*r(mean),1)) + "%"

*-----------------------------*
* 7. Draw graph
*-----------------------------*
twoway ///
    (line sh_tr   Year, sort lcolor(orange) lwidth(medthin)) ///
    (line sh_stat Year, sort lcolor(purple) lwidth(medthin)) ///
    (line sh_ind  Year, sort lcolor(sienna) lwidth(thin)) ///
    (line sh_agr  Year, sort lcolor(green)  lwidth(thin)) ///
    (line sh_was  Year, sort lcolor(teal)   lwidth(thin)) ///
    (line sh_fug  Year, sort lcolor(red)    lwidth(thin)), ///
    scheme(s1color) ///
    xlabel(1990(5)2020, nogrid labsize(small)) ///
    ylabel(0(.1).5, nogrid angle(horizontal) labsize(small) format(%3.1f)) ///
    xscale(range(1990 2019)) ///
    yscale(range(-0.01 .52)) ///
    xtitle("") ///
    ytitle("Share of BC CO2 Emissions", size(small)) ///
    title("Share of BC Emissions by Sector", size(medsmall)) ///
    legend(off) ///
    text(0.505 2010 "Transportation `tr'", place(e) color(orange) size(small)) ///
    text(0.395 2010 "Stationary Combustion `st'", place(e) color(purple) size(small)) ///
    text(0.055 2014.8 "Industry `ind'", place(e) color(sienna) size(vsmall)) ///
    text(0.012 2004   "Agriculture `agr'", place(e) color(green) size(vsmall)) ///
    text(0.008 1998   "Waste `was'", place(e) color(teal) size(vsmall)) ///
    text(0.004 2014.8 "Fugitive `fug'", place(e) color(red) size(vsmall)) ///
   

graph export "$Cleaned/fig_share_bc_emissions.png", replace width(2000)

restore



*==============================================================================
*ROBUSTNESS CHECKS
*==============================================================================


*===============================================================================
* Robustness Check 1: Excluding Alberta and Quebec from the control group
*===============================================================================


//Regression for Total
preserve
keep if Category=="Total"

* Exclude provinces with carbon-pricing schemes
drop if Province=="Alberta" | Province=="Quebec"

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Transportation
preserve
keep if Category=="Transport"

* Exclude provinces with carbon-pricing schemes
drop if Province=="Alberta" | Province=="Quebec"

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Fugitive Sources
preserve
keep if Category=="Fugitive Sources" & C02_Mt>0

* Exclude provinces with carbon-pricing schemes
drop if Province=="Alberta" | Province=="Quebec"

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Total Energy
preserve
keep if Category=="Total Energy" & C02_Mt>0

* Exclude provinces with carbon-pricing schemes
drop if Province=="Alberta" | Province=="Quebec"

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Total Industrial Processes and Product Use
preserve
keep if Category=="Total Industrial Processes and Product Use" & C02_Mt>0

* Exclude provinces with carbon-pricing schemes
drop if Province=="Alberta" | Province=="Quebec"

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Total Agriculture
preserve
keep if Category=="Total Agriculture" & C02_Mt>0

* Exclude provinces with carbon-pricing schemes
drop if Province=="Alberta" | Province=="Quebec"

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Total Waste
preserve
keep if Category=="Total Waste" & C02_Mt>0

* Exclude provinces with carbon-pricing schemes
drop if Province=="Alberta" | Province=="Quebec"

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


preserve
keep if Category=="Total"

xtset prov_id Year

xtabond2 l_emiss L.l_emiss tax l_pop l_gdp, ///
    gmm(L.l_emiss, lag(2 3) collapse) ///
    iv(tax l_pop l_gdp) ///
    twostep robust small

restore




*===============================================================================
* Robustness Check 2: Conventional Standard Errors
*===============================================================================


//Regression for Total
preserve
keep if Category=="Total"

count if missing(l_emiss)

xtset prov_id Year

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year)

nlcom _b[tax]/(1-_b[L.l_emiss])

restore


//Regression for Transportation
preserve
keep if Category=="Transport"

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Fugitive Sources
preserve
keep if Category=="Fugitive Sources" & C02_Mt>0

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Total Energy
preserve
keep if Category=="Total Energy" & C02_Mt>0

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Total Industrial Processes and Product Use
preserve
keep if Category=="Total Industrial Processes and Product Use" & C02_Mt>0

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Total Agriculture
preserve
keep if Category=="Total Agriculture" & C02_Mt>0

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year)

nlcom _b[tax]/(1-_b[L.l_emiss])
restore


//Regression for Total Waste
preserve
keep if Category=="Total Waste" & C02_Mt>0

xtset prov_id Year
count if missing(l_emiss)

reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year)

nlcom _b[tax]/(1-_b[L.l_emiss])

restore



*===============================================================================
* Robustness Check 3: Cluster-Robust Bootstrap Standard Errors
*===============================================================================

*========================
* 1. TOTAL
*========================
preserve
keep if Category=="Total"

capture program drop did_boot_total
program define did_boot_total, rclass
    xtset bs_id Year
    reghdfe l_emiss tax L.l_emiss l_pop l_gdp, absorb(bs_id Year)
    return scalar b_tax = _b[tax]
end

bootstrap r(b_tax), reps(500) cluster(prov_id) idcluster(bs_id) seed(12345): did_boot_total
restore


*========================
* 2. TRANSPORTATION
*========================
preserve
keep if Category=="Transport"

capture program drop did_boot_trans
program define did_boot_trans, rclass
    xtset bs_id Year
    reghdfe l_emiss tax L.l_emiss l_pop l_gdp, absorb(bs_id Year)
    return scalar b_tax = _b[tax]
end

bootstrap r(b_tax), reps(500) cluster(prov_id) idcluster(bs_id) seed(12345): did_boot_trans
restore


*========================
* 3. FUGITIVE SOURCES
*========================
preserve
keep if Category=="Fugitive Sources" & C02_Mt>0

capture program drop did_boot_fugit
program define did_boot_fugit, rclass
    xtset bs_id Year
    reghdfe l_emiss tax L.l_emiss l_pop l_gdp, absorb(bs_id Year)
    return scalar b_tax = _b[tax]
end

bootstrap r(b_tax), reps(500) cluster(prov_id) idcluster(bs_id) seed(12345): did_boot_fugit
restore


*========================
* 4. TOTAL ENERGY
*========================
preserve
keep if Category=="Total Energy" & C02_Mt>0

capture program drop did_boot_energy
program define did_boot_energy, rclass
    xtset bs_id Year
    reghdfe l_emiss tax L.l_emiss l_pop l_gdp, absorb(bs_id Year)
    return scalar b_tax = _b[tax]
end

bootstrap r(b_tax), reps(500) cluster(prov_id) idcluster(bs_id) seed(12345): did_boot_energy
restore


*========================
* 5. INDUSTRY
*========================
preserve
keep if Category=="Total Industrial Processes and Product Use" & C02_Mt>0

capture program drop did_boot_industry
program define did_boot_industry, rclass
    xtset bs_id Year
    reghdfe l_emiss tax L.l_emiss l_pop l_gdp, absorb(bs_id Year)
    return scalar b_tax = _b[tax]
end

bootstrap r(b_tax), reps(500) cluster(prov_id) idcluster(bs_id) seed(12345): did_boot_industry
restore


*========================
* 6. AGRICULTURE
*========================
preserve
keep if Category=="Total Agriculture" & C02_Mt>0

capture program drop did_boot_agric
program define did_boot_agric, rclass
    xtset bs_id Year
    reghdfe l_emiss tax L.l_emiss l_pop l_gdp, absorb(bs_id Year)
    return scalar b_tax = _b[tax]
end

bootstrap r(b_tax), reps(500) cluster(prov_id) idcluster(bs_id) seed(12345): did_boot_agric
restore


*========================
* 7. WASTE
*========================
preserve
keep if Category=="Total Waste" & C02_Mt>0

capture program drop did_boot_waste
program define did_boot_waste, rclass
    xtset bs_id Year
    reghdfe l_emiss tax L.l_emiss l_pop l_gdp, absorb(bs_id Year)
    return scalar b_tax = _b[tax]
end

bootstrap r(b_tax), reps(500) cluster(prov_id) idcluster(bs_id) seed(12345): did_boot_waste
restore




*==============================================================*
* RANDOMIZATION INFERENCE / PLACEBO TEST:
* AGGREGATE CO2 EMISSIONS 
*==============================================================*

preserve

*--------------------------------------------------------------*
* STEP 1. Keep only aggregate emissions
*--------------------------------------------------------------*
keep if Category == "Total"

*--------------------------------------------------------------*
* STEP 2. Declare panel structure
*--------------------------------------------------------------*
xtset prov_id Year

*--------------------------------------------------------------*
* STEP 3. Estimate the actual BC treatment effect
*--------------------------------------------------------------*
quietly reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

scalar beta_real = _b[tax]
scalar t_real    = _b[tax] / _se[tax]

display "Actual aggregate beta = " beta_real
display "Actual aggregate t    = " t_real

*--------------------------------------------------------------*
* STEP 4. Create temporary file to store placebo results
*--------------------------------------------------------------*
tempfile placebo_results_aggregate
capture postclose mypost
postfile mypost int prov int year double beta tstat using `placebo_results_aggregate', replace

*--------------------------------------------------------------*
* STEP 5. Get list of provinces and years
*--------------------------------------------------------------*
levelsof prov_id, local(provs)
levelsof Year, local(years)

*--------------------------------------------------------------*
* STEP 6. Create placebo treatment variable
*--------------------------------------------------------------*
capture drop placebo_tax
gen placebo_tax = 0

*--------------------------------------------------------------*
* STEP 7. Loop over all province-year placebo assignments
*--------------------------------------------------------------*
foreach p of local provs {
    foreach y of local years {

        quietly replace placebo_tax = 0
        quietly replace placebo_tax = 1 if prov_id == `p' & Year >= `y'

        quietly count if placebo_tax == 1
        if r(N) > 0 {

            capture noisily reghdfe l_emiss placebo_tax L.l_emiss l_pop l_gdp, ///
                absorb(prov_id Year) vce(cluster prov_id)

            if _rc == 0 {
                capture scalar b = _b[placebo_tax]
                capture scalar s = _se[placebo_tax]

                if c(rc) == 0 {
                    scalar t = .
                    if !missing(s) & s > 0 {
                        scalar t = b/s
                    }
                    post mypost (`p') (`y') (b) (t)
                }
            }
        }
    }
}

*--------------------------------------------------------------*
* STEP 8. Close postfile and load placebo estimates
*--------------------------------------------------------------*
postclose mypost
use `placebo_results_aggregate', clear

count
display "Rows stored (aggregate placebo estimates) = " r(N)

*--------------------------------------------------------------*
* STEP 9. Compute randomization-inference p-values
*--------------------------------------------------------------*
gen extreme_beta = abs(beta) >= abs(beta_real)
quietly summarize extreme_beta
scalar p_beta = r(mean)

gen extreme_t = abs(tstat) >= abs(t_real) if !missing(tstat)
quietly summarize extreme_t
scalar p_t = r(mean)

display "RI p-value (aggregate beta) = " p_beta
display "RI p-value (aggregate t)    = " p_t

*--------------------------------------------------------------*
* STEP 10. Compute percentile cutoffs for beta and t-stat
*--------------------------------------------------------------*
quietly centile beta, centile(2.5 5 95 97.5)
scalar b_p2_5  = r(c_1)
scalar b_p5    = r(c_2)
scalar b_p95   = r(c_3)
scalar b_p97_5 = r(c_4)

quietly centile tstat if !missing(tstat), centile(2.5 5 95 97.5)
scalar t_p2_5  = r(c_1)
scalar t_p5    = r(c_2)
scalar t_p95   = r(c_3)
scalar t_p97_5 = r(c_4)

*--------------------------------------------------------------*
* STEP 11. Plot histogram of placebo coefficients
*--------------------------------------------------------------*
histogram beta, width(0.01) frequency ///
    fcolor(gs14%50) lcolor(black) ///
    xline(`=beta_real', lcolor(red) lwidth(thick)) ///
    xline(`=b_p2_5',  lcolor(gs8) lpattern(dash)) ///
    xline(`=b_p5',    lcolor(gs8) lpattern(shortdash)) ///
    xline(`=b_p95',   lcolor(gs8) lpattern(shortdash)) ///
    xline(`=b_p97_5', lcolor(gs8) lpattern(dash)) ///
    xtitle("Coefficient") ///
    ytitle("Frequency") ///
    text(30 `=beta_real' "Estimated BC Carbon Tax", ///
         color(red) size(large) placement(e)) ///
    text(12 0.02 "Placebo Estimates", ///
         color(gs8) size(large)) ///
    graphregion(color(white)) ///
    plotregion(color(white))

graph export "$Cleaned/placebo_beta_aggregate.png", replace width(2000)


*--------------------------------------------------------------*
* STEP 12. Plot histogram of placebo t-statistics
*--------------------------------------------------------------*
histogram tstat if !missing(tstat), width(1) frequency ///
    fcolor(gs14%50) lcolor(black) ///
    xline(`=t_real', lcolor(red) lwidth(thick)) ///
    xline(`=t_p2_5',  lcolor(gs8) lpattern(dash)) ///
    xline(`=t_p5',    lcolor(gs8) lpattern(shortdash)) ///
    xline(`=t_p95',   lcolor(gs8) lpattern(shortdash)) ///
    xline(`=t_p97_5', lcolor(gs8) lpattern(dash)) ///
    xtitle("t-value") ///
    ytitle("Frequency") ///
    text(30 `=t_real' "Estimated BC Carbon Tax", ///
         color(red) size(large) placement(e)) ///
    text(12 3 "Placebo Estimates", ///
         color(gs8) size(large)) ///
    graphregion(color(white)) ///
    plotregion(color(white))

graph export "$Cleaned/placebo_tstat_aggregate.png", replace width(2000)
restore




*==============================================================*
* RANDOMIZATION INFERENCE / PLACEBO TEST:
* TRANSPORTATION CO2 EMISSIONS
*==============================================================*

preserve

*--------------------------------------------------------------*
* STEP 1. Keep only transportation emissions
*--------------------------------------------------------------*
keep if Category == "Transport"

*--------------------------------------------------------------*
* STEP 2. Declare panel structure
*--------------------------------------------------------------*
xtset prov_id Year

*--------------------------------------------------------------*
* STEP 3. Estimate the actual BC treatment effect
*--------------------------------------------------------------*
quietly reghdfe l_emiss tax L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

scalar beta_real = _b[tax]
scalar t_real    = _b[tax] / _se[tax]

display "Actual transport beta = " beta_real
display "Actual transport t    = " t_real

*--------------------------------------------------------------*
* STEP 4. Create temporary file to store placebo results
*--------------------------------------------------------------*
tempfile placebo_results_transport
capture postclose mypost
postfile mypost int prov int year double beta tstat using `placebo_results_transport', replace

*--------------------------------------------------------------*
* STEP 5. Get list of provinces and years
*--------------------------------------------------------------*
levelsof prov_id, local(provs)
levelsof Year, local(years)

*--------------------------------------------------------------*
* STEP 6. Create placebo treatment variable
*--------------------------------------------------------------*
capture drop placebo_tax
gen placebo_tax = 0

*--------------------------------------------------------------*
* STEP 7. Loop over all province-year placebo assignments
*--------------------------------------------------------------*
foreach p of local provs {
    foreach y of local years {

        quietly replace placebo_tax = 0
        quietly replace placebo_tax = 1 if prov_id == `p' & Year >= `y'

        quietly count if placebo_tax == 1
        if r(N) > 0 {

            capture noisily reghdfe l_emiss placebo_tax L.l_emiss l_pop l_gdp, ///
                absorb(prov_id Year) vce(cluster prov_id)

            if _rc == 0 {
                capture scalar b = _b[placebo_tax]
                capture scalar s = _se[placebo_tax]

                if c(rc) == 0 {
                    scalar t = .
                    if !missing(s) & s > 0 {
                        scalar t = b/s
                    }
                    post mypost (`p') (`y') (b) (t)
                }
            }
        }
    }
}

*--------------------------------------------------------------*
* STEP 8. Close postfile and load placebo estimates
*--------------------------------------------------------------*
postclose mypost
use `placebo_results_transport', clear

count
display "Rows stored (transport placebo estimates) = " r(N)

*--------------------------------------------------------------*
* STEP 9. Compute randomization-inference p-values
*--------------------------------------------------------------*
gen extreme_beta = abs(beta) >= abs(beta_real)
quietly summarize extreme_beta
scalar p_beta = r(mean)

gen extreme_t = abs(tstat) >= abs(t_real) if !missing(tstat)
quietly summarize extreme_t
scalar p_t = r(mean)

display "RI p-value (transport beta) = " p_beta
display "RI p-value (transport t)    = " p_t

*--------------------------------------------------------------*
* STEP 10. Compute percentile cutoffs for beta and t-stat
*--------------------------------------------------------------*
quietly centile beta, centile(2.5 5 95 97.5)
scalar b_p2_5  = r(c_1)
scalar b_p5    = r(c_2)
scalar b_p95   = r(c_3)
scalar b_p97_5 = r(c_4)

quietly centile tstat if !missing(tstat), centile(2.5 5 95 97.5)
scalar t_p2_5  = r(c_1)
scalar t_p5    = r(c_2)
scalar t_p95   = r(c_3)
scalar t_p97_5 = r(c_4)

*--------------------------------------------------------------*
* STEP 11. Plot histogram of placebo coefficients
*--------------------------------------------------------------*
histogram beta, width(0.01) frequency ///
    fcolor(gs14%50) lcolor(black) ///
    xline(`=beta_real', lcolor(red) lwidth(thick)) ///
    xline(`=b_p2_5',  lcolor(gs8) lpattern(dash)) ///
    xline(`=b_p5',    lcolor(gs8) lpattern(shortdash)) ///
    xline(`=b_p95',   lcolor(gs8) lpattern(shortdash)) ///
    xline(`=b_p97_5', lcolor(gs8) lpattern(dash)) ///
    xtitle("Coefficient") ///
    ytitle("Frequency") ///
    text(70 `=beta_real' "Estimated BC Carbon Tax", ///
         color(red) size(large) placement(e)) ///
    text(12 0.045 "Placebo Estimates", ///
         color(gs8) size(large)) ///
    graphregion(color(white)) ///
    plotregion(color(white))
graph export "$Cleaned/placebo_beta_transport.png", replace width(2000)


*--------------------------------------------------------------*
* STEP 12. Plot histogram of placebo t-statistics
*--------------------------------------------------------------*
histogram tstat if !missing(tstat), width(1) frequency ///
    fcolor(gs14%50) lcolor(black) ///
    xline(`=t_real', lcolor(red) lwidth(thick)) ///
    xline(`=t_p2_5',  lcolor(gs8) lpattern(dash)) ///
    xline(`=t_p5',    lcolor(gs8) lpattern(shortdash)) ///
    xline(`=t_p95',   lcolor(gs8) lpattern(shortdash)) ///
    xline(`=t_p97_5', lcolor(gs8) lpattern(dash)) ///
    xtitle("t-value") ///
    ytitle("Frequency") ///
    text(40 `=t_real' "Estimated BC Carbon Tax", ///
         color(red) size(large) placement(e)) ///
    text(12 4 "Placebo Estimates", ///
         color(gs8) size(large)) ///
    graphregion(color(white)) ///
    plotregion(color(white))

graph export "$Cleaned/placebo_tstat_transport.png", replace width(2000)


restore



*===============================================================================
* Event Study (Dynamic Treatment Effects) – Total Emissions
*===============================================================================

preserve

*----------------------------
* 1. Restrict sample
*----------------------------
keep if Category=="Total"

xtset prov_id Year


*----------------------------
* 2. Event time (BC only)
*----------------------------
gen event_time = Year - 2008 if Province=="British Columbia"


*----------------------------
* 3. Leads and lags
*   (Reference period = -1 → 2007)
*----------------------------
gen lead4 = (event_time==-4)
gen lead3 = (event_time==-3)
gen lead2 = (event_time==-2)

gen event0 = (event_time==0)
gen lag1  = (event_time==1)
gen lag2  = (event_time==2)
gen lag3  = (event_time==3)
gen lag4  = (event_time==4)
gen lag5  = (event_time==5)
gen lag6  = (event_time==6)
gen lag7  = (event_time==7)
gen lag8  = (event_time==8)
gen lag9  = (event_time==9)
gen lag10 = (event_time==10)


*----------------------------
* 4. Event study regression
*----------------------------
reghdfe l_emiss ///
    lead4 lead3 lead2 ///
    event0 lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 lag9 lag10 ///
    L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)


restore


*===============================================================================
* Event Study (Dynamic Treatment Effects) – Transportation
*===============================================================================

preserve

keep if Category=="Transport"

xtset prov_id Year

gen event_time = Year - 2008 if Province=="British Columbia"

gen lead4 = (event_time==-4)
gen lead3 = (event_time==-3)
gen lead2 = (event_time==-2)

gen event0 = (event_time==0)
gen lag1  = (event_time==1)
gen lag2  = (event_time==2)
gen lag3  = (event_time==3)
gen lag4  = (event_time==4)
gen lag5  = (event_time==5)
gen lag6  = (event_time==6)
gen lag7  = (event_time==7)
gen lag8  = (event_time==8)
gen lag9  = (event_time==9)
gen lag10 = (event_time==10)

reghdfe l_emiss ///
    lead4 lead3 lead2 ///
    event0 lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 lag9 lag10 ///
    L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

restore



*===============================================================================
* Event Study (Dynamic Treatment Effects) – Fugitive Sources
*===============================================================================

preserve

keep if Category=="Fugitive Sources" & C02_Mt>0

xtset prov_id Year

gen event_time = Year - 2008 if Province=="British Columbia"

gen lead4 = (event_time==-4)
gen lead3 = (event_time==-3)
gen lead2 = (event_time==-2)

gen event0 = (event_time==0)
gen lag1  = (event_time==1)
gen lag2  = (event_time==2)
gen lag3  = (event_time==3)
gen lag4  = (event_time==4)
gen lag5  = (event_time==5)
gen lag6  = (event_time==6)
gen lag7  = (event_time==7)
gen lag8  = (event_time==8)
gen lag9  = (event_time==9)
gen lag10 = (event_time==10)

reghdfe l_emiss ///
    lead4 lead3 lead2 ///
    event0 lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 lag9 lag10 ///
    L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

restore


*===============================================================================
* Event Study (Dynamic Treatment Effects) – Total Energy
*===============================================================================

preserve

keep if Category=="Total Energy" & C02_Mt>0

xtset prov_id Year

gen event_time = Year - 2008 if Province=="British Columbia"

gen lead4 = (event_time==-4)
gen lead3 = (event_time==-3)
gen lead2 = (event_time==-2)

gen event0 = (event_time==0)
gen lag1  = (event_time==1)
gen lag2  = (event_time==2)
gen lag3  = (event_time==3)
gen lag4  = (event_time==4)
gen lag5  = (event_time==5)
gen lag6  = (event_time==6)
gen lag7  = (event_time==7)
gen lag8  = (event_time==8)
gen lag9  = (event_time==9)
gen lag10 = (event_time==10)

reghdfe l_emiss ///
    lead4 lead3 lead2 ///
    event0 lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 lag9 lag10 ///
    L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

restore


*===============================================================================
* Event Study (Dynamic Treatment Effects) – Industry
*===============================================================================

preserve

keep if Category=="Total Industrial Processes and Product Use" & C02_Mt>0

xtset prov_id Year

gen event_time = Year - 2008 if Province=="British Columbia"

gen lead4 = (event_time==-4)
gen lead3 = (event_time==-3)
gen lead2 = (event_time==-2)

gen event0 = (event_time==0)
gen lag1  = (event_time==1)
gen lag2  = (event_time==2)
gen lag3  = (event_time==3)
gen lag4  = (event_time==4)
gen lag5  = (event_time==5)
gen lag6  = (event_time==6)
gen lag7  = (event_time==7)
gen lag8  = (event_time==8)
gen lag9  = (event_time==9)
gen lag10 = (event_time==10)

reghdfe l_emiss ///
    lead4 lead3 lead2 ///
    event0 lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 lag9 lag10 ///
    L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

restore



*===============================================================================
* Event Study (Dynamic Treatment Effects) – Agriculture
*===============================================================================

preserve

keep if Category=="Total Agriculture" & C02_Mt>0

xtset prov_id Year

gen event_time = Year - 2008 if Province=="British Columbia"

gen lead4 = (event_time==-4)
gen lead3 = (event_time==-3)
gen lead2 = (event_time==-2)

gen event0 = (event_time==0)
gen lag1  = (event_time==1)
gen lag2  = (event_time==2)
gen lag3  = (event_time==3)
gen lag4  = (event_time==4)
gen lag5  = (event_time==5)
gen lag6  = (event_time==6)
gen lag7  = (event_time==7)
gen lag8  = (event_time==8)
gen lag9  = (event_time==9)
gen lag10 = (event_time==10)

reghdfe l_emiss ///
    lead4 lead3 lead2 ///
    event0 lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 lag9 lag10 ///
    L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

restore



*===============================================================================
* Event Study (Dynamic Treatment Effects) – Waste
*===============================================================================

preserve

keep if Category=="Total Waste" & C02_Mt>0

xtset prov_id Year

gen event_time = Year - 2008 if Province=="British Columbia"

gen lead4 = (event_time==-4)
gen lead3 = (event_time==-3)
gen lead2 = (event_time==-2)

gen event0 = (event_time==0)
gen lag1  = (event_time==1)
gen lag2  = (event_time==2)
gen lag3  = (event_time==3)
gen lag4  = (event_time==4)
gen lag5  = (event_time==5)
gen lag6  = (event_time==6)
gen lag7  = (event_time==7)
gen lag8  = (event_time==8)
gen lag9  = (event_time==9)
gen lag10 = (event_time==10)

reghdfe l_emiss ///
    lead4 lead3 lead2 ///
    event0 lag1 lag2 lag3 lag4 lag5 lag6 lag7 lag8 lag9 lag10 ///
    L.l_emiss l_pop l_gdp, ///
    absorb(prov_id Year) vce(cluster prov_id)

restore



/**************************************************************************
* 10) CLOSE LOG
**************************************************************************/
log close

exit, clear

