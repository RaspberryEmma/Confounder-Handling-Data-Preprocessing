#!/bin/bash


for i in 1 2 3 4 5 6 7 8 9;
do
	# convert CSV's into TeX code
	python tably.py "temp/scenario_"$i"_causal_estimation_table.csv" -o "outputs/scenario_"$i"_causal_estimation_table_tex.txt" -r
	python tably.py "temp/scenario_"$i"_backdoor_pathway_table.csv"  -o "outputs/scenario_"$i"_backdoor_pathway_table_tex.txt"  -r
	python tably.py "temp/scenario_"$i"_standard_error_first_half_table.csv"  -o "outputs/scenario_"$i"_standard_error_first_half_table_tex.txt"  -r
	python tably.py "temp/scenario_"$i"_standard_error_second_half_table.csv" -o "outputs/scenario_"$i"_standard_error_second_half_table_tex.txt" -r

	# remove first 4 lines (tabular header)
	sed -i 1,4d "outputs/scenario_"$i"_causal_estimation_table_tex.txt"
	sed -i 1,4d "outputs/scenario_"$i"_backdoor_pathway_table_tex.txt"
	sed -i 1,4d "outputs/scenario_"$i"_standard_error_first_half_table_tex.txt"
	sed -i 1,4d "outputs/scenario_"$i"_standard_error_second_half_table_tex.txt"

	# remove last 2 lines (tabular footer)
	sed -i '$d' "outputs/scenario_"$i"_causal_estimation_table_tex.txt"
	sed -i '$d' "outputs/scenario_"$i"_causal_estimation_table_tex.txt"

	sed -i '$d' "outputs/scenario_"$i"_backdoor_pathway_table_tex.txt"
	sed -i '$d' "outputs/scenario_"$i"_backdoor_pathway_table_tex.txt"

	sed -i '$d' "outputs/scenario_"$i"_standard_error_first_half_table_tex.txt"
	sed -i '$d' "outputs/scenario_"$i"_standard_error_first_half_table_tex.txt"
	sed -i '$d' "outputs/scenario_"$i"_standard_error_second_half_table_tex.txt"
	sed -i '$d' "outputs/scenario_"$i"_standard_error_second_half_table_tex.txt"
	
done

