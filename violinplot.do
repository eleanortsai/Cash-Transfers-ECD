import excel using "meta.xlsx", first clear

label define conditional_cash_label 0 "UCT" 1 "UCT+" 2 "CCT" 3 "CCT+"
encode conditional_cash_cat, gen(conditional_cash_label) label(conditional_cash_label)
drop conditional_cash_cat

label define conditional_label 0 "Unconditional" 1 "Conditional"
encode conditional_cat, gen(conditional_label) label(conditional_label)
drop conditional_cat

label define cash_label 0 "Cash Only" 1 "Cash-Plus"
encode cash_plus_cat, gen(cash_label) label(cash_label)
drop cash_plus_cat

encode region, gen(region_label)
drop region

drop conditional
order conditional_cash_label conditional_label cash_label region_label, after(cash_plus_component)

foreach domain in language cognition socioemotional {
	local capvar=strproper("`domain'")
	label var `domain'_esize "`capvar'"
}

label var gmotor_esize "Gross Motor"
label var fmotor_esize "Fine Motor"

violinplot language_esize cognition_esize gmotor_esize fmotor_esize socioemotional_esize, vertical yline(0, lpattern(dash)) ytitle("Effect Size (SD)")
graph export "Violin All.jpg", replace quality(100) width(1728)

foreach domain in language cognition socioemotional gmotor fmotor {
	local label : variable label `domain'_esize
violinplot `domain'_esize, over(conditional_cash_label) vertical yline(0, lpattern(dash)) ytitle("Effect Size (SD)") title("`label'") name(`domain', replace)
}
graph combine language cognition socioemotional gmotor fmotor, xcommon ycommon cols(1) ysize(14)
graph export "Violin Subgroup.jpg", replace quality(100) height(2688)

foreach domain in language cognition socioemotional gmotor fmotor {
	local label : variable label `domain'_esize
violinplot `domain'_esize, over(conditional_label) vertical yline(0, lpattern(dash)) ytitle("Effect Size (SD)") title("`label'") name(`domain', replace)
}
graph combine language cognition socioemotional gmotor fmotor, xcommon ycommon cols(1) ysize(14)
graph export "Violin Conditional.jpg", replace quality(100) height(2688)

foreach domain in language cognition socioemotional gmotor fmotor {
	local label : variable label `domain'_esize
violinplot `domain'_esize, over(cash_label) vertical yline(0, lpattern(dash)) ytitle("Effect Size (SD)") title("`label'") name(`domain', replace)
}
graph combine language cognition socioemotional gmotor fmotor, xcommon ycommon cols(1) ysize(14)
graph export "Violin Plus.jpg", replace quality(100) height(2688)

foreach domain in language cognition socioemotional gmotor fmotor {
	local label : variable label `domain'_esize
violinplot `domain'_esize, over(region_label) vertical yline(0, lpattern(dash)) ytitle("Effect Size (SD)") title("`label'") name(`domain', replace)
}
graph combine language cognition socioemotional gmotor fmotor, xcommon ycommon cols(1) ysize(14)
graph export "Violin Region.jpg", replace quality(100) height(2688)