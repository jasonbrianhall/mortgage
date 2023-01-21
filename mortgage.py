import math

def mortgage_calculator(principal, interest_rate, years):
    # calculate the monthly interest rate
    monthly_rate = interest_rate / 12
    # calculate the total number of payments
    total_payments = years * 12
    # calculate the minimum monthly payment
    minimum_payment = (principal * monthly_rate) / (1 - math.pow((1 + monthly_rate), -total_payments))
    # initialize the remaining balance
    remaining_balance = principal
    # print the header
    print("Year\tRemaining Balance\tYearly Payment")
    # loop through each year
    for i in range(1, years+1):
        # loop through each month
        for j in range(1, 13):
            # calculate the interest for the month
            interest = remaining_balance * monthly_rate
            # calculate the principal for the month
            principal_paid = minimum_payment - interest
            # update the remaining balance
            remaining_balance -= principal_paid
        # print the year, remaining balance, and yearly payment
        print(i, "\t", round(remaining_balance, 2), "\t\t", round(minimum_payment*12, 2))

# example usage
mortgage_calculator(100000, 0.05, 30)

