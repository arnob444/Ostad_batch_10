import 'dart:io';

main() {
  print("Enter Your User name:");
  String? username = stdin.readLineSync();

  print("Enter Your User password:");
  String? password = stdin.readLineSync();

  if (username == 'Arnob' && password == '123456') {
    print("Login Successful");
  } else if (username == 'hridoy' && password != '123456') {
    print("User name is correct \n Try correct password");
  } else if (username != 'hridoy' && password == '123456') {
    print("password is correct \n Try correct username");
  } else {
    print("Wrong info...! Try again");
  }
}
