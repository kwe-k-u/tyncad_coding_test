import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tyncad_test/models/app_state.dart';


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
                  child: const CircleAvatar(
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
                      value: context.read<AppState>().user.fullName
                  ),

                  const _AccountStatusText(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _InfoLabel(
                    width: size.width *0.42,
                      label: "First Name",
                      value: context.read<AppState>().user.fullName
                  ),
                  _InfoLabel(
                    width: size.width * 0.42,
                      label: "Last Name",
                      value: context.read<AppState>().user.lastName
                  ),
                ],
              ),


              _InfoLabel(
                  label: "Email",
                  value: context.read<AppState>().user.email
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _InfoLabel(
                    width: size.width * 0.42,
                      label: "phone number",
                      value: context.read<AppState>().user.phoneNumber
                  ),

                  _InfoLabel(
                      width: size.width * 0.42,
                      label: "Date Created",
                      value: DateFormat.yMMMd().format(context.read<AppState>().user.dateCreated)
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
      padding: const EdgeInsets.all(8) - const EdgeInsets.only(top: 8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        border: const Border(
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






class _AccountStatusText extends StatelessWidget {
  const _AccountStatusText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.read<AppState>().user.isActive){
      return Text("Active",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
            color: Colors.green),
      );
    }

    return Text("InActive",
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.bold,
          color: Colors.purple),
    );
  }
}

