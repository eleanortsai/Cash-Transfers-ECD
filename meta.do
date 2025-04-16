import excel using "meta.xlsx", first clear
label define transfer_label 0 "Low Transfer" 1 "Medium Transfer" 2 "High Transfer"
encode transfer_cat, gen(transfer_label) label(transfer_label)
drop transfer_cat
order transfer_label, after(transfer_pct)

label define conditional_cash_label 0 "UCT" 1 "UCT+" 2 "CCT" 3 "CCT+"
encode conditional_cash_cat, gen(conditional_cash_label) label(conditional_cash_label)
drop conditional_cash_cat
order conditional_cash_label, after(conditional_cat)

label define conditional_label 0 "Unconditional" 1 "Conditional"
encode conditional_cat, gen(conditional_label) label(conditional_label)
drop conditional_cat
order conditional_label, after(conditional)

// Heterogeneity by Transfer Generosity (Low, Medium, High)
meta set language_esize language_cil language_ciu, studylabel(studylbl) studysize(N) civartolerance(.02)
meta forestplot, sort(language_esize) title(Language) nullrefline esrefline subgroup(transfer_label)
graph export "Transfer_Language.jpg", replace quality(100) width(6240)

meta set cognition_esize cognition_cil cognition_ciu, studylabel(studylbl) studysize(N) civartolerance(.01)
meta forestplot, sort(cognition_esize) title(Cognition) nullrefline esrefline subgroup(transfer_label)
graph export "Transfer_Cognition.jpg", replace quality(100) width(6240)

meta set gmotor_esize gmotor_cil gmotor_ciu, studylabel(studylbl) studysize(N) civartolerance(.01)
meta forestplot, sort(gmotor_esize) title(Gross Motor) nullrefline esrefline subgroup(transfer_label)
graph export "Transfer_Gross Motor.jpg", replace quality(100) width(6240)

meta set fmotor_esize fmotor_cil fmotor_ciu, studylabel(studylbl) studysize(N) civartolerance(.01)
meta forestplot, sort(fmotor_esize) title(Fine Motor) nullrefline esrefline subgroup(transfer_label)
graph export "Transfer_Fine Motor.jpg", replace quality(100) width(6240)

meta set socioemotional_esize socioemotional_cil socioemotional_ciu, studylabel(studylbl) studysize(N) civartolerance(.02)
meta forestplot, sort(socioemotional_esize) title(Socioemotional) nullrefline esrefline subgroup(transfer_label)
graph export "Transfer_Socioemotional.jpg", replace quality(100) width(6240)

// Heterogeneity by Conditional vs. Unconditional
meta set language_esize language_cil language_ciu, studylabel(studylbl) studysize(N) civartolerance(.02)
meta forestplot, sort(language_esize) title(Language) nullrefline esrefline subgroup(conditional_label)
graph export "Conditional_Language.jpg", replace quality(100) width(6240)

meta set cognition_esize cognition_cil cognition_ciu, studylabel(studylbl) studysize(N) civartolerance(.01)
meta forestplot, sort(cognition_esize) title(Cognition) nullrefline esrefline subgroup(conditional_label)
graph export "Conditional_Cognition.jpg", replace quality(100) width(6240)

meta set gmotor_esize gmotor_cil gmotor_ciu, studylabel(studylbl) studysize(N) civartolerance(.01)
meta forestplot, sort(gmotor_esize) title(Gross Motor) nullrefline esrefline subgroup(conditional_label)
graph export "Conditional_Gross Motor.jpg", replace quality(100) width(6240)

meta set fmotor_esize fmotor_cil fmotor_ciu, studylabel(studylbl) studysize(N) civartolerance(.01)
meta forestplot, sort(fmotor_esize) title(Fine Motor) nullrefline esrefline subgroup(conditional_label)
graph export "Conditional_Fine Motor.jpg", replace quality(100) width(6240)

meta set socioemotional_esize socioemotional_cil socioemotional_ciu, studylabel(studylbl) studysize(N) civartolerance(.02)
meta forestplot, sort(socioemotional_esize) title(Socioemotional) nullrefline esrefline subgroup(conditional_label)
graph export "Conditional_Socioemotional.jpg", replace quality(100) width(6240)

// Heterogeneity by Conditional vs. Unconditional and Cash-Only vs. Cash-Plus (UCT, UCT+, CCT, CCT+)
meta set language_esize language_cil language_ciu, studylabel(studylbl) studysize(N) civartolerance(.02)
meta forestplot, sort(language_esize) title(Language) nullrefline esrefline subgroup(conditional_cash_label)
graph export "Plus_Language.jpg", replace quality(100) width(6240)

