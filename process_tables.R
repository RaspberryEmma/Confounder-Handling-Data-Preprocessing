# ****************************************
# Confounder Handling Simulation Study
#
# Process tables
# Generates more readable summaries of data tables from the simulation
# Make the final CSV's ready for conversion to .tex by tably
#
# Emma Tarmey
#
# Started:          14/03/2024
# Most Recent Edit: 18/03/2024
# ****************************************



# ----- Setup -----

# clear R memory
rm(list=ls())

# fix wd issue
# forces wd to be the location of this file
if (Sys.getenv("RSTUDIO") == "1") {
  setwd(dirname(rstudioapi::getSourceEditorContext()$path))
}



# ----- Import data -----

measured_confounders   <- c(16, 12, 32, 24, 64, 48, 128,  96)
unmeasured_confounders <- c( 0,  4,  0,  8,  0, 16,   0,  32)
total_confounders      <- c(16, 16, 32, 32, 64, 64, 128, 128)

scenario_1_confset_1_data <- read.csv("data/sim_run_1_scenario_1_results.csv", row.names = 1)
scenario_1_confset_2_data <- read.csv("data/sim_run_1_scenario_2_results.csv", row.names = 1)
scenario_1_confset_3_data <- read.csv("data/sim_run_1_scenario_3_results.csv", row.names = 1)
scenario_1_confset_4_data <- read.csv("data/sim_run_1_scenario_4_results.csv", row.names = 1)
scenario_1_confset_5_data <- read.csv("data/sim_run_1_scenario_5_results.csv", row.names = 1)
scenario_1_confset_6_data <- read.csv("data/sim_run_1_scenario_6_results.csv", row.names = 1)
scenario_1_confset_7_data <- read.csv("data/sim_run_1_scenario_7_results.csv", row.names = 1)
scenario_1_confset_8_data <- read.csv("data/sim_run_1_scenario_8_results.csv", row.names = 1)

scenario_2_confset_1_data <- read.csv("data/sim_run_2_scenario_1_results.csv", row.names = 1)
scenario_2_confset_2_data <- read.csv("data/sim_run_2_scenario_2_results.csv", row.names = 1)
scenario_2_confset_3_data <- read.csv("data/sim_run_2_scenario_3_results.csv", row.names = 1)
scenario_2_confset_4_data <- read.csv("data/sim_run_2_scenario_4_results.csv", row.names = 1)
scenario_2_confset_5_data <- read.csv("data/sim_run_2_scenario_5_results.csv", row.names = 1)
scenario_2_confset_6_data <- read.csv("data/sim_run_2_scenario_6_results.csv", row.names = 1)
# scenario_2_confset_7_data <- read.csv("data/sim_run_2_scenario_7_results.csv", row.names = 1)
# scenario_2_confset_8_data <- read.csv("data/sim_run_2_scenario_8_results.csv", row.names = 1)

scenario_3_confset_1_data <- read.csv("data/sim_run_3_scenario_1_results.csv", row.names = 1)
scenario_3_confset_2_data <- read.csv("data/sim_run_3_scenario_2_results.csv", row.names = 1)
scenario_3_confset_3_data <- read.csv("data/sim_run_3_scenario_3_results.csv", row.names = 1)
scenario_3_confset_4_data <- read.csv("data/sim_run_3_scenario_4_results.csv", row.names = 1)
scenario_3_confset_5_data <- read.csv("data/sim_run_3_scenario_5_results.csv", row.names = 1)
scenario_3_confset_6_data <- read.csv("data/sim_run_3_scenario_6_results.csv", row.names = 1)
# scenario_3_confset_7_data <- read.csv("data/sim_run_3_scenario_7_results.csv", row.names = 1)
# scenario_3_confset_8_data <- read.csv("data/sim_run_3_scenario_8_results.csv", row.names = 1)

scenario_4_confset_1_data <- read.csv("data/sim_run_4_scenario_1_results.csv", row.names = 1)
scenario_4_confset_2_data <- read.csv("data/sim_run_4_scenario_2_results.csv", row.names = 1)
scenario_4_confset_3_data <- read.csv("data/sim_run_4_scenario_3_results.csv", row.names = 1)
scenario_4_confset_4_data <- read.csv("data/sim_run_4_scenario_4_results.csv", row.names = 1)
scenario_4_confset_5_data <- read.csv("data/sim_run_4_scenario_5_results.csv", row.names = 1)
scenario_4_confset_6_data <- read.csv("data/sim_run_4_scenario_6_results.csv", row.names = 1)
# scenario_4_confset_7_data <- read.csv("data/sim_run_4_scenario_7_results.csv", row.names = 1)
# scenario_4_confset_8_data <- read.csv("data/sim_run_4_scenario_8_results.csv", row.names = 1)

scenario_5_confset_1_data <- read.csv("data/sim_run_5_scenario_1_results.csv", row.names = 1)
scenario_5_confset_2_data <- read.csv("data/sim_run_5_scenario_2_results.csv", row.names = 1)
scenario_5_confset_3_data <- read.csv("data/sim_run_5_scenario_3_results.csv", row.names = 1)
scenario_5_confset_4_data <- read.csv("data/sim_run_5_scenario_4_results.csv", row.names = 1)
# scenario_5_confset_5_data <- read.csv("data/sim_run_5_scenario_5_results.csv", row.names = 1)
# scenario_5_confset_6_data <- read.csv("data/sim_run_5_scenario_6_results.csv", row.names = 1)
# scenario_5_confset_7_data <- read.csv("data/sim_run_5_scenario_7_results.csv", row.names = 1)
# scenario_5_confset_8_data <- read.csv("data/sim_run_5_scenario_8_results.csv", row.names = 1)

scenario_6_confset_1_data <- read.csv("data/sim_run_6_scenario_1_results.csv", row.names = 1)
scenario_6_confset_2_data <- read.csv("data/sim_run_6_scenario_2_results.csv", row.names = 1)
scenario_6_confset_3_data <- read.csv("data/sim_run_6_scenario_3_results.csv", row.names = 1)
scenario_6_confset_4_data <- read.csv("data/sim_run_6_scenario_4_results.csv", row.names = 1)
# scenario_6_confset_5_data <- read.csv("data/sim_run_6_scenario_5_results.csv", row.names = 1)
# scenario_6_confset_6_data <- read.csv("data/sim_run_6_scenario_6_results.csv", row.names = 1)
# scenario_6_confset_7_data <- read.csv("data/sim_run_6_scenario_7_results.csv", row.names = 1)
# scenario_6_confset_8_data <- read.csv("data/sim_run_6_scenario_8_results.csv", row.names = 1)

scenario_7_confset_1_data <- read.csv("data/sim_run_7_scenario_1_results.csv", row.names = 1)
scenario_7_confset_2_data <- read.csv("data/sim_run_7_scenario_2_results.csv", row.names = 1)
scenario_7_confset_3_data <- read.csv("data/sim_run_7_scenario_3_results.csv", row.names = 1)
scenario_7_confset_4_data <- read.csv("data/sim_run_7_scenario_4_results.csv", row.names = 1)
# scenario_7_confset_5_data <- read.csv("data/sim_run_7_scenario_5_results.csv", row.names = 1)
# scenario_7_confset_6_data <- read.csv("data/sim_run_7_scenario_6_results.csv", row.names = 1)
# scenario_7_confset_7_data <- read.csv("data/sim_run_7_scenario_7_results.csv", row.names = 1)
# scenario_7_confset_8_data <- read.csv("data/sim_run_7_scenario_8_results.csv", row.names = 1)

