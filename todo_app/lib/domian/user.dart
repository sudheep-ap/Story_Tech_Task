import '../data/db/functions/db_functions.dart';

class User {
  //To save registered data
  registerUser(String userFirstName, String userLastName, String userGender,
      String userEmail, String userPassword) async {
    await addUserDetails(
        userFirstName, userLastName, userGender, userEmail, userPassword);
  }

//To log out user
  logOutUser() async {
    await clearUserDetails();
  }
}
