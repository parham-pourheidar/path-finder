import 'package:flutter/material.dart';
import 'package:path_finder/screens/home_screen.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 15, 20, 1),
      body: Center(
        child: Column(
          spacing: 40,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Won !',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w700,
                fontSize: 40,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> HomeScreen()), (route) => false,);
              },
              icon: Icon(
                Icons.home,
                color: Colors.green,
                size: 60,
              ),
            )
          ],
        ),
      ),
    );
  }
}
