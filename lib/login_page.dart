import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:lottie/lottie.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return LoginPage();
          } else if (constraints.maxWidth <= 1200) {
            return LoginPage();
          } else {
            return LoginPageWeb();
          }
        },
      ),
    );
  }
}



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color customColor = const Color(0xFF5F7C8D);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void setDataUser(Map<String, dynamic> user) {
    _emailController.text = user['email'];
  }


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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only( left: 10.0),
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

                Lottie.asset("assets/hello.json"),

                Row(
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

                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.moiraiOne(
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
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
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "SignUp",
                        style: GoogleFonts.moiraiOne(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
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


                const SizedBox(height: 20.0),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
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
                          labelText: 'Enter Your Passwords',
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
                        onPressed: () async {
                          if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('yehhh!!'),
                                content: Text(' isi heula eta na tahhh!!\n ieu naa\n naon sih\n eta na tah, tekspild'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('syapp'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            final result = await Navigator.pushNamed(context, '/another', arguments: {
                              'email': _emailController.text,
                              'password': _passwordController.text
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customColor,
                        ),
                        child: Text(
                          "Login",
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(90, 50),
                            elevation: 5,
                          ),
                          child: Image.asset("images/fb.png"),
                        ),

                        const SizedBox(width: 40,),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(90, 50),
                            elevation: 5,
                          ),
                          child: Image.asset("images/google.png"),
                        ),

                      ],
                    ),
                    const SizedBox(height: 30.0,),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}

class LoginPageWeb extends StatefulWidget {
  const LoginPageWeb({super.key});

  @override
  State<LoginPageWeb> createState() => _LoginPageWebState();
}

class _LoginPageWebState extends State<LoginPageWeb> {
  Color customColor = const Color(0xFF5F7C8D);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void setDataUser(Map<String, dynamic> user) {
    _emailController.text = user['email'];
  }


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
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/bgWeb.jpg'),
              const SizedBox(width: 50.0,),
              SizedBox(
                width: 550,
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
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



                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        TextButton(
                          onPressed: () {

                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.moiraiOne(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
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
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            "SignUp",
                            style: GoogleFonts.moiraiOne(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: customColor
                            ),
                          ),
                        ),


                      ],

                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
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
                          labelText: 'Enter Your Passwords',
                          hintText: 'Ssst!!!',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 50),
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
                        onPressed: () async {
                          if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('yehhh!!'),
                                content: Text(' isi heula eta na tahhh!!\n ieu naa\n naon sih\n eta na tah, tekspild'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('syapp'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            final result = await Navigator.pushNamed(context, '/another', arguments: {
                              'email': _emailController.text,
                              'password': _passwordController.text
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customColor,
                        ),
                        child: Text(
                          "Login",
                          style: GoogleFonts.istokWeb(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
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

                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(90, 50),
                            elevation: 5,
                          ),
                          child: Image.asset("images/fb.png"),
                        ),

                        const SizedBox(width: 40,),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(90, 50),
                            elevation: 5,
                          ),
                          child: Image.asset("images/google.png"),
                        ),

                      ],
                    ),
                    const SizedBox(height: 20.0,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

