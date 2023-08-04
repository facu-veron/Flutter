import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                counter = 0;
              });
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Contador",
            style: TextStyle(fontSize: 25),
          ),
          Text(
            '$counter',
            style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
          ),
          Text(
            (counter == 1) ? 'click' : 'clicks',
            style: const TextStyle(fontSize: 25),
          )
        ],
      )),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        CustomButton(
          icon: Icons.refresh_rounded,
          onPressed: () {
            counter = 0;
            setState(() {});
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          icon: Icons.exposure_minus_1_outlined,
          onPressed: () {
            if (counter <= 0) return;
            counter--;
            setState(() {});
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          icon: Icons.plus_one,
          onPressed: () {
            counter++;
            setState(() {});
          },
        ),
      ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
