import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];
List<Widget> getLabels(){
  return colors.map((cl)=>Label(cl)).toList();
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children:  [
            Label("Method 1: Loop in Array", bold: true),
            // TODO
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for(var cl in colors)
                  Label(cl),
                
              ],
            ),
            

            Label("Method 2: Map", bold: true),
            // TODO
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               ... colors.map((cl)=> Label(cl)).toList(),
              ],
            ),
             
            Label("Method 3: Dedicated Function", bold: true),
            // TODO
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
                getLabels(),
              
            )
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}