scenario_8_confset_1_data <- read.csv("data/sim_run_8_scenario_1_results.csv", row.names = 1)
scenario_8_confset_2_data <- read.csv("data/sim_run_8_scenario_2_results.csv", row.names = 1)
scenario_8_confset_3_data <- read.csv("data/sim_run_8_scenario_3_results.csv", row.names = 1)
scenario_8_confset_4_data <- read.csv("data/sim_run_8_scenario_4_results.csv", row.names = 1)
# scenario_8_confset_5_data <- read.csv("data/sim_run_8_scenario_5_results.csv", row.names = 1)
# scenario_8_confset_6_data <- read.csv("data/sim_run_8_scenario_6_results.csv", row.names = 1)
# scenario_8_confset_7_data <- read.csv("data/sim_run_8_scenario_7_results.csv", row.names = 1)
# scenario_8_confset_8_data <- read.csv("data/sim_run_8_scenario_8_results.csv", row.names = 1)

scenario_9_confset_1_data <- read.csv("data/sim_run_9_scenario_1_results.csv", row.names = 1)
scenario_9_confset_2_data <- read.csv("data/sim_run_9_scenario_2_results.csv", row.names = 1)
scenario_9_confset_3_data <- read.csv("data/sim_run_9_scenario_3_results.csv", row.names = 1)
scenario_9_confset_4_data <- read.csv("data/sim_run_9_scenario_4_results.csv", row.names = 1)
# scenario_9_confset_5_data <- read.csv("data/sim_run_9_scenario_5_results.csv", row.names = 1)
# scenario_9_confset_6_data <- read.csv("data/sim_run_9_scenario_6_results.csv", row.names = 1)
# scenario_9_confset_7_data <- read.csv("data/sim_run_9_scenario_7_results.csv", row.names = 1)
# scenario_9_confset_8_data <- read.csv("data/sim_run_9_scenario_8_results.csv", row.names = 1)

print(scenario_1_confset_1_data)
# i <- 1
# print( get( paste0( "scenario_1_confset_", i, "_data"))["linear", "causal_bias"] )
# stop("dev")



# ----- Generate Scenario 1 Tables -----


# causal effect estimation table

linear_full_bias  <- c()
for (i in 1:8) { linear_full_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "causal_bias"] }

linear_full_coverage <- c()
for (i in 1:8) { linear_full_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "causal_coverage"] }

stepwise_bias <- c()
for (i in 1:8) { stepwise_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "causal_bias"] }

stepwise_coverage <- c()
for (i in 1:8) { stepwise_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "causal_coverage"] }

stepwise_X_bias <- c()
for (i in 1:8) { stepwise_X_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "causal_bias"] }

stepwise_X_coverage <- c()
for (i in 1:8) { stepwise_X_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }

lasso_bias <- c()
for (i in 1:8) { lasso_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }

lasso_coverage <- c()
for (i in 1:8) { lasso_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }

lasso_X_bias <- c()
for (i in 1:8) { lasso_X_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }

lasso_X_coverage <- c()
for (i in 1:8) { lasso_X_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }

lasso_union_bias <- c()
for (i in 1:8) { lasso_union_bias[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }

lasso_union_coverage <- c()
for (i in 1:8) { lasso_union_coverage[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }

scenario_1_causal_estimation_table <- data.frame(measured_confounders,
                                                 unmeasured_confounders,
                                                 linear_full_bias,
                                                 linear_full_coverage,
                                                 stepwise_bias,
                                                 stepwise_coverage,
                                                 stepwise_X_bias,
                                                 stepwise_X_coverage,
                                                 lasso_bias,
                                                 lasso_coverage,
                                                 lasso_X_bias,
                                                 lasso_X_coverage,
                                                 lasso_union_bias,
                                                 lasso_union_coverage)

print(scenario_1_causal_estimation_table)


# backdoor pathway table

open_paths <- total_confounders

linear_full_blocked <- c()
for (i in 1:8) { linear_full_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "blocked_paths"] }

stepwise_blocked <- c()
for (i in 1:8) { stepwise_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "blocked_paths"] }

stepwise_X_blocked <- c()
for (i in 1:8) { stepwise_X_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }

lasso_blocked <- c()
for (i in 1:8) { lasso_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }

lasso_X_blocked <- c()
for (i in 1:8) { lasso_X_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }

lasso_union_blocked <- c()
for (i in 1:8) { lasso_union_blocked[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }

scenario_1_backdoor_pathway_table <- data.frame(measured_confounders,
                                                unmeasured_confounders,
                                                open_paths,
                                                linear_full_blocked,
                                                stepwise_blocked,
                                                stepwise_X_blocked,
                                                lasso_blocked,
                                                lasso_X_blocked,
                                                lasso_union_blocked)

print(scenario_1_backdoor_pathway_table)


# coefficients and SEs table

true_coefficients <- c()
for (i in 1:8) { true_coefficients[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods

linear_full_mean_coef <- c()
for (i in 1:8) { linear_full_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "causal_estimate"] }

linear_full_emp_se <- c()
for (i in 1:8) { linear_full_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "emp_SE"] }

linear_full_model_se <- c()
for (i in 1:8) { linear_full_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["linear", "model_SE"] }

stepwise_mean_coef <- c()
for (i in 1:8) { stepwise_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "causal_estimate"] }

stepwise_emp_se <- c()
for (i in 1:8) { stepwise_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "emp_SE"] }

stepwise_model_se <- c()
for (i in 1:8) { stepwise_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise", "model_SE"] }

stepwise_X_mean_coef <- c()
for (i in 1:8) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }

stepwise_X_emp_se <- c()
for (i in 1:8) { stepwise_X_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "emp_SE"] }

stepwise_X_model_se <- c()
for (i in 1:8) { stepwise_X_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["stepwise_X", "model_SE"] }

lasso_mean_coef <- c()
for (i in 1:8) { lasso_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }

lasso_emp_se <- c()
for (i in 1:8) { lasso_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }

lasso_model_se <- c()
for (i in 1:8) { lasso_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso", "model_SE"] }

lasso_X_mean_coef <- c()
for (i in 1:8) { lasso_X_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }

lasso_X_emp_se <- c()
for (i in 1:8) { lasso_X_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }

lasso_X_model_se <- c()
for (i in 1:8) { lasso_X_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }

lasso_union_mean_coef <- c()
for (i in 1:8) { lasso_union_mean_coef[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }

lasso_union_emp_se <- c()
for (i in 1:8) { lasso_union_emp_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }

lasso_union_model_se <- c()
for (i in 1:8) { lasso_union_model_se[i] <- get( paste0( "scenario_1_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }

scenario_1_standard_error_table <- data.frame(measured_confounders,
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
                                              stepwise_X_model_se,
                                              lasso_mean_coef,
                                              lasso_emp_se,
                                              lasso_model_se,
                                              lasso_X_mean_coef,
                                              lasso_X_emp_se,
                                              lasso_X_model_se,
                                              lasso_union_mean_coef,
                                              lasso_union_emp_se,
                                              lasso_union_model_se)

print(scenario_1_standard_error_table)



# ----- Generate Scenario 2 Tables -----

# allows us to be flexible as things finish on HPC at different times

num_computed <- 6
measured_confounders   <- measured_confounders[1:num_computed]
unmeasured_confounders <- unmeasured_confounders[1:num_computed]
true_coefficients      <- true_coefficients[1:num_computed]


# causal effect estimation table

linear_full_bias  <- c()
for (i in 1:num_computed) { linear_full_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "causal_bias"] }

linear_full_coverage <- c()
for (i in 1:num_computed) { linear_full_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "causal_coverage"] }

stepwise_bias <- c()
for (i in 1:num_computed) { stepwise_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "causal_bias"] }

stepwise_coverage <- c()
for (i in 1:num_computed) { stepwise_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "causal_coverage"] }

stepwise_X_bias <- c()
for (i in 1:num_computed) { stepwise_X_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "causal_bias"] }

stepwise_X_coverage <- c()
for (i in 1:num_computed) { stepwise_X_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }

