# ****************************************
# Confounder Handling Simulation Study
#
# Combine Tables
# Combine results tables across step=0 and step=1 column divisions
#
# Emma Tarmey
#
# Started:          23/04/2025
# Most Recent Edit: 23/04/2025
# ****************************************



# ----- Setup -----

# clear R memory
rm(list=ls())

# fix wd issue
# forces wd to be the location of this file
if (Sys.getenv("RSTUDIO") == "1") {
  setwd(dirname(rstudioapi::getSourceEditorContext()$path))
}



# ----- Import Data -----

scenario_1_step_0_causal_estimation_table          <- read.csv("temp/scenario_1_step_0_causal_estimation_table.csv")
scenario_1_step_1_causal_estimation_table          <- read.csv("temp/scenario_1_step_1_causal_estimation_table.csv")
scenario_1_step_0_backdoor_pathway_table           <- read.csv("temp/scenario_1_step_0_backdoor_pathway_table.csv")
scenario_1_step_1_backdoor_pathway_table           <- read.csv("temp/scenario_1_step_1_backdoor_pathway_table.csv")
scenario_1_step_0_standard_error_first_half_table  <- read.csv("temp/scenario_1_step_0_standard_error_first_half_table.csv")
scenario_1_step_1_standard_error_first_half_table  <- read.csv("temp/scenario_1_step_1_standard_error_first_half_table.csv")
scenario_1_step_0_standard_error_second_half_table <- read.csv("temp/scenario_1_step_0_standard_error_second_half_table.csv")
scenario_1_step_1_standard_error_second_half_table <- read.csv("temp/scenario_1_step_1_standard_error_second_half_table.csv")

scenario_2_step_0_causal_estimation_table          <- read.csv("temp/scenario_2_step_0_causal_estimation_table.csv")
scenario_2_step_1_causal_estimation_table          <- read.csv("temp/scenario_2_step_1_causal_estimation_table.csv")
scenario_2_step_0_backdoor_pathway_table           <- read.csv("temp/scenario_2_step_0_backdoor_pathway_table.csv")
scenario_2_step_1_backdoor_pathway_table           <- read.csv("temp/scenario_2_step_1_backdoor_pathway_table.csv")
scenario_2_step_0_standard_error_first_half_table  <- read.csv("temp/scenario_2_step_0_standard_error_first_half_table.csv")
scenario_2_step_1_standard_error_first_half_table  <- read.csv("temp/scenario_2_step_1_standard_error_first_half_table.csv")
scenario_2_step_0_standard_error_second_half_table <- read.csv("temp/scenario_2_step_0_standard_error_second_half_table.csv")
scenario_2_step_1_standard_error_second_half_table <- read.csv("temp/scenario_2_step_1_standard_error_second_half_table.csv")

scenario_3_step_0_causal_estimation_table          <- read.csv("temp/scenario_3_step_0_causal_estimation_table.csv")
scenario_3_step_1_causal_estimation_table          <- read.csv("temp/scenario_3_step_1_causal_estimation_table.csv")
scenario_3_step_0_backdoor_pathway_table           <- read.csv("temp/scenario_3_step_0_backdoor_pathway_table.csv")
scenario_3_step_1_backdoor_pathway_table           <- read.csv("temp/scenario_3_step_1_backdoor_pathway_table.csv")
scenario_3_step_0_standard_error_first_half_table  <- read.csv("temp/scenario_3_step_0_standard_error_first_half_table.csv")
scenario_3_step_1_standard_error_first_half_table  <- read.csv("temp/scenario_3_step_1_standard_error_first_half_table.csv")
scenario_3_step_0_standard_error_second_half_table <- read.csv("temp/scenario_3_step_0_standard_error_second_half_table.csv")
scenario_3_step_1_standard_error_second_half_table <- read.csv("temp/scenario_3_step_1_standard_error_second_half_table.csv")

scenario_4_step_0_causal_estimation_table          <- read.csv("temp/scenario_4_step_0_causal_estimation_table.csv")
scenario_4_step_1_causal_estimation_table          <- read.csv("temp/scenario_4_step_1_causal_estimation_table.csv")
scenario_4_step_0_backdoor_pathway_table           <- read.csv("temp/scenario_4_step_0_backdoor_pathway_table.csv")
scenario_4_step_1_backdoor_pathway_table           <- read.csv("temp/scenario_4_step_1_backdoor_pathway_table.csv")
scenario_4_step_0_standard_error_first_half_table  <- read.csv("temp/scenario_4_step_0_standard_error_first_half_table.csv")
scenario_4_step_1_standard_error_first_half_table  <- read.csv("temp/scenario_4_step_1_standard_error_first_half_table.csv")
scenario_4_step_0_standard_error_second_half_table <- read.csv("temp/scenario_4_step_0_standard_error_second_half_table.csv")
scenario_4_step_1_standard_error_second_half_table <- read.csv("temp/scenario_4_step_1_standard_error_second_half_table.csv")

scenario_5_step_0_causal_estimation_table          <- read.csv("temp/scenario_5_step_0_causal_estimation_table.csv")
scenario_5_step_1_causal_estimation_table          <- read.csv("temp/scenario_5_step_1_causal_estimation_table.csv")
scenario_5_step_0_backdoor_pathway_table           <- read.csv("temp/scenario_5_step_0_backdoor_pathway_table.csv")
scenario_5_step_1_backdoor_pathway_table           <- read.csv("temp/scenario_5_step_1_backdoor_pathway_table.csv")
scenario_5_step_0_standard_error_first_half_table  <- read.csv("temp/scenario_5_step_0_standard_error_first_half_table.csv")
scenario_5_step_1_standard_error_first_half_table  <- read.csv("temp/scenario_5_step_1_standard_error_first_half_table.csv")
scenario_5_step_0_standard_error_second_half_table <- read.csv("temp/scenario_5_step_0_standard_error_second_half_table.csv")
scenario_5_step_1_standard_error_second_half_table <- read.csv("temp/scenario_5_step_1_standard_error_second_half_table.csv")

scenario_6_step_0_causal_estimation_table          <- read.csv("temp/scenario_6_step_0_causal_estimation_table.csv")
scenario_6_step_1_causal_estimation_table          <- read.csv("temp/scenario_6_step_1_causal_estimation_table.csv")
scenario_6_step_0_backdoor_pathway_table           <- read.csv("temp/scenario_6_step_0_backdoor_pathway_table.csv")
scenario_6_step_1_backdoor_pathway_table           <- read.csv("temp/scenario_6_step_1_backdoor_pathway_table.csv")
scenario_6_step_0_standard_error_first_half_table  <- read.csv("temp/scenario_6_step_0_standard_error_first_half_table.csv")
scenario_6_step_1_standard_error_first_half_table  <- read.csv("temp/scenario_6_step_1_standard_error_first_half_table.csv")
scenario_6_step_0_standard_error_second_half_table <- read.csv("temp/scenario_6_step_0_standard_error_second_half_table.csv")
scenario_6_step_1_standard_error_second_half_table <- read.csv("temp/scenario_6_step_1_standard_error_second_half_table.csv")

