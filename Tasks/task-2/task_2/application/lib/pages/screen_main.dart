import 'package:flutter/material.dart';

class ComputationScreen extends StatefulWidget {
  @override
  _ComputationScreenState createState() => _ComputationScreenState();
}

class _ComputationScreenState extends State<ComputationScreen> {
  Future<int>? _computationResult;

  @override
  void initState() {
    super.initState();
    _computationResult = myFunc();
  }

  Future<int> myFunc() async {
    return await heavyComputation();
  }

  Future<int> heavyComputation() async {
    int sum = 0;
    for (int i = 0; i < 1000; i++) {
      sum += i;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Heavy Computation')),
      body: Center(
        child: FutureBuilder<int>(
          future: _computationResult,
          builder: (context, snapshot) {
            return Text(snapshot.data.toString());
          },
        ),
      ),
    );
  }
}