lasso_bias <- c()
for (i in 1:num_computed) { lasso_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }

lasso_coverage <- c()
for (i in 1:num_computed) { lasso_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }

lasso_X_bias <- c()
for (i in 1:num_computed) { lasso_X_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }

lasso_X_coverage <- c()
for (i in 1:num_computed) { lasso_X_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }

lasso_union_bias <- c()
for (i in 1:num_computed) { lasso_union_bias[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }

lasso_union_coverage <- c()
for (i in 1:num_computed) { lasso_union_coverage[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }

scenario_2_causal_estimation_table <- data.frame(measured_confounders,
                                                 unmeasured_confounders,
                                                 linear_full_bias,
                                                 linear_full_coverage,
                                                 stepwise_bias,
                                                 stepwise_coverage,
                                                 stepwise_X_bias,
                                                 stepwise_X_coverage,
                                                 lasso_bias,
                                                 lasso_coverage,
                                                 lasso_X_bias,
                                                 lasso_X_coverage,
                                                 lasso_union_bias,
                                                 lasso_union_coverage)

print(scenario_2_causal_estimation_table)


# backdoor pathway table

open_paths <- total_confounders
open_paths <- open_paths[1:num_computed]

linear_full_blocked <- c()
for (i in 1:num_computed) { linear_full_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "blocked_paths"] }

stepwise_blocked <- c()
for (i in 1:num_computed) { stepwise_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "blocked_paths"] }

stepwise_X_blocked <- c()
for (i in 1:num_computed) { stepwise_X_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }

lasso_blocked <- c()
for (i in 1:num_computed) { lasso_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }

lasso_X_blocked <- c()
for (i in 1:num_computed) { lasso_X_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }

lasso_union_blocked <- c()
for (i in 1:num_computed) { lasso_union_blocked[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }

scenario_2_backdoor_pathway_table <- data.frame(measured_confounders,
                                                unmeasured_confounders,
                                                open_paths,
                                                linear_full_blocked,
                                                stepwise_blocked,
                                                stepwise_X_blocked,
                                                lasso_blocked,
                                                lasso_X_blocked,
                                                lasso_union_blocked)

print(scenario_2_backdoor_pathway_table)


# coefficients and SEs table

true_coefficients <- c()
for (i in 1:num_computed) { true_coefficients[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods

linear_full_mean_coef <- c()
for (i in 1:num_computed) { linear_full_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "causal_estimate"] }

linear_full_emp_se <- c()
for (i in 1:num_computed) { linear_full_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "emp_SE"] }

linear_full_model_se <- c()
for (i in 1:num_computed) { linear_full_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["linear", "model_SE"] }

stepwise_mean_coef <- c()
for (i in 1:num_computed) { stepwise_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "causal_estimate"] }

stepwise_emp_se <- c()
for (i in 1:num_computed) { stepwise_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "emp_SE"] }

stepwise_model_se <- c()
for (i in 1:num_computed) { stepwise_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise", "model_SE"] }

stepwise_X_mean_coef <- c()
for (i in 1:num_computed) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }

stepwise_X_emp_se <- c()
for (i in 1:num_computed) { stepwise_X_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "emp_SE"] }

stepwise_X_model_se <- c()
for (i in 1:num_computed) { stepwise_X_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["stepwise_X", "model_SE"] }

lasso_mean_coef <- c()
for (i in 1:num_computed) { lasso_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }

lasso_emp_se <- c()
for (i in 1:num_computed) { lasso_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }

lasso_model_se <- c()
for (i in 1:num_computed) { lasso_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso", "model_SE"] }

lasso_X_mean_coef <- c()
for (i in 1:num_computed) { lasso_X_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }

lasso_X_emp_se <- c()
for (i in 1:num_computed) { lasso_X_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }

lasso_X_model_se <- c()
for (i in 1:num_computed) { lasso_X_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }

lasso_union_mean_coef <- c()
for (i in 1:num_computed) { lasso_union_mean_coef[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }

lasso_union_emp_se <- c()
for (i in 1:num_computed) { lasso_union_emp_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }

lasso_union_model_se <- c()
for (i in 1:num_computed) { lasso_union_model_se[i] <- get( paste0( "scenario_2_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }

scenario_2_standard_error_table <- data.frame(measured_confounders,
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
                                              stepwise_X_model_se,
                                              lasso_mean_coef,
                                              lasso_emp_se,
                                              lasso_model_se,
                                              lasso_X_mean_coef,
                                              lasso_X_emp_se,
                                              lasso_X_model_se,
                                              lasso_union_mean_coef,
                                              lasso_union_emp_se,
                                              lasso_union_model_se)

print(scenario_2_standard_error_table)



# ----- Generate Scenario 3 Tables -----

# allows us to be flexible as things finish on HPC at different times

num_computed <- 6
measured_confounders   <- measured_confounders[1:num_computed]
unmeasured_confounders <- unmeasured_confounders[1:num_computed]
true_coefficients      <- true_coefficients[1:num_computed]


# causal effect estimation table

linear_full_bias  <- c()
for (i in 1:num_computed) { linear_full_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "causal_bias"] }

linear_full_coverage <- c()
for (i in 1:num_computed) { linear_full_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "causal_coverage"] }

stepwise_bias <- c()
for (i in 1:num_computed) { stepwise_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "causal_bias"] }

stepwise_coverage <- c()
for (i in 1:num_computed) { stepwise_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "causal_coverage"] }

stepwise_X_bias <- c()
for (i in 1:num_computed) { stepwise_X_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "causal_bias"] }

stepwise_X_coverage <- c()
for (i in 1:num_computed) { stepwise_X_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }

lasso_bias <- c()
for (i in 1:num_computed) { lasso_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }

lasso_coverage <- c()
for (i in 1:num_computed) { lasso_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }

lasso_X_bias <- c()
for (i in 1:num_computed) { lasso_X_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }

lasso_X_coverage <- c()
for (i in 1:num_computed) { lasso_X_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }

lasso_union_bias <- c()
for (i in 1:num_computed) { lasso_union_bias[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }

lasso_union_coverage <- c()
for (i in 1:num_computed) { lasso_union_coverage[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }

scenario_3_causal_estimation_table <- data.frame(measured_confounders,
                                                 unmeasured_confounders,
                                                 linear_full_bias,
                                                 linear_full_coverage,
                                                 stepwise_bias,
                                                 stepwise_coverage,
                                                 stepwise_X_bias,
                                                 stepwise_X_coverage,
                                                 lasso_bias,
                                                 lasso_coverage,
                                                 lasso_X_bias,
                                                 lasso_X_coverage,
                                                 lasso_union_bias,
                                                 lasso_union_coverage)

print(scenario_3_causal_estimation_table)


# backdoor pathway table

open_paths <- total_confounders
open_paths <- open_paths[1:num_computed]

linear_full_blocked <- c()
for (i in 1:num_computed) { linear_full_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "blocked_paths"] }

stepwise_blocked <- c()
for (i in 1:num_computed) { stepwise_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "blocked_paths"] }

stepwise_X_blocked <- c()
for (i in 1:num_computed) { stepwise_X_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }

lasso_blocked <- c()
for (i in 1:num_computed) { lasso_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }

lasso_X_blocked <- c()
for (i in 1:num_computed) { lasso_X_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }

