import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String data;

  SecondScreen({
    super.key,
    required this.data
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> arguments =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(widget.data)
      ),
    );
  }
}