scenario_7_step_0_causal_estimation_table          <- read.csv("temp/scenario_7_step_0_causal_estimation_table.csv")
scenario_7_step_1_causal_estimation_table          <- read.csv("temp/scenario_7_step_1_causal_estimation_table.csv")
scenario_7_step_0_backdoor_pathway_table           <- read.csv("temp/scenario_7_step_0_backdoor_pathway_table.csv")
scenario_7_step_1_backdoor_pathway_table           <- read.csv("temp/scenario_7_step_1_backdoor_pathway_table.csv")
scenario_7_step_0_standard_error_first_half_table  <- read.csv("temp/scenario_7_step_0_standard_error_first_half_table.csv")
scenario_7_step_1_standard_error_first_half_table  <- read.csv("temp/scenario_7_step_1_standard_error_first_half_table.csv")
scenario_7_step_0_standard_error_second_half_table <- read.csv("temp/scenario_7_step_0_standard_error_second_half_table.csv")
scenario_7_step_1_standard_error_second_half_table <- read.csv("temp/scenario_7_step_1_standard_error_second_half_table.csv")

scenario_8_step_0_causal_estimation_table          <- read.csv("temp/scenario_8_step_0_causal_estimation_table.csv")
scenario_8_step_1_causal_estimation_table          <- read.csv("temp/scenario_8_step_1_causal_estimation_table.csv")
scenario_8_step_0_backdoor_pathway_table           <- read.csv("temp/scenario_8_step_0_backdoor_pathway_table.csv")
scenario_8_step_1_backdoor_pathway_table           <- read.csv("temp/scenario_8_step_1_backdoor_pathway_table.csv")
scenario_8_step_0_standard_error_first_half_table  <- read.csv("temp/scenario_8_step_0_standard_error_first_half_table.csv")
scenario_8_step_1_standard_error_first_half_table  <- read.csv("temp/scenario_8_step_1_standard_error_first_half_table.csv")
scenario_8_step_0_standard_error_second_half_table <- read.csv("temp/scenario_8_step_0_standard_error_second_half_table.csv")
scenario_8_step_1_standard_error_second_half_table <- read.csv("temp/scenario_8_step_1_standard_error_second_half_table.csv")

scenario_9_step_0_causal_estimation_table          <- read.csv("temp/scenario_9_step_0_causal_estimation_table.csv")
scenario_9_step_1_causal_estimation_table          <- read.csv("temp/scenario_9_step_1_causal_estimation_table.csv")
scenario_9_step_0_backdoor_pathway_table           <- read.csv("temp/scenario_9_step_0_backdoor_pathway_table.csv")
scenario_9_step_1_backdoor_pathway_table           <- read.csv("temp/scenario_9_step_1_backdoor_pathway_table.csv")
scenario_9_step_0_standard_error_first_half_table  <- read.csv("temp/scenario_9_step_0_standard_error_first_half_table.csv")
scenario_9_step_1_standard_error_first_half_table  <- read.csv("temp/scenario_9_step_1_standard_error_first_half_table.csv")
scenario_9_step_0_standard_error_second_half_table <- read.csv("temp/scenario_9_step_0_standard_error_second_half_table.csv")
scenario_9_step_1_standard_error_second_half_table <- read.csv("temp/scenario_9_step_1_standard_error_second_half_table.csv")




# ----- scenario_1 -----

scenario_1_causal_estimation_table <- data.frame(scenario_1_step_0_causal_estimation_table$measured_confounders,
                                                 scenario_1_step_0_causal_estimation_table$unmeasured_confounders,
                                                 scenario_1_step_0_causal_estimation_table$linear_full_bias,
                                                 scenario_1_step_0_causal_estimation_table$linear_full_bias_percentage,
                                                 scenario_1_step_0_causal_estimation_table$linear_full_coverage,

                                                 scenario_1_step_1_causal_estimation_table$stepwise_bias,
                                                 scenario_1_step_1_causal_estimation_table$stepwise_bias_percentage,
                                                 scenario_1_step_1_causal_estimation_table$stepwise_coverage,
                                                 scenario_1_step_1_causal_estimation_table$stepwise_X_bias,
                                                 scenario_1_step_1_causal_estimation_table$stepwise_X_bias_percentage,
                                                 scenario_1_step_1_causal_estimation_table$stepwise_X_coverage,

                                                 scenario_1_step_0_causal_estimation_table$lasso_bias,
                                                 scenario_1_step_0_causal_estimation_table$lasso_bias_percentage,
                                                 scenario_1_step_0_causal_estimation_table$lasso_coverage,
                                                 scenario_1_step_0_causal_estimation_table$lasso_X_bias,
                                                 scenario_1_step_0_causal_estimation_table$lasso_X_bias_percentage,
                                                 scenario_1_step_0_causal_estimation_table$lasso_X_coverage,
                                                 scenario_1_step_0_causal_estimation_table$lasso_union_bias,
                                                 scenario_1_step_0_causal_estimation_table$lasso_union_bias_percentage,
                                                 scenario_1_step_0_causal_estimation_table$lasso_union_coverage)
colnames(scenario_1_causal_estimation_table) <- colnames(scenario_1_step_0_causal_estimation_table)

scenario_1_backdoor_pathway_table <- data.frame(scenario_1_step_0_backdoor_pathway_table$measured_confounders,
                                                scenario_1_step_0_backdoor_pathway_table$unmeasured_confounders,
                                                scenario_1_step_0_backdoor_pathway_table$open_paths,
                                                scenario_1_step_0_backdoor_pathway_table$linear_full_blocked,
                                                scenario_1_step_0_backdoor_pathway_table$linear_full_blocked_percentage,
                                                
                                                scenario_1_step_1_backdoor_pathway_table$stepwise_blocked,
                                                scenario_1_step_1_backdoor_pathway_table$stepwise_blocked_percentage,
                                                scenario_1_step_1_backdoor_pathway_table$stepwise_X_blocked,
                                                scenario_1_step_1_backdoor_pathway_table$stepwise_X_blocked_percentage,
                                                
                                                scenario_1_step_0_backdoor_pathway_table$lasso_blocked,
                                                scenario_1_step_0_backdoor_pathway_table$lasso_blocked_percentage,
                                                scenario_1_step_0_backdoor_pathway_table$lasso_X_blocked,
                                                scenario_1_step_0_backdoor_pathway_table$lasso_X_blocked_percentage,
                                                scenario_1_step_0_backdoor_pathway_table$lasso_union_blocked,
                                                scenario_1_step_0_backdoor_pathway_table$lasso_union_blocked_percentage)
colnames(scenario_1_backdoor_pathway_table) <- colnames(scenario_1_step_0_backdoor_pathway_table)

scenario_1_standard_error_first_half_table <- data.frame(scenario_1_step_0_standard_error_first_half_table$measured_confounders,
                                                         scenario_1_step_0_standard_error_first_half_table$unmeasured_confounders,
                                                         scenario_1_step_0_standard_error_first_half_table$true_coefficients,
                                                         scenario_1_step_0_standard_error_first_half_table$linear_full_mean_coef,
                                                         scenario_1_step_0_standard_error_first_half_table$linear_full_emp_se,
                                                         scenario_1_step_0_standard_error_first_half_table$linear_full_model_se,
                                                         
                                                         scenario_1_step_1_standard_error_first_half_table$stepwise_mean_coef,
                                                         scenario_1_step_1_standard_error_first_half_table$stepwise_emp_se,
                                                         scenario_1_step_1_standard_error_first_half_table$stepwise_model_se,
                                                         scenario_1_step_1_standard_error_first_half_table$stepwise_X_mean_coef,
                                                         scenario_1_step_1_standard_error_first_half_table$stepwise_X_emp_se,
                                                         scenario_1_step_1_standard_error_first_half_table$stepwise_X_model_se)
