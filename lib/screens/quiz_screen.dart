// screens/quiz_screen.dart
import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  final List<Question> _questions = [
    Question(questionText: 'Is Flutter awesome?', answer: true),
    Question(questionText: 'Is the earth flat?', answer: false),
  ];

  void _checkAnswer(bool userAnswer) {
    if (userAnswer == _questions[_currentQuestionIndex].answer) {
      // Thông báo đúng hoặc sai
      print('Correct!');
    } else {
      print('Wrong!');
    }
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % _questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Center( // Thêm Center widget để căn giữa nội dung
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
          crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều ngang
          children: [
            Text(
              _questions[_currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _checkAnswer(true),
              child: Text('True'),
            ),
            ElevatedButton(
              onPressed: () => _checkAnswer(false),
              child: Text('False'),
            ),
          ],
        ),
      ),
    );
  }
}
