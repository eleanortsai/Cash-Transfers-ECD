# Cash-Transfers-ECD

## **1. System requirements**<br/>
   <code>CI Calculations.Rmd</code>: RStudio 2024.12.0<br/>
   <code>meta.do</code>, <code>violinplot.do</code>: STATA 17.0<br/>
   <code>meta.xlsx</code>: Microsoft Excel 2016<br/>

## **2. Instructions to run on data**<br/>
   <code>CI Calculations.Rmd</code> defines three functions to calculate Glass' Delta effect sizes and/or confidence intervals, given the information reported in published studies:<br/>
<ol type="a">
<li>standardized regresion coefficients and their standard errors (<code>get_ci</code>);</li>
<li>unstandardized regression coefficients and their standard errors (<code>calculate_sdy</code>); or</li>
<li>regression coefficients and the standard deviation of the control group (<code>calculate_glass_delta2</code>).</li>
</ol>
   <code>meta.xlsx</code> contains data extracted from published studies after any necessary transformations in <code>CI Calculations.Rmd</code>.<br/>
   Run <code>meta.do</code> to produce forest plots and scatterplots, and <code>violinplot.do</code> to produce violin plots from the extracted data.<br/>
   
## **3. Expected output**<br/>
<ol type="a">
<li>Transfer_Language.jpg, Transfer_Cognition.jpg, Transfer_Socioemotional.jpg, Transfer_Gross Motor.jpg, Transfer_Fine Motor.jpg</li>
<li>Conditional_Language.jpg, Conditional_Cognition.jpg, Conditional_Socioemotional.jpg, Conditional_Gross Motor.jpg, Conditional_Fine Motor.jpg</li>
<li>Plus_Language.jpg, Plus_Cognition.jpg, Plus_Socioemotional.jpg, Plus_Gross Motor.jpg, Plus_Fine Motor.jpg</li>
<li>Generosity_Language.jpg, Generosity_Cognition.jpg, Generosity_Socioemotional.jpg, Generosity_Gross Motor.jpg, Generosity_Fine Motor.jpg</li>
<li>Violin All.jpg, Violin Subgroup.jpg, Violin Conditional.jpg, Violin Plus.jpg, Violin Region.jpg</li>
</ol>

## **4. Expected run time**<br/>
   <code>meta.do</code>: 1 minute<br/>
   <code>violinplot.do</code>: 1 minute<br/>
