import 'package:flutter/material.dart';
import 'package:tyncad_test/models/user.dart';
import 'package:tyncad_test/screens/create_account/create_account.dart';
import 'package:tyncad_test/screens/feed_screen/feed_screen.dart';
import 'package:tyncad_test/services/api.dart';
import 'package:tyncad_test/widgets/custom_button.dart';
import 'package:tyncad_test/widgets/custom_text_field.dart';
import 'package:tyncad_test/widgets/text_action.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  
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
                child: Text("Log In",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),

              CustomTextField(
                  controller: email,
                hintText: "Email",
              ),
              CustomTextField(
                  controller: password,
                hintText: "Password",
                obscure: true
              ),

              CustomButton(
                  text: "Sign in",
                onTap: () async{
                  // User? user = await Api().login(email: email.text, password: password.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> FeedScreen()
                      )
                  );
                },
              ),



              TextAction(
                  label: "Don't have an account?",
                  actionLabel: "Create Account",
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const CreateAccount()
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
