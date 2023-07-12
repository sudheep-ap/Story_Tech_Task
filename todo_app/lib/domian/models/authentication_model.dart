// ignore_for_file: prefer_typing_uninitialized_variables

Authentication userDataInstance = Authentication();

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
  //To save  data
  registerUser(String userFirstName, String userLastName, String userGender,
      String userEmail, String userPassword) {
    userDataInstance = Authentication(
        firstName: userFirstName,
        lastName: userLastName,
        gender: userGender,
        email: userEmail,
        password: userPassword);

    return userDataInstance;
  }

//To extract data
  Map getUserData(Authentication data) {
    Map userData = {
      'firstName': data.firstName,
      'lastName': data.lastName,
      'gender': data.gender,
      'email': data.email,
      'password': data.password
    };
    return userData;
  }
}