lasso_union_blocked <- c()
for (i in 1:num_computed) { lasso_union_blocked[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }

scenario_3_backdoor_pathway_table <- data.frame(measured_confounders,
                                                unmeasured_confounders,
                                                open_paths,
                                                linear_full_blocked,
                                                stepwise_blocked,
                                                stepwise_X_blocked,
                                                lasso_blocked,
                                                lasso_X_blocked,
                                                lasso_union_blocked)

print(scenario_3_backdoor_pathway_table)


# coefficients and SEs table

true_coefficients <- c()
for (i in 1:num_computed) { true_coefficients[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods

linear_full_mean_coef <- c()
for (i in 1:num_computed) { linear_full_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "causal_estimate"] }

linear_full_emp_se <- c()
for (i in 1:num_computed) { linear_full_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "emp_SE"] }

linear_full_model_se <- c()
for (i in 1:num_computed) { linear_full_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["linear", "model_SE"] }

stepwise_mean_coef <- c()
for (i in 1:num_computed) { stepwise_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "causal_estimate"] }

stepwise_emp_se <- c()
for (i in 1:num_computed) { stepwise_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "emp_SE"] }

stepwise_model_se <- c()
for (i in 1:num_computed) { stepwise_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise", "model_SE"] }

stepwise_X_mean_coef <- c()
for (i in 1:num_computed) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }

stepwise_X_emp_se <- c()
for (i in 1:num_computed) { stepwise_X_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "emp_SE"] }

stepwise_X_model_se <- c()
for (i in 1:num_computed) { stepwise_X_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["stepwise_X", "model_SE"] }

lasso_mean_coef <- c()
for (i in 1:num_computed) { lasso_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }

lasso_emp_se <- c()
for (i in 1:num_computed) { lasso_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }

lasso_model_se <- c()
for (i in 1:num_computed) { lasso_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso", "model_SE"] }

lasso_X_mean_coef <- c()
for (i in 1:num_computed) { lasso_X_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }

lasso_X_emp_se <- c()
for (i in 1:num_computed) { lasso_X_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }

lasso_X_model_se <- c()
for (i in 1:num_computed) { lasso_X_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }

lasso_union_mean_coef <- c()
for (i in 1:num_computed) { lasso_union_mean_coef[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }

lasso_union_emp_se <- c()
for (i in 1:num_computed) { lasso_union_emp_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }

lasso_union_model_se <- c()
for (i in 1:num_computed) { lasso_union_model_se[i] <- get( paste0( "scenario_3_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }

scenario_3_standard_error_table <- data.frame(measured_confounders,
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
                                              stepwise_X_model_se,
                                              lasso_mean_coef,
                                              lasso_emp_se,
                                              lasso_model_se,
                                              lasso_X_mean_coef,
                                              lasso_X_emp_se,
                                              lasso_X_model_se,
                                              lasso_union_mean_coef,
                                              lasso_union_emp_se,
                                              lasso_union_model_se)

print(scenario_3_standard_error_table)



# ----- Generate Scenario 4 Tables -----

# allows us to be flexible as things finish on HPC at different times

num_computed <- 6
measured_confounders   <- measured_confounders[1:num_computed]
unmeasured_confounders <- unmeasured_confounders[1:num_computed]
true_coefficients      <- true_coefficients[1:num_computed]


# causal effect estimation table

linear_full_bias  <- c()
for (i in 1:num_computed) { linear_full_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "causal_bias"] }

linear_full_coverage <- c()
for (i in 1:num_computed) { linear_full_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "causal_coverage"] }

stepwise_bias <- c()
for (i in 1:num_computed) { stepwise_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "causal_bias"] }

stepwise_coverage <- c()
for (i in 1:num_computed) { stepwise_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "causal_coverage"] }

stepwise_X_bias <- c()
for (i in 1:num_computed) { stepwise_X_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "causal_bias"] }

stepwise_X_coverage <- c()
for (i in 1:num_computed) { stepwise_X_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }

lasso_bias <- c()
for (i in 1:num_computed) { lasso_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }

lasso_coverage <- c()
for (i in 1:num_computed) { lasso_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }

lasso_X_bias <- c()
for (i in 1:num_computed) { lasso_X_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }

lasso_X_coverage <- c()
for (i in 1:num_computed) { lasso_X_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }

lasso_union_bias <- c()
for (i in 1:num_computed) { lasso_union_bias[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }

lasso_union_coverage <- c()
for (i in 1:num_computed) { lasso_union_coverage[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }

scenario_4_causal_estimation_table <- data.frame(measured_confounders,
                                                 unmeasured_confounders,
                                                 linear_full_bias,
                                                 linear_full_coverage,
                                                 stepwise_bias,
                                                 stepwise_coverage,
                                                 stepwise_X_bias,
                                                 stepwise_X_coverage,
                                                 lasso_bias,
                                                 lasso_coverage,
                                                 lasso_X_bias,
                                                 lasso_X_coverage,
                                                 lasso_union_bias,
                                                 lasso_union_coverage)

print(scenario_4_causal_estimation_table)


# backdoor pathway table

open_paths <- total_confounders
open_paths <- open_paths[1:num_computed]

linear_full_blocked <- c()
for (i in 1:num_computed) { linear_full_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "blocked_paths"] }

stepwise_blocked <- c()
for (i in 1:num_computed) { stepwise_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "blocked_paths"] }

stepwise_X_blocked <- c()
for (i in 1:num_computed) { stepwise_X_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }

lasso_blocked <- c()
for (i in 1:num_computed) { lasso_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }

lasso_X_blocked <- c()
for (i in 1:num_computed) { lasso_X_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }

lasso_union_blocked <- c()
for (i in 1:num_computed) { lasso_union_blocked[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }

scenario_4_backdoor_pathway_table <- data.frame(measured_confounders,
                                                unmeasured_confounders,
                                                open_paths,
                                                linear_full_blocked,
                                                stepwise_blocked,
                                                stepwise_X_blocked,
                                                lasso_blocked,
                                                lasso_X_blocked,
                                                lasso_union_blocked)

print(scenario_4_backdoor_pathway_table)


# coefficients and SEs table

true_coefficients <- c()
for (i in 1:num_computed) { true_coefficients[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods

linear_full_mean_coef <- c()
for (i in 1:num_computed) { linear_full_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "causal_estimate"] }

linear_full_emp_se <- c()
for (i in 1:num_computed) { linear_full_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "emp_SE"] }

linear_full_model_se <- c()
for (i in 1:num_computed) { linear_full_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["linear", "model_SE"] }

stepwise_mean_coef <- c()
for (i in 1:num_computed) { stepwise_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "causal_estimate"] }

stepwise_emp_se <- c()
for (i in 1:num_computed) { stepwise_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "emp_SE"] }

stepwise_model_se <- c()
for (i in 1:num_computed) { stepwise_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise", "model_SE"] }

stepwise_X_mean_coef <- c()
for (i in 1:num_computed) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }

stepwise_X_emp_se <- c()
for (i in 1:num_computed) { stepwise_X_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "emp_SE"] }

stepwise_X_model_se <- c()
for (i in 1:num_computed) { stepwise_X_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["stepwise_X", "model_SE"] }

lasso_mean_coef <- c()
for (i in 1:num_computed) { lasso_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }

lasso_emp_se <- c()
for (i in 1:num_computed) { lasso_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }

