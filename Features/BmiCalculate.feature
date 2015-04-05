Feature: BMI Calculator has a Calculate Function

Scenario: Calculate BMI
	Given I am on BMI Calculator
	When I fill in the following:
	| heightCMS | 181 |
	| weight Kg | 80 |
	When I press "Calculate"
	Then I should see following
	| bmi | 24.4 |
	|bmi_category | Normal | 
