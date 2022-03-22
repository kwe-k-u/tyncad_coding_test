import 'package:flutter/material.dart';
import 'package:tyncad_test/models/user.dart';
import 'package:tyncad_test/screens/feed_screen/feed_screen.dart';
import 'package:tyncad_test/screens/sign_in/sign_in.dart';
import 'package:tyncad_test/services/api.dart';
import 'package:tyncad_test/widgets/custom_button.dart';
import 'package:tyncad_test/widgets/custom_text_field.dart';
import 'package:tyncad_test/widgets/text_action.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Sign Up",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),

              CustomTextField(
                controller: firstName,
                hintText: "First Name",
              ),

              CustomTextField(
                controller: lastName,
                hintText: "Last Name",
              ),


              CustomTextField(
                controller: email,
                hintText: "Email",
              ),

              CustomTextField(
                controller: password,
                hintText: "Password",
              ),

              CustomTextField(
                  controller: confirmPassword,
                  hintText: "Confirm Password",
                  obscure: true
              ),

              CustomTextField(
                controller: phoneNumber,
                hintText: "Phone Number",
              ),

              CustomButton(
                text: "Create Account",
                onTap: () async{
                  User? user = await Api().createAccount(
                      email: email.text,
                      password: password.text,
                    firstName: firstName.text,
                    lastName: lastName.text,
                    phoneNumber: phoneNumber.text,
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> FeedScreen()
                      )
                  );
                },
              ),
              
              TextAction(
                  label: "Already have an account?", 
                  actionLabel: "Log IN",
                  onTap: (){
                    Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=> const SignIn()
                        )
                    );
                  }
              )
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }
}
