import 'package:flutter/material.dart';

 class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  final String quizTitle;
  const WelcomeScreen({
    required this.onStart,
    required this.quizTitle,
    super.key});
   
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Image.asset(
            'assets/images/quiz-logo.png',
            width: 500,
            height: 500,
            ),
            Text(
              quizTitle,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: onStart,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )
               ),
               child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_forward, color: Colors.blue, size: 20,),
                  SizedBox(width: 10),
                  Text("Start Quiz",
                  style: TextStyle(fontSize: 18,color: Colors.blue),
                  )
                ],
               ),
              
          ),
          
        ],
      ),

    );
  }
}
 
