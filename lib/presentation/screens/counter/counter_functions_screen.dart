import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;
  // String texto = "clicks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App Counter"), actions: [
        IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            })
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            Text("click${clickCounter != 1 ? 's' : ''}",
                style: const TextStyle(fontSize: 25))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh,
            onPressed: () {
              clickCounter = 0;
              setState(() {  });
            },
          ),
         const SizedBox(height: 10),
          CustomButton(icon: Icons.plus_one,
          onPressed: () {
              clickCounter++;
              setState(() {  });
            },),
         const SizedBox(height: 10),
          CustomButton(icon: Icons.exposure_minus_1,
          onPressed: () {
              if(clickCounter!=0) clickCounter--;
              setState(() {  });
            },)
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        enableFeedback: true,
        elevation: 60,
        shape: const StadiumBorder(), onPressed: onPressed, child: Icon(icon,color: Colors.white,));
  }
}
