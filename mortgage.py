import math
import re

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
    print("Year\tRemaining Balance\tYearly Payment\tMonthly Payment\tInterest per year")
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
        print(i, "\t", round(remaining_balance, 2), "\t\t", round(minimum_payment*12, 2), "\t", round(minimum_payment, 2), "\t", round(interest*12,2))

# example usage

exittheloop=False

while exittheloop==False:
    print("How much is the initial principal:  ", end="")
    choice=input()
    if re.match("[0-9]+?(\.[0-9][0-o]?)?", choice):
        principal=float(choice)
        exittheloop=True
    else:
        print("** Not a valid float")
    
exittheloop=False
while exittheloop==False:
    print("How much is the interest rate:  ", end="")
    choice=input()
    if re.match("[0-9]+?(\.[0-9][0-o]?)?", choice):
        interestrate=float(choice)/100
        exittheloop=True
    else:
        print("** Not a valid float")

exittheloop=False
while exittheloop==False:
    print("How many years does this mortgage last:  ", end="")
    choice=input()
    if re.match("[0-9]+", choice):
        numberofyears=int(choice)
        exittheloop=True
    else:
        print("** Not a valid number of years")

print(principal, interestrate, numberofyears)
mortgage_calculator(principal, interestrate, numberofyears)

