#!/usr/bin/env python

import math
import re

def mortgage_calculator(principal, rate, years):
    r = rate/12/100
    n = years*12
    monthly_payment = principal*((r*(1+r)**n)/(((1+r)**n)-1))
    remaining_balance = principal
    interest_paid = 0
    payments = []
    total_interest_paid=0
    for i in range(1, n+1):
        interest = remaining_balance * r
        principal_paid = monthly_payment - interest
        remaining_balance -= principal_paid
        interest_paid += interest
        total_interest_paid=total_interest_paid+interest
        payments.append({
            'month': i, 
            'monthly_payment': round(monthly_payment, 2), 
            'principal_paid': round(principal_paid, 2),
            'interest_paid': round(interest, 2),
            'remaining_balance': round(remaining_balance, 2),
            'total_interest_paid': round(total_interest_paid, 2) 
        })
    return payments

print("*"*12, " Welcome to the Mortgage Caculator ", "*"*12, "\n\n")

principal = input("Please enter the principal of the mortgage: ")
while not bool(re.match("^[0-9]+(\.[0-9]{1,2})?$", principal)):
    principal = input("Invalid input. Please enter a valid principal amount: ")
principal = float(principal)

rate = input("\nPlease enter the interest rate of the mortgage: ")
while not bool(re.match("^[0-9]+(\.[0-9]{1,2})?$", rate)):
    rate = input("Invalid input. Please enter a valid interest rate: ")
rate = float(rate)

years = input("\nPlease enter the number of years of the mortgage: ")
while not bool(re.match("^[0-9]+$", years)):
    years = input("Invalid input. Please enter a valid number of years: ")
years = int(years)

table = mortgage_calculator(principal, rate, years)

print("\n\n\n{:<12}{:<12}{:<12}{:<12}{:<12}{:<12}".format("Month", "Payment", "Principal", "Interest", "Remaining", "Total Interest"))
totalinterestpaid=0
for payment in table:
    print("{:<12}{:<12}{:<12}{:<12}{:<12}{:<12}".format(payment['month'], payment['monthly_payment'], payment['principal_paid'], payment['interest_paid'], payment['remaining_balance'], payment['total_interest_paid']))
