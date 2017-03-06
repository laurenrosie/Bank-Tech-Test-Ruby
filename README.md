# Bank (Ruby)

[![Coverage Status](https://coveralls.io/repos/github/laurenrosie/Bank-Tech-Test-Ruby/badge.svg?branch=master)](https://coveralls.io/github/laurenrosie/Bank-Tech-Test-Ruby?branch=master)
[![Build Status](https://travis-ci.org/laurenrosie/Bank-Tech-Test-Ruby.svg?branch=master)](https://travis-ci.org/laurenrosie/Bank-Tech-Test-Ruby)
## Specification

```
Actions
- A user can create an account
- A user can deposit money to the account
- A user can withdraw money from the account
- A user can view a statement for the account

Assumed Initial Constraints (In order to reach the acceptance criteria)
- The client is seen as inherent in the use of the Console (not its own model)
- A user cannot withdraw more than the current account balance
- The statement of an account shows all past transactions
- A user can specify the date of a transaction, if not it defaults to today's
  date
- The account statement shows transactions in reverse chronological order

Possible Later Additions
- A user can view a statement showing transactions within a specific date range
- Account can be created with a specified opening balance

```

## Model

**Models**
- Account
- Deposit
- Withdrawal
- Statement

**Discussion**

Deposits and a Withdrawals are both essentially *Transactions* in that
they will both have a Date, Amount, Initial Balance and New Balance. However,
with a view to future features they have been separated into different Models
here as they are subject to different constraints. This extracts the
responsibility of a *Transaction* being aware of its own type although
intuitively the two are very similar in structure.

The addition of the option of a specified date for withdrawals and deposits is
included in order to most closely replicate the acceptance criteria. In practice
the current date would be stored by default for each transaction, as occurs by
default if a date is not specified.

The account creation and therefore the initial balance is not shown in the
statement, only the transactions.


## User Interface

This will be accessed via the Javascript Console in any browser.  

```
> my_account = Account.new()
> my_account.deposit(200, "10/01/2016")
  £200 has been successfully deposited. The current balance is £200
> my_account.withdraw(50, "12/01/2016")
  £50 has been successfully withdrawn. The current balance is £150
> my_account.withdraw(300)
  This withdrawal could not be completed due to insufficient funds
> my_account.statement()
  date       || credit || debit   || balance
  12/01/2016 ||        || 50.00   || 150.00
  10/01/2016 || 200.00 ||         || 200.00
```
