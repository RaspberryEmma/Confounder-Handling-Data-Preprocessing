# ****************************************
# Confounder Handling Simulation Study
#
# Process tables
# Generates more readable summaries of data tables from the simulation
# Make the final CSV's ready for conversion to .tex by tably
# Edited to handle step=0, step=1 distinction with grace
#
# Emma Tarmey
#
# Started:          14/03/2025
# Most Recent Edit: 06/05/2025
# ****************************************



# ----- Setup -----

# clear R memory
rm(list=ls())

# fix wd issue
# forces wd to be the location of this file
if (Sys.getenv("RSTUDIO") == "1") {
  setwd(dirname(rstudioapi::getSourceEditorContext()$path))
}



# ----- Repeat entire procedure twice -----

for (step_off_on in c(1)) {
  # stepwise off / on variable, used for file i/o at either end
  # variables in the middle otherwise unaffected
  step_string <- paste0("step_", step_off_on)
  print(step_off_on)
  print(step_string)
  

  # ----- Import data -----
  
  true_causal_effect <- 0.15
  
  measured_confounders   <- c(16, 12, 32, 24, 64, 48, 128,  96)
  unmeasured_confounders <- c( 0,  4,  0,  8,  0, 16,   0,  32)
  total_confounders      <- c(16, 16, 32, 32, 64, 64, 128, 128)
  
  # mark progress manually
  # step 0
  # num_computed_s1 <- 8
  # num_computed_s2 <- 8
  # num_computed_s3 <- 8
  # num_computed_s4 <- 8
  # num_computed_s5 <- 8
  # num_computed_s6 <- 8
  # num_computed_s7 <- 8
  # num_computed_s8 <- 6
  # num_computed_s9 <- 8
  
  # step 1
  num_computed_s1 <- 8
  num_computed_s2 <- 8
  num_computed_s3 <- 6
  num_computed_s4 <- 6
  num_computed_s5 <- 6
  num_computed_s6 <- 6
  num_computed_s7 <- 6
  num_computed_s8 <- 6
  num_computed_s9 <- 6
  
  scenario_1_confset_1_data <- read.csv(paste0("data/sim_run_1_scenario_1_", step_string, "_results.csv"), row.names = 1)
  scenario_1_confset_2_data <- read.csv(paste0("data/sim_run_1_scenario_2_", step_string, "_results.csv"), row.names = 1)
  scenario_1_confset_3_data <- read.csv(paste0("data/sim_run_1_scenario_3_", step_string, "_results.csv"), row.names = 1)
  scenario_1_confset_4_data <- read.csv(paste0("data/sim_run_1_scenario_4_", step_string, "_results.csv"), row.names = 1)
  scenario_1_confset_5_data <- read.csv(paste0("data/sim_run_1_scenario_5_", step_string, "_results.csv"), row.names = 1)
  scenario_1_confset_6_data <- read.csv(paste0("data/sim_run_1_scenario_6_", step_string, "_results.csv"), row.names = 1)
  scenario_1_confset_7_data <- read.csv(paste0("data/sim_run_1_scenario_7_", step_string, "_results.csv"), row.names = 1)
  scenario_1_confset_8_data <- read.csv(paste0("data/sim_run_1_scenario_8_", step_string, "_results.csv"), row.names = 1)
  
  scenario_2_confset_1_data <- read.csv(paste0("data/sim_run_2_scenario_1_", step_string, "_results.csv"), row.names = 1)
  scenario_2_confset_2_data <- read.csv(paste0("data/sim_run_2_scenario_2_", step_string, "_results.csv"), row.names = 1)
  scenario_2_confset_3_data <- read.csv(paste0("data/sim_run_2_scenario_3_", step_string, "_results.csv"), row.names = 1)
  scenario_2_confset_4_data <- read.csv(paste0("data/sim_run_2_scenario_4_", step_string, "_results.csv"), row.names = 1)
  scenario_2_confset_5_data <- read.csv(paste0("data/sim_run_2_scenario_5_", step_string, "_results.csv"), row.names = 1)
  scenario_2_confset_6_data <- read.csv(paste0("data/sim_run_2_scenario_6_", step_string, "_results.csv"), row.names = 1)
  scenario_2_confset_7_data <- read.csv(paste0("data/sim_run_2_scenario_7_", step_string, "_results.csv"), row.names = 1)
  scenario_2_confset_8_data <- read.csv(paste0("data/sim_run_2_scenario_8_", step_string, "_results.csv"), row.names = 1)
  
  scenario_3_confset_1_data <- read.csv(paste0("data/sim_run_3_scenario_1_", step_string, "_results.csv"), row.names = 1)
  scenario_3_confset_2_data <- read.csv(paste0("data/sim_run_3_scenario_2_", step_string, "_results.csv"), row.names = 1)
  scenario_3_confset_3_data <- read.csv(paste0("data/sim_run_3_scenario_3_", step_string, "_results.csv"), row.names = 1)
  scenario_3_confset_4_data <- read.csv(paste0("data/sim_run_3_scenario_4_", step_string, "_results.csv"), row.names = 1)
  scenario_3_confset_5_data <- read.csv(paste0("data/sim_run_3_scenario_5_", step_string, "_results.csv"), row.names = 1)
  scenario_3_confset_6_data <- read.csv(paste0("data/sim_run_3_scenario_6_", step_string, "_results.csv"), row.names = 1)
  # scenario_3_confset_7_data <- read.csv(paste0("data/sim_run_3_scenario_7_", step_string, "_results.csv"), row.names = 1)
  # scenario_3_confset_8_data <- read.csv(paste0("data/sim_run_3_scenario_8_", step_string, "_results.csv"), row.names = 1)
  
  scenario_4_confset_1_data <- read.csv(paste0("data/sim_run_4_scenario_1_", step_string, "_results.csv"), row.names = 1)
  scenario_4_confset_2_data <- read.csv(paste0("data/sim_run_4_scenario_2_", step_string, "_results.csv"), row.names = 1)
  scenario_4_confset_3_data <- read.csv(paste0("data/sim_run_4_scenario_3_", step_string, "_results.csv"), row.names = 1)
  scenario_4_confset_4_data <- read.csv(paste0("data/sim_run_4_scenario_4_", step_string, "_results.csv"), row.names = 1)
  scenario_4_confset_5_data <- read.csv(paste0("data/sim_run_4_scenario_5_", step_string, "_results.csv"), row.names = 1)
  scenario_4_confset_6_data <- read.csv(paste0("data/sim_run_4_scenario_6_", step_string, "_results.csv"), row.names = 1)
  # scenario_4_confset_7_data <- read.csv(paste0("data/sim_run_4_scenario_7_", step_string, "_results.csv"), row.names = 1)
  # scenario_4_confset_8_data <- read.csv(paste0("data/sim_run_4_scenario_8_", step_string, "_results.csv"), row.names = 1)
  
  scenario_5_confset_1_data <- read.csv(paste0("data/sim_run_5_scenario_1_", step_string, "_results.csv"), row.names = 1)
  scenario_5_confset_2_data <- read.csv(paste0("data/sim_run_5_scenario_2_", step_string, "_results.csv"), row.names = 1)
  scenario_5_confset_3_data <- read.csv(paste0("data/sim_run_5_scenario_3_", step_string, "_results.csv"), row.names = 1)
  scenario_5_confset_4_data <- read.csv(paste0("data/sim_run_5_scenario_4_", step_string, "_results.csv"), row.names = 1)
  scenario_5_confset_5_data <- read.csv(paste0("data/sim_run_5_scenario_5_", step_string, "_results.csv"), row.names = 1)
  scenario_5_confset_6_data <- read.csv(paste0("data/sim_run_5_scenario_6_", step_string, "_results.csv"), row.names = 1)
  # scenario_5_confset_7_data <- read.csv(paste0("data/sim_run_5_scenario_7_", step_string, "_results.csv"), row.names = 1)
  # scenario_5_confset_8_data <- read.csv(paste0("data/sim_run_5_scenario_8_", step_string, "_results.csv"), row.names = 1)
  
  scenario_6_confset_1_data <- read.csv(paste0("data/sim_run_6_scenario_1_", step_string, "_results.csv"), row.names = 1)
  scenario_6_confset_2_data <- read.csv(paste0("data/sim_run_6_scenario_2_", step_string, "_results.csv"), row.names = 1)
  scenario_6_confset_3_data <- read.csv(paste0("data/sim_run_6_scenario_3_", step_string, "_results.csv"), row.names = 1)
  scenario_6_confset_4_data <- read.csv(paste0("data/sim_run_6_scenario_4_", step_string, "_results.csv"), row.names = 1)
  scenario_6_confset_5_data <- read.csv(paste0("data/sim_run_6_scenario_5_", step_string, "_results.csv"), row.names = 1)
  scenario_6_confset_6_data <- read.csv(paste0("data/sim_run_6_scenario_6_", step_string, "_results.csv"), row.names = 1)
  # scenario_6_confset_7_data <- read.csv(paste0("data/sim_run_6_scenario_7_", step_string, "_results.csv"), row.names = 1)
  # scenario_6_confset_8_data <- read.csv(paste0("data/sim_run_6_scenario_8_", step_string, "_results.csv"), row.names = 1)
  
  scenario_7_confset_1_data <- read.csv(paste0("data/sim_run_7_scenario_1_", step_string, "_results.csv"), row.names = 1)
  scenario_7_confset_2_data <- read.csv(paste0("data/sim_run_7_scenario_2_", step_string, "_results.csv"), row.names = 1)
  scenario_7_confset_3_data <- read.csv(paste0("data/sim_run_7_scenario_3_", step_string, "_results.csv"), row.names = 1)
  scenario_7_confset_4_data <- read.csv(paste0("data/sim_run_7_scenario_4_", step_string, "_results.csv"), row.names = 1)
  scenario_7_confset_5_data <- read.csv(paste0("data/sim_run_7_scenario_5_", step_string, "_results.csv"), row.names = 1)
  scenario_7_confset_6_data <- read.csv(paste0("data/sim_run_7_scenario_6_", step_string, "_results.csv"), row.names = 1)
  # scenario_7_confset_7_data <- read.csv(paste0("data/sim_run_7_scenario_7_", step_string, "_results.csv"), row.names = 1)
  # scenario_7_confset_8_data <- read.csv(paste0("data/sim_run_7_scenario_8_", step_string, "_results.csv"), row.names = 1)
  
  scenario_8_confset_1_data <- read.csv(paste0("data/sim_run_8_scenario_1_", step_string, "_results.csv"), row.names = 1)
  scenario_8_confset_2_data <- read.csv(paste0("data/sim_run_8_scenario_2_", step_string, "_results.csv"), row.names = 1)
  scenario_8_confset_3_data <- read.csv(paste0("data/sim_run_8_scenario_3_", step_string, "_results.csv"), row.names = 1)
  scenario_8_confset_4_data <- read.csv(paste0("data/sim_run_8_scenario_4_", step_string, "_results.csv"), row.names = 1)
  scenario_8_confset_5_data <- read.csv(paste0("data/sim_run_8_scenario_5_", step_string, "_results.csv"), row.names = 1)
  scenario_8_confset_6_data <- read.csv(paste0("data/sim_run_8_scenario_6_", step_string, "_results.csv"), row.names = 1)
  # scenario_8_confset_7_data <- read.csv(paste0("data/sim_run_8_scenario_7_", step_string, "_results.csv"), row.names = 1)
  # scenario_8_confset_8_data <- read.csv(paste0("data/sim_run_8_scenario_8_", step_string, "_results.csv"), row.names = 1)
  
  scenario_9_confset_1_data <- read.csv(paste0("data/sim_run_9_scenario_1_", step_string, "_results.csv"), row.names = 1)
  scenario_9_confset_2_data <- read.csv(paste0("data/sim_run_9_scenario_2_", step_string, "_results.csv"), row.names = 1)
  scenario_9_confset_3_data <- read.csv(paste0("data/sim_run_9_scenario_3_", step_string, "_results.csv"), row.names = 1)
  scenario_9_confset_4_data <- read.csv(paste0("data/sim_run_9_scenario_4_", step_string, "_results.csv"), row.names = 1)
  scenario_9_confset_5_data <- read.csv(paste0("data/sim_run_9_scenario_5_", step_string, "_results.csv"), row.names = 1)
  scenario_9_confset_6_data <- read.csv(paste0("data/sim_run_9_scenario_6_", step_string, "_results.csv"), row.names = 1)
  # scenario_9_confset_7_data <- read.csv(paste0("data/sim_run_9_scenario_7_", step_string, "_results.csv"), row.names = 1)
  # scenario_9_confset_8_data <- read.csv(paste0("data/sim_run_9_scenario_8_", step_string, "_results.csv"), row.names = 1)
  
  
  
  # ----- Generate Scenario 1 Tables -----
  
  
  # causal effect estimation table
  
  linear_full_bias  <- c()
  for (i in 1:num_computed_s1) { linear_full_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "causal_bias"] }
  
  linear_full_bias_percentage <- c()
  for (i in 1:num_computed_s1) { linear_full_bias_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "causal_bias"] / true_causal_effect }
  
  linear_full_coverage <- c()
  for (i in 1:num_computed_s1) { linear_full_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "causal_coverage"] }
  
  stepwise_bias <- c()
  for (i in 1:num_computed_s1) { stepwise_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "causal_bias"] }
  
  stepwise_bias_percentage <- c()
  for (i in 1:num_computed_s1) { stepwise_bias_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "causal_bias"] / true_causal_effect }
  
  stepwise_coverage <- c()
  for (i in 1:num_computed_s1) { stepwise_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "causal_coverage"] }
  
  stepwise_X_bias <- c()
  for (i in 1:num_computed_s1) { stepwise_X_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "causal_bias"] }
  
  stepwise_X_bias_percentage <- c()
  for (i in 1:num_computed_s1) { stepwise_X_bias_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "causal_bias"] / true_causal_effect }
  
  stepwise_X_coverage <- c()
  for (i in 1:num_computed_s1) { stepwise_X_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }
  
  lasso_bias <- c()
  for (i in 1:num_computed_s1) { lasso_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }
  
  lasso_bias_percentage <- c()
  for (i in 1:num_computed_s1) { lasso_bias_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "causal_bias"] / true_causal_effect }
  
  lasso_coverage <- c()
  for (i in 1:num_computed_s1) { lasso_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }
  
  lasso_X_bias <- c()
  for (i in 1:num_computed_s1) { lasso_X_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }
  
  lasso_X_bias_percentage <- c()
  for (i in 1:num_computed_s1) { lasso_X_bias_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] / true_causal_effect }
  
  lasso_X_coverage <- c()
  for (i in 1:num_computed_s1) { lasso_X_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }
  
  lasso_union_bias <- c()
  for (i in 1:num_computed_s1) { lasso_union_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }
  
  lasso_union_bias_percentage <- c()
  for (i in 1:num_computed_s1) { lasso_union_bias_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] / true_causal_effect }
  
  lasso_union_coverage <- c()
  for (i in 1:num_computed_s1) { lasso_union_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }
  
  scenario_1_causal_estimation_table <- data.frame(measured_confounders,
                                                   unmeasured_confounders,
                                                   linear_full_bias,
                                                   linear_full_bias_percentage,
                                                   linear_full_coverage,
                                                   stepwise_bias,
                                                   stepwise_bias_percentage,
                                                   stepwise_coverage,
                                                   stepwise_X_bias,
                                                   stepwise_X_bias_percentage,
                                                   stepwise_X_coverage,
                                                   lasso_bias,
                                                   lasso_bias_percentage,
                                                   lasso_coverage,
                                                   lasso_X_bias,
                                                   lasso_X_bias_percentage,
                                                   lasso_X_coverage,
                                                   lasso_union_bias,
                                                   lasso_union_bias_percentage,
                                                   lasso_union_coverage)
  
  print(scenario_1_causal_estimation_table)
  
  
  # backdoor pathway table
  
  open_paths <- total_confounders
  
  linear_full_blocked <- c()
  for (i in 1:num_computed_s1) { linear_full_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "blocked_paths"] }
  
  linear_full_blocked_percentage <- c()
  for (i in 1:num_computed_s1) { linear_full_blocked_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "blocked_paths"] / total_confounders[i] }
  
  stepwise_blocked <- c()
  for (i in 1:num_computed_s1) { stepwise_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "blocked_paths"] }
  
  stepwise_blocked_percentage <- c()
  for (i in 1:num_computed_s1) { stepwise_blocked_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "blocked_paths"] / total_confounders[i] }
  
  stepwise_X_blocked <- c()
  for (i in 1:num_computed_s1) { stepwise_X_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }
  
  stepwise_X_blocked_percentage <- c()
  for (i in 1:num_computed_s1) { stepwise_X_blocked_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_blocked <- c()
  for (i in 1:num_computed_s1) { lasso_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }
  
  lasso_blocked_percentage <- c()
  for (i in 1:num_computed_s1) { lasso_blocked_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] / total_confounders[i] }
  
  lasso_X_blocked <- c()
  for (i in 1:num_computed_s1) { lasso_X_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }
  
  lasso_X_blocked_percentage <- c()
  for (i in 1:num_computed_s1) { lasso_X_blocked_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_union_blocked <- c()
  for (i in 1:num_computed_s1) { lasso_union_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }
  
  lasso_union_blocked_percentage <- c()
  for (i in 1:num_computed_s1) { lasso_union_blocked_percentage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] / total_confounders[i] }
  
  scenario_1_backdoor_pathway_table <- data.frame(measured_confounders,
                                                  unmeasured_confounders,
                                                  open_paths,
                                                  linear_full_blocked,
                                                  linear_full_blocked_percentage,
                                                  stepwise_blocked,
                                                  stepwise_blocked_percentage,
                                                  stepwise_X_blocked,
                                                  stepwise_X_blocked_percentage,
                                                  lasso_blocked,
                                                  lasso_blocked_percentage,
                                                  lasso_X_blocked,
                                                  lasso_X_blocked_percentage,
                                                  lasso_union_blocked,
                                                  lasso_union_blocked_percentage)
  
  print(scenario_1_backdoor_pathway_table)
  
  
  # coefficients and SEs table
  
  true_coefficients <- c()
  for (i in 1:num_computed_s1) { true_coefficients[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods
  
  linear_full_mean_coef <- c()
  for (i in 1:num_computed_s1) { linear_full_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "causal_estimate"] }
  
  linear_full_emp_se <- c()
  for (i in 1:num_computed_s1) { linear_full_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "emp_SE"] }
  
  linear_full_model_se <- c()
  for (i in 1:num_computed_s1) { linear_full_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "model_SE"] }
  
  stepwise_mean_coef <- c()
  for (i in 1:num_computed_s1) { stepwise_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "causal_estimate"] }
  
  stepwise_emp_se <- c()
  for (i in 1:num_computed_s1) { stepwise_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "emp_SE"] }
  
  stepwise_model_se <- c()
  for (i in 1:num_computed_s1) { stepwise_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "model_SE"] }
  
  stepwise_X_mean_coef <- c()
  for (i in 1:num_computed_s1) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }
  
  stepwise_X_emp_se <- c()
  for (i in 1:num_computed_s1) { stepwise_X_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "emp_SE"] }
  
  stepwise_X_model_se <- c()
  for (i in 1:num_computed_s1) { stepwise_X_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "model_SE"] }
  
  lasso_mean_coef <- c()
  for (i in 1:num_computed_s1) { lasso_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }
  
  lasso_emp_se <- c()
  for (i in 1:num_computed_s1) { lasso_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }
  
  lasso_model_se <- c()
  for (i in 1:num_computed_s1) { lasso_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "model_SE"] }
  
  lasso_X_mean_coef <- c()
  for (i in 1:num_computed_s1) { lasso_X_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }
  
  lasso_X_emp_se <- c()
  for (i in 1:num_computed_s1) { lasso_X_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }
  
  lasso_X_model_se <- c()
  for (i in 1:num_computed_s1) { lasso_X_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }
  
  lasso_union_mean_coef <- c()
  for (i in 1:num_computed_s1) { lasso_union_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }
  
  lasso_union_emp_se <- c()
  for (i in 1:num_computed_s1) { lasso_union_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }
  
  lasso_union_model_se <- c()
  for (i in 1:num_computed_s1) { lasso_union_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }
  
  scenario_1_standard_error_first_half_table <- data.frame(measured_confounders,
                                                           unmeasured_confounders,
                                                           true_coefficients,
                                                           linear_full_mean_coef,
                                                           linear_full_emp_se,
                                                           linear_full_model_se,
                                                           stepwise_mean_coef,
                                                           stepwise_emp_se,
                                                           stepwise_model_se,
                                                           stepwise_X_mean_coef,
                                                           stepwise_X_emp_se,
                                                           stepwise_X_model_se)
  
  scenario_1_standard_error_second_half_table <- data.frame(measured_confounders,
                                                            unmeasured_confounders,
                                                            true_coefficients,
                                                            lasso_mean_coef,
                                                            lasso_emp_se,
                                                            lasso_model_se,
                                                            lasso_X_mean_coef,
                                                            lasso_X_emp_se,
                                                            lasso_X_model_se,
                                                            lasso_union_mean_coef,
                                                            lasso_union_emp_se,
                                                            lasso_union_model_se)
  
  print(scenario_1_standard_error_first_half_table)
  print(scenario_1_standard_error_second_half_table)
  
  
  
  # ----- Generate Scenario 2 Tables -----
  
  # allows us to be flexible as things finish on HPC at different times
  measured_confounders   <- c(16, 12, 32, 24, 64, 48, 128,  96)
  unmeasured_confounders <- c( 0,  4,  0,  8,  0, 16,   0,  32)
  total_confounders      <- c(16, 16, 32, 32, 64, 64, 128, 128)

  measured_confounders   <- measured_confounders[1:num_computed_s2]
  unmeasured_confounders <- unmeasured_confounders[1:num_computed_s2]
  true_coefficients      <- true_coefficients[1:num_computed_s2]
  
  
  # causal effect estimation table
  
  linear_full_bias  <- c()
  for (i in 1:num_computed_s2) { linear_full_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "causal_bias"] }
  
  linear_full_bias_percentage <- c()
  for (i in 1:num_computed_s2) { linear_full_bias_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "causal_bias"] / true_causal_effect }
  
  linear_full_coverage <- c()
  for (i in 1:num_computed_s2) { linear_full_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "causal_coverage"] }
  
  stepwise_bias <- c()
  for (i in 1:num_computed_s2) { stepwise_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "causal_bias"] }
  
  stepwise_bias_percentage <- c()
  for (i in 1:num_computed_s2) { stepwise_bias_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "causal_bias"] / true_causal_effect }
  
  stepwise_coverage <- c()
  for (i in 1:num_computed_s2) { stepwise_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "causal_coverage"] }
  
  stepwise_X_bias <- c()
  for (i in 1:num_computed_s2) { stepwise_X_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "causal_bias"] }
  
  stepwise_X_bias_percentage <- c()
  for (i in 1:num_computed_s2) { stepwise_X_bias_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "causal_bias"] / true_causal_effect }
  
  stepwise_X_coverage <- c()
  for (i in 1:num_computed_s2) { stepwise_X_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }
  
  lasso_bias <- c()
  for (i in 1:num_computed_s2) { lasso_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }
  
  lasso_bias_percentage <- c()
  for (i in 1:num_computed_s2) { lasso_bias_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "causal_bias"] / true_causal_effect }
  
  lasso_coverage <- c()
  for (i in 1:num_computed_s2) { lasso_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }
  
  lasso_X_bias <- c()
  for (i in 1:num_computed_s2) { lasso_X_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }
  
  lasso_X_bias_percentage <- c()
  for (i in 1:num_computed_s2) { lasso_X_bias_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] / true_causal_effect }
  
  lasso_X_coverage <- c()
  for (i in 1:num_computed_s2) { lasso_X_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }
  
  lasso_union_bias <- c()
  for (i in 1:num_computed_s2) { lasso_union_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }
  
  lasso_union_bias_percentage <- c()
  for (i in 1:num_computed_s2) { lasso_union_bias_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] / true_causal_effect }
  
  lasso_union_coverage <- c()
  for (i in 1:num_computed_s2) { lasso_union_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }
  
  scenario_2_causal_estimation_table <- data.frame(measured_confounders,
                                                   unmeasured_confounders,
                                                   linear_full_bias,
                                                   linear_full_bias_percentage,
                                                   linear_full_coverage,
                                                   stepwise_bias,
                                                   stepwise_bias_percentage,
                                                   stepwise_coverage,
                                                   stepwise_X_bias,
                                                   stepwise_X_bias_percentage,
                                                   stepwise_X_coverage,
                                                   lasso_bias,
                                                   lasso_bias_percentage,
                                                   lasso_coverage,
                                                   lasso_X_bias,
                                                   lasso_X_bias_percentage,
                                                   lasso_X_coverage,
                                                   lasso_union_bias,
                                                   lasso_union_bias_percentage,
                                                   lasso_union_coverage)
  
  print(scenario_2_causal_estimation_table)
  
  
  # backdoor pathway table
  
  open_paths <- total_confounders
  open_paths <- open_paths[1:num_computed_s2]
  
  linear_full_blocked <- c()
  for (i in 1:num_computed_s2) { linear_full_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "blocked_paths"] }
  
  linear_full_blocked_percentage <- c()
  for (i in 1:num_computed_s2) { linear_full_blocked_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "blocked_paths"] / total_confounders[i] }
  
  stepwise_blocked <- c()
  for (i in 1:num_computed_s2) { stepwise_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "blocked_paths"] }
  
  stepwise_blocked_percentage <- c()
  for (i in 1:num_computed_s2) { stepwise_blocked_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "blocked_paths"] / total_confounders[i] }
  
  stepwise_X_blocked <- c()
  for (i in 1:num_computed_s2) { stepwise_X_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }
  
  stepwise_X_blocked_percentage <- c()
  for (i in 1:num_computed_s2) { stepwise_X_blocked_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_blocked <- c()
  for (i in 1:num_computed_s2) { lasso_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }
  
  lasso_blocked_percentage <- c()
  for (i in 1:num_computed_s2) { lasso_blocked_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] / total_confounders[i] }
  
  lasso_X_blocked <- c()
  for (i in 1:num_computed_s2) { lasso_X_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }
  
  lasso_X_blocked_percentage <- c()
  for (i in 1:num_computed_s2) { lasso_X_blocked_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_union_blocked <- c()
  for (i in 1:num_computed_s2) { lasso_union_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }
  
  lasso_union_blocked_percentage <- c()
  for (i in 1:num_computed_s2) { lasso_union_blocked_percentage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] / total_confounders[i] }
  
  scenario_2_backdoor_pathway_table <- data.frame(measured_confounders,
                                                  unmeasured_confounders,
                                                  open_paths,
                                                  linear_full_blocked,
                                                  linear_full_blocked_percentage,
                                                  stepwise_blocked,
                                                  stepwise_blocked_percentage,
                                                  stepwise_X_blocked,
                                                  stepwise_X_blocked_percentage,
                                                  lasso_blocked,
                                                  lasso_blocked_percentage,
                                                  lasso_X_blocked,
                                                  lasso_X_blocked_percentage,
                                                  lasso_union_blocked,
                                                  lasso_union_blocked_percentage)
  
  print(scenario_2_backdoor_pathway_table)
  
  
  # coefficients and SEs table
  
  true_coefficients <- c()
  for (i in 1:num_computed_s2) { true_coefficients[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods
  
  linear_full_mean_coef <- c()
  for (i in 1:num_computed_s2) { linear_full_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "causal_estimate"] }
  
  linear_full_emp_se <- c()
  for (i in 1:num_computed_s2) { linear_full_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "emp_SE"] }
  
  linear_full_model_se <- c()
  for (i in 1:num_computed_s2) { linear_full_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "model_SE"] }
  
  stepwise_mean_coef <- c()
  for (i in 1:num_computed_s2) { stepwise_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "causal_estimate"] }
  
  stepwise_emp_se <- c()
  for (i in 1:num_computed_s2) { stepwise_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "emp_SE"] }
  
  stepwise_model_se <- c()
  for (i in 1:num_computed_s2) { stepwise_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "model_SE"] }
  
  stepwise_X_mean_coef <- c()
  for (i in 1:num_computed_s2) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }
  
  stepwise_X_emp_se <- c()
  for (i in 1:num_computed_s2) { stepwise_X_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "emp_SE"] }
  
  stepwise_X_model_se <- c()
  for (i in 1:num_computed_s2) { stepwise_X_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "model_SE"] }
  
  lasso_mean_coef <- c()
  for (i in 1:num_computed_s2) { lasso_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }
  
  lasso_emp_se <- c()
  for (i in 1:num_computed_s2) { lasso_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }
  
  lasso_model_se <- c()
  for (i in 1:num_computed_s2) { lasso_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "model_SE"] }
  
  lasso_X_mean_coef <- c()
  for (i in 1:num_computed_s2) { lasso_X_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }
  
  lasso_X_emp_se <- c()
  for (i in 1:num_computed_s2) { lasso_X_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }
  
  lasso_X_model_se <- c()
  for (i in 1:num_computed_s2) { lasso_X_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }
  
  lasso_union_mean_coef <- c()
  for (i in 1:num_computed_s2) { lasso_union_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }
  
  lasso_union_emp_se <- c()
  for (i in 1:num_computed_s2) { lasso_union_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }
  
  lasso_union_model_se <- c()
  for (i in 1:num_computed_s2) { lasso_union_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }
  
  scenario_2_standard_error_first_half_table <- data.frame(measured_confounders,
                                                           unmeasured_confounders,
                                                           true_coefficients,
                                                           linear_full_mean_coef,
                                                           linear_full_emp_se,
                                                           linear_full_model_se,
                                                           stepwise_mean_coef,
                                                           stepwise_emp_se,
                                                           stepwise_model_se,
                                                           stepwise_X_mean_coef,
                                                           stepwise_X_emp_se,
                                                           stepwise_X_model_se)
  
  scenario_2_standard_error_second_half_table <- data.frame(measured_confounders,
                                                            unmeasured_confounders,
                                                            true_coefficients,
                                                            lasso_mean_coef,
                                                            lasso_emp_se,
                                                            lasso_model_se,
                                                            lasso_X_mean_coef,
                                                            lasso_X_emp_se,
                                                            lasso_X_model_se,
                                                            lasso_union_mean_coef,
                                                            lasso_union_emp_se,
                                                            lasso_union_model_se)
  
  print(scenario_2_standard_error_first_half_table)
  print(scenario_2_standard_error_second_half_table)
  
  
  
  # ----- Generate Scenario 3 Tables -----
  
  # allows us to be flexible as things finish on HPC at different times
  measured_confounders   <- c(16, 12, 32, 24, 64, 48, 128,  96)
  unmeasured_confounders <- c( 0,  4,  0,  8,  0, 16,   0,  32)
  total_confounders      <- c(16, 16, 32, 32, 64, 64, 128, 128)
  
  measured_confounders   <- measured_confounders[1:num_computed_s3]
  unmeasured_confounders <- unmeasured_confounders[1:num_computed_s3]
  true_coefficients      <- true_coefficients[1:num_computed_s3]
  
  
  # causal effect estimation table
  
  linear_full_bias  <- c()
  for (i in 1:num_computed_s3) { linear_full_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "causal_bias"] }
  
  linear_full_bias_percentage <- c()
  for (i in 1:num_computed_s3) { linear_full_bias_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "causal_bias"] / true_causal_effect }
  
  linear_full_coverage <- c()
  for (i in 1:num_computed_s3) { linear_full_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "causal_coverage"] }
  
  stepwise_bias <- c()
  for (i in 1:num_computed_s3) { stepwise_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "causal_bias"] }
  
  stepwise_bias_percentage <- c()
  for (i in 1:num_computed_s3) { stepwise_bias_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "causal_bias"] / true_causal_effect }
  
  stepwise_coverage <- c()
  for (i in 1:num_computed_s3) { stepwise_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "causal_coverage"] }
  
  stepwise_X_bias <- c()
  for (i in 1:num_computed_s3) { stepwise_X_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "causal_bias"] }
  
  stepwise_X_bias_percentage <- c()
  for (i in 1:num_computed_s3) { stepwise_X_bias_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "causal_bias"] / true_causal_effect }
  
  stepwise_X_coverage <- c()
  for (i in 1:num_computed_s3) { stepwise_X_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }
  
  lasso_bias <- c()
  for (i in 1:num_computed_s3) { lasso_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }
  
  lasso_bias_percentage <- c()
  for (i in 1:num_computed_s3) { lasso_bias_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "causal_bias"] / true_causal_effect }
  
  lasso_coverage <- c()
  for (i in 1:num_computed_s3) { lasso_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }
  
  lasso_X_bias <- c()
  for (i in 1:num_computed_s3) { lasso_X_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }
  
  lasso_X_bias_percentage <- c()
  for (i in 1:num_computed_s3) { lasso_X_bias_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] / true_causal_effect }
  
  lasso_X_coverage <- c()
  for (i in 1:num_computed_s3) { lasso_X_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }
  
  lasso_union_bias <- c()
  for (i in 1:num_computed_s3) { lasso_union_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }
  
  lasso_union_bias_percentage <- c()
  for (i in 1:num_computed_s3) { lasso_union_bias_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] / true_causal_effect }
  
  lasso_union_coverage <- c()
  for (i in 1:num_computed_s3) { lasso_union_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }
  
  scenario_3_causal_estimation_table <- data.frame(measured_confounders,
                                                   unmeasured_confounders,
                                                   linear_full_bias,
                                                   linear_full_bias_percentage,
                                                   linear_full_coverage,
                                                   stepwise_bias,
                                                   stepwise_bias_percentage,
                                                   stepwise_coverage,
                                                   stepwise_X_bias,
                                                   stepwise_X_bias_percentage,
                                                   stepwise_X_coverage,
                                                   lasso_bias,
                                                   lasso_bias_percentage,
                                                   lasso_coverage,
                                                   lasso_X_bias,
                                                   lasso_X_bias_percentage,
                                                   lasso_X_coverage,
                                                   lasso_union_bias,
                                                   lasso_union_bias_percentage,
                                                   lasso_union_coverage)
  
  print(scenario_3_causal_estimation_table)
  
  
  # backdoor pathway table
  
  open_paths <- total_confounders
  open_paths <- open_paths[1:num_computed_s3]
  
  linear_full_blocked <- c()
  for (i in 1:num_computed_s3) { linear_full_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "blocked_paths"] }
  
  linear_full_blocked_percentage <- c()
  for (i in 1:num_computed_s3) { linear_full_blocked_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "blocked_paths"] / total_confounders[i] }
  
  stepwise_blocked <- c()
  for (i in 1:num_computed_s3) { stepwise_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "blocked_paths"] }
  
  stepwise_blocked_percentage <- c()
  for (i in 1:num_computed_s3) { stepwise_blocked_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "blocked_paths"] / total_confounders[i] }
  
  stepwise_X_blocked <- c()
  for (i in 1:num_computed_s3) { stepwise_X_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }
  
  stepwise_X_blocked_percentage <- c()
  for (i in 1:num_computed_s3) { stepwise_X_blocked_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_blocked <- c()
  for (i in 1:num_computed_s3) { lasso_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }
  
  lasso_blocked_percentage <- c()
  for (i in 1:num_computed_s3) { lasso_blocked_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] / total_confounders[i] }
  
  lasso_X_blocked <- c()
  for (i in 1:num_computed_s3) { lasso_X_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }
  
  lasso_X_blocked_percentage <- c()
  for (i in 1:num_computed_s3) { lasso_X_blocked_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_union_blocked <- c()
  for (i in 1:num_computed_s3) { lasso_union_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }
  
  lasso_union_blocked_percentage <- c()
  for (i in 1:num_computed_s3) { lasso_union_blocked_percentage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] / total_confounders[i] }
  
  scenario_3_backdoor_pathway_table <- data.frame(measured_confounders,
                                                  unmeasured_confounders,
                                                  open_paths,
                                                  linear_full_blocked,
                                                  linear_full_blocked_percentage,
                                                  stepwise_blocked,
                                                  stepwise_blocked_percentage,
                                                  stepwise_X_blocked,
                                                  stepwise_X_blocked_percentage,
                                                  lasso_blocked,
                                                  lasso_blocked_percentage,
                                                  lasso_X_blocked,
                                                  lasso_X_blocked_percentage,
                                                  lasso_union_blocked,
                                                  lasso_union_blocked_percentage)
  
  print(scenario_3_backdoor_pathway_table)
  
  
  # coefficients and SEs table
  
  true_coefficients <- c()
  for (i in 1:num_computed_s3) { true_coefficients[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods
  
  linear_full_mean_coef <- c()
  for (i in 1:num_computed_s3) { linear_full_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "causal_estimate"] }
  
  linear_full_emp_se <- c()
  for (i in 1:num_computed_s3) { linear_full_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "emp_SE"] }
  
  linear_full_model_se <- c()
  for (i in 1:num_computed_s3) { linear_full_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "model_SE"] }
  
  stepwise_mean_coef <- c()
  for (i in 1:num_computed_s3) { stepwise_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "causal_estimate"] }
  
  stepwise_emp_se <- c()
  for (i in 1:num_computed_s3) { stepwise_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "emp_SE"] }
  
  stepwise_model_se <- c()
  for (i in 1:num_computed_s3) { stepwise_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "model_SE"] }
  
  stepwise_X_mean_coef <- c()
  for (i in 1:num_computed_s3) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }
  
  stepwise_X_emp_se <- c()
  for (i in 1:num_computed_s3) { stepwise_X_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "emp_SE"] }
  
  stepwise_X_model_se <- c()
  for (i in 1:num_computed_s3) { stepwise_X_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "model_SE"] }
  
  lasso_mean_coef <- c()
  for (i in 1:num_computed_s3) { lasso_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }
  
  lasso_emp_se <- c()
  for (i in 1:num_computed_s3) { lasso_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }
  
  lasso_model_se <- c()
  for (i in 1:num_computed_s3) { lasso_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "model_SE"] }
  
  lasso_X_mean_coef <- c()
  for (i in 1:num_computed_s3) { lasso_X_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }
  
  lasso_X_emp_se <- c()
  for (i in 1:num_computed_s3) { lasso_X_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }
  
  lasso_X_model_se <- c()
  for (i in 1:num_computed_s3) { lasso_X_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }
  
  lasso_union_mean_coef <- c()
  for (i in 1:num_computed_s3) { lasso_union_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }
  
  lasso_union_emp_se <- c()
  for (i in 1:num_computed_s3) { lasso_union_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }
  
  lasso_union_model_se <- c()
  for (i in 1:num_computed_s3) { lasso_union_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }
  
  scenario_3_standard_error_first_half_table <- data.frame(measured_confounders,
                                                           unmeasured_confounders,
                                                           true_coefficients,
                                                           linear_full_mean_coef,
                                                           linear_full_emp_se,
                                                           linear_full_model_se,
                                                           stepwise_mean_coef,
                                                           stepwise_emp_se,
                                                           stepwise_model_se,
                                                           stepwise_X_mean_coef,
                                                           stepwise_X_emp_se,
                                                           stepwise_X_model_se)
  
  scenario_3_standard_error_second_half_table <- data.frame(measured_confounders,
                                                            unmeasured_confounders,
                                                            true_coefficients,
                                                            lasso_mean_coef,
                                                            lasso_emp_se,
                                                            lasso_model_se,
                                                            lasso_X_mean_coef,
                                                            lasso_X_emp_se,
                                                            lasso_X_model_se,
                                                            lasso_union_mean_coef,
                                                            lasso_union_emp_se,
                                                            lasso_union_model_se)
  
  print(scenario_3_standard_error_first_half_table)
  print(scenario_3_standard_error_second_half_table)
  
  
  
  # ----- Generate Scenario 4 Tables -----
  
  # allows us to be flexible as things finish on HPC at different times
  measured_confounders   <- c(16, 12, 32, 24, 64, 48, 128,  96)
  unmeasured_confounders <- c( 0,  4,  0,  8,  0, 16,   0,  32)
  total_confounders      <- c(16, 16, 32, 32, 64, 64, 128, 128)
  
  measured_confounders   <- measured_confounders[1:num_computed_s4]
  unmeasured_confounders <- unmeasured_confounders[1:num_computed_s4]
  true_coefficients      <- true_coefficients[1:num_computed_s4]
  
  
  # causal effect estimation table
  
  linear_full_bias  <- c()
  for (i in 1:num_computed_s4) { linear_full_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "causal_bias"] }
  
  linear_full_bias_percentage <- c()
  for (i in 1:num_computed_s4) { linear_full_bias_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "causal_bias"] / true_causal_effect }
  
  linear_full_coverage <- c()
  for (i in 1:num_computed_s4) { linear_full_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "causal_coverage"] }
  
  stepwise_bias <- c()
  for (i in 1:num_computed_s4) { stepwise_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "causal_bias"] }
  
  stepwise_bias_percentage <- c()
  for (i in 1:num_computed_s4) { stepwise_bias_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "causal_bias"] / true_causal_effect }
  
  stepwise_coverage <- c()
  for (i in 1:num_computed_s4) { stepwise_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "causal_coverage"] }
  
  stepwise_X_bias <- c()
  for (i in 1:num_computed_s4) { stepwise_X_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "causal_bias"] }
  
  stepwise_X_bias_percentage <- c()
  for (i in 1:num_computed_s4) { stepwise_X_bias_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "causal_bias"] / true_causal_effect }
  
  stepwise_X_coverage <- c()
  for (i in 1:num_computed_s4) { stepwise_X_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }
  
  lasso_bias <- c()
  for (i in 1:num_computed_s4) { lasso_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }
  
  lasso_bias_percentage <- c()
  for (i in 1:num_computed_s4) { lasso_bias_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "causal_bias"] / true_causal_effect }
  
  lasso_coverage <- c()
  for (i in 1:num_computed_s4) { lasso_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }
  
  lasso_X_bias <- c()
  for (i in 1:num_computed_s4) { lasso_X_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }
  
  lasso_X_bias_percentage <- c()
  for (i in 1:num_computed_s4) { lasso_X_bias_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] / true_causal_effect }
  
  lasso_X_coverage <- c()
  for (i in 1:num_computed_s4) { lasso_X_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }
  
  lasso_union_bias <- c()
  for (i in 1:num_computed_s4) { lasso_union_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }
  
  lasso_union_bias_percentage <- c()
  for (i in 1:num_computed_s4) { lasso_union_bias_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] / true_causal_effect }
  
  lasso_union_coverage <- c()
  for (i in 1:num_computed_s4) { lasso_union_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }
  
  scenario_4_causal_estimation_table <- data.frame(measured_confounders,
                                                   unmeasured_confounders,
                                                   linear_full_bias,
                                                   linear_full_bias_percentage,
                                                   linear_full_coverage,
                                                   stepwise_bias,
                                                   stepwise_bias_percentage,
                                                   stepwise_coverage,
                                                   stepwise_X_bias,
                                                   stepwise_X_bias_percentage,
                                                   stepwise_X_coverage,
                                                   lasso_bias,
                                                   lasso_bias_percentage,
                                                   lasso_coverage,
                                                   lasso_X_bias,
                                                   lasso_X_bias_percentage,
                                                   lasso_X_coverage,
                                                   lasso_union_bias,
                                                   lasso_union_bias_percentage,
                                                   lasso_union_coverage)
  
  print(scenario_4_causal_estimation_table)
  
  
  # backdoor pathway table
  
  open_paths <- total_confounders
  open_paths <- open_paths[1:num_computed_s4]
  
  linear_full_blocked <- c()
  for (i in 1:num_computed_s4) { linear_full_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "blocked_paths"] }
  
  linear_full_blocked_percentage <- c()
  for (i in 1:num_computed_s4) { linear_full_blocked_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "blocked_paths"] / total_confounders[i] }
  
  stepwise_blocked <- c()
  for (i in 1:num_computed_s4) { stepwise_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "blocked_paths"] }
  
  stepwise_blocked_percentage <- c()
  for (i in 1:num_computed_s4) { stepwise_blocked_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "blocked_paths"] / total_confounders[i] }
  
  stepwise_X_blocked <- c()
  for (i in 1:num_computed_s4) { stepwise_X_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }
  
  stepwise_X_blocked_percentage <- c()
  for (i in 1:num_computed_s4) { stepwise_X_blocked_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_blocked <- c()
  for (i in 1:num_computed_s4) { lasso_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }
  
  lasso_blocked_percentage <- c()
  for (i in 1:num_computed_s4) { lasso_blocked_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] / total_confounders[i] }
  
  lasso_X_blocked <- c()
  for (i in 1:num_computed_s4) { lasso_X_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }
  
  lasso_X_blocked_percentage <- c()
  for (i in 1:num_computed_s4) { lasso_X_blocked_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_union_blocked <- c()
  for (i in 1:num_computed_s4) { lasso_union_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }
  
  lasso_union_blocked_percentage <- c()
  for (i in 1:num_computed_s4) { lasso_union_blocked_percentage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] / total_confounders[i] }
  
  scenario_4_backdoor_pathway_table <- data.frame(measured_confounders,
                                                  unmeasured_confounders,
                                                  open_paths,
                                                  linear_full_blocked,
                                                  linear_full_blocked_percentage,
                                                  stepwise_blocked,
                                                  stepwise_blocked_percentage,
                                                  stepwise_X_blocked,
                                                  stepwise_X_blocked_percentage,
                                                  lasso_blocked,
                                                  lasso_blocked_percentage,
                                                  lasso_X_blocked,
                                                  lasso_X_blocked_percentage,
                                                  lasso_union_blocked,
                                                  lasso_union_blocked_percentage)
  
  print(scenario_4_backdoor_pathway_table)
  
  
  # coefficients and SEs table
  
  true_coefficients <- c()
  for (i in 1:num_computed_s4) { true_coefficients[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods
  
  linear_full_mean_coef <- c()
  for (i in 1:num_computed_s4) { linear_full_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "causal_estimate"] }
  
  linear_full_emp_se <- c()
  for (i in 1:num_computed_s4) { linear_full_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "emp_SE"] }
  
  linear_full_model_se <- c()
  for (i in 1:num_computed_s4) { linear_full_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "model_SE"] }
  
  stepwise_mean_coef <- c()
  for (i in 1:num_computed_s4) { stepwise_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "causal_estimate"] }
  
  stepwise_emp_se <- c()
  for (i in 1:num_computed_s4) { stepwise_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "emp_SE"] }
  
  stepwise_model_se <- c()
  for (i in 1:num_computed_s4) { stepwise_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "model_SE"] }
  
  stepwise_X_mean_coef <- c()
  for (i in 1:num_computed_s4) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }
  
  stepwise_X_emp_se <- c()
  for (i in 1:num_computed_s4) { stepwise_X_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "emp_SE"] }
  
  stepwise_X_model_se <- c()
  for (i in 1:num_computed_s4) { stepwise_X_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "model_SE"] }
  
  lasso_mean_coef <- c()
  for (i in 1:num_computed_s4) { lasso_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }
  
  lasso_emp_se <- c()
  for (i in 1:num_computed_s4) { lasso_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }
  
  lasso_model_se <- c()
  for (i in 1:num_computed_s4) { lasso_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "model_SE"] }
  
  lasso_X_mean_coef <- c()
  for (i in 1:num_computed_s4) { lasso_X_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }
  
  lasso_X_emp_se <- c()
  for (i in 1:num_computed_s4) { lasso_X_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }
  
  lasso_X_model_se <- c()
  for (i in 1:num_computed_s4) { lasso_X_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }
  
  lasso_union_mean_coef <- c()
  for (i in 1:num_computed_s4) { lasso_union_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }
  
  lasso_union_emp_se <- c()
  for (i in 1:num_computed_s4) { lasso_union_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }
  
  lasso_union_model_se <- c()
  for (i in 1:num_computed_s4) { lasso_union_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }
  
  scenario_4_standard_error_first_half_table <- data.frame(measured_confounders,
                                                           unmeasured_confounders,
                                                           true_coefficients,
                                                           linear_full_mean_coef,
                                                           linear_full_emp_se,
                                                           linear_full_model_se,
                                                           stepwise_mean_coef,
                                                           stepwise_emp_se,
                                                           stepwise_model_se,
                                                           stepwise_X_mean_coef,
                                                           stepwise_X_emp_se,
                                                           stepwise_X_model_se)
  
  scenario_4_standard_error_second_half_table <- data.frame(measured_confounders,
                                                            unmeasured_confounders,
                                                            true_coefficients,
                                                            lasso_mean_coef,
                                                            lasso_emp_se,
                                                            lasso_model_se,
                                                            lasso_X_mean_coef,
                                                            lasso_X_emp_se,
                                                            lasso_X_model_se,
                                                            lasso_union_mean_coef,
                                                            lasso_union_emp_se,
                                                            lasso_union_model_se)
  
  print(scenario_4_standard_error_first_half_table)
  print(scenario_4_standard_error_second_half_table)
  
  
  
  # ----- Generate Scenario 5 Tables -----
  
  # allows us to be flexible as things finish on HPC at different times
  measured_confounders   <- c(16, 12, 32, 24, 64, 48, 128,  96)
  unmeasured_confounders <- c( 0,  4,  0,  8,  0, 16,   0,  32)
  total_confounders      <- c(16, 16, 32, 32, 64, 64, 128, 128)
  
  measured_confounders   <- measured_confounders[1:num_computed_s5]
  unmeasured_confounders <- unmeasured_confounders[1:num_computed_s5]
  true_coefficients      <- true_coefficients[1:num_computed_s5]
  
  
  # causal effect estimation table
  
  linear_full_bias  <- c()
  for (i in 1:num_computed_s5) { linear_full_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "causal_bias"] }
  
  linear_full_bias_percentage <- c()
  for (i in 1:num_computed_s5) { linear_full_bias_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "causal_bias"] / true_causal_effect }
  
  linear_full_coverage <- c()
  for (i in 1:num_computed_s5) { linear_full_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "causal_coverage"] }
  
  stepwise_bias <- c()
  for (i in 1:num_computed_s5) { stepwise_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "causal_bias"] }
  
  stepwise_bias_percentage <- c()
  for (i in 1:num_computed_s5) { stepwise_bias_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "causal_bias"] / true_causal_effect }
  
  stepwise_coverage <- c()
  for (i in 1:num_computed_s5) { stepwise_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "causal_coverage"] }
  
  stepwise_X_bias <- c()
  for (i in 1:num_computed_s5) { stepwise_X_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "causal_bias"] }
  
  stepwise_X_bias_percentage <- c()
  for (i in 1:num_computed_s5) { stepwise_X_bias_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "causal_bias"] / true_causal_effect }
  
  stepwise_X_coverage <- c()
  for (i in 1:num_computed_s5) { stepwise_X_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }
  
  lasso_bias <- c()
  for (i in 1:num_computed_s5) { lasso_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }
  
  lasso_bias_percentage <- c()
  for (i in 1:num_computed_s5) { lasso_bias_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "causal_bias"] / true_causal_effect }
  
  lasso_coverage <- c()
  for (i in 1:num_computed_s5) { lasso_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }
  
  lasso_X_bias <- c()
  for (i in 1:num_computed_s5) { lasso_X_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }
  
  lasso_X_bias_percentage <- c()
  for (i in 1:num_computed_s5) { lasso_X_bias_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] / true_causal_effect }
  
  lasso_X_coverage <- c()
  for (i in 1:num_computed_s5) { lasso_X_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }
  
  lasso_union_bias <- c()
  for (i in 1:num_computed_s5) { lasso_union_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }
  
  lasso_union_bias_percentage <- c()
  for (i in 1:num_computed_s5) { lasso_union_bias_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] / true_causal_effect }
  
  lasso_union_coverage <- c()
  for (i in 1:num_computed_s5) { lasso_union_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }
  
  scenario_5_causal_estimation_table <- data.frame(measured_confounders,
                                                   unmeasured_confounders,
                                                   linear_full_bias,
                                                   linear_full_bias_percentage,
                                                   linear_full_coverage,
                                                   stepwise_bias,
                                                   stepwise_bias_percentage,
                                                   stepwise_coverage,
                                                   stepwise_X_bias,
                                                   stepwise_X_bias_percentage,
                                                   stepwise_X_coverage,
                                                   lasso_bias,
                                                   lasso_bias_percentage,
                                                   lasso_coverage,
                                                   lasso_X_bias,
                                                   lasso_X_bias_percentage,
                                                   lasso_X_coverage,
                                                   lasso_union_bias,
                                                   lasso_union_bias_percentage,
                                                   lasso_union_coverage)
  
  print(scenario_5_causal_estimation_table)
  
  
  # backdoor pathway table
  
  open_paths <- total_confounders
  open_paths <- open_paths[1:num_computed_s5]
  
  linear_full_blocked <- c()
  for (i in 1:num_computed_s5) { linear_full_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "blocked_paths"] }
  
  linear_full_blocked_percentage <- c()
  for (i in 1:num_computed_s5) { linear_full_blocked_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "blocked_paths"] / total_confounders[i] }
  
  stepwise_blocked <- c()
  for (i in 1:num_computed_s5) { stepwise_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "blocked_paths"] }
  
  stepwise_blocked_percentage <- c()
  for (i in 1:num_computed_s5) { stepwise_blocked_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "blocked_paths"] / total_confounders[i] }
  
  stepwise_X_blocked <- c()
  for (i in 1:num_computed_s5) { stepwise_X_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }
  
  stepwise_X_blocked_percentage <- c()
  for (i in 1:num_computed_s5) { stepwise_X_blocked_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_blocked <- c()
  for (i in 1:num_computed_s5) { lasso_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }
  
  lasso_blocked_percentage <- c()
  for (i in 1:num_computed_s5) { lasso_blocked_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] / total_confounders[i] }
  
  lasso_X_blocked <- c()
  for (i in 1:num_computed_s5) { lasso_X_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }
  
  lasso_X_blocked_percentage <- c()
  for (i in 1:num_computed_s5) { lasso_X_blocked_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_union_blocked <- c()
  for (i in 1:num_computed_s5) { lasso_union_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }
  
  lasso_union_blocked_percentage <- c()
  for (i in 1:num_computed_s5) { lasso_union_blocked_percentage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] / total_confounders[i] }
  
  scenario_5_backdoor_pathway_table <- data.frame(measured_confounders,
                                                  unmeasured_confounders,
                                                  open_paths,
                                                  linear_full_blocked,
                                                  linear_full_blocked_percentage,
                                                  stepwise_blocked,
                                                  stepwise_blocked_percentage,
                                                  stepwise_X_blocked,
                                                  stepwise_X_blocked_percentage,
                                                  lasso_blocked,
                                                  lasso_blocked_percentage,
                                                  lasso_X_blocked,
                                                  lasso_X_blocked_percentage,
                                                  lasso_union_blocked,
                                                  lasso_union_blocked_percentage)
  
  print(scenario_5_backdoor_pathway_table)
  
  
  # coefficients and SEs table
  
  true_coefficients <- c()
  for (i in 1:num_computed_s5) { true_coefficients[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods
  
  linear_full_mean_coef <- c()
  for (i in 1:num_computed_s5) { linear_full_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "causal_estimate"] }
  
  linear_full_emp_se <- c()
  for (i in 1:num_computed_s5) { linear_full_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "emp_SE"] }
  
  linear_full_model_se <- c()
  for (i in 1:num_computed_s5) { linear_full_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "model_SE"] }
  
  stepwise_mean_coef <- c()
  for (i in 1:num_computed_s5) { stepwise_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "causal_estimate"] }
  
  stepwise_emp_se <- c()
  for (i in 1:num_computed_s5) { stepwise_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "emp_SE"] }
  
  stepwise_model_se <- c()
  for (i in 1:num_computed_s5) { stepwise_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "model_SE"] }
  
  stepwise_X_mean_coef <- c()
  for (i in 1:num_computed_s5) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }
  
  stepwise_X_emp_se <- c()
  for (i in 1:num_computed_s5) { stepwise_X_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "emp_SE"] }
  
  stepwise_X_model_se <- c()
  for (i in 1:num_computed_s5) { stepwise_X_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "model_SE"] }
  
  lasso_mean_coef <- c()
  for (i in 1:num_computed_s5) { lasso_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }
  
  lasso_emp_se <- c()
  for (i in 1:num_computed_s5) { lasso_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }
  
  lasso_model_se <- c()
  for (i in 1:num_computed_s5) { lasso_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "model_SE"] }
  
  lasso_X_mean_coef <- c()
  for (i in 1:num_computed_s5) { lasso_X_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }
  
  lasso_X_emp_se <- c()
  for (i in 1:num_computed_s5) { lasso_X_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }
  
  lasso_X_model_se <- c()
  for (i in 1:num_computed_s5) { lasso_X_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }
  
  lasso_union_mean_coef <- c()
  for (i in 1:num_computed_s5) { lasso_union_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }
  
  lasso_union_emp_se <- c()
  for (i in 1:num_computed_s5) { lasso_union_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }
  
  lasso_union_model_se <- c()
  for (i in 1:num_computed_s5) { lasso_union_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }
  
  scenario_5_standard_error_first_half_table <- data.frame(measured_confounders,
                                                           unmeasured_confounders,
                                                           true_coefficients,
                                                           linear_full_mean_coef,
                                                           linear_full_emp_se,
                                                           linear_full_model_se,
                                                           stepwise_mean_coef,
                                                           stepwise_emp_se,
                                                           stepwise_model_se,
                                                           stepwise_X_mean_coef,
                                                           stepwise_X_emp_se,
                                                           stepwise_X_model_se)
  
  scenario_5_standard_error_second_half_table <- data.frame(measured_confounders,
                                                            unmeasured_confounders,
                                                            true_coefficients,
                                                            lasso_mean_coef,
                                                            lasso_emp_se,
                                                            lasso_model_se,
                                                            lasso_X_mean_coef,
                                                            lasso_X_emp_se,
                                                            lasso_X_model_se,
                                                            lasso_union_mean_coef,
                                                            lasso_union_emp_se,
                                                            lasso_union_model_se)
  
  print(scenario_5_standard_error_first_half_table)
  print(scenario_5_standard_error_second_half_table)
  
  
  
  # ----- Generate Scenario 6 Tables -----
  
  # allows us to be flexible as things finish on HPC at different times
  measured_confounders   <- c(16, 12, 32, 24, 64, 48, 128,  96)
  unmeasured_confounders <- c( 0,  4,  0,  8,  0, 16,   0,  32)
  total_confounders      <- c(16, 16, 32, 32, 64, 64, 128, 128)
  
  measured_confounders   <- measured_confounders[1:num_computed_s6]
  unmeasured_confounders <- unmeasured_confounders[1:num_computed_s6]
  true_coefficients      <- true_coefficients[1:num_computed_s6]
  
  
  # causal effect estimation table
  
  linear_full_bias  <- c()
  for (i in 1:num_computed_s6) { linear_full_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "causal_bias"] }
  
  linear_full_bias_percentage <- c()
  for (i in 1:num_computed_s6) { linear_full_bias_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "causal_bias"] / true_causal_effect }
  
  linear_full_coverage <- c()
  for (i in 1:num_computed_s6) { linear_full_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "causal_coverage"] }
  
  stepwise_bias <- c()
  for (i in 1:num_computed_s6) { stepwise_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "causal_bias"] }
  
  stepwise_bias_percentage <- c()
  for (i in 1:num_computed_s6) { stepwise_bias_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "causal_bias"] / true_causal_effect }
  
  stepwise_coverage <- c()
  for (i in 1:num_computed_s6) { stepwise_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "causal_coverage"] }
  
  stepwise_X_bias <- c()
  for (i in 1:num_computed_s6) { stepwise_X_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "causal_bias"] }
  
  stepwise_X_bias_percentage <- c()
  for (i in 1:num_computed_s6) { stepwise_X_bias_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "causal_bias"] / true_causal_effect }
  
  stepwise_X_coverage <- c()
  for (i in 1:num_computed_s6) { stepwise_X_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }
  
  lasso_bias <- c()
  for (i in 1:num_computed_s6) { lasso_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }
  
  lasso_bias_percentage <- c()
  for (i in 1:num_computed_s6) { lasso_bias_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "causal_bias"] / true_causal_effect }
  
  lasso_coverage <- c()
  for (i in 1:num_computed_s6) { lasso_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }
  
  lasso_X_bias <- c()
  for (i in 1:num_computed_s6) { lasso_X_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }
  
  lasso_X_bias_percentage <- c()
  for (i in 1:num_computed_s6) { lasso_X_bias_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] / true_causal_effect }
  
  lasso_X_coverage <- c()
  for (i in 1:num_computed_s6) { lasso_X_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }
  
  lasso_union_bias <- c()
  for (i in 1:num_computed_s6) { lasso_union_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }
  
  lasso_union_bias_percentage <- c()
  for (i in 1:num_computed_s6) { lasso_union_bias_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] / true_causal_effect }
  
  lasso_union_coverage <- c()
  for (i in 1:num_computed_s6) { lasso_union_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }
  
  scenario_6_causal_estimation_table <- data.frame(measured_confounders,
                                                   unmeasured_confounders,
                                                   linear_full_bias,
                                                   linear_full_bias_percentage,
                                                   linear_full_coverage,
                                                   stepwise_bias,
                                                   stepwise_bias_percentage,
                                                   stepwise_coverage,
                                                   stepwise_X_bias,
                                                   stepwise_X_bias_percentage,
                                                   stepwise_X_coverage,
                                                   lasso_bias,
                                                   lasso_bias_percentage,
                                                   lasso_coverage,
                                                   lasso_X_bias,
                                                   lasso_X_bias_percentage,
                                                   lasso_X_coverage,
                                                   lasso_union_bias,
                                                   lasso_union_bias_percentage,
                                                   lasso_union_coverage)
  
  print(scenario_6_causal_estimation_table)
  
  
  # backdoor pathway table
  
  open_paths <- total_confounders
  open_paths <- open_paths[1:num_computed_s6]
  
  linear_full_blocked <- c()
  for (i in 1:num_computed_s6) { linear_full_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "blocked_paths"] }
  
  linear_full_blocked_percentage <- c()
  for (i in 1:num_computed_s6) { linear_full_blocked_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "blocked_paths"] / total_confounders[i] }
  
  stepwise_blocked <- c()
  for (i in 1:num_computed_s6) { stepwise_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "blocked_paths"] }
  
  stepwise_blocked_percentage <- c()
  for (i in 1:num_computed_s6) { stepwise_blocked_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "blocked_paths"] / total_confounders[i] }
  
  stepwise_X_blocked <- c()
  for (i in 1:num_computed_s6) { stepwise_X_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }
  
  stepwise_X_blocked_percentage <- c()
  for (i in 1:num_computed_s6) { stepwise_X_blocked_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_blocked <- c()
  for (i in 1:num_computed_s6) { lasso_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }
  
  lasso_blocked_percentage <- c()
  for (i in 1:num_computed_s6) { lasso_blocked_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] / total_confounders[i] }
  
  lasso_X_blocked <- c()
  for (i in 1:num_computed_s6) { lasso_X_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }
  
  lasso_X_blocked_percentage <- c()
  for (i in 1:num_computed_s6) { lasso_X_blocked_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_union_blocked <- c()
  for (i in 1:num_computed_s6) { lasso_union_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }
  
  lasso_union_blocked_percentage <- c()
  for (i in 1:num_computed_s6) { lasso_union_blocked_percentage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] / total_confounders[i] }
  
  scenario_6_backdoor_pathway_table <- data.frame(measured_confounders,
                                                  unmeasured_confounders,
                                                  open_paths,
                                                  linear_full_blocked,
                                                  linear_full_blocked_percentage,
                                                  stepwise_blocked,
                                                  stepwise_blocked_percentage,
                                                  stepwise_X_blocked,
                                                  stepwise_X_blocked_percentage,
                                                  lasso_blocked,
                                                  lasso_blocked_percentage,
                                                  lasso_X_blocked,
                                                  lasso_X_blocked_percentage,
                                                  lasso_union_blocked,
                                                  lasso_union_blocked_percentage)
  
  print(scenario_6_backdoor_pathway_table)
  
  
  # coefficients and SEs table
  
  true_coefficients <- c()
  for (i in 1:num_computed_s6) { true_coefficients[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods
  
  linear_full_mean_coef <- c()
  for (i in 1:num_computed_s6) { linear_full_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "causal_estimate"] }
  
  linear_full_emp_se <- c()
  for (i in 1:num_computed_s6) { linear_full_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "emp_SE"] }
  
  linear_full_model_se <- c()
  for (i in 1:num_computed_s6) { linear_full_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "model_SE"] }
  
  stepwise_mean_coef <- c()
  for (i in 1:num_computed_s6) { stepwise_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "causal_estimate"] }
  
  stepwise_emp_se <- c()
  for (i in 1:num_computed_s6) { stepwise_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "emp_SE"] }
  
  stepwise_model_se <- c()
  for (i in 1:num_computed_s6) { stepwise_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "model_SE"] }
  
  stepwise_X_mean_coef <- c()
  for (i in 1:num_computed_s6) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }
  
  stepwise_X_emp_se <- c()
  for (i in 1:num_computed_s6) { stepwise_X_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "emp_SE"] }
  
  stepwise_X_model_se <- c()
  for (i in 1:num_computed_s6) { stepwise_X_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "model_SE"] }
  
  lasso_mean_coef <- c()
  for (i in 1:num_computed_s6) { lasso_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }
  
  lasso_emp_se <- c()
  for (i in 1:num_computed_s6) { lasso_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }
  
  lasso_model_se <- c()
  for (i in 1:num_computed_s6) { lasso_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "model_SE"] }
  
  lasso_X_mean_coef <- c()
  for (i in 1:num_computed_s6) { lasso_X_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }
  
  lasso_X_emp_se <- c()
  for (i in 1:num_computed_s6) { lasso_X_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }
  
  lasso_X_model_se <- c()
  for (i in 1:num_computed_s6) { lasso_X_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }
  
  lasso_union_mean_coef <- c()
  for (i in 1:num_computed_s6) { lasso_union_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }
  
  lasso_union_emp_se <- c()
  for (i in 1:num_computed_s6) { lasso_union_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }
  
  lasso_union_model_se <- c()
  for (i in 1:num_computed_s6) { lasso_union_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }
  
  scenario_6_standard_error_first_half_table <- data.frame(measured_confounders,
                                                           unmeasured_confounders,
                                                           true_coefficients,
                                                           linear_full_mean_coef,
                                                           linear_full_emp_se,
                                                           linear_full_model_se,
                                                           stepwise_mean_coef,
                                                           stepwise_emp_se,
                                                           stepwise_model_se,
                                                           stepwise_X_mean_coef,
                                                           stepwise_X_emp_se,
                                                           stepwise_X_model_se)
  
  scenario_6_standard_error_second_half_table <- data.frame(measured_confounders,
                                                            unmeasured_confounders,
                                                            true_coefficients,
                                                            lasso_mean_coef,
                                                            lasso_emp_se,
                                                            lasso_model_se,
                                                            lasso_X_mean_coef,
                                                            lasso_X_emp_se,
                                                            lasso_X_model_se,
                                                            lasso_union_mean_coef,
                                                            lasso_union_emp_se,
                                                            lasso_union_model_se)
  
  print(scenario_6_standard_error_first_half_table)
  print(scenario_6_standard_error_second_half_table)
  
  
  
  # ----- Generate Scenario 7 Tables -----
  
  # allows us to be flexible as things finish on HPC at different times
  measured_confounders   <- c(16, 12, 32, 24, 64, 48, 128,  96)
  unmeasured_confounders <- c( 0,  4,  0,  8,  0, 16,   0,  32)
  total_confounders      <- c(16, 16, 32, 32, 64, 64, 128, 128)
  
  measured_confounders   <- measured_confounders[1:num_computed_s7]
  unmeasured_confounders <- unmeasured_confounders[1:num_computed_s7]
  true_coefficients      <- true_coefficients[1:num_computed_s7]
  
  
  # causal effect estimation table
  
  linear_full_bias  <- c()
  for (i in 1:num_computed_s7) { linear_full_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "causal_bias"] }
  
  linear_full_bias_percentage <- c()
  for (i in 1:num_computed_s7) { linear_full_bias_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "causal_bias"] / true_causal_effect }
  
  linear_full_coverage <- c()
  for (i in 1:num_computed_s7) { linear_full_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "causal_coverage"] }
  
  stepwise_bias <- c()
  for (i in 1:num_computed_s7) { stepwise_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "causal_bias"] }
  
  stepwise_bias_percentage <- c()
  for (i in 1:num_computed_s7) { stepwise_bias_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "causal_bias"] / true_causal_effect }
  
  stepwise_coverage <- c()
  for (i in 1:num_computed_s7) { stepwise_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "causal_coverage"] }
  
  stepwise_X_bias <- c()
  for (i in 1:num_computed_s7) { stepwise_X_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "causal_bias"] }
  
  stepwise_X_bias_percentage <- c()
  for (i in 1:num_computed_s7) { stepwise_X_bias_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "causal_bias"] / true_causal_effect }
  
  stepwise_X_coverage <- c()
  for (i in 1:num_computed_s7) { stepwise_X_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }
  
  lasso_bias <- c()
  for (i in 1:num_computed_s7) { lasso_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }
  
  lasso_bias_percentage <- c()
  for (i in 1:num_computed_s7) { lasso_bias_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "causal_bias"] / true_causal_effect }
  
  lasso_coverage <- c()
  for (i in 1:num_computed_s7) { lasso_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }
  
  lasso_X_bias <- c()
  for (i in 1:num_computed_s7) { lasso_X_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }
  
  lasso_X_bias_percentage <- c()
  for (i in 1:num_computed_s7) { lasso_X_bias_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] / true_causal_effect }
  
  lasso_X_coverage <- c()
  for (i in 1:num_computed_s7) { lasso_X_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }
  
  lasso_union_bias <- c()
  for (i in 1:num_computed_s7) { lasso_union_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }
  
  lasso_union_bias_percentage <- c()
  for (i in 1:num_computed_s7) { lasso_union_bias_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] / true_causal_effect }
  
  lasso_union_coverage <- c()
  for (i in 1:num_computed_s7) { lasso_union_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }
  
  scenario_7_causal_estimation_table <- data.frame(measured_confounders,
                                                   unmeasured_confounders,
                                                   linear_full_bias,
                                                   linear_full_bias_percentage,
                                                   linear_full_coverage,
                                                   stepwise_bias,
                                                   stepwise_bias_percentage,
                                                   stepwise_coverage,
                                                   stepwise_X_bias,
                                                   stepwise_X_bias_percentage,
                                                   stepwise_X_coverage,
                                                   lasso_bias,
                                                   lasso_bias_percentage,
                                                   lasso_coverage,
                                                   lasso_X_bias,
                                                   lasso_X_bias_percentage,
                                                   lasso_X_coverage,
                                                   lasso_union_bias,
                                                   lasso_union_bias_percentage,
                                                   lasso_union_coverage)
  
  print(scenario_7_causal_estimation_table)
  
  
  # backdoor pathway table
  
  open_paths <- total_confounders
  open_paths <- open_paths[1:num_computed_s7]
  
  linear_full_blocked <- c()
  for (i in 1:num_computed_s7) { linear_full_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "blocked_paths"] }
  
  linear_full_blocked_percentage <- c()
  for (i in 1:num_computed_s7) { linear_full_blocked_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "blocked_paths"] / total_confounders[i] }
  
  stepwise_blocked <- c()
  for (i in 1:num_computed_s7) { stepwise_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "blocked_paths"] }
  
  stepwise_blocked_percentage <- c()
  for (i in 1:num_computed_s7) { stepwise_blocked_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "blocked_paths"] / total_confounders[i] }
  
  stepwise_X_blocked <- c()
  for (i in 1:num_computed_s7) { stepwise_X_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }
  
  stepwise_X_blocked_percentage <- c()
  for (i in 1:num_computed_s7) { stepwise_X_blocked_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_blocked <- c()
  for (i in 1:num_computed_s7) { lasso_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }
  
  lasso_blocked_percentage <- c()
  for (i in 1:num_computed_s7) { lasso_blocked_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] / total_confounders[i] }
  
  lasso_X_blocked <- c()
  for (i in 1:num_computed_s7) { lasso_X_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }
  
  lasso_X_blocked_percentage <- c()
  for (i in 1:num_computed_s7) { lasso_X_blocked_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_union_blocked <- c()
  for (i in 1:num_computed_s7) { lasso_union_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }
  
  lasso_union_blocked_percentage <- c()
  for (i in 1:num_computed_s7) { lasso_union_blocked_percentage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] / total_confounders[i] }
  
  scenario_7_backdoor_pathway_table <- data.frame(measured_confounders,
                                                  unmeasured_confounders,
                                                  open_paths,
                                                  linear_full_blocked,
                                                  linear_full_blocked_percentage,
                                                  stepwise_blocked,
                                                  stepwise_blocked_percentage,
                                                  stepwise_X_blocked,
                                                  stepwise_X_blocked_percentage,
                                                  lasso_blocked,
                                                  lasso_blocked_percentage,
                                                  lasso_X_blocked,
                                                  lasso_X_blocked_percentage,
                                                  lasso_union_blocked,
                                                  lasso_union_blocked_percentage)
  
  print(scenario_7_backdoor_pathway_table)
  
  
  # coefficients and SEs table
  
  true_coefficients <- c()
  for (i in 1:num_computed_s7) { true_coefficients[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods
  
  linear_full_mean_coef <- c()
  for (i in 1:num_computed_s7) { linear_full_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "causal_estimate"] }
  
  linear_full_emp_se <- c()
  for (i in 1:num_computed_s7) { linear_full_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "emp_SE"] }
  
  linear_full_model_se <- c()
  for (i in 1:num_computed_s7) { linear_full_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "model_SE"] }
  
  stepwise_mean_coef <- c()
  for (i in 1:num_computed_s7) { stepwise_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "causal_estimate"] }
  
  stepwise_emp_se <- c()
  for (i in 1:num_computed_s7) { stepwise_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "emp_SE"] }
  
  stepwise_model_se <- c()
  for (i in 1:num_computed_s7) { stepwise_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "model_SE"] }
  
  stepwise_X_mean_coef <- c()
  for (i in 1:num_computed_s7) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }
  
  stepwise_X_emp_se <- c()
  for (i in 1:num_computed_s7) { stepwise_X_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "emp_SE"] }
  
  stepwise_X_model_se <- c()
  for (i in 1:num_computed_s7) { stepwise_X_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "model_SE"] }
  
  lasso_mean_coef <- c()
  for (i in 1:num_computed_s7) { lasso_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }
  
  lasso_emp_se <- c()
  for (i in 1:num_computed_s7) { lasso_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }
  
  lasso_model_se <- c()
  for (i in 1:num_computed_s7) { lasso_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "model_SE"] }
  
  lasso_X_mean_coef <- c()
  for (i in 1:num_computed_s7) { lasso_X_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }
  
  lasso_X_emp_se <- c()
  for (i in 1:num_computed_s7) { lasso_X_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }
  
  lasso_X_model_se <- c()
  for (i in 1:num_computed_s7) { lasso_X_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }
  
  lasso_union_mean_coef <- c()
  for (i in 1:num_computed_s7) { lasso_union_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }
  
  lasso_union_emp_se <- c()
  for (i in 1:num_computed_s7) { lasso_union_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }
  
  lasso_union_model_se <- c()
  for (i in 1:num_computed_s7) { lasso_union_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }
  
  scenario_7_standard_error_first_half_table <- data.frame(measured_confounders,
                                                           unmeasured_confounders,
                                                           true_coefficients,
                                                           linear_full_mean_coef,
                                                           linear_full_emp_se,
                                                           linear_full_model_se,
                                                           stepwise_mean_coef,
                                                           stepwise_emp_se,
                                                           stepwise_model_se,
                                                           stepwise_X_mean_coef,
                                                           stepwise_X_emp_se,
                                                           stepwise_X_model_se)
  
  scenario_7_standard_error_second_half_table <- data.frame(measured_confounders,
                                                            unmeasured_confounders,
                                                            true_coefficients,
                                                            lasso_mean_coef,
                                                            lasso_emp_se,
                                                            lasso_model_se,
                                                            lasso_X_mean_coef,
                                                            lasso_X_emp_se,
                                                            lasso_X_model_se,
                                                            lasso_union_mean_coef,
                                                            lasso_union_emp_se,
                                                            lasso_union_model_se)
  
  print(scenario_7_standard_error_first_half_table)
  print(scenario_7_standard_error_second_half_table)
  
  
  
  # ----- Generate Scenario 8 Tables -----
  
  # allows us to be flexible as things finish on HPC at different times
  measured_confounders   <- c(16, 12, 32, 24, 64, 48, 128,  96)
  unmeasured_confounders <- c( 0,  4,  0,  8,  0, 16,   0,  32)
  total_confounders      <- c(16, 16, 32, 32, 64, 64, 128, 128)
  
  measured_confounders   <- measured_confounders[1:num_computed_s8]
  unmeasured_confounders <- unmeasured_confounders[1:num_computed_s8]
  true_coefficients      <- true_coefficients[1:num_computed_s8]
  
  
  # causal effect estimation table
  
  linear_full_bias  <- c()
  for (i in 1:num_computed_s8) { linear_full_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "causal_bias"] }
  
  linear_full_bias_percentage <- c()
  for (i in 1:num_computed_s8) { linear_full_bias_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "causal_bias"] / true_causal_effect }
  
  linear_full_coverage <- c()
  for (i in 1:num_computed_s8) { linear_full_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "causal_coverage"] }
  
  stepwise_bias <- c()
  for (i in 1:num_computed_s8) { stepwise_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "causal_bias"] }
  
  stepwise_bias_percentage <- c()
  for (i in 1:num_computed_s8) { stepwise_bias_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "causal_bias"] / true_causal_effect }
  
  stepwise_coverage <- c()
  for (i in 1:num_computed_s8) { stepwise_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "causal_coverage"] }
  
  stepwise_X_bias <- c()
  for (i in 1:num_computed_s8) { stepwise_X_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "causal_bias"] }
  
  stepwise_X_bias_percentage <- c()
  for (i in 1:num_computed_s8) { stepwise_X_bias_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "causal_bias"] / true_causal_effect }
  
  stepwise_X_coverage <- c()
  for (i in 1:num_computed_s8) { stepwise_X_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }
  
  lasso_bias <- c()
  for (i in 1:num_computed_s8) { lasso_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }
  
  lasso_bias_percentage <- c()
  for (i in 1:num_computed_s8) { lasso_bias_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "causal_bias"] / true_causal_effect }
  
  lasso_coverage <- c()
  for (i in 1:num_computed_s8) { lasso_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }
  
  lasso_X_bias <- c()
  for (i in 1:num_computed_s8) { lasso_X_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }
  
  lasso_X_bias_percentage <- c()
  for (i in 1:num_computed_s8) { lasso_X_bias_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] / true_causal_effect }
  
  lasso_X_coverage <- c()
  for (i in 1:num_computed_s8) { lasso_X_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }
  
  lasso_union_bias <- c()
  for (i in 1:num_computed_s8) { lasso_union_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }
  
  lasso_union_bias_percentage <- c()
  for (i in 1:num_computed_s8) { lasso_union_bias_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] / true_causal_effect }
  
  lasso_union_coverage <- c()
  for (i in 1:num_computed_s8) { lasso_union_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }
  
  scenario_8_causal_estimation_table <- data.frame(measured_confounders,
                                                   unmeasured_confounders,
                                                   linear_full_bias,
                                                   linear_full_bias_percentage,
                                                   linear_full_coverage,
                                                   stepwise_bias,
                                                   stepwise_bias_percentage,
                                                   stepwise_coverage,
                                                   stepwise_X_bias,
                                                   stepwise_X_bias_percentage,
                                                   stepwise_X_coverage,
                                                   lasso_bias,
                                                   lasso_bias_percentage,
                                                   lasso_coverage,
                                                   lasso_X_bias,
                                                   lasso_X_bias_percentage,
                                                   lasso_X_coverage,
                                                   lasso_union_bias,
                                                   lasso_union_bias_percentage,
                                                   lasso_union_coverage)
  
  print(scenario_8_causal_estimation_table)
  
  
  # backdoor pathway table
  
  open_paths <- total_confounders
  open_paths <- open_paths[1:num_computed_s8]
  
  linear_full_blocked <- c()
  for (i in 1:num_computed_s8) { linear_full_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "blocked_paths"] }
  
  linear_full_blocked_percentage <- c()
  for (i in 1:num_computed_s8) { linear_full_blocked_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "blocked_paths"] / total_confounders[i] }
  
  stepwise_blocked <- c()
  for (i in 1:num_computed_s8) { stepwise_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "blocked_paths"] }
  
  stepwise_blocked_percentage <- c()
  for (i in 1:num_computed_s8) { stepwise_blocked_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "blocked_paths"] / total_confounders[i] }
  
  stepwise_X_blocked <- c()
  for (i in 1:num_computed_s8) { stepwise_X_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }
  
  stepwise_X_blocked_percentage <- c()
  for (i in 1:num_computed_s8) { stepwise_X_blocked_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_blocked <- c()
  for (i in 1:num_computed_s8) { lasso_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }
  
  lasso_blocked_percentage <- c()
  for (i in 1:num_computed_s8) { lasso_blocked_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] / total_confounders[i] }
  
  lasso_X_blocked <- c()
  for (i in 1:num_computed_s8) { lasso_X_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }
  
  lasso_X_blocked_percentage <- c()
  for (i in 1:num_computed_s8) { lasso_X_blocked_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_union_blocked <- c()
  for (i in 1:num_computed_s8) { lasso_union_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }
  
  lasso_union_blocked_percentage <- c()
  for (i in 1:num_computed_s8) { lasso_union_blocked_percentage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] / total_confounders[i] }
  
  scenario_8_backdoor_pathway_table <- data.frame(measured_confounders,
                                                  unmeasured_confounders,
                                                  open_paths,
                                                  linear_full_blocked,
                                                  linear_full_blocked_percentage,
                                                  stepwise_blocked,
                                                  stepwise_blocked_percentage,
                                                  stepwise_X_blocked,
                                                  stepwise_X_blocked_percentage,
                                                  lasso_blocked,
                                                  lasso_blocked_percentage,
                                                  lasso_X_blocked,
                                                  lasso_X_blocked_percentage,
                                                  lasso_union_blocked,
                                                  lasso_union_blocked_percentage)
  
  print(scenario_8_backdoor_pathway_table)
  
  
  # coefficients and SEs table
  
  true_coefficients <- c()
  for (i in 1:num_computed_s8) { true_coefficients[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods
  
  linear_full_mean_coef <- c()
  for (i in 1:num_computed_s8) { linear_full_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "causal_estimate"] }
  
  linear_full_emp_se <- c()
  for (i in 1:num_computed_s8) { linear_full_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "emp_SE"] }
  
  linear_full_model_se <- c()
  for (i in 1:num_computed_s8) { linear_full_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "model_SE"] }
  
  stepwise_mean_coef <- c()
  for (i in 1:num_computed_s8) { stepwise_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "causal_estimate"] }
  
  stepwise_emp_se <- c()
  for (i in 1:num_computed_s8) { stepwise_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "emp_SE"] }
  
  stepwise_model_se <- c()
  for (i in 1:num_computed_s8) { stepwise_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "model_SE"] }
  
  stepwise_X_mean_coef <- c()
  for (i in 1:num_computed_s8) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }
  
  stepwise_X_emp_se <- c()
  for (i in 1:num_computed_s8) { stepwise_X_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "emp_SE"] }
  
  stepwise_X_model_se <- c()
  for (i in 1:num_computed_s8) { stepwise_X_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "model_SE"] }
  
  lasso_mean_coef <- c()
  for (i in 1:num_computed_s8) { lasso_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }
  
  lasso_emp_se <- c()
  for (i in 1:num_computed_s8) { lasso_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }
  
  lasso_model_se <- c()
  for (i in 1:num_computed_s8) { lasso_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "model_SE"] }
  
  lasso_X_mean_coef <- c()
  for (i in 1:num_computed_s8) { lasso_X_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }
  
  lasso_X_emp_se <- c()
  for (i in 1:num_computed_s8) { lasso_X_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }
  
  lasso_X_model_se <- c()
  for (i in 1:num_computed_s8) { lasso_X_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }
  
  lasso_union_mean_coef <- c()
  for (i in 1:num_computed_s8) { lasso_union_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }
  
  lasso_union_emp_se <- c()
  for (i in 1:num_computed_s8) { lasso_union_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }
  
  lasso_union_model_se <- c()
  for (i in 1:num_computed_s8) { lasso_union_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }
  
  scenario_8_standard_error_first_half_table <- data.frame(measured_confounders,
                                                           unmeasured_confounders,
                                                           true_coefficients,
                                                           linear_full_mean_coef,
                                                           linear_full_emp_se,
                                                           linear_full_model_se,
                                                           stepwise_mean_coef,
                                                           stepwise_emp_se,
                                                           stepwise_model_se,
                                                           stepwise_X_mean_coef,
                                                           stepwise_X_emp_se,
                                                           stepwise_X_model_se)
  
  scenario_8_standard_error_second_half_table <- data.frame(measured_confounders,
                                                            unmeasured_confounders,
                                                            true_coefficients,
                                                            lasso_mean_coef,
                                                            lasso_emp_se,
                                                            lasso_model_se,
                                                            lasso_X_mean_coef,
                                                            lasso_X_emp_se,
                                                            lasso_X_model_se,
                                                            lasso_union_mean_coef,
                                                            lasso_union_emp_se,
                                                            lasso_union_model_se)
  
  print(scenario_8_standard_error_first_half_table)
  print(scenario_8_standard_error_second_half_table)
  
  
  
  # ----- Generate Scenario 9 Tables -----
  
  # allows us to be flexible as things finish on HPC at different times
  measured_confounders   <- c(16, 12, 32, 24, 64, 48, 128,  96)
  unmeasured_confounders <- c( 0,  4,  0,  8,  0, 16,   0,  32)
  total_confounders      <- c(16, 16, 32, 32, 64, 64, 128, 128)
  
  measured_confounders   <- measured_confounders[1:num_computed_s9]
  unmeasured_confounders <- unmeasured_confounders[1:num_computed_s9]
  true_coefficients      <- true_coefficients[1:num_computed_s9]
  
  
  # causal effect estimation table
  
  linear_full_bias  <- c()
  for (i in 1:num_computed_s9) { linear_full_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "causal_bias"] }
  
  linear_full_bias_percentage <- c()
  for (i in 1:num_computed_s9) { linear_full_bias_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "causal_bias"] / true_causal_effect }
  
  linear_full_coverage <- c()
  for (i in 1:num_computed_s9) { linear_full_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "causal_coverage"] }
  
  stepwise_bias <- c()
  for (i in 1:num_computed_s9) { stepwise_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "causal_bias"] }
  
  stepwise_bias_percentage <- c()
  for (i in 1:num_computed_s9) { stepwise_bias_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "causal_bias"] / true_causal_effect }
  
  stepwise_coverage <- c()
  for (i in 1:num_computed_s9) { stepwise_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "causal_coverage"] }
  
  stepwise_X_bias <- c()
  for (i in 1:num_computed_s9) { stepwise_X_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "causal_bias"] }
  
  stepwise_X_bias_percentage <- c()
  for (i in 1:num_computed_s9) { stepwise_X_bias_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "causal_bias"] / true_causal_effect }
  
  stepwise_X_coverage <- c()
  for (i in 1:num_computed_s9) { stepwise_X_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }
  
  lasso_bias <- c()
  for (i in 1:num_computed_s9) { lasso_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }
  
  lasso_bias_percentage <- c()
  for (i in 1:num_computed_s9) { lasso_bias_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "causal_bias"] / true_causal_effect }
  
  lasso_coverage <- c()
  for (i in 1:num_computed_s9) { lasso_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }
  
  lasso_X_bias <- c()
  for (i in 1:num_computed_s9) { lasso_X_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }
  
  lasso_X_bias_percentage <- c()
  for (i in 1:num_computed_s9) { lasso_X_bias_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] / true_causal_effect }
  
  lasso_X_coverage <- c()
  for (i in 1:num_computed_s9) { lasso_X_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }
  
  lasso_union_bias <- c()
  for (i in 1:num_computed_s9) { lasso_union_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }
  
  lasso_union_bias_percentage <- c()
  for (i in 1:num_computed_s9) { lasso_union_bias_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] / true_causal_effect }
  
  lasso_union_coverage <- c()
  for (i in 1:num_computed_s9) { lasso_union_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }
  
  scenario_9_causal_estimation_table <- data.frame(measured_confounders,
                                                   unmeasured_confounders,
                                                   linear_full_bias,
                                                   linear_full_bias_percentage,
                                                   linear_full_coverage,
                                                   stepwise_bias,
                                                   stepwise_bias_percentage,
                                                   stepwise_coverage,
                                                   stepwise_X_bias,
                                                   stepwise_X_bias_percentage,
                                                   stepwise_X_coverage,
                                                   lasso_bias,
                                                   lasso_bias_percentage,
                                                   lasso_coverage,
                                                   lasso_X_bias,
                                                   lasso_X_bias_percentage,
                                                   lasso_X_coverage,
                                                   lasso_union_bias,
                                                   lasso_union_bias_percentage,
                                                   lasso_union_coverage)
  
  print(scenario_9_causal_estimation_table)
  
  
  # backdoor pathway table
  
  open_paths <- total_confounders
  open_paths <- open_paths[1:num_computed_s9]
  
  linear_full_blocked <- c()
  for (i in 1:num_computed_s9) { linear_full_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "blocked_paths"] }
  
  linear_full_blocked_percentage <- c()
  for (i in 1:num_computed_s9) { linear_full_blocked_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "blocked_paths"] / total_confounders[i] }
  
  stepwise_blocked <- c()
  for (i in 1:num_computed_s9) { stepwise_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "blocked_paths"] }
  
  stepwise_blocked_percentage <- c()
  for (i in 1:num_computed_s9) { stepwise_blocked_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "blocked_paths"] / total_confounders[i] }
  
  stepwise_X_blocked <- c()
  for (i in 1:num_computed_s9) { stepwise_X_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }
  
  stepwise_X_blocked_percentage <- c()
  for (i in 1:num_computed_s9) { stepwise_X_blocked_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_blocked <- c()
  for (i in 1:num_computed_s9) { lasso_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }
  
  lasso_blocked_percentage <- c()
  for (i in 1:num_computed_s9) { lasso_blocked_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] / total_confounders[i] }
  
  lasso_X_blocked <- c()
  for (i in 1:num_computed_s9) { lasso_X_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }
  
  lasso_X_blocked_percentage <- c()
  for (i in 1:num_computed_s9) { lasso_X_blocked_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] / total_confounders[i] }
  
  lasso_union_blocked <- c()
  for (i in 1:num_computed_s9) { lasso_union_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }
  
  lasso_union_blocked_percentage <- c()
  for (i in 1:num_computed_s9) { lasso_union_blocked_percentage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] / total_confounders[i] }
  
  scenario_9_backdoor_pathway_table <- data.frame(measured_confounders,
                                                  unmeasured_confounders,
                                                  open_paths,
                                                  linear_full_blocked,
                                                  linear_full_blocked_percentage,
                                                  stepwise_blocked,
                                                  stepwise_blocked_percentage,
                                                  stepwise_X_blocked,
                                                  stepwise_X_blocked_percentage,
                                                  lasso_blocked,
                                                  lasso_blocked_percentage,
                                                  lasso_X_blocked,
                                                  lasso_X_blocked_percentage,
                                                  lasso_union_blocked,
                                                  lasso_union_blocked_percentage)
  
  print(scenario_9_backdoor_pathway_table)
  
  
  # coefficients and SEs table
  
  true_coefficients <- c()
  for (i in 1:num_computed_s9) { true_coefficients[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods
  
  linear_full_mean_coef <- c()
  for (i in 1:num_computed_s9) { linear_full_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "causal_estimate"] }
  
  linear_full_emp_se <- c()
  for (i in 1:num_computed_s9) { linear_full_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "emp_SE"] }
  
  linear_full_model_se <- c()
  for (i in 1:num_computed_s9) { linear_full_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "model_SE"] }
  
  stepwise_mean_coef <- c()
  for (i in 1:num_computed_s9) { stepwise_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "causal_estimate"] }
  
  stepwise_emp_se <- c()
  for (i in 1:num_computed_s9) { stepwise_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "emp_SE"] }
  
  stepwise_model_se <- c()
  for (i in 1:num_computed_s9) { stepwise_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "model_SE"] }
  
  stepwise_X_mean_coef <- c()
  for (i in 1:num_computed_s9) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }
  
  stepwise_X_emp_se <- c()
  for (i in 1:num_computed_s9) { stepwise_X_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "emp_SE"] }
  
  stepwise_X_model_se <- c()
  for (i in 1:num_computed_s9) { stepwise_X_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "model_SE"] }
  
  lasso_mean_coef <- c()
  for (i in 1:num_computed_s9) { lasso_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }
  
  lasso_emp_se <- c()
  for (i in 1:num_computed_s9) { lasso_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }
  
  lasso_model_se <- c()
  for (i in 1:num_computed_s9) { lasso_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "model_SE"] }
  
  lasso_X_mean_coef <- c()
  for (i in 1:num_computed_s9) { lasso_X_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }
  
  lasso_X_emp_se <- c()
  for (i in 1:num_computed_s9) { lasso_X_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }
  
  lasso_X_model_se <- c()
  for (i in 1:num_computed_s9) { lasso_X_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }
  
  lasso_union_mean_coef <- c()
  for (i in 1:num_computed_s9) { lasso_union_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }
  
  lasso_union_emp_se <- c()
  for (i in 1:num_computed_s9) { lasso_union_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }
  
  lasso_union_model_se <- c()
  for (i in 1:num_computed_s9) { lasso_union_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }
  
  scenario_9_standard_error_first_half_table <- data.frame(measured_confounders,
                                                           unmeasured_confounders,
                                                           true_coefficients,
                                                           linear_full_mean_coef,
                                                           linear_full_emp_se,
                                                           linear_full_model_se,
                                                           stepwise_mean_coef,
                                                           stepwise_emp_se,
                                                           stepwise_model_se,
                                                           stepwise_X_mean_coef,
                                                           stepwise_X_emp_se,
                                                           stepwise_X_model_se)
  
  scenario_9_standard_error_second_half_table <- data.frame(measured_confounders,
                                                            unmeasured_confounders,
                                                            true_coefficients,
                                                            lasso_mean_coef,
                                                            lasso_emp_se,
                                                            lasso_model_se,
                                                            lasso_X_mean_coef,
                                                            lasso_X_emp_se,
                                                            lasso_X_model_se,
                                                            lasso_union_mean_coef,
                                                            lasso_union_emp_se,
                                                            lasso_union_model_se)
  
  print(scenario_9_standard_error_first_half_table)
  print(scenario_9_standard_error_second_half_table)
  
  
  
  # ----- Rounding to 3 s.f. -----
  
  scenario_1_causal_estimation_table          <- signif(scenario_1_causal_estimation_table, digits = 3)
  scenario_1_backdoor_pathway_table           <- signif(scenario_1_backdoor_pathway_table, digits = 3)
  scenario_1_standard_error_first_half_table  <- signif(scenario_1_standard_error_first_half_table, digits = 3)
  scenario_1_standard_error_second_half_table <- signif(scenario_1_standard_error_second_half_table, digits = 3)
  
  scenario_2_causal_estimation_table          <- signif(scenario_2_causal_estimation_table, digits = 3)
  scenario_2_backdoor_pathway_table           <- signif(scenario_2_backdoor_pathway_table, digits = 3)
  scenario_2_standard_error_first_half_table  <- signif(scenario_2_standard_error_first_half_table, digits = 3)
  scenario_2_standard_error_second_half_table <- signif(scenario_2_standard_error_second_half_table, digits = 3)
  
  scenario_3_causal_estimation_table          <- signif(scenario_3_causal_estimation_table, digits = 3)
  scenario_3_backdoor_pathway_table           <- signif(scenario_3_backdoor_pathway_table, digits = 3)
  scenario_3_standard_error_first_half_table  <- signif(scenario_3_standard_error_first_half_table, digits = 3)
  scenario_3_standard_error_second_half_table <- signif(scenario_3_standard_error_second_half_table, digits = 3)
  
  scenario_4_causal_estimation_table          <- signif(scenario_4_causal_estimation_table, digits = 3)
  scenario_4_backdoor_pathway_table           <- signif(scenario_4_backdoor_pathway_table, digits = 3)
  scenario_4_standard_error_first_half_table  <- signif(scenario_4_standard_error_first_half_table, digits = 3)
  scenario_4_standard_error_second_half_table <- signif(scenario_4_standard_error_second_half_table, digits = 3)
  
  scenario_5_causal_estimation_table          <- signif(scenario_5_causal_estimation_table, digits = 3)
  scenario_5_backdoor_pathway_table           <- signif(scenario_5_backdoor_pathway_table, digits = 3)
  scenario_5_standard_error_first_half_table  <- signif(scenario_5_standard_error_first_half_table, digits = 3)
  scenario_5_standard_error_second_half_table <- signif(scenario_5_standard_error_second_half_table, digits = 3)
  
  scenario_6_causal_estimation_table          <- signif(scenario_6_causal_estimation_table, digits = 3)
  scenario_6_backdoor_pathway_table           <- signif(scenario_6_backdoor_pathway_table, digits = 3)
  scenario_6_standard_error_first_half_table  <- signif(scenario_6_standard_error_first_half_table, digits = 3)
  scenario_6_standard_error_second_half_table <- signif(scenario_6_standard_error_second_half_table, digits = 3)
  
  scenario_7_causal_estimation_table          <- signif(scenario_7_causal_estimation_table, digits = 3)
  scenario_7_backdoor_pathway_table           <- signif(scenario_7_backdoor_pathway_table, digits = 3)
  scenario_7_standard_error_first_half_table  <- signif(scenario_7_standard_error_first_half_table, digits = 3)
  scenario_7_standard_error_second_half_table <- signif(scenario_7_standard_error_second_half_table, digits = 3)
  
  scenario_8_causal_estimation_table          <- signif(scenario_8_causal_estimation_table, digits = 3)
  scenario_8_backdoor_pathway_table           <- signif(scenario_8_backdoor_pathway_table, digits = 3)
  scenario_8_standard_error_first_half_table  <- signif(scenario_8_standard_error_first_half_table, digits = 3)
  scenario_8_standard_error_second_half_table <- signif(scenario_8_standard_error_second_half_table, digits = 3)
  
  scenario_9_causal_estimation_table          <- signif(scenario_9_causal_estimation_table, digits = 3)
  scenario_9_backdoor_pathway_table           <- signif(scenario_9_backdoor_pathway_table, digits = 3)
  scenario_9_standard_error_first_half_table  <- signif(scenario_9_standard_error_first_half_table, digits = 3)
  scenario_9_standard_error_second_half_table <- signif(scenario_9_standard_error_second_half_table, digits = 3)
  
  
  
  # ----- Export and save data -----
  
  write.csv(scenario_1_causal_estimation_table,          paste0("temp/scenario_1_", step_string, "_causal_estimation_table.csv"),          row.names = FALSE)
  write.csv(scenario_1_backdoor_pathway_table,           paste0("temp/scenario_1_", step_string, "_backdoor_pathway_table.csv"),           row.names = FALSE)
  write.csv(scenario_1_standard_error_first_half_table,  paste0("temp/scenario_1_", step_string, "_standard_error_first_half_table.csv"),  row.names = FALSE)
  write.csv(scenario_1_standard_error_second_half_table, paste0("temp/scenario_1_", step_string, "_standard_error_second_half_table.csv"), row.names = FALSE)
  
  write.csv(scenario_2_causal_estimation_table,          paste0("temp/scenario_2_", step_string, "_causal_estimation_table.csv"),          row.names = FALSE)
  write.csv(scenario_2_backdoor_pathway_table,           paste0("temp/scenario_2_", step_string, "_backdoor_pathway_table.csv"),           row.names = FALSE)
  write.csv(scenario_2_standard_error_first_half_table,  paste0("temp/scenario_2_", step_string, "_standard_error_first_half_table.csv"),  row.names = FALSE)
  write.csv(scenario_2_standard_error_second_half_table, paste0("temp/scenario_2_", step_string, "_standard_error_second_half_table.csv"), row.names = FALSE)
  
  write.csv(scenario_3_causal_estimation_table,          paste0("temp/scenario_3_", step_string, "_causal_estimation_table.csv"),          row.names = FALSE)
  write.csv(scenario_3_backdoor_pathway_table,           paste0("temp/scenario_3_", step_string, "_backdoor_pathway_table.csv"),           row.names = FALSE)
  write.csv(scenario_3_standard_error_first_half_table,  paste0("temp/scenario_3_", step_string, "_standard_error_first_half_table.csv"),  row.names = FALSE)
  write.csv(scenario_3_standard_error_second_half_table, paste0("temp/scenario_3_", step_string, "_standard_error_second_half_table.csv"), row.names = FALSE)
  
  write.csv(scenario_4_causal_estimation_table,          paste0("temp/scenario_4_", step_string, "_causal_estimation_table.csv"),          row.names = FALSE)
  write.csv(scenario_4_backdoor_pathway_table,           paste0("temp/scenario_4_", step_string, "_backdoor_pathway_table.csv"),           row.names = FALSE)
  write.csv(scenario_4_standard_error_first_half_table,  paste0("temp/scenario_4_", step_string, "_standard_error_first_half_table.csv"),  row.names = FALSE)
  write.csv(scenario_4_standard_error_second_half_table, paste0("temp/scenario_4_", step_string, "_standard_error_second_half_table.csv"), row.names = FALSE)
  
  write.csv(scenario_5_causal_estimation_table,          paste0("temp/scenario_5_", step_string, "_causal_estimation_table.csv"),          row.names = FALSE)
  write.csv(scenario_5_backdoor_pathway_table,           paste0("temp/scenario_5_", step_string, "_backdoor_pathway_table.csv"),           row.names = FALSE)
  write.csv(scenario_5_standard_error_first_half_table,  paste0("temp/scenario_5_", step_string, "_standard_error_first_half_table.csv"),  row.names = FALSE)
  write.csv(scenario_5_standard_error_second_half_table, paste0("temp/scenario_5_", step_string, "_standard_error_second_half_table.csv"), row.names = FALSE)
  
  write.csv(scenario_6_causal_estimation_table,          paste0("temp/scenario_6_", step_string, "_causal_estimation_table.csv"),          row.names = FALSE)
  write.csv(scenario_6_backdoor_pathway_table,           paste0("temp/scenario_6_", step_string, "_backdoor_pathway_table.csv"),           row.names = FALSE)
  write.csv(scenario_6_standard_error_first_half_table,  paste0("temp/scenario_6_", step_string, "_standard_error_first_half_table.csv"),  row.names = FALSE)
  write.csv(scenario_6_standard_error_second_half_table, paste0("temp/scenario_6_", step_string, "_standard_error_second_half_table.csv"), row.names = FALSE)
  
  write.csv(scenario_7_causal_estimation_table,          paste0("temp/scenario_7_", step_string, "_causal_estimation_table.csv"),          row.names = FALSE)
  write.csv(scenario_7_backdoor_pathway_table,           paste0("temp/scenario_7_", step_string, "_backdoor_pathway_table.csv"),           row.names = FALSE)
  write.csv(scenario_7_standard_error_first_half_table,  paste0("temp/scenario_7_", step_string, "_standard_error_first_half_table.csv"),  row.names = FALSE)
  write.csv(scenario_7_standard_error_second_half_table, paste0("temp/scenario_7_", step_string, "_standard_error_second_half_table.csv"), row.names = FALSE)
  
  write.csv(scenario_8_causal_estimation_table,          paste0("temp/scenario_8_", step_string, "_causal_estimation_table.csv"),          row.names = FALSE)
  write.csv(scenario_8_backdoor_pathway_table,           paste0("temp/scenario_8_", step_string, "_backdoor_pathway_table.csv"),           row.names = FALSE)
  write.csv(scenario_8_standard_error_first_half_table,  paste0("temp/scenario_8_", step_string, "_standard_error_first_half_table.csv"),  row.names = FALSE)
  write.csv(scenario_8_standard_error_second_half_table, paste0("temp/scenario_8_", step_string, "_standard_error_second_half_table.csv"), row.names = FALSE)
  
  write.csv(scenario_9_causal_estimation_table,          paste0("temp/scenario_9_", step_string, "_causal_estimation_table.csv"),          row.names = FALSE)
  write.csv(scenario_9_backdoor_pathway_table,           paste0("temp/scenario_9_", step_string, "_backdoor_pathway_table.csv"),           row.names = FALSE)
  write.csv(scenario_9_standard_error_first_half_table,  paste0("temp/scenario_9_", step_string, "_standard_error_first_half_table.csv"),  row.names = FALSE)
  write.csv(scenario_9_standard_error_second_half_table, paste0("temp/scenario_9_", step_string, "_standard_error_second_half_table.csv"), row.names = FALSE)

}




