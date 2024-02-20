import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'login_page.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  Color customColor = const Color(0xFF5F7C8D);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  ///input pass
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 10.0),
            child: Row(
              children: [
                GradientAnimationText(
                    text: Text(
                      "Hello,",
                      style: GoogleFonts.istokWeb(
                        fontSize: 54,
                        fontWeight: FontWeight.w700,
                        color: customColor,
                      ),
                    ),
                    colors: const [
                      Color(0xFF5F7C8D),
                      Color(0xFF5fffff),
                    ],
                    duration: const Duration(seconds: 4)),
                const SizedBox(width: 15.0),
                Text(
                  "Guyss!",
                  style: GoogleFonts.istokWeb(
                    fontSize: 44,
                    fontWeight: FontWeight.w200,
                    color: customColor,
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 5,
                    color: customColor,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: customColor,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.moiraiOne(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: customColor
                    ),
                  ),
                ),

                const Icon(
                  Icons.mail_lock,
                  size: 50,
                ),

                TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    "SignUp",
                    style: GoogleFonts.moiraiOne(
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                        color: customColor
                    ),
                  ),
                ),

                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: customColor,
                  ),
                ),

              ],

            ),
          ),

          const SizedBox(height: 20.0),

          Column(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    // prefixIcon: Icon(Icons.account_box),
                    labelText: 'Enter your SureName',
                    hintText: 'Full name',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    // prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Enter your email',
                    hintText: 'example@gmail.com',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: TextField(
                  obscureText: _isHidden,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.key),
                    suffixIcon: IconButton(
                        onPressed: _toggleVisibility,
                        icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off)),
                    labelText: 'Enter Your Password',
                    hintText: 'Ssst!!!',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 30),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "forgot password?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: customColor,
                  ),
                  child: Text(
                    "Register",
                    style: GoogleFonts.istokWeb(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: customColor,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Or Continue With",
                        style: TextStyle(color: customColor),
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: customColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(90, 50),
                      ),
                      child: Image.asset("images/fb.png"),
                    ),

                    const SizedBox(width: 40,),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(90, 50),
                      ),
                      child: Image.asset("images/google.png"),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
    );
  }
}
