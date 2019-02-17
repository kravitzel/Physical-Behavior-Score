
# Set up the computing environment: ----------------------------------------------
# Set the working directory. This should have the files example_PBS.R, 
# assign_score_single_person.R, assign_score_multiple_people.R, 
# and score_functions.rda
require("here")

source(here("assign_score_single_person.R"))
load(here("score_functions.rda"))

################################################################################

# This assigns a physical activity score to a single
# person. Users can input values for all the physical behaviors and see the total
# score as well as the contribution to the total score by the 8 physical behaviors

################################################################################

# Put in the observed values of each physical behavior: ----------------------------
#  Median in the NIH-AARP dataset
moderate.exercise = 13.7  # Moderate exercise (MET-hr/wk)
vigorous.exercise = 0 # Vigorous exercise (MET-hr/wk)
light.intensity.household = 7 # Light-intensity Household (MET-hr/wk)
moderate.vigorous.household  = 13.25 # Moderate-vigorous Household (MET-hr/wk)
weight.training = 0 # Weight Training (MET-hr/wk)
sitting.other.than.tv = 3.0 # Sitting other than TV (hr/day)
television.sitting = 3.5 # Television sitting (hr/day)
sleep = 7.5 # Sleep (hr/day)

# After inputing reported physical behaviors above, run the calculate_score function
# which will calculate the PBS and print the results to the console
total.score.median = calculate_score(moderate.exercise = moderate.exercise, vigorous.exercise = vigorous.exercise,
                light.intensity.household = light.intensity.household,
                moderate.vigorous.household = moderate.vigorous.household,
                weight.training = weight.training, sitting.other.than.tv = sitting.other.than.tv,
                television.sitting = television.sitting, sleep = sleep)

################################################################################

# Begin specific cases of physical activity that are of interest:
# 2018 recommended levels, an inactive person and active with high sitting

###############################################################################


#Put in the physical behaviors at recommended levels  ----------------------------
# Get physical behavior score for 2018 recommended physical behviors:  -------------------
moderate.exercise = 7.5  # Moderate exercise (MET-hr/wk)
vigorous.exercise = 0 # Vigorous exercise (MET-hr/wk)
light.intensity.household = 2.5 # Light-intensity Household (MET-hr/wk)
moderate.vigorous.household  = 2 # Moderate-vigorous Household (MET-hr/wk)
weight.training = 0 # Weight Training (MET-hr/wk)
sitting.other.than.tv = 3.0 # Sitting other than TV (hr/day)
television.sitting = 3 # Television sitting (hr/day)
sleep = 7 # Sleep (hr/day)

total.score.recommended = calculate_score(moderate.exercise = moderate.exercise, vigorous.exercise = vigorous.exercise,
                                     light.intensity.household = light.intensity.household,
                                     moderate.vigorous.household = moderate.vigorous.household,
                                     weight.training = weight.training, sitting.other.than.tv = sitting.other.than.tv,
                                     television.sitting = television.sitting, sleep = sleep)

#Put in the physical behaviors for inactive person  ----------------------------
moderate.exercise = 0  # Moderate exercise (MET-hr/wk)
vigorous.exercise = 0 # Vigorous exercise (MET-hr/wk)
light.intensity.household = 2 # Light-intensity Household (MET-hr/wk)
moderate.vigorous.household  = 2 # Moderate-vigorous Household (MET-hr/wk)
weight.training = 0 # Weight Training (MET-hr/wk)
sitting.other.than.tv = 10 # Sitting other than TV (hr/day)
television.sitting = 7 # Television sitting (hr/day)
sleep = 6 # Sleep (hr/day)

total.score.inactive = calculate_score(moderate.exercise = moderate.exercise, vigorous.exercise = vigorous.exercise,
                                          light.intensity.household = light.intensity.household,
                                          moderate.vigorous.household = moderate.vigorous.household,
                                          weight.training = weight.training, sitting.other.than.tv = sitting.other.than.tv,
                                          television.sitting = television.sitting, sleep = sleep)

# Put in the physical behaviors for active person but high sitting  ----------------------------
moderate.exercise = 7.5  # Moderate exercise (MET-hr/wk)
vigorous.exercise = 0 # Vigorous exercise (MET-hr/wk)
light.intensity.household = 2.5 # Light-intensity Household (MET-hr/wk)
moderate.vigorous.household  = 2 # Moderate-vigorous Household (MET-hr/wk)
weight.training = 0 # Weight Training (MET-hr/wk)
sitting.other.than.tv = 5 # Sitting other than TV (hr/day)
television.sitting = 9 # Television sitting (hr/day)
sleep = 6 # Sleep (hr/day)

total.score.high.sit = calculate_score(moderate.exercise = moderate.exercise, vigorous.exercise = vigorous.exercise,
                                       light.intensity.household = light.intensity.household,
                                       moderate.vigorous.household = moderate.vigorous.household,
                                       weight.training = weight.training, sitting.other.than.tv = sitting.other.than.tv,
                                       television.sitting = television.sitting, sleep = sleep)


################################################################################

# Users can enter their own custom physical activity values to see the 
# assigned physical behavior score.
# All values are set to 0 as a placeholder

################################################################################
moderate.exercise = 0  # Moderate exercise (MET-hr/wk)
vigorous.exercise = 0 # Vigorous exercise (MET-hr/wk)
light.intensity.household = 0 # Light-intensity Household (MET-hr/wk)
moderate.vigorous.household  = 20# Moderate-vigorous Household (MET-hr/wk)
weight.training = 0 # Weight Training (MET-hr/wk)
sitting.other.than.tv = 0 # Sitting other than TV (hr/day)
television.sitting = 0 # Television sitting (hr/day)
sleep = 0 # Sleep (hr/day)

total.score.inactive = calculate_score(moderate.exercise = moderate.exercise, vigorous.exercise = vigorous.exercise,
                                       light.intensity.household = light.intensity.household,
                                       moderate.vigorous.household = moderate.vigorous.household,
                                       weight.training = weight.training, sitting.other.than.tv = sitting.other.than.tv,
                                       television.sitting = television.sitting, sleep = sleep)