lasso_model_se <- c()
for (i in 1:num_computed) { lasso_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso", "model_SE"] }

lasso_X_mean_coef <- c()
for (i in 1:num_computed) { lasso_X_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }

lasso_X_emp_se <- c()
for (i in 1:num_computed) { lasso_X_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }

lasso_X_model_se <- c()
for (i in 1:num_computed) { lasso_X_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }

lasso_union_mean_coef <- c()
for (i in 1:num_computed) { lasso_union_mean_coef[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }

lasso_union_emp_se <- c()
for (i in 1:num_computed) { lasso_union_emp_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }

lasso_union_model_se <- c()
for (i in 1:num_computed) { lasso_union_model_se[i] <- get( paste0( "scenario_4_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }

scenario_4_standard_error_table <- data.frame(measured_confounders,
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
                                              stepwise_X_model_se,
                                              lasso_mean_coef,
                                              lasso_emp_se,
                                              lasso_model_se,
                                              lasso_X_mean_coef,
                                              lasso_X_emp_se,
                                              lasso_X_model_se,
                                              lasso_union_mean_coef,
                                              lasso_union_emp_se,
                                              lasso_union_model_se)

print(scenario_4_standard_error_table)



# ----- Generate Scenario 5 Tables -----

# allows us to be flexible as things finish on HPC at different times

num_computed <- 4
measured_confounders   <- measured_confounders[1:num_computed]
unmeasured_confounders <- unmeasured_confounders[1:num_computed]
true_coefficients      <- true_coefficients[1:num_computed]


# causal effect estimation table

linear_full_bias  <- c()
for (i in 1:num_computed) { linear_full_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "causal_bias"] }

linear_full_coverage <- c()
for (i in 1:num_computed) { linear_full_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "causal_coverage"] }

stepwise_bias <- c()
for (i in 1:num_computed) { stepwise_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "causal_bias"] }

stepwise_coverage <- c()
for (i in 1:num_computed) { stepwise_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "causal_coverage"] }

stepwise_X_bias <- c()
for (i in 1:num_computed) { stepwise_X_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "causal_bias"] }

stepwise_X_coverage <- c()
for (i in 1:num_computed) { stepwise_X_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }

lasso_bias <- c()
for (i in 1:num_computed) { lasso_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }

lasso_coverage <- c()
for (i in 1:num_computed) { lasso_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }

lasso_X_bias <- c()
for (i in 1:num_computed) { lasso_X_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }

lasso_X_coverage <- c()
for (i in 1:num_computed) { lasso_X_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }

lasso_union_bias <- c()
for (i in 1:num_computed) { lasso_union_bias[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }

lasso_union_coverage <- c()
for (i in 1:num_computed) { lasso_union_coverage[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }

scenario_5_causal_estimation_table <- data.frame(measured_confounders,
                                                 unmeasured_confounders,
                                                 linear_full_bias,
                                                 linear_full_coverage,
                                                 stepwise_bias,
                                                 stepwise_coverage,
                                                 stepwise_X_bias,
                                                 stepwise_X_coverage,
                                                 lasso_bias,
                                                 lasso_coverage,
                                                 lasso_X_bias,
                                                 lasso_X_coverage,
                                                 lasso_union_bias,
                                                 lasso_union_coverage)

print(scenario_5_causal_estimation_table)


# backdoor pathway table

open_paths <- total_confounders
open_paths <- open_paths[1:num_computed]

linear_full_blocked <- c()
for (i in 1:num_computed) { linear_full_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "blocked_paths"] }

stepwise_blocked <- c()
for (i in 1:num_computed) { stepwise_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "blocked_paths"] }

stepwise_X_blocked <- c()
for (i in 1:num_computed) { stepwise_X_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }

lasso_blocked <- c()
for (i in 1:num_computed) { lasso_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }

lasso_X_blocked <- c()
for (i in 1:num_computed) { lasso_X_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }

lasso_union_blocked <- c()
for (i in 1:num_computed) { lasso_union_blocked[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }

scenario_5_backdoor_pathway_table <- data.frame(measured_confounders,
                                                unmeasured_confounders,
                                                open_paths,
                                                linear_full_blocked,
                                                stepwise_blocked,
                                                stepwise_X_blocked,
                                                lasso_blocked,
                                                lasso_X_blocked,
                                                lasso_union_blocked)

print(scenario_5_backdoor_pathway_table)


# coefficients and SEs table

true_coefficients <- c()
for (i in 1:num_computed) { true_coefficients[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods

linear_full_mean_coef <- c()
for (i in 1:num_computed) { linear_full_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "causal_estimate"] }

linear_full_emp_se <- c()
for (i in 1:num_computed) { linear_full_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "emp_SE"] }

linear_full_model_se <- c()
for (i in 1:num_computed) { linear_full_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["linear", "model_SE"] }

stepwise_mean_coef <- c()
for (i in 1:num_computed) { stepwise_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "causal_estimate"] }

stepwise_emp_se <- c()
for (i in 1:num_computed) { stepwise_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "emp_SE"] }

stepwise_model_se <- c()
for (i in 1:num_computed) { stepwise_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise", "model_SE"] }

stepwise_X_mean_coef <- c()
for (i in 1:num_computed) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }

stepwise_X_emp_se <- c()
for (i in 1:num_computed) { stepwise_X_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "emp_SE"] }

stepwise_X_model_se <- c()
for (i in 1:num_computed) { stepwise_X_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["stepwise_X", "model_SE"] }

lasso_mean_coef <- c()
for (i in 1:num_computed) { lasso_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }

lasso_emp_se <- c()
for (i in 1:num_computed) { lasso_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }

lasso_model_se <- c()
for (i in 1:num_computed) { lasso_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso", "model_SE"] }

lasso_X_mean_coef <- c()
for (i in 1:num_computed) { lasso_X_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }

lasso_X_emp_se <- c()
for (i in 1:num_computed) { lasso_X_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }

lasso_X_model_se <- c()
for (i in 1:num_computed) { lasso_X_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }

lasso_union_mean_coef <- c()
for (i in 1:num_computed) { lasso_union_mean_coef[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }

lasso_union_emp_se <- c()
for (i in 1:num_computed) { lasso_union_emp_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }

lasso_union_model_se <- c()
for (i in 1:num_computed) { lasso_union_model_se[i] <- get( paste0( "scenario_5_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }

scenario_5_standard_error_table <- data.frame(measured_confounders,
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
                                              stepwise_X_model_se,
                                              lasso_mean_coef,
                                              lasso_emp_se,
                                              lasso_model_se,
                                              lasso_X_mean_coef,
                                              lasso_X_emp_se,
                                              lasso_X_model_se,
                                              lasso_union_mean_coef,
                                              lasso_union_emp_se,
                                              lasso_union_model_se)

print(scenario_5_standard_error_table)



# ----- Generate Scenario 6 Tables -----

# allows us to be flexible as things finish on HPC at different times

num_computed <- 4
measured_confounders   <- measured_confounders[1:num_computed]
unmeasured_confounders <- unmeasured_confounders[1:num_computed]
true_coefficients      <- true_coefficients[1:num_computed]


# causal effect estimation table

linear_full_bias  <- c()
for (i in 1:num_computed) { linear_full_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "causal_bias"] }

linear_full_coverage <- c()
for (i in 1:num_computed) { linear_full_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "causal_coverage"] }

stepwise_bias <- c()
for (i in 1:num_computed) { stepwise_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "causal_bias"] }

stepwise_coverage <- c()
for (i in 1:num_computed) { stepwise_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "causal_coverage"] }

stepwise_X_bias <- c()
for (i in 1:num_computed) { stepwise_X_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "causal_bias"] }

stepwise_X_coverage <- c()
for (i in 1:num_computed) { stepwise_X_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }

lasso_bias <- c()
for (i in 1:num_computed) { lasso_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }

lasso_coverage <- c()
for (i in 1:num_computed) { lasso_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }

lasso_X_bias <- c()
for (i in 1:num_computed) { lasso_X_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }

lasso_X_coverage <- c()
for (i in 1:num_computed) { lasso_X_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }

lasso_union_bias <- c()
for (i in 1:num_computed) { lasso_union_bias[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }

lasso_union_coverage <- c()
for (i in 1:num_computed) { lasso_union_coverage[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }

scenario_6_causal_estimation_table <- data.frame(measured_confounders,
                                                 unmeasured_confounders,
                                                 linear_full_bias,
                                                 linear_full_coverage,
                                                 stepwise_bias,
                                                 stepwise_coverage,
                                                 stepwise_X_bias,
                                                 stepwise_X_coverage,
                                                 lasso_bias,
                                                 lasso_coverage,
                                                 lasso_X_bias,
                                                 lasso_X_coverage,
                                                 lasso_union_bias,
                                                 lasso_union_coverage)

print(scenario_6_causal_estimation_table)


# backdoor pathway table

open_paths <- total_confounders
open_paths <- open_paths[1:num_computed]

linear_full_blocked <- c()
for (i in 1:num_computed) { linear_full_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "blocked_paths"] }

stepwise_blocked <- c()
for (i in 1:num_computed) { stepwise_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "blocked_paths"] }