colnames(scenario_1_standard_error_first_half_table) <- colnames(scenario_1_step_0_standard_error_first_half_table)

scenario_1_standard_error_second_half_table <- scenario_1_step_0_standard_error_second_half_table



# ----- scenario_2 -----

# NB: for stepwise portion, we have 7 conf sets computed instead of the usual 6
# hence only one structural NA

scenario_2_causal_estimation_table <- data.frame(scenario_2_step_0_causal_estimation_table$measured_confounders,
                                                 scenario_2_step_0_causal_estimation_table$unmeasured_confounders,
                                                 scenario_2_step_0_causal_estimation_table$linear_full_bias,
                                                 scenario_2_step_0_causal_estimation_table$linear_full_bias_percentage,
                                                 scenario_2_step_0_causal_estimation_table$linear_full_coverage,
                                                 
                                                 c(scenario_2_step_1_causal_estimation_table$stepwise_bias),
                                                 c(scenario_2_step_1_causal_estimation_table$stepwise_bias_percentage),
                                                 c(scenario_2_step_1_causal_estimation_table$stepwise_coverage),
                                                 c(scenario_2_step_1_causal_estimation_table$stepwise_X_bias),
                                                 c(scenario_2_step_1_causal_estimation_table$stepwise_X_bias_percentage),
                                                 c(scenario_2_step_1_causal_estimation_table$stepwise_X_coverage),
                                                 
                                                 scenario_2_step_0_causal_estimation_table$lasso_bias,
                                                 scenario_2_step_0_causal_estimation_table$lasso_bias_percentage,
                                                 scenario_2_step_0_causal_estimation_table$lasso_coverage,
                                                 scenario_2_step_0_causal_estimation_table$lasso_X_bias,
                                                 scenario_2_step_0_causal_estimation_table$lasso_X_bias_percentage,
                                                 scenario_2_step_0_causal_estimation_table$lasso_X_coverage,
                                                 scenario_2_step_0_causal_estimation_table$lasso_union_bias,
                                                 scenario_2_step_0_causal_estimation_table$lasso_union_bias_percentage,
                                                 scenario_2_step_0_causal_estimation_table$lasso_union_coverage)
colnames(scenario_2_causal_estimation_table) <- colnames(scenario_2_step_0_causal_estimation_table)


scenario_2_backdoor_pathway_table <- data.frame(scenario_2_step_0_backdoor_pathway_table$measured_confounders,
                                                scenario_2_step_0_backdoor_pathway_table$unmeasured_confounders,
                                                scenario_2_step_0_backdoor_pathway_table$open_paths,
                                                scenario_2_step_0_backdoor_pathway_table$linear_full_blocked,
                                                scenario_2_step_0_backdoor_pathway_table$linear_full_blocked_percentage,
                                                
                                                c(scenario_2_step_1_backdoor_pathway_table$stepwise_blocked),
                                                c(scenario_2_step_1_backdoor_pathway_table$stepwise_blocked_percentage),
                                                c(scenario_2_step_1_backdoor_pathway_table$stepwise_X_blocked),
                                                c(scenario_2_step_1_backdoor_pathway_table$stepwise_X_blocked_percentage),
                                                
                                                scenario_2_step_0_backdoor_pathway_table$lasso_blocked,
                                                scenario_2_step_0_backdoor_pathway_table$lasso_blocked_percentage,
                                                scenario_2_step_0_backdoor_pathway_table$lasso_X_blocked,
                                                scenario_2_step_0_backdoor_pathway_table$lasso_X_blocked_percentage,
                                                scenario_2_step_0_backdoor_pathway_table$lasso_union_blocked,
                                                scenario_2_step_0_backdoor_pathway_table$lasso_union_blocked_percentage)
colnames(scenario_2_backdoor_pathway_table) <- colnames(scenario_2_step_0_backdoor_pathway_table)

scenario_2_standard_error_first_half_table <- data.frame(scenario_2_step_0_standard_error_first_half_table$measured_confounders,
                                                         scenario_2_step_0_standard_error_first_half_table$unmeasured_confounders,
                                                         scenario_2_step_0_standard_error_first_half_table$true_coefficients,
                                                         scenario_2_step_0_standard_error_first_half_table$linear_full_mean_coef,
                                                         scenario_2_step_0_standard_error_first_half_table$linear_full_emp_se,
                                                         scenario_2_step_0_standard_error_first_half_table$linear_full_model_se,
                                                         
                                                         c(scenario_2_step_1_standard_error_first_half_table$stepwise_mean_coef),
                                                         c(scenario_2_step_1_standard_error_first_half_table$stepwise_emp_se),
                                                         c(scenario_2_step_1_standard_error_first_half_table$stepwise_model_se),
                                                         c(scenario_2_step_1_standard_error_first_half_table$stepwise_X_mean_coef),
                                                         c(scenario_2_step_1_standard_error_first_half_table$stepwise_X_emp_se),
                                                         c(scenario_2_step_1_standard_error_first_half_table$stepwise_X_model_se)
                                                         )
colnames(scenario_2_standard_error_first_half_table) <- colnames(scenario_2_step_0_standard_error_first_half_table)

scenario_2_standard_error_second_half_table <- scenario_2_step_0_standard_error_second_half_table



# ----- scenario_3 -----

scenario_3_causal_estimation_table <- data.frame(scenario_3_step_0_causal_estimation_table$measured_confounders,
                                                 scenario_3_step_0_causal_estimation_table$unmeasured_confounders,
                                                 scenario_3_step_0_causal_estimation_table$linear_full_bias,
                                                 scenario_3_step_0_causal_estimation_table$linear_full_bias_percentage,
                                                 scenario_3_step_0_causal_estimation_table$linear_full_coverage,
                                                 
                                                 c(scenario_3_step_1_causal_estimation_table$stepwise_bias, NA, NA),
                                                 c(scenario_3_step_1_causal_estimation_table$stepwise_bias_percentage, NA, NA),
                                                 c(scenario_3_step_1_causal_estimation_table$stepwise_coverage, NA, NA),
                                                 c(scenario_3_step_1_causal_estimation_table$stepwise_X_bias, NA, NA),
                                                 c(scenario_3_step_1_causal_estimation_table$stepwise_X_bias_percentage, NA, NA),
                                                 c(scenario_3_step_1_causal_estimation_table$stepwise_X_coverage, NA, NA),
                                                 
                                                 scenario_3_step_0_causal_estimation_table$lasso_bias,
                                                 scenario_3_step_0_causal_estimation_table$lasso_bias_percentage,
                                                 scenario_3_step_0_causal_estimation_table$lasso_coverage,
                                                 scenario_3_step_0_causal_estimation_table$lasso_X_bias,
                                                 scenario_3_step_0_causal_estimation_table$lasso_X_bias_percentage,
                                                 scenario_3_step_0_causal_estimation_table$lasso_X_coverage,
                                                 scenario_3_step_0_causal_estimation_table$lasso_union_bias,
                                                 scenario_3_step_0_causal_estimation_table$lasso_union_bias_percentage,
                                                 scenario_3_step_0_causal_estimation_table$lasso_union_coverage)
colnames(scenario_3_causal_estimation_table) <- colnames(scenario_3_step_0_causal_estimation_table)

