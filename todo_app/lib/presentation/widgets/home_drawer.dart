import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/screens/registration/sign_up_page.dart';
import 'package:todo_app/presentation/screens/todo/bloc/todo_bloc.dart';
import '../../data/core/constants.dart';
import '../../domian/user.dart';
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
              leading: const Icon(Icons.delete_outline_rounded),
              title: Text(
                'clear all data',
                style: TextStyle(
                    color: AppColors().kTextBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                context.read<ToDoBloc>().add(ClearAllListEvent());
                Navigator.pop(context);
              },
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
                User().logOutUser();
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
