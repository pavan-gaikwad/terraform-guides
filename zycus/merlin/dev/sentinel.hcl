import "tfrun"
# The standard decimal import
import "decimal"

limit_proposed_monthly_cost = func(limit) {

  # Check whether cost estimate is available
  # It should be for Terraform 0.12.x
  # It should not be for Terraform 0.11.x
  if tfrun.cost_estimate else null is null {
    print("No cost estimates available")
    # Allow the policy to pass
    return true
  }

  # Determine proposed monthly cost
  proposed_cost = decimal.new(tfrun.cost_estimate.proposed_monthly_cost)

  # Compare proposed monthly cost to the limit
  if proposed_cost.lte(limit) {
    print("Proposed monthly cost", proposed_cost.string,
          "is under the limit:", limit.string)
    return true
  } else {
    print("Proposed monthly cost", proposed_cost.string,
          "is over the limit:", limit.string)
    return false
  }
}

# Monthly Limit
limit = decimal.new(10)

# Call the validation function
# Warnings will be printed for violations
cost_validated = limit_proposed_monthly_cost(limit)

# Main rule
main = rule {
  cost_validated
}