scenario_3_backdoor_pathway_table <- data.frame(scenario_3_step_0_backdoor_pathway_table$measured_confounders,
                                                scenario_3_step_0_backdoor_pathway_table$unmeasured_confounders,
                                                scenario_3_step_0_backdoor_pathway_table$open_paths,
                                                scenario_3_step_0_backdoor_pathway_table$linear_full_blocked,
                                                scenario_3_step_0_backdoor_pathway_table$linear_full_blocked_percentage,
                                                
                                                c(scenario_3_step_1_backdoor_pathway_table$stepwise_blocked, NA, NA),
                                                c(scenario_3_step_1_backdoor_pathway_table$stepwise_blocked_percentage, NA, NA),
                                                c(scenario_3_step_1_backdoor_pathway_table$stepwise_X_blocked, NA, NA),
                                                c(scenario_3_step_1_backdoor_pathway_table$stepwise_X_blocked_percentage, NA, NA),
                                                
                                                scenario_3_step_0_backdoor_pathway_table$lasso_blocked,
                                                scenario_3_step_0_backdoor_pathway_table$lasso_blocked_percentage,
                                                scenario_3_step_0_backdoor_pathway_table$lasso_X_blocked,
                                                scenario_3_step_0_backdoor_pathway_table$lasso_X_blocked_percentage,
                                                scenario_3_step_0_backdoor_pathway_table$lasso_union_blocked,
                                                scenario_3_step_0_backdoor_pathway_table$lasso_union_blocked_percentage)
colnames(scenario_3_backdoor_pathway_table) <- colnames(scenario_3_step_0_backdoor_pathway_table)

scenario_3_standard_error_first_half_table <- data.frame(scenario_3_step_0_standard_error_first_half_table$measured_confounders,
                                                         scenario_3_step_0_standard_error_first_half_table$unmeasured_confounders,
                                                         scenario_3_step_0_standard_error_first_half_table$true_coefficients,
                                                         scenario_3_step_0_standard_error_first_half_table$linear_full_mean_coef,
                                                         scenario_3_step_0_standard_error_first_half_table$linear_full_emp_se,
                                                         scenario_3_step_0_standard_error_first_half_table$linear_full_model_se,
                                                         
                                                         c(scenario_3_step_1_standard_error_first_half_table$stepwise_mean_coef, NA, NA),
                                                         c(scenario_3_step_1_standard_error_first_half_table$stepwise_emp_se, NA, NA),
                                                         c(scenario_3_step_1_standard_error_first_half_table$stepwise_model_se, NA, NA),
                                                         c(scenario_3_step_1_standard_error_first_half_table$stepwise_X_mean_coef, NA, NA),
                                                         c(scenario_3_step_1_standard_error_first_half_table$stepwise_X_emp_se, NA, NA),
                                                         c(scenario_3_step_1_standard_error_first_half_table$stepwise_X_model_se, NA, NA)
)
colnames(scenario_3_standard_error_first_half_table) <- colnames(scenario_3_step_0_standard_error_first_half_table)

scenario_3_standard_error_second_half_table <- scenario_3_step_0_standard_error_second_half_table



# ----- scenario_4 -----

scenario_4_causal_estimation_table <- data.frame(scenario_4_step_0_causal_estimation_table$measured_confounders,
                                                 scenario_4_step_0_causal_estimation_table$unmeasured_confounders,
                                                 scenario_4_step_0_causal_estimation_table$linear_full_bias,
                                                 scenario_4_step_0_causal_estimation_table$linear_full_bias_percentage,
                                                 scenario_4_step_0_causal_estimation_table$linear_full_coverage,
                                                 
                                                 c(scenario_4_step_1_causal_estimation_table$stepwise_bias, NA, NA),
                                                 c(scenario_4_step_1_causal_estimation_table$stepwise_bias_percentage, NA, NA),
                                                 c(scenario_4_step_1_causal_estimation_table$stepwise_coverage, NA, NA),
                                                 c(scenario_4_step_1_causal_estimation_table$stepwise_X_bias, NA, NA),
                                                 c(scenario_4_step_1_causal_estimation_table$stepwise_X_bias_percentage, NA, NA),
                                                 c(scenario_4_step_1_causal_estimation_table$stepwise_X_coverage, NA, NA),
                                                 
                                                 scenario_4_step_0_causal_estimation_table$lasso_bias,
                                                 scenario_4_step_0_causal_estimation_table$lasso_bias_percentage,
                                                 scenario_4_step_0_causal_estimation_table$lasso_coverage,
                                                 scenario_4_step_0_causal_estimation_table$lasso_X_bias,
                                                 scenario_4_step_0_causal_estimation_table$lasso_X_bias_percentage,
                                                 scenario_4_step_0_causal_estimation_table$lasso_X_coverage,
                                                 scenario_4_step_0_causal_estimation_table$lasso_union_bias,
                                                 scenario_4_step_0_causal_estimation_table$lasso_union_bias_percentage,
                                                 scenario_4_step_0_causal_estimation_table$lasso_union_coverage)
colnames(scenario_4_causal_estimation_table) <- colnames(scenario_4_step_0_causal_estimation_table)

scenario_4_backdoor_pathway_table <- data.frame(scenario_4_step_0_backdoor_pathway_table$measured_confounders,
                                                scenario_4_step_0_backdoor_pathway_table$unmeasured_confounders,
                                                scenario_4_step_0_backdoor_pathway_table$open_paths,
                                                scenario_4_step_0_backdoor_pathway_table$linear_full_blocked,
                                                scenario_4_step_0_backdoor_pathway_table$linear_full_blocked_percentage,
                                                
                                                c(scenario_4_step_1_backdoor_pathway_table$stepwise_blocked, NA, NA),
                                                c(scenario_4_step_1_backdoor_pathway_table$stepwise_blocked_percentage, NA, NA),
                                                c(scenario_4_step_1_backdoor_pathway_table$stepwise_X_blocked, NA, NA),
                                                c(scenario_4_step_1_backdoor_pathway_table$stepwise_X_blocked_percentage, NA, NA),
                                                
                                                scenario_4_step_0_backdoor_pathway_table$lasso_blocked,
                                                scenario_4_step_0_backdoor_pathway_table$lasso_blocked_percentage,
                                                scenario_4_step_0_backdoor_pathway_table$lasso_X_blocked,
                                                scenario_4_step_0_backdoor_pathway_table$lasso_X_blocked_percentage,
                                                scenario_4_step_0_backdoor_pathway_table$lasso_union_blocked,
                                                scenario_4_step_0_backdoor_pathway_table$lasso_union_blocked_percentage)
colnames(scenario_4_backdoor_pathway_table) <- colnames(scenario_4_step_0_backdoor_pathway_table)

scenario_4_standard_error_first_half_table <- data.frame(scenario_4_step_0_standard_error_first_half_table$measured_confounders,
                                                         scenario_4_step_0_standard_error_first_half_table$unmeasured_confounders,
                                                         scenario_4_step_0_standard_error_first_half_table$true_coefficients,
                                                         scenario_4_step_0_standard_error_first_half_table$linear_full_mean_coef,
                                                         scenario_4_step_0_standard_error_first_half_table$linear_full_emp_se,
                                                         scenario_4_step_0_standard_error_first_half_table$linear_full_model_se,
                                                         
                                                         c(scenario_4_step_1_standard_error_first_half_table$stepwise_mean_coef, NA, NA),
                                                         c(scenario_4_step_1_standard_error_first_half_table$stepwise_emp_se, NA, NA),
                                                         c(scenario_4_step_1_standard_error_first_half_table$stepwise_model_se, NA, NA),
                                                         c(scenario_4_step_1_standard_error_first_half_table$stepwise_X_mean_coef, NA, NA),
                                                         c(scenario_4_step_1_standard_error_first_half_table$stepwise_X_emp_se, NA, NA),
                                                         c(scenario_4_step_1_standard_error_first_half_table$stepwise_X_model_se, NA, NA)
)
colnames(scenario_4_standard_error_first_half_table) <- colnames(scenario_4_step_0_standard_error_first_half_table)