stepwise_X_blocked <- c()
for (i in 1:num_computed) { stepwise_X_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }

lasso_blocked <- c()
for (i in 1:num_computed) { lasso_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }

lasso_X_blocked <- c()
for (i in 1:num_computed) { lasso_X_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }

lasso_union_blocked <- c()
for (i in 1:num_computed) { lasso_union_blocked[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }

scenario_6_backdoor_pathway_table <- data.frame(measured_confounders,
                                                unmeasured_confounders,
                                                open_paths,
                                                linear_full_blocked,
                                                stepwise_blocked,
                                                stepwise_X_blocked,
                                                lasso_blocked,
                                                lasso_X_blocked,
                                                lasso_union_blocked)

print(scenario_6_backdoor_pathway_table)


# coefficients and SEs table

true_coefficients <- c()
for (i in 1:num_computed) { true_coefficients[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods

linear_full_mean_coef <- c()
for (i in 1:num_computed) { linear_full_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "causal_estimate"] }

linear_full_emp_se <- c()
for (i in 1:num_computed) { linear_full_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "emp_SE"] }

linear_full_model_se <- c()
for (i in 1:num_computed) { linear_full_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["linear", "model_SE"] }

stepwise_mean_coef <- c()
for (i in 1:num_computed) { stepwise_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "causal_estimate"] }

stepwise_emp_se <- c()
for (i in 1:num_computed) { stepwise_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "emp_SE"] }

stepwise_model_se <- c()
for (i in 1:num_computed) { stepwise_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise", "model_SE"] }

stepwise_X_mean_coef <- c()
for (i in 1:num_computed) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }

stepwise_X_emp_se <- c()
for (i in 1:num_computed) { stepwise_X_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "emp_SE"] }

stepwise_X_model_se <- c()
for (i in 1:num_computed) { stepwise_X_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["stepwise_X", "model_SE"] }

lasso_mean_coef <- c()
for (i in 1:num_computed) { lasso_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }

lasso_emp_se <- c()
for (i in 1:num_computed) { lasso_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }

lasso_model_se <- c()
for (i in 1:num_computed) { lasso_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso", "model_SE"] }

lasso_X_mean_coef <- c()
for (i in 1:num_computed) { lasso_X_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }

lasso_X_emp_se <- c()
for (i in 1:num_computed) { lasso_X_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }

lasso_X_model_se <- c()
for (i in 1:num_computed) { lasso_X_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }

lasso_union_mean_coef <- c()
for (i in 1:num_computed) { lasso_union_mean_coef[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }

lasso_union_emp_se <- c()
for (i in 1:num_computed) { lasso_union_emp_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }

lasso_union_model_se <- c()
for (i in 1:num_computed) { lasso_union_model_se[i] <- get( paste0( "scenario_6_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }

scenario_6_standard_error_table <- data.frame(measured_confounders,
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
                                              stepwise_X_model_se,
                                              lasso_mean_coef,
                                              lasso_emp_se,
                                              lasso_model_se,
                                              lasso_X_mean_coef,
                                              lasso_X_emp_se,
                                              lasso_X_model_se,
                                              lasso_union_mean_coef,
                                              lasso_union_emp_se,
                                              lasso_union_model_se)

print(scenario_6_standard_error_table)



# ----- Generate Scenario 7 Tables -----

# allows us to be flexible as things finish on HPC at different times

num_computed <- 4
measured_confounders   <- measured_confounders[1:num_computed]
unmeasured_confounders <- unmeasured_confounders[1:num_computed]
true_coefficients      <- true_coefficients[1:num_computed]


# causal effect estimation table

linear_full_bias  <- c()
for (i in 1:num_computed) { linear_full_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "causal_bias"] }

linear_full_coverage <- c()
for (i in 1:num_computed) { linear_full_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "causal_coverage"] }

stepwise_bias <- c()
for (i in 1:num_computed) { stepwise_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "causal_bias"] }

stepwise_coverage <- c()
for (i in 1:num_computed) { stepwise_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "causal_coverage"] }

stepwise_X_bias <- c()
for (i in 1:num_computed) { stepwise_X_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "causal_bias"] }

stepwise_X_coverage <- c()
for (i in 1:num_computed) { stepwise_X_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }

lasso_bias <- c()
for (i in 1:num_computed) { lasso_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }

lasso_coverage <- c()
for (i in 1:num_computed) { lasso_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }

lasso_X_bias <- c()
for (i in 1:num_computed) { lasso_X_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }

lasso_X_coverage <- c()
for (i in 1:num_computed) { lasso_X_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }

lasso_union_bias <- c()
for (i in 1:num_computed) { lasso_union_bias[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }

lasso_union_coverage <- c()
for (i in 1:num_computed) { lasso_union_coverage[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }

scenario_7_causal_estimation_table <- data.frame(measured_confounders,
                                                 unmeasured_confounders,
                                                 linear_full_bias,
                                                 linear_full_coverage,
                                                 stepwise_bias,
                                                 stepwise_coverage,
                                                 stepwise_X_bias,
                                                 stepwise_X_coverage,
                                                 lasso_bias,
                                                 lasso_coverage,
                                                 lasso_X_bias,
                                                 lasso_X_coverage,
                                                 lasso_union_bias,
                                                 lasso_union_coverage)

print(scenario_7_causal_estimation_table)


# backdoor pathway table

open_paths <- total_confounders
open_paths <- open_paths[1:num_computed]

linear_full_blocked <- c()
for (i in 1:num_computed) { linear_full_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "blocked_paths"] }

stepwise_blocked <- c()
for (i in 1:num_computed) { stepwise_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "blocked_paths"] }

stepwise_X_blocked <- c()
for (i in 1:num_computed) { stepwise_X_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }

lasso_blocked <- c()
for (i in 1:num_computed) { lasso_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }

lasso_X_blocked <- c()
for (i in 1:num_computed) { lasso_X_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }

lasso_union_blocked <- c()
for (i in 1:num_computed) { lasso_union_blocked[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }

scenario_7_backdoor_pathway_table <- data.frame(measured_confounders,
                                                unmeasured_confounders,
                                                open_paths,
                                                linear_full_blocked,
                                                stepwise_blocked,
                                                stepwise_X_blocked,
                                                lasso_blocked,
                                                lasso_X_blocked,
                                                lasso_union_blocked)

print(scenario_7_backdoor_pathway_table)


# coefficients and SEs table

true_coefficients <- c()
for (i in 1:num_computed) { true_coefficients[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods

linear_full_mean_coef <- c()
for (i in 1:num_computed) { linear_full_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "causal_estimate"] }

linear_full_emp_se <- c()
for (i in 1:num_computed) { linear_full_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "emp_SE"] }

linear_full_model_se <- c()
for (i in 1:num_computed) { linear_full_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["linear", "model_SE"] }

stepwise_mean_coef <- c()
for (i in 1:num_computed) { stepwise_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "causal_estimate"] }

stepwise_emp_se <- c()
for (i in 1:num_computed) { stepwise_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "emp_SE"] }

stepwise_model_se <- c()
for (i in 1:num_computed) { stepwise_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise", "model_SE"] }

stepwise_X_mean_coef <- c()
for (i in 1:num_computed) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }

stepwise_X_emp_se <- c()
for (i in 1:num_computed) { stepwise_X_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "emp_SE"] }

