class UserModel {
  late String id;
  late String email;
  late String firstName;
  late String lastName;
  late String mobile;

  UserModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    email = jsonData['email'];
    firstName = jsonData['firstName'];
    lastName = jsonData['lastName'];
    mobile = jsonData['mobile'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
    };
  }
}
