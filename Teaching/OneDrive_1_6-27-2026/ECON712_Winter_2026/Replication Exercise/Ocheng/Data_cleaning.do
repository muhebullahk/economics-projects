/**************************************************************************
* Project:     ECON 712: Applied Econometrics
* Term:        Winter 2026
* Deliverable: Replication Excercise
* Author:      Ocheng Abel
* Supervisor:  Dr. Leandro Freylejer
*
* Purpose:     Replicable workflow: setup → import → clean
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
global Raw "C:\Users\abelo\OneDrive\APPLICATION TO CANADA 2024\Winter January 2026 reading materials\Replication Exercise\Carbon_tax"

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
log using "$Log\Data_cleaning.log", text replace

display "=============================================================="
display "ECON 712: Applied Econometrics | Winter 2026 | Replication Excercise"
display "Author: Ocheng Abel | Supervisor: Dr. Leandro Freylejer"
display "Run started: " c(current_date) " at " c(current_time)
display "Stata version: " c(stata_version)
display "Working directory Raw: $Raw"
display "=============================================================="



//Importing Emission raw data
import delimited "$Raw/Data_set/EN_GHG_IPCC_Can_Prov_Terr.csv", clear

//Cleaning provinces
keep if regexm(region,"^(Alberta|British Columbia|Ontario|Newfoundland and Labrador|Nova Scotia|New Brunswick|Saskatchewan|Quebec|Prince Edward Island|Manitoba)$")

//Cleaning variables not used
drop total ch4 ch4co2eq n2o n2oco2eq hfcs pfcs sf6 nf3 co2eq unit

//Cleaning variable source
drop if regexm(source, "^(Land Use, Land-Use Change and Forestry)$")

 //Backward summing
keep if subsubcategory == ""
keep if subcategory == ""

replace category = "Total Energy" if category == "" & source == "Energy"

replace category = "Total Industrial Processes and Product Use" if category == "" & source == "Industrial Processes and Product Use"

replace category = "Total Agriculture" if category == "" & source == "Agriculture"

replace category = "Total Waste" if category == "" & source == "Waste"

replace category = "Total" if category == "" & source == "Total"




//Renaming the variables
rename (year region categoryid source category co2) (Year Province Category_ID Source Category C02_Kt)


//Destring Carbon emission values
destring C02_Kt, replace

//Keeping Category
keep if regexm(Category, "^(Total Agriculture|Total Energy|Total Waste|Total Industrial Processes and Product Use|Fugitive Sources|Transport|Total)$")


//Converting Carbon emission from Kt to Mt
gen C02_Mt = C02_Kt/1000


//Grouping provinces in taxed and controls
gen P_group = ""
replace P_group = "Taxed" if Province == "British Columbia"
replace P_group = "Control" if Province != "British Columbia"
order P_group, a(Province)


save "$Raw/Cleaned_datasets/IPCC_Carbon_emission_data.dta", replace






*===============================================================================
*GDP DATASET
*===============================================================================

import delimited "$Raw/Data_set/3610022201_GDP.csv", clear

drop dguid uom uom_id vector coordinate status symbol terminated decimals

//Cleaning provinces
keep if regexm(geo,"^(Alberta|British Columbia|Ontario|Newfoundland and Labrador|Nova Scotia|New Brunswick|Saskatchewan|Quebec|Prince Edward Island|Manitoba)$")

keep if prices == "2017 constant prices"
keep if estimates =="Gross domestic product at market prices"

//Converting GDP from million to billion
gen GDP_bn =value/1000

drop scalar_id scalar_factor
rename ( ref_date geo prices estimates value)(Year Province Price Estimates GDP_mn)

//Merging Emission with GDP
merge 1:m Year Province using "$Raw/Cleaned_datasets/IPCC_Carbon_emission_data.dta", keepusing(Year Province P_group Category_ID Source Category C02_Kt C02_Mt)

drop if _merge==1
drop _merge

order Year Province P_group Category_ID Source Category C02_Kt C02_Mt Price Estimates GDP_mn GDP_bn

save "$Raw/Cleaned_datasets/IPCC_emission_GDP.dta", replace




*===============================================================================
*POPULATION DATASET
*===============================================================================
import delimited "$Raw/Data_set/1710000501_population.csv", clear

keep if agegroup == "All ages"
drop dguid uom uom_id scalar_factor scalar_id vector coordinate status symbol terminated decimals


//Cleaning provinces
keep if regexm(geo,"^(Alberta|British Columbia|Ontario|Newfoundland and Labrador|Nova Scotia|New Brunswick|Saskatchewan|Quebec|Prince Edward Island|Manitoba)$")

//Renaming variables 
rename ( ref_date geo value)(Year Province Population)

//Merging Emission_GDP with population
merge 1:m Year Province using "$Raw/Cleaned_datasets/IPCC_emission_GDP.dta", keepusing(Year Province P_group Category_ID Source Category C02_Kt C02_Mt Price Estimates GDP_mn GDP_bn)

drop if _merge==1

drop _merge gender agegroup Estimates 

order Year Province P_group Category_ID Source Category C02_Kt C02_Mt Price GDP_mn GDP_bn Population

gen Popn_Mn = Population/1000000

save "$Raw/Cleaned_datasets/IPCC_emission_GDP_Popn.dta", replace



/**************************************************************************
* 10) CLOSE LOG
**************************************************************************/
log close

exit, clear