stepwise_X_model_se <- c()
for (i in 1:num_computed) { stepwise_X_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["stepwise_X", "model_SE"] }

lasso_mean_coef <- c()
for (i in 1:num_computed) { lasso_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }

lasso_emp_se <- c()
for (i in 1:num_computed) { lasso_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }

lasso_model_se <- c()
for (i in 1:num_computed) { lasso_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso", "model_SE"] }

lasso_X_mean_coef <- c()
for (i in 1:num_computed) { lasso_X_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }

lasso_X_emp_se <- c()
for (i in 1:num_computed) { lasso_X_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }

lasso_X_model_se <- c()
for (i in 1:num_computed) { lasso_X_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }

lasso_union_mean_coef <- c()
for (i in 1:num_computed) { lasso_union_mean_coef[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }

lasso_union_emp_se <- c()
for (i in 1:num_computed) { lasso_union_emp_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }

lasso_union_model_se <- c()
for (i in 1:num_computed) { lasso_union_model_se[i] <- get( paste0( "scenario_7_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }

scenario_7_standard_error_table <- data.frame(measured_confounders,
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
                                              stepwise_X_model_se,
                                              lasso_mean_coef,
                                              lasso_emp_se,
                                              lasso_model_se,
                                              lasso_X_mean_coef,
                                              lasso_X_emp_se,
                                              lasso_X_model_se,
                                              lasso_union_mean_coef,
                                              lasso_union_emp_se,
                                              lasso_union_model_se)

print(scenario_7_standard_error_table)



# ----- Generate Scenario 8 Tables -----

# allows us to be flexible as things finish on HPC at different times

num_computed <- 4
measured_confounders   <- measured_confounders[1:num_computed]
unmeasured_confounders <- unmeasured_confounders[1:num_computed]
true_coefficients      <- true_coefficients[1:num_computed]


# causal effect estimation table

linear_full_bias  <- c()
for (i in 1:num_computed) { linear_full_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "causal_bias"] }

linear_full_coverage <- c()
for (i in 1:num_computed) { linear_full_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "causal_coverage"] }

stepwise_bias <- c()
for (i in 1:num_computed) { stepwise_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "causal_bias"] }

stepwise_coverage <- c()
for (i in 1:num_computed) { stepwise_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "causal_coverage"] }

stepwise_X_bias <- c()
for (i in 1:num_computed) { stepwise_X_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "causal_bias"] }

stepwise_X_coverage <- c()
for (i in 1:num_computed) { stepwise_X_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }

lasso_bias <- c()
for (i in 1:num_computed) { lasso_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }

lasso_coverage <- c()
for (i in 1:num_computed) { lasso_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }

lasso_X_bias <- c()
for (i in 1:num_computed) { lasso_X_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }

lasso_X_coverage <- c()
for (i in 1:num_computed) { lasso_X_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }

lasso_union_bias <- c()
for (i in 1:num_computed) { lasso_union_bias[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }

lasso_union_coverage <- c()
for (i in 1:num_computed) { lasso_union_coverage[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }

scenario_8_causal_estimation_table <- data.frame(measured_confounders,
                                                 unmeasured_confounders,
                                                 linear_full_bias,
                                                 linear_full_coverage,
                                                 stepwise_bias,
                                                 stepwise_coverage,
                                                 stepwise_X_bias,
                                                 stepwise_X_coverage,
                                                 lasso_bias,
                                                 lasso_coverage,
                                                 lasso_X_bias,
                                                 lasso_X_coverage,
                                                 lasso_union_bias,
                                                 lasso_union_coverage)

print(scenario_8_causal_estimation_table)


# backdoor pathway table

open_paths <- total_confounders
open_paths <- open_paths[1:num_computed]

linear_full_blocked <- c()
for (i in 1:num_computed) { linear_full_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "blocked_paths"] }

stepwise_blocked <- c()
for (i in 1:num_computed) { stepwise_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "blocked_paths"] }

stepwise_X_blocked <- c()
for (i in 1:num_computed) { stepwise_X_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }

lasso_blocked <- c()
for (i in 1:num_computed) { lasso_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }

lasso_X_blocked <- c()
for (i in 1:num_computed) { lasso_X_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }

lasso_union_blocked <- c()
for (i in 1:num_computed) { lasso_union_blocked[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }

scenario_8_backdoor_pathway_table <- data.frame(measured_confounders,
                                                unmeasured_confounders,
                                                open_paths,
                                                linear_full_blocked,
                                                stepwise_blocked,
                                                stepwise_X_blocked,
                                                lasso_blocked,
                                                lasso_X_blocked,
                                                lasso_union_blocked)

print(scenario_8_backdoor_pathway_table)


# coefficients and SEs table

true_coefficients <- c()
for (i in 1:num_computed) { true_coefficients[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods

linear_full_mean_coef <- c()
for (i in 1:num_computed) { linear_full_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "causal_estimate"] }

linear_full_emp_se <- c()
for (i in 1:num_computed) { linear_full_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "emp_SE"] }

linear_full_model_se <- c()
for (i in 1:num_computed) { linear_full_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["linear", "model_SE"] }

stepwise_mean_coef <- c()
for (i in 1:num_computed) { stepwise_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "causal_estimate"] }

stepwise_emp_se <- c()
for (i in 1:num_computed) { stepwise_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "emp_SE"] }

stepwise_model_se <- c()
for (i in 1:num_computed) { stepwise_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise", "model_SE"] }

stepwise_X_mean_coef <- c()
for (i in 1:num_computed) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }

stepwise_X_emp_se <- c()
for (i in 1:num_computed) { stepwise_X_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "emp_SE"] }

stepwise_X_model_se <- c()
for (i in 1:num_computed) { stepwise_X_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["stepwise_X", "model_SE"] }

lasso_mean_coef <- c()
for (i in 1:num_computed) { lasso_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }

lasso_emp_se <- c()
for (i in 1:num_computed) { lasso_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }

lasso_model_se <- c()
for (i in 1:num_computed) { lasso_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso", "model_SE"] }

lasso_X_mean_coef <- c()
for (i in 1:num_computed) { lasso_X_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }

lasso_X_emp_se <- c()
for (i in 1:num_computed) { lasso_X_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }

lasso_X_model_se <- c()
for (i in 1:num_computed) { lasso_X_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }

lasso_union_mean_coef <- c()
for (i in 1:num_computed) { lasso_union_mean_coef[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }

lasso_union_emp_se <- c()
for (i in 1:num_computed) { lasso_union_emp_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }

lasso_union_model_se <- c()
for (i in 1:num_computed) { lasso_union_model_se[i] <- get( paste0( "scenario_8_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }

scenario_8_standard_error_table <- data.frame(measured_confounders,
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
                                              stepwise_X_model_se,
                                              lasso_mean_coef,
                                              lasso_emp_se,
                                              lasso_model_se,
                                              lasso_X_mean_coef,
                                              lasso_X_emp_se,
                                              lasso_X_model_se,
                                              lasso_union_mean_coef,
                                              lasso_union_emp_se,
                                              lasso_union_model_se)

print(scenario_8_standard_error_table)


# ----- Generate Scenario 9 Tables -----

# allows us to be flexible as things finish on HPC at different times

num_computed <- 4
measured_confounders   <- measured_confounders[1:num_computed]
unmeasured_confounders <- unmeasured_confounders[1:num_computed]
true_coefficients      <- true_coefficients[1:num_computed]


# causal effect estimation table

linear_full_bias  <- c()
for (i in 1:num_computed) { linear_full_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "causal_bias"] }

linear_full_coverage <- c()
for (i in 1:num_computed) { linear_full_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "causal_coverage"] }

stepwise_bias <- c()
for (i in 1:num_computed) { stepwise_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "causal_bias"] }

stepwise_coverage <- c()
for (i in 1:num_computed) { stepwise_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "causal_coverage"] }

stepwise_X_bias <- c()
for (i in 1:num_computed) { stepwise_X_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "causal_bias"] }

