import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool obscureTextTrue = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Some Text";
                }
                if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return "Enter Valid Email";
                }
                return null;
              },
              enableSuggestions: true,
              autocorrect: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                hintText: "Enter Your Email",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Your Password";
                }
                if (value.length < 6) {
                  return "Password should be minimum 6 characters";
                }
                return null;
              },
              obscureText: obscureTextTrue,
              enableSuggestions: true,
              autocorrect: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureTextTrue = !obscureTextTrue;
                    });
                  },
                  child: Icon(
                    Icons.remove_red_eye_sharp,
                    size: 20,
                    color: obscureTextTrue ? Colors.grey : Colors.blue,
                  ),
                ),
                hintText: "Enter Your Password",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login Successful')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login Unsuccessful')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
