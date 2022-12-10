import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopapp/common/widgets/custom_button.dart';
import 'package:shopapp/common/widgets/custom_textfield.dart';
import 'package:shopapp/constants/global_variable.dart';
enum Auth{signup , signin}
class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth= Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const Text("Welcome",style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500
          ),),
          ListTile(
            tileColor: _auth==Auth.signup?GlobalVariable.backgroundColor:GlobalVariable.greyBackgroundCOlor,
            title: const Text("Create Account",
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Radio(
              activeColor: GlobalVariable.secondaryColor,
              value: Auth.signup, 
              groupValue: _auth, onChanged: (Auth? val){
                setState(() {
                  _auth = val!;
                });
              }),
          ),
          if(_auth==Auth.signup)
          Container(
            padding: const EdgeInsets.all(8.0),
            color: GlobalVariable.backgroundColor,
            child: Form(
              key: _signUpFormKey,
              child: Column(
              children: [
                CustomTextField(hintText: "Name",controller: _nameController),
                const SizedBox(height: 10,),
                CustomTextField(hintText: "Email",controller: _emailController),
                const SizedBox(height: 10,),
                CustomTextField(controller: _passwordController, hintText: "Password"),
                const SizedBox(height: 10,),
                CustomButton(text: 'Sign Up', onTap: (){})
              ],
            )),
          ),
           ListTile(
             tileColor: _auth==Auth.signin?GlobalVariable.backgroundColor:GlobalVariable.greyBackgroundCOlor,
            title: const Text("Sign-in.",
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: Radio(
              activeColor: GlobalVariable.secondaryColor,
              value: Auth.signin, 
              groupValue: _auth, onChanged: (Auth? val){
                setState(() {
                  _auth = val!;
                });
              }),
          ),
          if(_auth==Auth.signin)
          Container(
            padding: const EdgeInsets.all(8.0),
            color: GlobalVariable.backgroundColor,

            child: Form(
              key: _signInFormKey,
              child: Column(
              children: [
                CustomTextField(controller: _emailController, hintText: 'Email'),
                const SizedBox(height: 10,),
                CustomTextField(controller: _passwordController, hintText: 'password'),
                const SizedBox(height: 10,),
                CustomButton(text: 'sign In', onTap: (){})

              ],
            )),
          )
        ],),
      )),
    );
  }
}