import 'package:hive_flutter/hive_flutter.dart';

import 'models/quiz.dart';

String addZero(int value) {
  return 'Level ${value.toString().padLeft(2, '0')}';
}

List<Quiz> getQuizesByLevel(List<Quiz> quizes, int level) {
  return quizes.where((quiz) => quiz.level == level).toList();
}

Future<void> initHive() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('football_quiz');
  Hive.registerAdapter(QuizAdapter());
}

Future<List<Quiz>> getQuizes() async {
  final box = await Hive.openBox('football_quiz');
  List data = box.get('quizes') ?? quizesList;
  return data.cast<Quiz>();
}

Future<List<Quiz>> updateQuizes(List<Quiz> quizes) async {
  final box = await Hive.openBox('football_quiz');
  box.put('quizes', quizes);
  return await box.get('quizes');
}
