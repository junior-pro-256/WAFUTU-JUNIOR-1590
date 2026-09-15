import 'package:flutter/material.dart';

// The LoginScreen class is a stateful widget that represents the login screen of the application.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState(); // The createState method creates the mutable state for this widget, which is represented by the _LoginScreenState class.
}

// The _LoginScreenState class manages the state of the LoginScreen widget, including the visibility of the password and the focus state of the email field.
class _LoginScreenState extends State<LoginScreen> {
  bool obscurePassword = true;
  // This boolean variable controls whether the password is obscured (hidden) or visible in the password TextField.
  bool emailFocused = false;
  // This boolean variable tracks whether the email TextField is currently focused, which affects its border color.

  static const green = Color.fromARGB(255, 105, 209, 116);
  // The build method describes how to display the LoginScreen widget in terms of other, lower-level widgets.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 253, 253),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30), // The Padding widget adds horizontal padding of 45 pixels on both sides of the child widget, which is the Column containing the login form elements.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 1), // The Spacer widget is used to create flexible empty space in the Column. It takes up 3 parts of the available space, pushing the content down.

              const Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 38, 37, 37),
                      ),
                    ),
                    SizedBox(height: 4), // The SizedBox widget is used to create vertical spacing between the "Welcome Back" text and the "Sign in to your account" text.
                    Text(
                      'Sign in to your account',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 105, 102, 102),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10), // The SizedBox widget is used to create vertical spacing between the welcome message and the email label.

              const Text(
                'Email ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // The Transform.translate widget is used to position the red asterisk (*) next to the "Email" label, indicating that it is a required field.
              Transform.translate(
                offset: const Offset(60, -37), // The offset moves the asterisk to the right and slightly up to align it with the "Email" label.
                child: const Text(
                  '*',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // The Focus widget is used to manage the focus state of the email TextField. It allows us to change the border color when the field is focused.
              Focus(
                onFocusChange: (focused) {
                  setState(() => emailFocused = focused);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 37, 37, 37),
                        fontSize: 20,
                      ),
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                        color: green,
                        size: 27,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10), // The contentPadding property adds vertical padding inside the TextField to make it taller and more visually appealing.
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: emailFocused ? green : const Color(0xFFDDDDDD),
                          width: emailFocused ? 4 : 1.2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: green, width: 4),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10), // The SizedBox widget is used to create vertical spacing between the email label and the password label.

              const Text(
                'Password ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Transform.translate(
                offset: const Offset(105, -37), // The offset moves the asterisk to the right and slightly up to align it with the "Password" label.
                child: const Text(
                  '*',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 0.3),

              TextField(
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 41, 40, 40),
                    fontSize: 20,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 48, 49, 49),
                    size: 27,
                  ),
                  // The suffixIcon is an IconButton that toggles the visibility of the password when pressed. It changes the icon between visibility and visibility_off based on the obscurePassword state.
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: const Color.fromARGB(255, 62, 63, 62),
                    ),
                    onPressed: () {
                      setState(() => obscurePassword = !obscurePassword); // This toggles the obscurePassword state, which controls whether the password is obscured or visible.
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                  // The contentPadding property adds vertical padding inside the TextField to make it taller and more visually appealing.
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDDDDD),
                      width: 1.2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: green, width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 15), // The SizedBox widget is used to create vertical spacing between the password field and the "Forgot Password?" button.

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 15,
                      color: green,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15), // The SizedBox widget is used to create vertical spacing between the "Forgot Password?" button and the "Sign In" button.

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Add sign-in logic here.
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30), // The SizedBox widget is used to create vertical spacing between the "Sign In" button and the "Don't have an account? Sign Up" text.

              Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 18, color: Color(0xFF666666)),
                    children: [
                      TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