stepwise_X_coverage <- c()
for (i in 1:num_computed) { stepwise_X_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "causal_coverage"] }

lasso_bias <- c()
for (i in 1:num_computed) { lasso_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "causal_bias"] }

lasso_coverage <- c()
for (i in 1:num_computed) { lasso_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "causal_coverage"] }

lasso_X_bias <- c()
for (i in 1:num_computed) { lasso_X_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "causal_bias"] }

lasso_X_coverage <- c()
for (i in 1:num_computed) { lasso_X_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "causal_coverage"] }

lasso_union_bias <- c()
for (i in 1:num_computed) { lasso_union_bias[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "causal_bias"] }

lasso_union_coverage <- c()
for (i in 1:num_computed) { lasso_union_coverage[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "causal_coverage"] }

scenario_9_causal_estimation_table <- data.frame(measured_confounders,
                                                 unmeasured_confounders,
                                                 linear_full_bias,
                                                 linear_full_coverage,
                                                 stepwise_bias,
                                                 stepwise_coverage,
                                                 stepwise_X_bias,
                                                 stepwise_X_coverage,
                                                 lasso_bias,
                                                 lasso_coverage,
                                                 lasso_X_bias,
                                                 lasso_X_coverage,
                                                 lasso_union_bias,
                                                 lasso_union_coverage)

print(scenario_9_causal_estimation_table)


# backdoor pathway table

open_paths <- total_confounders
open_paths <- open_paths[1:num_computed]

linear_full_blocked <- c()
for (i in 1:num_computed) { linear_full_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "blocked_paths"] }

stepwise_blocked <- c()
for (i in 1:num_computed) { stepwise_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "blocked_paths"] }

stepwise_X_blocked <- c()
for (i in 1:num_computed) { stepwise_X_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "blocked_paths"] }

lasso_blocked <- c()
for (i in 1:num_computed) { lasso_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "blocked_paths"] }

lasso_X_blocked <- c()
for (i in 1:num_computed) { lasso_X_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "blocked_paths"] }

lasso_union_blocked <- c()
for (i in 1:num_computed) { lasso_union_blocked[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "blocked_paths"] }

scenario_9_backdoor_pathway_table <- data.frame(measured_confounders,
                                                unmeasured_confounders,
                                                open_paths,
                                                linear_full_blocked,
                                                stepwise_blocked,
                                                stepwise_X_blocked,
                                                lasso_blocked,
                                                lasso_X_blocked,
                                                lasso_union_blocked)

print(scenario_9_backdoor_pathway_table)


# coefficients and SEs table

true_coefficients <- c()
for (i in 1:num_computed) { true_coefficients[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "causal_true_value"] } # true value constant across methods

linear_full_mean_coef <- c()
for (i in 1:num_computed) { linear_full_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "causal_estimate"] }

linear_full_emp_se <- c()
for (i in 1:num_computed) { linear_full_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "emp_SE"] }

linear_full_model_se <- c()
for (i in 1:num_computed) { linear_full_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["linear", "model_SE"] }

stepwise_mean_coef <- c()
for (i in 1:num_computed) { stepwise_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "causal_estimate"] }

stepwise_emp_se <- c()
for (i in 1:num_computed) { stepwise_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "emp_SE"] }

stepwise_model_se <- c()
for (i in 1:num_computed) { stepwise_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise", "model_SE"] }

stepwise_X_mean_coef <- c()
for (i in 1:num_computed) { stepwise_X_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "causal_estimate"] }

stepwise_X_emp_se <- c()
for (i in 1:num_computed) { stepwise_X_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "emp_SE"] }

stepwise_X_model_se <- c()
for (i in 1:num_computed) { stepwise_X_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["stepwise_X", "model_SE"] }

lasso_mean_coef <- c()
for (i in 1:num_computed) { lasso_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "causal_estimate"] }

lasso_emp_se <- c()
for (i in 1:num_computed) { lasso_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "emp_SE"] }

lasso_model_se <- c()
for (i in 1:num_computed) { lasso_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso", "model_SE"] }

lasso_X_mean_coef <- c()
for (i in 1:num_computed) { lasso_X_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "causal_estimate"] }

lasso_X_emp_se <- c()
for (i in 1:num_computed) { lasso_X_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "emp_SE"] }

lasso_X_model_se <- c()
for (i in 1:num_computed) { lasso_X_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_X", "model_SE"] }

lasso_union_mean_coef <- c()
for (i in 1:num_computed) { lasso_union_mean_coef[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "causal_estimate"] }

lasso_union_emp_se <- c()
for (i in 1:num_computed) { lasso_union_emp_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "emp_SE"] }

lasso_union_model_se <- c()
for (i in 1:num_computed) { lasso_union_model_se[i] <- get( paste0( "scenario_9_confset_", i, "_data"))["two_step_lasso_union", "model_SE"] }

scenario_9_standard_error_table <- data.frame(measured_confounders,
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
                                              stepwise_X_model_se,
                                              lasso_mean_coef,
                                              lasso_emp_se,
                                              lasso_model_se,
                                              lasso_X_mean_coef,
                                              lasso_X_emp_se,
                                              lasso_X_model_se,
                                              lasso_union_mean_coef,
                                              lasso_union_emp_se,
                                              lasso_union_model_se)

print(scenario_9_standard_error_table)




# ----- Export and save data -----

write.csv(scenario_1_causal_estimation_table, "temp/scenario_1_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_1_backdoor_pathway_table,  "temp/scenario_1_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_1_standard_error_table,    "temp/scenario_1_standard_error_table.csv", row.names = FALSE)

write.csv(scenario_2_causal_estimation_table, "temp/scenario_2_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_2_backdoor_pathway_table,  "temp/scenario_2_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_2_standard_error_table,    "temp/scenario_2_standard_error_table.csv", row.names = FALSE)

write.csv(scenario_3_causal_estimation_table, "temp/scenario_3_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_3_backdoor_pathway_table,  "temp/scenario_3_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_3_standard_error_table,    "temp/scenario_3_standard_error_table.csv", row.names = FALSE)

write.csv(scenario_4_causal_estimation_table, "temp/scenario_4_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_4_backdoor_pathway_table,  "temp/scenario_4_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_4_standard_error_table,    "temp/scenario_4_standard_error_table.csv", row.names = FALSE)

write.csv(scenario_5_causal_estimation_table, "temp/scenario_5_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_5_backdoor_pathway_table,  "temp/scenario_5_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_5_standard_error_table,    "temp/scenario_5_standard_error_table.csv", row.names = FALSE)

write.csv(scenario_6_causal_estimation_table, "temp/scenario_6_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_6_backdoor_pathway_table,  "temp/scenario_6_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_6_standard_error_table,    "temp/scenario_6_standard_error_table.csv", row.names = FALSE)

write.csv(scenario_7_causal_estimation_table, "temp/scenario_7_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_7_backdoor_pathway_table,  "temp/scenario_7_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_7_standard_error_table,    "temp/scenario_7_standard_error_table.csv", row.names = FALSE)

write.csv(scenario_8_causal_estimation_table, "temp/scenario_8_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_8_backdoor_pathway_table,  "temp/scenario_8_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_8_standard_error_table,    "temp/scenario_8_standard_error_table.csv", row.names = FALSE)

write.csv(scenario_9_causal_estimation_table, "temp/scenario_9_causal_estimation_table.csv", row.names = FALSE)
write.csv(scenario_9_backdoor_pathway_table,  "temp/scenario_9_backdoor_pathway_table.csv", row.names = FALSE)
write.csv(scenario_9_standard_error_table,    "temp/scenario_9_standard_error_table.csv", row.names = FALSE)



