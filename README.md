# Cash-Transfers-ECD

1. System requirements
   CI Calculations.Rmd: RStudio 2024.12.0
   meta.do, violinplot.do: STATA 17.0
   meta.xlsx: Microsoft Excel 2016
2. Instructions to run on data:
   CI Calculations.Rmd defines three functions to calculate Glass' Delta effect sizes and/or confidence intervals, given the information reported in published studies:
     (a) standardized regresion coefficients and their standard errors ("get_ci");
     (b) unstandardized regression coefficients and their standard errors ("calculate_sdy"); or
     (c) regression coefficients and the standard deviation of the control group ("calculate_glass_delta2").
   meta.xlsx contains data extracted from published studies after any necessary transformations in CI Calculations.Rmd.
   Run meta.do to produce forest plots and scatterplots, and violinplot.do to produce violin plots from the extracted data.
3. Expected output:
     (a) Transfer_Language.jpg, Transfer_Cognition.jpg, Transfer_Socioemotional.jpg, Transfer_Gross Motor.jpg, Transfer_Fine Motor.jpg
     (b) Conditional_Language.jpg, Conditional_Cognition.jpg, Conditional_Socioemotional.jpg, Conditional_Gross Motor.jpg, Conditional_Fine Motor.jpg
     (c) Plus_Language.jpg, Plus_Cognition.jpg, Plus_Socioemotional.jpg, Plus_Gross Motor.jpg, Plus_Fine Motor.jpg
     (d) Generosity_Language.jpg, Generosity_Cognition.jpg, Generosity_Socioemotional.jpg, Generosity_Gross Motor.jpg, Generosity_Fine Motor.jpg
     (e) Violin All.jpg, Violin Subgroup.jpg, Violin Conditional.jpg, Violin Plus.jpg, Violin Region.jpg
4. Expected run time:
   meta.do: 1 minute
   violinplot.do: 1 minute
