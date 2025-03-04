import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool obscureTextTrue = true;
  bool obscureTextConfirmTrue = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Field
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Some Text";
                }
                if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
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

            // Password Field
            TextFormField(
              controller: _passwordController,
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
              height: 15.0,
            ),

            // Confirm Password Field
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: obscureTextConfirmTrue,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Confirm Your Password";
                }
                if (value != _passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureTextConfirmTrue = !obscureTextConfirmTrue;
                    });
                  },
                  child: Icon(
                    Icons.remove_red_eye_sharp,
                    size: 20,
                    color: obscureTextConfirmTrue ? Colors.grey : Colors.blue,
                  ),
                ),
                hintText: "Confirm Your Password",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  // If all is good, show "Signup Successful"
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Signup Successful')),
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