scenario_4_standard_error_second_half_table <- scenario_4_step_0_standard_error_second_half_table



# ----- scenario_5 -----

scenario_5_causal_estimation_table <- data.frame(scenario_5_step_0_causal_estimation_table$measured_confounders,
                                                 scenario_5_step_0_causal_estimation_table$unmeasured_confounders,
                                                 scenario_5_step_0_causal_estimation_table$linear_full_bias,
                                                 scenario_5_step_0_causal_estimation_table$linear_full_bias_percentage,
                                                 scenario_5_step_0_causal_estimation_table$linear_full_coverage,
                                                 
                                                 c(scenario_5_step_1_causal_estimation_table$stepwise_bias, NA, NA),
                                                 c(scenario_5_step_1_causal_estimation_table$stepwise_bias_percentage, NA, NA),
                                                 c(scenario_5_step_1_causal_estimation_table$stepwise_coverage, NA, NA),
                                                 c(scenario_5_step_1_causal_estimation_table$stepwise_X_bias, NA, NA),
                                                 c(scenario_5_step_1_causal_estimation_table$stepwise_X_bias_percentage, NA, NA),
                                                 c(scenario_5_step_1_causal_estimation_table$stepwise_X_coverage, NA, NA),
                                                 
                                                 scenario_5_step_0_causal_estimation_table$lasso_bias,
                                                 scenario_5_step_0_causal_estimation_table$lasso_bias_percentage,
                                                 scenario_5_step_0_causal_estimation_table$lasso_coverage,
                                                 scenario_5_step_0_causal_estimation_table$lasso_X_bias,
                                                 scenario_5_step_0_causal_estimation_table$lasso_X_bias_percentage,
                                                 scenario_5_step_0_causal_estimation_table$lasso_X_coverage,
                                                 scenario_5_step_0_causal_estimation_table$lasso_union_bias,
                                                 scenario_5_step_0_causal_estimation_table$lasso_union_bias_percentage,
                                                 scenario_5_step_0_causal_estimation_table$lasso_union_coverage)
colnames(scenario_5_causal_estimation_table) <- colnames(scenario_5_step_0_causal_estimation_table)

scenario_5_backdoor_pathway_table <- data.frame(scenario_5_step_0_backdoor_pathway_table$measured_confounders,
                                                scenario_5_step_0_backdoor_pathway_table$unmeasured_confounders,
                                                scenario_5_step_0_backdoor_pathway_table$open_paths,
                                                scenario_5_step_0_backdoor_pathway_table$linear_full_blocked,
                                                scenario_5_step_0_backdoor_pathway_table$linear_full_blocked_percentage,
                                                
                                                c(scenario_5_step_1_backdoor_pathway_table$stepwise_blocked, NA, NA),
                                                c(scenario_5_step_1_backdoor_pathway_table$stepwise_blocked_percentage, NA, NA),
                                                c(scenario_5_step_1_backdoor_pathway_table$stepwise_X_blocked, NA, NA),
                                                c(scenario_5_step_1_backdoor_pathway_table$stepwise_X_blocked_percentage, NA, NA),
                                                
                                                scenario_5_step_0_backdoor_pathway_table$lasso_blocked,
                                                scenario_5_step_0_backdoor_pathway_table$lasso_blocked_percentage,
                                                scenario_5_step_0_backdoor_pathway_table$lasso_X_blocked,
                                                scenario_5_step_0_backdoor_pathway_table$lasso_X_blocked_percentage,
                                                scenario_5_step_0_backdoor_pathway_table$lasso_union_blocked,
                                                scenario_5_step_0_backdoor_pathway_table$lasso_union_blocked_percentage)
colnames(scenario_5_backdoor_pathway_table) <- colnames(scenario_5_step_0_backdoor_pathway_table)

scenario_5_standard_error_first_half_table <- data.frame(scenario_5_step_0_standard_error_first_half_table$measured_confounders,
                                                         scenario_5_step_0_standard_error_first_half_table$unmeasured_confounders,
                                                         scenario_5_step_0_standard_error_first_half_table$true_coefficients,
                                                         scenario_5_step_0_standard_error_first_half_table$linear_full_mean_coef,
                                                         scenario_5_step_0_standard_error_first_half_table$linear_full_emp_se,
                                                         scenario_5_step_0_standard_error_first_half_table$linear_full_model_se,
                                                         
                                                         c(scenario_5_step_1_standard_error_first_half_table$stepwise_mean_coef, NA, NA),
                                                         c(scenario_5_step_1_standard_error_first_half_table$stepwise_emp_se, NA, NA),
                                                         c(scenario_5_step_1_standard_error_first_half_table$stepwise_model_se, NA, NA),
                                                         c(scenario_5_step_1_standard_error_first_half_table$stepwise_X_mean_coef, NA, NA),
                                                         c(scenario_5_step_1_standard_error_first_half_table$stepwise_X_emp_se, NA, NA),
                                                         c(scenario_5_step_1_standard_error_first_half_table$stepwise_X_model_se, NA, NA)
)
colnames(scenario_5_standard_error_first_half_table) <- colnames(scenario_5_step_0_standard_error_first_half_table)

scenario_5_standard_error_second_half_table <- scenario_5_step_0_standard_error_second_half_table



# ----- scenario_6 -----

scenario_6_causal_estimation_table <- data.frame(scenario_6_step_0_causal_estimation_table$measured_confounders,
                                                 scenario_6_step_0_causal_estimation_table$unmeasured_confounders,
                                                 scenario_6_step_0_causal_estimation_table$linear_full_bias,
                                                 scenario_6_step_0_causal_estimation_table$linear_full_bias_percentage,
                                                 scenario_6_step_0_causal_estimation_table$linear_full_coverage,
                                                 
                                                 c(scenario_6_step_1_causal_estimation_table$stepwise_bias, NA, NA),
                                                 c(scenario_6_step_1_causal_estimation_table$stepwise_bias_percentage, NA, NA),
                                                 c(scenario_6_step_1_causal_estimation_table$stepwise_coverage, NA, NA),
                                                 c(scenario_6_step_1_causal_estimation_table$stepwise_X_bias, NA, NA),
                                                 c(scenario_6_step_1_causal_estimation_table$stepwise_X_bias_percentage, NA, NA),
                                                 c(scenario_6_step_1_causal_estimation_table$stepwise_X_coverage, NA, NA),
                                                 
                                                 scenario_6_step_0_causal_estimation_table$lasso_bias,
                                                 scenario_6_step_0_causal_estimation_table$lasso_bias_percentage,
                                                 scenario_6_step_0_causal_estimation_table$lasso_coverage,
                                                 scenario_6_step_0_causal_estimation_table$lasso_X_bias,
                                                 scenario_6_step_0_causal_estimation_table$lasso_X_bias_percentage,
                                                 scenario_6_step_0_causal_estimation_table$lasso_X_coverage,
                                                 scenario_6_step_0_causal_estimation_table$lasso_union_bias,
                                                 scenario_6_step_0_causal_estimation_table$lasso_union_bias_percentage,
                                                 scenario_6_step_0_causal_estimation_table$lasso_union_coverage)
