import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:sawara_project/screenTwo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;
  final Color customButtonColor = const Color(0xFF68CCCA);
  bool isSubmitButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateInputs() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    setState(() {
      isSubmitButtonEnabled = email.isNotEmpty && _isValidEmail(email) && password.isNotEmpty;
    });
  }

  bool _isValidEmail(String email) {
    // Regular expression for validating email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> onPressed() async {
    const apiUrl = 'https://apiv2stg.promilo.com/user/oauth/token';
    const email = 'test45@yopmail.com';
    const password = 'Test@123';

    // Convert password to SHA256
    final hashedPassword = sha256.convert(utf8.encode(password)).toString();

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
      },
      body: {
        'username': email,
        'password': hashedPassword,
        'grant_type': 'password',
      },
    );

    if (response.statusCode == 200) {
      // Successful login
      print('Login successful!');
      print('Response: ${response.body}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessPage()),
      );

    } else {
      print('Error: Invalid ID Password');

    }
  }

  void _onRememberMeChanged(bool? newValue) {
    if (newValue != null) {
      setState(() {
        rememberMe = newValue;
      });
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Promilo",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),),
                SizedBox(height: 30),
                Text("Hi, Welcome Back!",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text(
                          "Please Sign In to Continue",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Enter Email or Mob No",
                            border: InputBorder.none, // Remove underline
                            errorText: _emailController.text.isNotEmpty &&
                                !_isValidEmail(_emailController.text)
                                ? 'Please enter a valid email'
                                : null,
                          ),

                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:260),
                  child: const Text("Sign In using OTP",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            border: InputBorder.none, // Remove underline
                          ),
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: _onRememberMeChanged,
                    ),
                    Text("Remember Me"),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right:20),
                      child: const Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                    ),
                  ],
                ),
                SizedBox(height: 20),
            Container(
              width: 380,
              height: 60,// Match the parent width
              child: ElevatedButton(
                onPressed: isSubmitButtonEnabled ? onPressed : null,
                child: Text("Submit",style: TextStyle(fontSize: 25,color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: customButtonColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue,width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      height: 1,
                      width: 150,
                      color: Colors.grey.shade300,
                    ),
                    Text("or"),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      height: 1,
                      width: 150,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.google),
                      color: Colors.green,
                      onPressed: () {
                        // onPressed action for icon1
                      },
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.linkedin),
                      color: Colors.blue,
                      onPressed: () {
                        // onPressed action for icon2
                      },
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.facebook),
                      color: Colors.blueAccent,
                      onPressed: () {

                      },
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      onPressed: () {

                      },
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.whatsapp),
                      color: Colors.green.shade500,
                      onPressed: () {

                      },
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                    Text("Business User?"),
                    Spacer(),
                    Text("Don't have an account"),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8),
                  child: Row(
                    children: [
                      Text("Login Here",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text("Sign Up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                    ],),
                ),
                Text("By Continuing you agree to",style: TextStyle(color: Colors.grey,),),
                RichText(
                  text: TextSpan(
                    text: 'Promilo\'s ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms of Use and Privacy Policy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }