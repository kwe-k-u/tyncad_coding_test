import 'dart:math';

import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                  height: size.height * 0.25,
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.account_circle),
                  )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _InfoLabel(
                    width: size.width * 0.73,
                      label: "Full Name",
                      value: "kwasi Amankwah"
                  ),

                  Text("Active"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _InfoLabel(
                    width: size.width *0.42,
                      label: "First Name",
                      value: "kwasi"
                  ),
                  _InfoLabel(
                    width: size.width * 0.42,
                      label: "Last Name",
                      value: "Amankwah"
                  ),
                ],
              ),


              _InfoLabel(
                  label: "Email",
                  value: "email@gmail.com"
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _InfoLabel(
                    width: size.width * 0.42,
                      label: "phone number",
                      value: "055958555"
                  ),

                  _InfoLabel(
                      width: size.width * 0.42,
                      label: "Date Created",
                      value: "2022-03-216Z"
                  ),
                ],
              ),

              // d": 5,
              // "email": "lucky3@gmail.com",
              // "username": "lucky3@gmail.com",
              // "is_active": true,
              // "is_blocked": false,
              // "date_created": "2022-03-21T17:26:41.689696Z",
              // "phone_number": "0247446039"

            ],
          ),
        )
    );
  }
}





class _InfoLabel extends StatelessWidget {
  final String label;
  final String value;
  final double? width;

  const _InfoLabel({
    Key? key,
    required this.label,
    required this.value,
    this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: width ?? size.width * 0.75,
      padding: EdgeInsets.all(8) - EdgeInsets.only(top: 8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        border: Border(
          left: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.black, width: 2)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelSmall,),
          Text(value)
        ],
      ),
    );
  }
}