colnames(scenario_6_causal_estimation_table) <- colnames(scenario_6_step_0_causal_estimation_table)

scenario_6_backdoor_pathway_table <- data.frame(scenario_6_step_0_backdoor_pathway_table$measured_confounders,
                                                scenario_6_step_0_backdoor_pathway_table$unmeasured_confounders,
                                                scenario_6_step_0_backdoor_pathway_table$open_paths,
                                                scenario_6_step_0_backdoor_pathway_table$linear_full_blocked,
                                                scenario_6_step_0_backdoor_pathway_table$linear_full_blocked_percentage,
                                                
                                                c(scenario_6_step_1_backdoor_pathway_table$stepwise_blocked, NA, NA),
                                                c(scenario_6_step_1_backdoor_pathway_table$stepwise_blocked_percentage, NA, NA),
                                                c(scenario_6_step_1_backdoor_pathway_table$stepwise_X_blocked, NA, NA),
                                                c(scenario_6_step_1_backdoor_pathway_table$stepwise_X_blocked_percentage, NA, NA),
                                                
                                                scenario_6_step_0_backdoor_pathway_table$lasso_blocked,
                                                scenario_6_step_0_backdoor_pathway_table$lasso_blocked_percentage,
                                                scenario_6_step_0_backdoor_pathway_table$lasso_X_blocked,
                                                scenario_6_step_0_backdoor_pathway_table$lasso_X_blocked_percentage,
                                                scenario_6_step_0_backdoor_pathway_table$lasso_union_blocked,
                                                scenario_6_step_0_backdoor_pathway_table$lasso_union_blocked_percentage)
colnames(scenario_6_backdoor_pathway_table) <- colnames(scenario_6_step_0_backdoor_pathway_table)

scenario_6_standard_error_first_half_table <- data.frame(scenario_6_step_0_standard_error_first_half_table$measured_confounders,
                                                         scenario_6_step_0_standard_error_first_half_table$unmeasured_confounders,
                                                         scenario_6_step_0_standard_error_first_half_table$true_coefficients,
                                                         scenario_6_step_0_standard_error_first_half_table$linear_full_mean_coef,
                                                         scenario_6_step_0_standard_error_first_half_table$linear_full_emp_se,
                                                         scenario_6_step_0_standard_error_first_half_table$linear_full_model_se,
                                                         
                                                         c(scenario_6_step_1_standard_error_first_half_table$stepwise_mean_coef, NA, NA),
                                                         c(scenario_6_step_1_standard_error_first_half_table$stepwise_emp_se, NA, NA),
                                                         c(scenario_6_step_1_standard_error_first_half_table$stepwise_model_se, NA, NA),
                                                         c(scenario_6_step_1_standard_error_first_half_table$stepwise_X_mean_coef, NA, NA),
                                                         c(scenario_6_step_1_standard_error_first_half_table$stepwise_X_emp_se, NA, NA),
                                                         c(scenario_6_step_1_standard_error_first_half_table$stepwise_X_model_se, NA, NA)
)
colnames(scenario_6_standard_error_first_half_table) <- colnames(scenario_6_step_0_standard_error_first_half_table)

scenario_6_standard_error_second_half_table <- scenario_6_step_0_standard_error_second_half_table



# ----- scenario_7 -----

scenario_7_causal_estimation_table <- data.frame(scenario_7_step_0_causal_estimation_table$measured_confounders,
                                                 scenario_7_step_0_causal_estimation_table$unmeasured_confounders,
                                                 scenario_7_step_0_causal_estimation_table$linear_full_bias,
                                                 scenario_7_step_0_causal_estimation_table$linear_full_bias_percentage,
                                                 scenario_7_step_0_causal_estimation_table$linear_full_coverage,
                                                 
                                                 c(scenario_7_step_1_causal_estimation_table$stepwise_bias, NA, NA),
                                                 c(scenario_7_step_1_causal_estimation_table$stepwise_bias_percentage, NA, NA),
                                                 c(scenario_7_step_1_causal_estimation_table$stepwise_coverage, NA, NA),
                                                 c(scenario_7_step_1_causal_estimation_table$stepwise_X_bias, NA, NA),
                                                 c(scenario_7_step_1_causal_estimation_table$stepwise_X_bias_percentage, NA, NA),
                                                 c(scenario_7_step_1_causal_estimation_table$stepwise_X_coverage, NA, NA),
                                                 
                                                 scenario_7_step_0_causal_estimation_table$lasso_bias,
                                                 scenario_7_step_0_causal_estimation_table$lasso_bias_percentage,
                                                 scenario_7_step_0_causal_estimation_table$lasso_coverage,
                                                 scenario_7_step_0_causal_estimation_table$lasso_X_bias,
                                                 scenario_7_step_0_causal_estimation_table$lasso_X_bias_percentage,
                                                 scenario_7_step_0_causal_estimation_table$lasso_X_coverage,
                                                 scenario_7_step_0_causal_estimation_table$lasso_union_bias,
                                                 scenario_7_step_0_causal_estimation_table$lasso_union_bias_percentage,
                                                 scenario_7_step_0_causal_estimation_table$lasso_union_coverage)
colnames(scenario_7_causal_estimation_table) <- colnames(scenario_7_step_0_causal_estimation_table)

scenario_7_backdoor_pathway_table <- data.frame(scenario_7_step_0_backdoor_pathway_table$measured_confounders,
                                                scenario_7_step_0_backdoor_pathway_table$unmeasured_confounders,
                                                scenario_7_step_0_backdoor_pathway_table$open_paths,
                                                scenario_7_step_0_backdoor_pathway_table$linear_full_blocked,
                                                scenario_7_step_0_backdoor_pathway_table$linear_full_blocked_percentage,
                                                
                                                c(scenario_7_step_1_backdoor_pathway_table$stepwise_blocked, NA, NA),
                                                c(scenario_7_step_1_backdoor_pathway_table$stepwise_blocked_percentage, NA, NA),
                                                c(scenario_7_step_1_backdoor_pathway_table$stepwise_X_blocked, NA, NA),
                                                c(scenario_7_step_1_backdoor_pathway_table$stepwise_X_blocked_percentage, NA, NA),
                                                
                                                scenario_7_step_0_backdoor_pathway_table$lasso_blocked,
                                                scenario_7_step_0_backdoor_pathway_table$lasso_blocked_percentage,
                                                scenario_7_step_0_backdoor_pathway_table$lasso_X_blocked,
                                                scenario_7_step_0_backdoor_pathway_table$lasso_X_blocked_percentage,
                                                scenario_7_step_0_backdoor_pathway_table$lasso_union_blocked,
                                                scenario_7_step_0_backdoor_pathway_table$lasso_union_blocked_percentage)
colnames(scenario_7_backdoor_pathway_table) <- colnames(scenario_7_step_0_backdoor_pathway_table)

