import 'package:flutter/material.dart';

import '../../screens/home_page.dart';
import '../util/custom_password_field.dart';
import '../util/custom_text_form_field.dart';
import 'google_sign_in_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController emailUsernameController;
  late final TextEditingController passwordController;

  static const _viewportFraction = 0.65;

  @override
  void initState() {
    super.initState();
    emailUsernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailUsernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: _viewportFraction * height,
          child: Card(
            color: Colors.grey.shade50,
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                primary: true,
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                            color: Colors.grey.shade800,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    CustomTextFormField(
                      "Email ID/Username",
                      TextFormField(
                        controller: emailUsernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade600,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade600,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomPasswordField(passwordController),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          splashColor: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(5),
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith(
                            (_) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          foregroundColor: MaterialStateColor.resolveWith(
                            (_) => Colors.grey.shade50,
                          ),
                          backgroundColor: MaterialStateColor.resolveWith(
                            (_) => Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MyHomePage(),
                            ),
                            (_) => false,
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.grey.shade50,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      indent: 24,
                      endIndent: 24,
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const GoogleSignInButton(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
