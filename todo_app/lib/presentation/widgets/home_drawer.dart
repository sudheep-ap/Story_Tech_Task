import 'package:flutter/material.dart';
import 'package:todo_app/data/db/functions/db_functions.dart';
import 'package:todo_app/domian/models/todo_model.dart';
import 'package:todo_app/presentation/screens/registration/sign_up_page.dart';

import '../../data/core/constants.dart';
import '../../main.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: AppColors().kBgTealColor,
              ),
              child: Center(
                child: Text(
                  '$custFirstName $custLastName',
                  style: TextStyle(
                      color: AppColors().kTextBlackColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.email_outlined),
              title: Text(
                custEmail,
                style: TextStyle(
                    color: AppColors().kTextBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person_pin_outlined),
              title: Text(custGender.toLowerCase(),
                  style: TextStyle(
                      color: AppColors().kTextBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app_outlined),
              title: Text(
                'Log Out',
                style: TextStyle(
                    color: AppColors().kTextBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                clearUserDetails();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
