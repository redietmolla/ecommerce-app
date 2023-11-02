import 'package:ecomm/common/widgets/custom_button.dart';
import 'package:ecomm/common/widgets/custom_textfield.dart';
import 'package:ecomm/constants/global_variables.dart';
import 'package:ecomm/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          tileColor:
                              _auth == (index == 0 ? Auth.signup : Auth.signin)
                                  ? GlobalVariables.backgroundColor
                                  : GlobalVariables.greyBackgroundCOlor,
                          title: Text(
                            index == 0 ? 'Create Account' : 'Sign-In',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Radio(
                            activeColor: GlobalVariables.secondaryColor,
                            value: index == 0 ? Auth.signup : Auth.signin,
                            groupValue: _auth,
                            onChanged: (Auth? val) {
                              setState(() {
                                _auth = val!;
                              });
                            },
                          ),
                        ),
                        if (_auth == (index == 0 ? Auth.signup : Auth.signin))
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: GlobalVariables.backgroundColor,
                            child: Form(
                              key: index == 0 ? _signUpFormKey : _signInFormKey,
                              child: Column(
                                children: [
                                  if (index == 0)
                                    CustomTextField(
                                      controller: _nameController,
                                      hintText: 'Name',
                                      keyboardType: TextInputType.name,
                                    ),
                                  const SizedBox(height: 10),
                                  CustomTextField(
                                    controller: _emailController,
                                    hintText: 'Email',
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextField(
                                    controller: _passwordController,
                                    hintText: 'Password',
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                  const SizedBox(height: 10),
                                  CustomButton(
                                    text: index == 0 ? 'Sign Up' : 'Sign In',
                                    onTap: () {
                                      if ((index == 0
                                              ? _signUpFormKey
                                              : _signInFormKey)
                                          .currentState!
                                          .validate()) {
                                        if (index == 0) {
                                          signUpUser();
                                        } else {
                                          signInUser();
                                        }
                                      }
                                    },
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