meta set cognition_esize cognition_cil cognition_ciu, studylabel(studylbl) studysize(N) civartolerance(.01)
meta forestplot, sort(cognition_esize) title(Cognition) nullrefline esrefline subgroup(conditional_cash_label)
graph export "Plus_Cognition.jpg", replace quality(100) width(6240)

meta set gmotor_esize gmotor_cil gmotor_ciu, studylabel(studylbl) studysize(N) civartolerance(.01)
meta forestplot, sort(gmotor_esize) title(Gross Motor) nullrefline esrefline subgroup(conditional_cash_label)
graph export "Plus_Gross Motor.jpg", replace quality(100) width(6240)

meta set fmotor_esize fmotor_cil fmotor_ciu, studylabel(studylbl) studysize(N) civartolerance(.01)
meta forestplot, sort(fmotor_esize) title(Fine Motor) nullrefline esrefline subgroup(conditional_cash_label)
graph export "Plus_Fine Motor.jpg", replace quality(100) width(6240)

meta set socioemotional_esize socioemotional_cil socioemotional_ciu, studylabel(studylbl) studysize(N) civartolerance(.02)
meta forestplot, sort(socioemotional_esize) title(Socioemotional) nullrefline esrefline subgroup(conditional_cash_label)
graph export "Plus_Socioemotional.jpg", replace quality(100) width(6240)

// Effect Sizes by Transfer Generosity
// gen study = ustrregexra(studylbl," \(.+\)","")
twoway scatter language_esize transfer_pct, msymbol(oh) || scatter language_esize transfer_pct [w=N], msymbol(none) mlabel(study) mlabsize(vsmall) mlabv(mlabv) || ///
lfit language_esize transfer_pct [w=N], legend(off) ylabel(-.4(.2).6) ///
xtitle("Transfer Generosity (% of Income/Expenditure)") ytitle(Language Effect Size) name(generosity_language, replace)
graph export "Generosity_Language.jpg", replace quality(100) width(6240)

twoway scatter cognition_esize transfer_pct, msymbol(oh) || scatter cognition_esize transfer_pct [w=N], msymbol(none) mlabel(study) mlabsize(vsmall) mlabv(mlabv) || ///
lfit cognition_esize transfer_pct [w=N], legend(off) ylabel(-.4(.2).6) ///
xtitle("Transfer Generosity (% of Income/Expenditure)") ytitle(Cognition Effect Size) name(generosity_cognition, replace)
graph export "Generosity_Cognition.jpg", replace quality(100) width(6240)

twoway scatter gmotor_esize transfer_pct, msymbol(oh) || scatter gmotor_esize transfer_pct [w=N], msymbol(none) mlabel(study) mlabsize(vsmall) mlabv(mlabv) || ///
lfit gmotor_esize transfer_pct [w=N], legend(off)  ylabel(-.4(.2).6) ///
xtitle("Transfer Generosity (% of Income/Expenditure)") ytitle(Gross Motor Effect Size) name(generosity_gross_motor, replace)
graph export "Generosity_Gross Motor.jpg", replace quality(100) width(6240)

twoway scatter fmotor_esize transfer_pct, msymbol(oh) || scatter fmotor_esize transfer_pct [w=N], msymbol(none) mlabel(study) mlabsize(vsmall) mlabv(mlabv) || ///
lfit fmotor_esize transfer_pct [w=N], legend(off) ylabel(-.4(.2).6) ///
xtitle("Transfer Generosity (% of Income/Expenditure)") ytitle(Fine Motor Effect Size) name(generosity_fine_motor, replace)
graph export "Generosity_Fine Motor.jpg", replace quality(100) width(6240)

twoway scatter socioemotional_esize transfer_pct, msymbol(oh) || scatter socioemotional_esize transfer_pct [w=N], msymbol(none) mlabel(study) mlabsize(vsmall) mlabv(mlabv) || ///
lfit socioemotional_esize transfer_pct [w=N], legend(off) ylabel(-.4(.2).6) ///
xtitle("Transfer Generosity (% of Income/Expenditure)") ytitle(Socioemotional Effect Size) name(generosity_socioemotional, replace)
graph export "Generosity_Socioemotional.jpg", replace quality(100) width(6240)

graph combine generosity_cognition generosity_language generosity_socioemotional generosity_gross_motor generosity_fine_motor, xcommon ycommon cols(2) rows(3) ///
b1title("Transfer Generosity (% of Income/Expenditure)", size(vsmall)) imargin(tiny) xsize(11) ysize(14)
