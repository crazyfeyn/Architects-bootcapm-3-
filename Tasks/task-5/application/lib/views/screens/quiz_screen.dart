import 'package:application/models/my_course.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool isAnswered = false;
  bool isCorrect = false;

  @override
  Widget build(BuildContext context) {
    Quizes quizes = ModalRoute.of(context)!.settings.arguments as Quizes;
    final quize = quizes.quiz1;
    final int correctOption = quize.correctOptionIndex;

    void checkAnswer(int index) {
      setState(() {
        isAnswered = true;
        isCorrect = (index == correctOption);
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 221, 34),
      appBar: AppBar(
        title: const Text(
          'Quizzes',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color.fromARGB(255, 241, 221, 34),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              '${quize.question} = ?',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                  quize.options.length,
                  (index) => InkWell(
                    onTap: () {
                      if (!isAnswered) {
                        checkAnswer(index);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                        color: isAnswered
                            ? (index == correctOption
                                ? Colors.green
                                : Colors.red)
                            : Colors.blue,
                      ),
                      child: Text(
                        quize.options[index].toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (isAnswered)
              Text(
                isCorrect
                    ? 'Congratulations, correct option!'
                    : 'Unfortunately, incorrect option.',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
