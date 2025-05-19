// ignore_for_file: avoid_print
import 'dart:io';

main() {
  var amount = 555;

  // ternary condition
  String result = amount >= 1000 ? "ami car e jabo": 
                  amount >= 500 ? "ami bike e jabo": 
                  amount >= 200 ? 'ami auto te jabo': 
                  "ami hete jabo";
  print(result);

  if (amount >= 1000) {
    print("Ame car e jbo");
  } else if (amount >= 500) {
    print("ame Bike jbo");
  } else if (amount >= 200) {
    print("ame rskw jbo");
  } else {
    print("ame hete jbo");
  }

  print("Enter Your User name:");
  String? username = stdin.readLineSync();

  print("Enter Your Password:");
  String? password = stdin.readLineSync();

  if (username == 'arnob' && password == '123456') {
    print("Login Successful");
  } else if (username == 'arnob' && password != '123456') {
    print("User name is correct \n Try correct password");
  } else if (username != 'arnob' && password == '123456') {
    print("password is correct \n Try correct username");
  } else {
    print("Wrong info...! Try again");
  }


  print((username == 'arnob' && password == '123456') ? "Login Successful" :
        (username == 'arnob' && password != '123456') ? "User name is correct \n Try correct password" :
        (username != 'arnob' && password == '123456') ? "password is correct \n Try correct username" :
        "Wrong info...! Try again");
}
