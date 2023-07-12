// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../../data/core/constants.dart';

class TextFieldWidget extends StatelessWidget {
  final controller;
  final validatorMessage;
  final hintText;
  final prefixIcon;
  final isPassword;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.validatorMessage,
      required this.hintText,
      this.prefixIcon,
      this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors().klightGreyColor,
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          obscureText: isPassword ?? false,
          style: TextStyle(
              color: AppColors().kTextBlackColor,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String name) {},
          onTap: () {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMessage;
            } else if (hintText == 'Email' && !value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.blueGrey[600], //color???
            ), //icon change
            border: InputBorder.none,
            fillColor: Colors.black,
            hintText: hintText,
            hintStyle: const TextStyle(
                letterSpacing: 0.6, fontWeight: FontWeight.w400),
            counterText: '',
            contentPadding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
          )),
    );
  }
}
