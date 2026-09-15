// This is a basic Flutter login screen implementation with email and password fields, including validation and styling.
import 'package:flutter/material.dart';

// Entry point of the application.
// The main function initializes the app by running the MyApp widget.
void main() {
  runApp(const MyApp());
}

// The MyApp class is a stateless widget that serves as the root of the application.
// It returns a MaterialApp widget with the LoginScreen as its home.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override // The build method describes how to display the widget in terms of other, lower-level widgets.
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

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

  static const green = Color(0xFF2E8437);
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
                        color: Color(0xFF202020),
                      ),
                    ),
                    SizedBox(height: 4), // The SizedBox widget is used to create vertical spacing between the "Welcome Back" text and the "Sign in to your account" text.
                    Text(
                      'Sign in to your account',
                      style: TextStyle(fontSize: 15, color: Color(0xFF666666)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20), // The SizedBox widget is used to create vertical spacing between the welcome message and the email label.

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
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: const TextStyle(
                      color: Color(0xFF777777),
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
                      borderRadius: BorderRadius.circular(15),
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

              const SizedBox(height: 20), // The SizedBox widget is used to create vertical spacing between the email label and the password label.

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

              TextField(
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(
                    color: Color(0xFF777777),
                    fontSize: 20,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xFF777777),
                    size: 27,
                  ),
                  // The suffixIcon is an IconButton that toggles the visibility of the password when pressed. It changes the icon between visibility and visibility_off based on the obscurePassword state.
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xFF777777),
                    ),
                    onPressed: () {
                      setState(() => obscurePassword = !obscurePassword); // This toggles the obscurePassword state, which controls whether the password is obscured or visible.
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
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







// how to declare a variable in dart
// In Dart, you can declare a variable using the `var`, 
//`final`, or `const` keywords, depending on whether the 
//variable's value can change or not. Here are some examples:
// var name = "John";
// final age = 30; // This variable cannot be reassigned after
// its initial value is set.
// const pi = 3.14; // This variable 
//is a compile-time constant and cannot
  //be reassigned or modified.
  
  //ternary operator in dart
  // The ternary operator in Dart 
  //is a shorthand way of writing an if-else
  // statement
  // It takes three operands: a condition,
  // a value to return if the condition is true, 
  //and a value to return if the condition is false.
  // Here's an example:
  // int number = 10;
  // String result = (number > 0) ? "Positive" : "Negative";
  // In this example, the condition (number > 0) is true,
  // so the value of result will be "Positive". 
  
  //for loop in dart
  // A for loop in Dart is used to execute a block of code
  // repeatedly for a specified number of times.
  // Here's an example:
  // for (int i = 0; i < 5; i++) {
  //   print(i);
  // }    

  //explain while and do while loop in dart
  // A while loop in Dart is used to execute a block of code
  // repeatedly as long as
  // a specified condition is true. The condition is checked 
  //before each iteration of the loop. Here's an example:
  // int i = 0;
  // while (i < 5) {
  //   print(i);
  //   i++;
  // }
  
  // A do-while loop in Dart is similar to a while loop, but the condition is checked 
  //after each iteration of the loop. This means that the block of code will always be executed at least once. Here's an example:
  // int j = 0;
  // do {
  //   print(j);
  //   j++;
  // } while (j < 5);   
  // In this example, the block of code will be executed 
  //once before checking the condition (j < 5).
  // The loop will continue to execute as long as the condition is true.
  // The main difference between a while loop and a do-while loop is that a while loop checks the condition before executing the block of code, while a do-while loop checks the condition after executing the block of code.