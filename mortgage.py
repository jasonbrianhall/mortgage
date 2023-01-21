import math
import re

def mortgage_calculator(principal, rate, years):
    r = rate/12/100
    n = years*12
    monthly_payment = principal*((r*(1+r)**n)/(((1+r)**n)-1))
    remaining_balance = principal
    interest_paid = 0
    payments = []
    for i in range(1, n+1):
        interest = remaining_balance * r
        principal_paid = monthly_payment - interest
        remaining_balance -= principal_paid
        interest_paid += interest
        payments.append({
            'month': i, 
            'monthly_payment': round(monthly_payment, 2), 
            'principal_paid': round(principal_paid, 2),
            'interest_paid': round(interest, 2),
            'remaining_balance': round(remaining_balance, 2)
        })
    return payments

principal = input("Please enter the principal of the mortgage: ")
while not bool(re.match("^[0-9]+(\.[0-9]{1,2})?$", principal)):
    principal = input("Invalid input. Please enter a valid principal amount: ")
principal = float(principal)

rate = input("Please enter the interest rate of the mortgage: ")
while not bool(re.match("^[0-9]+(\.[0-9]{1,2})?$", rate)):
    rate = input("Invalid input. Please enter a valid interest rate: ")
rate = float(rate)

years = input("Please enter the number of years of the mortgage: ")
while not bool(re.match("^[0-9]+$", years)):
    years = input("Invalid input. Please enter a valid number of years: ")
years = int(years)

table = mortgage_calculator(principal, rate, years)

print("{:<12}{:<12}{:<12}{:<12}{:<12}".format("Month", "Payment", "Principal", "Interest", "Remaining"))
for payment in table:
    print("{:<12}{:<12}{:<12}{:<12}{:<12}".format(payment['month'], payment['monthly_payment'], payment['principal_paid'], payment['interest_paid'], payment['remaining_balance']))
