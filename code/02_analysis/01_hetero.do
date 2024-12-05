// load j-pal data wide

use ../../data/analysis/ms_blel_jpal_wide, clear
	
/// gen interactions
		
gen treat_ses=treat*ses
gen treat_age = treat * st_age1

///	label interactions	
			
lab var treat_ses "Treatment * SES index"
label var treat_age "Treatment * Age"

///	run regressions
xtreg m_theta_mle2 treat st_age1 treat_age m_theta_mle1, robust i(strata) fe
outreg2 using ../../results/table4.xls, label less(1) replace 
		
xtreg h_theta_mle2 treat st_age1 treat_age h_theta_mle1, robust i(strata) fe
outreg2 using ../../results/table4.xls, label less(1) append 

xtreg m_theta_mle2 treat ses treat_ses m_theta_mle1, robust i(strata) fe
outreg2 using ../../results/table4.xls, label less(1) append
			
xtreg h_theta_mle2 treat ses treat_ses h_theta_mle1, robust i(strata) fe
outreg2 using ../../results/table4.xls, label less(1) append
