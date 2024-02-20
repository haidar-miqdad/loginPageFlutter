import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnotherPage extends StatelessWidget {
  final Map<String, dynamic> user;

  const AnotherPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('you Logged in'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello, ${user['email']}',
                style: GoogleFonts.permanentMarker(fontSize: 50),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20),
              Text('Happy Nica Day..',
                style: GoogleFonts.caveat(fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