scenario_7_standard_error_first_half_table <- data.frame(scenario_7_step_0_standard_error_first_half_table$measured_confounders,
                                                         scenario_7_step_0_standard_error_first_half_table$unmeasured_confounders,
                                                         scenario_7_step_0_standard_error_first_half_table$true_coefficients,
                                                         scenario_7_step_0_standard_error_first_half_table$linear_full_mean_coef,
                                                         scenario_7_step_0_standard_error_first_half_table$linear_full_emp_se,
                                                         scenario_7_step_0_standard_error_first_half_table$linear_full_model_se,
                                                         
                                                         c(scenario_7_step_1_standard_error_first_half_table$stepwise_mean_coef, NA, NA),
                                                         c(scenario_7_step_1_standard_error_first_half_table$stepwise_emp_se, NA, NA),
                                                         c(scenario_7_step_1_standard_error_first_half_table$stepwise_model_se, NA, NA),
                                                         c(scenario_7_step_1_standard_error_first_half_table$stepwise_X_mean_coef, NA, NA),
                                                         c(scenario_7_step_1_standard_error_first_half_table$stepwise_X_emp_se, NA, NA),
                                                         c(scenario_7_step_1_standard_error_first_half_table$stepwise_X_model_se, NA, NA)
)
colnames(scenario_7_standard_error_first_half_table) <- colnames(scenario_7_step_0_standard_error_first_half_table)

scenario_7_standard_error_second_half_table <- scenario_7_step_0_standard_error_second_half_table



# ----- scenario_8 -----

scenario_8_causal_estimation_table <- data.frame(c(scenario_8_step_0_causal_estimation_table$measured_confounders, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$unmeasured_confounders, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$linear_full_bias, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$linear_full_bias_percentage, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$linear_full_coverage, NA, NA),
                                                 
                                                 c(scenario_8_step_1_causal_estimation_table$stepwise_bias, NA, NA),
                                                 c(scenario_8_step_1_causal_estimation_table$stepwise_bias_percentage, NA, NA),
                                                 c(scenario_8_step_1_causal_estimation_table$stepwise_coverage, NA, NA),
                                                 c(scenario_8_step_1_causal_estimation_table$stepwise_X_bias, NA, NA),
                                                 c(scenario_8_step_1_causal_estimation_table$stepwise_X_bias_percentage, NA, NA),
                                                 c(scenario_8_step_1_causal_estimation_table$stepwise_X_coverage, NA, NA),
                                                 
                                                 c(scenario_8_step_0_causal_estimation_table$lasso_bias, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$lasso_bias_percentage, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$lasso_coverage, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$lasso_X_bias, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$lasso_X_bias_percentage, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$lasso_X_coverage, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$lasso_union_bias, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$lasso_union_bias_percentage, NA, NA),
                                                 c(scenario_8_step_0_causal_estimation_table$lasso_union_coverage, NA, NA))
colnames(scenario_8_causal_estimation_table) <- colnames(scenario_8_step_0_causal_estimation_table)

scenario_8_backdoor_pathway_table <- data.frame(c(scenario_8_step_0_backdoor_pathway_table$measured_confounders, NA, NA),
                                                c(scenario_8_step_0_backdoor_pathway_table$unmeasured_confounders, NA, NA),
                                                c(scenario_8_step_0_backdoor_pathway_table$open_paths, NA, NA),
                                                c(scenario_8_step_0_backdoor_pathway_table$linear_full_blocked, NA, NA),
                                                c(scenario_8_step_0_backdoor_pathway_table$linear_full_blocked_percentage, NA, NA),

                                                c(scenario_8_step_1_backdoor_pathway_table$stepwise_blocked, NA, NA),
                                                c(scenario_8_step_1_backdoor_pathway_table$stepwise_blocked_percentage, NA, NA),
                                                c(scenario_8_step_1_backdoor_pathway_table$stepwise_X_blocked, NA, NA),
                                                c(scenario_8_step_1_backdoor_pathway_table$stepwise_X_blocked_percentage, NA, NA),

                                                c(scenario_8_step_0_backdoor_pathway_table$lasso_blocked, NA, NA),
                                                c(scenario_8_step_0_backdoor_pathway_table$lasso_blocked_percentage, NA, NA),
                                                c(scenario_8_step_0_backdoor_pathway_table$lasso_X_blocked, NA, NA),
                                                c(scenario_8_step_0_backdoor_pathway_table$lasso_X_blocked_percentage, NA, NA),
                                                c(scenario_8_step_0_backdoor_pathway_table$lasso_union_blocked, NA, NA),
                                                c(scenario_8_step_0_backdoor_pathway_table$lasso_union_blocked_percentage, NA, NA))
colnames(scenario_8_backdoor_pathway_table) <- colnames(scenario_8_step_0_backdoor_pathway_table)

scenario_8_standard_error_first_half_table <- data.frame(c(scenario_8_step_0_standard_error_first_half_table$measured_confounders, NA, NA),
                                                         c(scenario_8_step_0_standard_error_first_half_table$unmeasured_confounders, NA, NA),
                                                         c(scenario_8_step_0_standard_error_first_half_table$true_coefficients, NA, NA),
                                                         c(scenario_8_step_0_standard_error_first_half_table$linear_full_mean_coef, NA, NA),
                                                         c(scenario_8_step_0_standard_error_first_half_table$linear_full_emp_se, NA, NA),
                                                         c(scenario_8_step_0_standard_error_first_half_table$linear_full_model_se, NA, NA),

                                                         c(scenario_8_step_1_standard_error_first_half_table$stepwise_mean_coef, NA, NA),
                                                         c(scenario_8_step_1_standard_error_first_half_table$stepwise_emp_se, NA, NA),
                                                         c(scenario_8_step_1_standard_error_first_half_table$stepwise_model_se, NA, NA),
                                                         c(scenario_8_step_1_standard_error_first_half_table$stepwise_X_mean_coef, NA, NA),
                                                         c(scenario_8_step_1_standard_error_first_half_table$stepwise_X_emp_se, NA, NA),
                                                         c(scenario_8_step_1_standard_error_first_half_table$stepwise_X_model_se, NA, NA)
)
colnames(scenario_8_standard_error_first_half_table) <- colnames(scenario_8_step_0_standard_error_first_half_table)

scenario_8_standard_error_second_half_table <- scenario_8_step_0_standard_error_second_half_table



# ----- scenario_9 -----

scenario_9_causal_estimation_table <- data.frame(scenario_9_step_0_causal_estimation_table$measured_confounders,
                                                 scenario_9_step_0_causal_estimation_table$unmeasured_confounders,
                                                 scenario_9_step_0_causal_estimation_table$linear_full_bias,
                                                 scenario_9_step_0_causal_estimation_table$linear_full_bias_percentage,
                                                 scenario_9_step_0_causal_estimation_table$linear_full_coverage,
                                                 
                                                 c(scenario_9_step_1_causal_estimation_table$stepwise_bias, NA, NA),
                                                 c(scenario_9_step_1_causal_estimation_table$stepwise_bias_percentage, NA, NA),
                                                 c(scenario_9_step_1_causal_estimation_table$stepwise_coverage, NA, NA),
                                                 c(scenario_9_step_1_causal_estimation_table$stepwise_X_bias, NA, NA),
                                                 c(scenario_9_step_1_causal_estimation_table$stepwise_X_bias_percentage, NA, NA),
                                                 c(scenario_9_step_1_causal_estimation_table$stepwise_X_coverage, NA, NA),
                                                 
                                                 scenario_9_step_0_causal_estimation_table$lasso_bias,
                                                 scenario_9_step_0_causal_estimation_table$lasso_bias_percentage,
                                                 scenario_9_step_0_causal_estimation_table$lasso_coverage,
                                                 scenario_9_step_0_causal_estimation_table$lasso_X_bias,
                                                 scenario_9_step_0_causal_estimation_table$lasso_X_bias_percentage,
                                                 scenario_9_step_0_causal_estimation_table$lasso_X_coverage,
                                                 scenario_9_step_0_causal_estimation_table$lasso_union_bias,
                                                 scenario_9_step_0_causal_estimation_table$lasso_union_bias_percentage,
                                                 scenario_9_step_0_causal_estimation_table$lasso_union_coverage)
