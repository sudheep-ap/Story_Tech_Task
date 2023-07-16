// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:todo_app/data/db/functions/db_functions.dart';

// Authentication userDataInstance = Authentication();

class Authentication {
  final firstName;
  final lastName;
  final gender;
  final email;
  final password;

  Authentication(
      {this.firstName, this.lastName, this.gender, this.email, this.password});
}

class User {
  //To save registered data
  registerUser(String userFirstName, String userLastName, String userGender,
      String userEmail, String userPassword) async {
    await addUserDetails(
        userFirstName, userLastName, userGender, userEmail, userPassword);
  }

  logOutUser() async {
    await clearUserDetails();
  }
}
