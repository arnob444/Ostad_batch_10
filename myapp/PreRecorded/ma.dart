class BankAccount {
  String accountHolder;
  int accountNumber;
  double _balance = 0;

  double get Balance => _balance;

  BankAccount(this.accountHolder, this.accountNumber);

  deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print(
          'You Deposit: $amount Taka & your current balance is: $_balance Taka');
    } else {
      print('Invalid deposit amount. Please deposit higher then 0');
    }
  }

  withdraw(double amount) {
    if (_balance > 0) {
      if (amount <= _balance && amount > 0) {
        _balance -= amount;
        print(
            'Your Withdraw amount is: $amount Taka & Your current Balance: $_balance  Taka');
      } else {
        print('Invalid Withdraw amount');
      }
    } else {
      print("Insufficient Balance. Please Deposit");
    }
  }

  getBalance() {
    return _balance;
  }

  getDetails() {
    print("Account Holder: $accountHolder");
    print("Account Number: $accountNumber");
    print("Account Balance: $_balance");
  }
}

class SavingAccount extends BankAccount {
  double interestRate;

  @override
  SavingAccount(String accountHolder, int accountNumber, this.interestRate)
      : super(accountHolder, accountNumber);

  @override
  deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print(
          'You Deposit: $amount Taka & your current balance is: $_balance Taka');
    } else {
      print('Invalid deposit amount. Please deposit higher then 0');
    }
  }

  @override
  withdraw(double amount) {
    if (_balance > 0) {
      if (amount <= _balance && amount > 0) {
        _balance -= amount;
        print(
            'Your Withdraw amount is: $amount Taka & Your current Balance: $_balance  Taka');
      } else {
        print('Invalid Withdraw amount');
      }
    } else {
      print("Insufficient Balance. Please Deposit");
    }
  }

  @override
  getBalance() {
    return _balance;
  }

  @override
  getDetails() {
    print("Account Holder: $accountHolder");
    print("Account Number: $accountNumber");
    print("Account Balance: $_balance");
  }
}
