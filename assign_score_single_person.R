
calculate_score = function(moderate.exercise, vigorous.exercise, light.intensity.household,
                           moderate.vigorous.household, weight.training,
                           sitting.other.than.tv, television.sitting, sleep){
  
  # Calculates the total Physical Behavior Score and the score for all the individual components 
  # for a single person.
  #
  # Args:
  #   moderate.exercise: reported moderate exercise in MET-hr/wk
  #   vigorous.exercise: reported vigorous exercise in MET-hr/wk
  #   light.intensity.household: reported light-intensity Household in MET-hr/wk
  #   moderate.vigorous.household: reported moderate-vigorous Household in MET-hr/wk
  #   weight.training: reported weight Training in MET-hr/wk
  #   sitting.other.than.tv: reported sitting other than TV in hr/day
  #   television.sitting: reported television sitting in hr/day
  #   sleep: reported leep (hr/day)
  #
  # Returns:
  #   the total physical behavior score
  #   Prints total Physical Behavior Score and score by component
  
  moderate.score = score_functions$`Moderate Activity`(moderate.exercise)
  vigorous.score = score_functions$`Vigorous Activity`(vigorous.exercise)
  light.household.score = score_functions$`Light Household Activity`(light.intensity.household)
  moderate.vigorous.household.score = score_functions$`MVPA Household Activity`(moderate.vigorous.household)
  weight.training.score = score_functions$`Weight Training`(weight.training)
  sitting.not.TV.score = score_functions$`Hours Sitting Other than TV`(sitting.other.than.tv)
  tv.sitting.score = score_functions$`Hours of TV Sitting`(television.sitting)
  sleep.score = score_functions$`Hours of Sleep`(sleep)
  
  total.PBS = sum(moderate.score, vigorous.score, light.household.score, 
                  moderate.vigorous.household.score,
                  weight.training.score, sitting.not.TV.score, tv.sitting.score, 
                  sleep.score)
  
  # Print the total score, rounded to two decimal places
  print(paste("Total PBS Score is:", round(total.PBS,2)))
  print("-------------------------------")
  
  # Print the individual score components
  print("This score is made up of:")
  print(paste("Moderate Activity:", round(moderate.score,2)))
  print(paste("Vigorous Activity:", round(vigorous.score,2)))
  print(paste("Light Household Activity:", round(light.household.score,2)))
  print(paste("Moderate-Vigorous Household Activity:", 
              round(moderate.vigorous.household.score,2)))
  print(paste("Weight Training:", 
              round(weight.training.score,2)))
  print(paste("Sitting other than TV:", round(sitting.not.TV.score,2)))
  print(paste("Television sitting:", round(tv.sitting.score,2)))
  print(paste("Sleep:", round(sleep.score,2)))
  
  # Get health outcomes associated with this score -------------
  # This is the coefficient for the PBS in a Cox Model using the NIH-AARP dataset from the paper
  cox.coefficient = -0.02742
  # This is the median score assigned to people in the NIH-AARP Dataset
  median.score = 76.41301
  fifth.quantile = 53.5
  relative.hazard.ratio.at.zero = exp(cox.coefficient * (total.PBS - fifth.quantile))
  relative.hazard.ratio.at.median = exp(-0.02742 * (total.PBS - median.score))
  
  print(paste("This score has a hazard ratio of", round(relative.hazard.ratio.at.zero,2), 
              "when compared to a score at the 5th percentile (PBS = 53.5)"))
  
  print(paste("This score has a hazard ratio of", round(relative.hazard.ratio.at.median,2), 
              "when compared to the median score in the NIH-AARP dataset"))
  
  return(total.PBS)
}
