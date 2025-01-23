#include <iostream>
#include <iomanip>
#include <cmath>
#include <vector>
#include <regex>
#include <string>

struct Payment {
    int month;
    double monthly_payment;
    double principal_paid;
    double interest_paid;
    double remaining_balance;
    double total_interest_paid;
};

std::vector<Payment> mortgage_calculator(double principal, double rate, int years, double additionalPayment = 0) {
    double r = rate / 12 / 100;
    int n = years * 12;
    double monthly_payment = principal * ((r * pow(1 + r, n)) / (pow(1 + r, n) - 1)) + additionalPayment;
    double remaining_balance = principal;
    double interest_paid = 0;
    double total_interest_paid = 0;
    std::vector<Payment> payments;

    for (int i = 1; i <= n; i++) {
        double interest = remaining_balance * r;
        double principal_paid = monthly_payment - interest;
        remaining_balance -= principal_paid;
        interest_paid += interest;
        total_interest_paid += interest;

        payments.push_back({
            i,
            round(monthly_payment * 100) / 100,
            round(principal_paid * 100) / 100,
            round(interest * 100) / 100,
            round(remaining_balance * 100) / 100,
            round(total_interest_paid * 100) / 100
        });
    }
    return payments;
}

bool is_valid_number(const std::string& input, bool allow_decimals = true) {
    std::regex pattern(allow_decimals ? "^[0-9]+(\\.[0-9]{1,2})?$" : "^[0-9]+$");
    return std::regex_match(input, pattern);
}

int main() {
    std::string input;
    double principal, rate, additionalPayment;
    int years;

    std::cout << std::string(12, '*') << " Welcome to the Mortgage Calculator " << std::string(12, '*') << "\n\n";

    do {
        std::cout << "Please enter the principal of the mortgage (e.g. 100000): ";
        std::getline(std::cin, input);
    } while (!is_valid_number(input));
    principal = std::stod(input);

    do {
        std::cout << "\nPlease enter the interest rate of the mortgage (e.g. 2.25 for 2.25%): ";
        std::getline(std::cin, input);
    } while (!is_valid_number(input));
    rate = std::stod(input);

    do {
        std::cout << "\nPlease enter the number of years of the mortgage: ";
        std::getline(std::cin, input);
    } while (!is_valid_number(input, false));
    years = std::stoi(input);

    do {
        std::cout << "\nPlease enter any additional payment above the minimum (enter 0 for none): ";
        std::getline(std::cin, input);
    } while (!is_valid_number(input));
    additionalPayment = std::stod(input);

    auto table = mortgage_calculator(principal, rate, years, additionalPayment);

    std::cout << "\n\n\n";
    std::cout << std::left 
              << std::setw(12) << "Month" << "\t"
              << std::setw(12) << "Payment" << "\t"
              << std::setw(12) << "Principal" << "\t"
              << std::setw(12) << "Interest" << "\t"
              << std::setw(12) << "Remaining" << "\t"
              << std::setw(12) << "Total Interest Paid" << "\n";

    for (const auto& payment : table) {
        std::cout << std::left
                  << std::setw(12) << std::to_string(payment.month) << "\t"
                  << std::setw(12) << "$" + std::to_string(payment.monthly_payment).substr(0, std::to_string(payment.monthly_payment).find(".") + 3) << "\t"
                  << std::setw(12) << "$" + std::to_string(payment.principal_paid).substr(0, std::to_string(payment.principal_paid).find(".") + 3) << "\t"
                  << std::setw(12) << "$" + std::to_string(payment.interest_paid).substr(0, std::to_string(payment.interest_paid).find(".") + 3) << "\t"
                  << std::setw(12) << "$" + std::to_string(payment.remaining_balance).substr(0, std::to_string(payment.remaining_balance).find(".") + 3) << "\t"
                  << std::setw(12) << "$" + std::to_string(payment.total_interest_paid).substr(0, std::to_string(payment.total_interest_paid).find(".") + 3) << "\n";
    }

    return 0;
}
