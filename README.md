# Mortgage Calculator

A mortgage calculator implemented in multiple programming languages (BASIC, C++, and Python) that calculates monthly payments, interest, and amortization schedules for home loans.

## Features

- Monthly payment calculation
- Amortization schedule generation
- Interest and principal breakdown
- Total interest paid tracking
- Support for additional payments above minimum
- Input validation for loan parameters

## Implementations

### BASIC Version
- Original IBM PC implementation from 1981
- Supports mortgage comparisons across different rates
- Displays amortization tables for 12-month periods
- Menu-driven interface with visual formatting

### C++ Version
- Modern implementation with input validation
- Complete amortization schedule
- Structured output with formatted tables
- Additional payment support
- Uses vector container for payment tracking

### Python Version
- Clean, modern implementation
- Regular expression input validation
- Formatted currency output
- Additional payment support
- Dictionary-based payment records

## Usage

Each implementation prompts for:
- Principal amount
- Interest rate (annual percentage)
- Loan term (years)
- Additional monthly payment (optional)

### Running the Programs

BASIC:
```basic
LOAD "mortgage.bas"
RUN
```

C++:
```bash
g++ mortgage.cpp -o mortgage
./mortgage
```

Python:
```bash
python mortgage.py
# or
chmod +x mortgage.py
./mortgage.py
```

## Calculations

The monthly payment formula used across all implementations:
```
P = L * (r(1+r)^n)/((1+r)^n-1)

Where:
P = Monthly Payment
L = Loan Amount
r = Monthly Interest Rate (Annual Rate / 12)
n = Total Number of Months (Years * 12)
```

## Output Format

All versions display:
- Monthly payment breakdown
- Principal paid per payment
- Interest paid per payment
- Remaining balance
- Cumulative interest paid

## Input Validation

- Principal: Positive number with optional decimal places
- Interest Rate: Positive number between 0-100 with optional decimals
- Years: Positive integer
- Additional Payment: Non-negative number with optional decimals