colnames(scenario_9_causal_estimation_table) <- colnames(scenario_9_step_0_causal_estimation_table)

scenario_9_backdoor_pathway_table <- data.frame(scenario_9_step_0_backdoor_pathway_table$measured_confounders,
                                                scenario_9_step_0_backdoor_pathway_table$unmeasured_confounders,
                                                scenario_9_step_0_backdoor_pathway_table$open_paths,
                                                scenario_9_step_0_backdoor_pathway_table$linear_full_blocked,
                                                scenario_9_step_0_backdoor_pathway_table$linear_full_blocked_percentage,
                                                
                                                c(scenario_9_step_1_backdoor_pathway_table$stepwise_blocked, NA, NA),
                                                c(scenario_9_step_1_backdoor_pathway_table$stepwise_blocked_percentage, NA, NA),
                                                c(scenario_9_step_1_backdoor_pathway_table$stepwise_X_blocked, NA, NA),
                                                c(scenario_9_step_1_backdoor_pathway_table$stepwise_X_blocked_percentage, NA, NA),
                                                
                                                scenario_9_step_0_backdoor_pathway_table$lasso_blocked,
                                                scenario_9_step_0_backdoor_pathway_table$lasso_blocked_percentage,
                                                scenario_9_step_0_backdoor_pathway_table$lasso_X_blocked,
                                                scenario_9_step_0_backdoor_pathway_table$lasso_X_blocked_percentage,
                                                scenario_9_step_0_backdoor_pathway_table$lasso_union_blocked,
                                                scenario_9_step_0_backdoor_pathway_table$lasso_union_blocked_percentage)
colnames(scenario_9_backdoor_pathway_table) <- colnames(scenario_9_step_0_backdoor_pathway_table)

scenario_9_standard_error_first_half_table <- data.frame(scenario_9_step_0_standard_error_first_half_table$measured_confounders,
                                                         scenario_9_step_0_standard_error_first_half_table$unmeasured_confounders,
                                                         scenario_9_step_0_standard_error_first_half_table$true_coefficients,
                                                         scenario_9_step_0_standard_error_first_half_table$linear_full_mean_coef,
                                                         scenario_9_step_0_standard_error_first_half_table$linear_full_emp_se,
                                                         scenario_9_step_0_standard_error_first_half_table$linear_full_model_se,
                                                         
                                                         c(scenario_9_step_1_standard_error_first_half_table$stepwise_mean_coef, NA, NA),
                                                         c(scenario_9_step_1_standard_error_first_half_table$stepwise_emp_se, NA, NA),
                                                         c(scenario_9_step_1_standard_error_first_half_table$stepwise_model_se, NA, NA),
                                                         c(scenario_9_step_1_standard_error_first_half_table$stepwise_X_mean_coef, NA, NA),
                                                         c(scenario_9_step_1_standard_error_first_half_table$stepwise_X_emp_se, NA, NA),
                                                         c(scenario_9_step_1_standard_error_first_half_table$stepwise_X_model_se, NA, NA)
)
colnames(scenario_9_standard_error_first_half_table) <- colnames(scenario_9_step_0_standard_error_first_half_table)

scenario_9_standard_error_second_half_table <- scenario_9_step_0_standard_error_second_half_table




# ----- Export and save data -----

write.csv(scenario_1_causal_estimation_table, "temp/scenario_1_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_1_backdoor_pathway_table,  "temp/scenario_1_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_1_standard_error_first_half_table,  "temp/scenario_1_standard_error_first_half_table.csv", row.names = FALSE)
write.csv(scenario_1_standard_error_second_half_table, "temp/scenario_1_standard_error_second_half_table.csv", row.names = FALSE)

write.csv(scenario_2_causal_estimation_table, "temp/scenario_2_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_2_backdoor_pathway_table,  "temp/scenario_2_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_2_standard_error_first_half_table,  "temp/scenario_2_standard_error_first_half_table.csv", row.names = FALSE)
write.csv(scenario_2_standard_error_second_half_table, "temp/scenario_2_standard_error_second_half_table.csv", row.names = FALSE)

write.csv(scenario_3_causal_estimation_table, "temp/scenario_3_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_3_backdoor_pathway_table,  "temp/scenario_3_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_3_standard_error_first_half_table,  "temp/scenario_3_standard_error_first_half_table.csv", row.names = FALSE)
write.csv(scenario_3_standard_error_second_half_table, "temp/scenario_3_standard_error_second_half_table.csv", row.names = FALSE)

write.csv(scenario_4_causal_estimation_table, "temp/scenario_4_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_4_backdoor_pathway_table,  "temp/scenario_4_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_4_standard_error_first_half_table,  "temp/scenario_4_standard_error_first_half_table.csv", row.names = FALSE)
write.csv(scenario_4_standard_error_second_half_table, "temp/scenario_4_standard_error_second_half_table.csv", row.names = FALSE)

write.csv(scenario_5_causal_estimation_table, "temp/scenario_5_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_5_backdoor_pathway_table,  "temp/scenario_5_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_5_standard_error_first_half_table,  "temp/scenario_5_standard_error_first_half_table.csv", row.names = FALSE)
write.csv(scenario_5_standard_error_second_half_table, "temp/scenario_5_standard_error_second_half_table.csv", row.names = FALSE)

write.csv(scenario_6_causal_estimation_table, "temp/scenario_6_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_6_backdoor_pathway_table,  "temp/scenario_6_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_6_standard_error_first_half_table,  "temp/scenario_6_standard_error_first_half_table.csv", row.names = FALSE)
write.csv(scenario_6_standard_error_second_half_table, "temp/scenario_6_standard_error_second_half_table.csv", row.names = FALSE)

write.csv(scenario_7_causal_estimation_table, "temp/scenario_7_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_7_backdoor_pathway_table,  "temp/scenario_7_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_7_standard_error_first_half_table,  "temp/scenario_7_standard_error_first_half_table.csv", row.names = FALSE)
write.csv(scenario_7_standard_error_second_half_table, "temp/scenario_7_standard_error_second_half_table.csv", row.names = FALSE)

write.csv(scenario_8_causal_estimation_table, "temp/scenario_8_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_8_backdoor_pathway_table,  "temp/scenario_8_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_8_standard_error_first_half_table,  "temp/scenario_8_standard_error_first_half_table.csv", row.names = FALSE)
write.csv(scenario_8_standard_error_second_half_table, "temp/scenario_8_standard_error_second_half_table.csv", row.names = FALSE)

write.csv(scenario_9_causal_estimation_table, "temp/scenario_9_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_9_backdoor_pathway_table,  "temp/scenario_9_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_9_standard_error_first_half_table,  "temp/scenario_9_standard_error_first_half_table.csv", row.names = FALSE)
write.csv(scenario_9_standard_error_second_half_table, "temp/scenario_9_standard_error_second_half_table.csv", row.names = FALSE)




