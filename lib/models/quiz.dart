import 'package:hive_flutter/hive_flutter.dart';

// @HiveType(typeId: 0)
class Quiz {
  Quiz({
    required this.level,
    required this.title,
    required this.asset,
    required this.letters,
    required this.completed,
  });

  @HiveField(0)
  final int level;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String asset;
  @HiveField(3)
  final List<String> letters;
  @HiveField(4)
  bool completed;
}

class QuizAdapter extends TypeAdapter<Quiz> {
  @override
  final typeId = 0;

  @override
  Quiz read(BinaryReader reader) {
    return Quiz(
      level: reader.read(),
      title: reader.read(),
      asset: reader.read(),
      letters: reader.read(),
      completed: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Quiz obj) {
    writer.write(obj.level);
    writer.write(obj.title);
    writer.write(obj.asset);
    writer.write(obj.letters);
    writer.write(obj.completed);
  }
}

List<Quiz> quizesList = [
  Quiz(
    level: 1,
    title: 'Arsenal',
    asset: 'assets/logo/1.png',
    letters: ['A', 'R', 'S', 'E', 'N', 'A', 'L', 'T', 'M', 'O', 'P', 'C'],
    completed: false,
  ),
  Quiz(
    level: 1,
    title: 'Milan',
    asset: 'assets/logo/2.png',
    letters: ['M', 'I', 'L', 'A', 'N', 'T', 'R', 'O', 'S', 'P', 'E', 'C'],
    completed: false,
  ),
  Quiz(
    level: 1,
    title: 'Bayern',
    asset: 'assets/logo/3.png',
    letters: ['B', 'A', 'Y', 'E', 'R', 'N', 'L', 'T', 'S', 'M', 'O', 'C'],
    completed: false,
  ),
  Quiz(
    level: 1,
    title: 'Everton',
    asset: 'assets/logo/4.png',
    letters: ['E', 'V', 'E', 'R', 'T', 'O', 'N', 'A', 'L', 'S', 'M', 'C'],
    completed: false,
  ),
  Quiz(
    level: 1,
    title: 'Barcelona',
    asset: 'assets/logo/5.png',
    letters: ['B', 'A', 'R', 'C', 'E', 'L', 'O', 'N', 'A', 'T', 'S', 'M'],
    completed: false,
  ),
  Quiz(
    level: 1,
    title: 'Inter',
    asset: 'assets/logo/6.png',
    letters: ['I', 'N', 'T', 'E', 'R', 'A', 'L', 'S', 'M', 'O', 'P', 'C'],
    completed: false,
  ),
  Quiz(
    level: 1,
    title: 'Juventus',
    asset: 'assets/logo/7.png',
    letters: ['J', 'U', 'V', 'E', 'N', 'T', 'U', 'S', 'A', 'L', 'R', 'P'],
    completed: false,
  ),
  Quiz(
    level: 1,
    title: 'Leicester',
    asset: 'assets/logo/8.png',
    letters: ['L', 'E', 'I', 'C', 'E', 'S', 'T', 'E', 'R', 'A', 'N', 'P'],
    completed: false,
  ),

  //
  Quiz(
    level: 2,
    title: 'Real Madrid',
    asset: 'assets/logo/9.png',
    letters: ['R', 'E', 'A', 'L', 'M', 'A', 'D', 'R', 'I', 'D', 'B', 'C', ' '],
    completed: false,
  ),
  Quiz(
    level: 2,
    title: 'Manchester United',
    asset: 'assets/logo/10.png',
    letters: [
      'M',
      'A',
      'N',
      'C',
      'H',
      'E',
      'S',
      'T',
      'E',
      'R',
      'U',
      'N',
      'I',
      'T',
      'E',
      'D',
      'C',
      ' ',
    ],
    completed: false,
  ),
  Quiz(
    level: 2,
    title: 'Manchester City',
    asset: 'assets/logo/11.png',
    letters: [
      'M',
      'A',
      'N',
      'C',
      'H',
      'E',
      'S',
      'T',
      'E',
      'R',
      'C',
      'I',
      'T',
      'Y',
      ' ',
      'L',
      'U',
      'B'
    ],
    completed: false,
  ),
  Quiz(
    level: 2,
    title: 'Chelsea',
    asset: 'assets/logo/12.png',
    letters: ['C', 'H', 'E', 'L', 'S', 'E', 'A', 'M', 'O', 'T', 'R', 'P'],
    completed: false,
  ),
  Quiz(
    level: 2,
    title: 'Liverpool',
    asset: 'assets/logo/13.png',
    letters: ['L', 'I', 'V', 'E', 'R', 'P', 'O', 'O', 'L', 'A', 'N', 'T'],
    completed: false,
  ),
  Quiz(
    level: 2,
    title: 'Tottenham',
    asset: 'assets/logo/14.png',
    letters: ['T', 'O', 'T', 'T', 'E', 'N', 'H', 'A', 'M', 'R', 'S', 'L'],
    completed: false,
  ),
  Quiz(
    level: 2,
    title: 'PSG',
    asset: 'assets/logo/15.png',
    letters: ['P', 'S', 'G', 'A', 'E', 'R', 'T', 'O', 'L', 'N', 'M', 'U'],
    completed: false,
  ),
  Quiz(
    level: 2,
    title: 'Borussia Dortmund',
    asset: 'assets/logo/16.png',
    letters: [
      'B',
      'O',
      'R',
      'U',
      'S',
      'S',
      'I',
      'A',
      'D',
      'O',
      'R',
      'T',
      'M',
      'U',
      'N',
      'D',
      'E',
      'L',
      'P',
      'G',
      ' '
    ],
    completed: false,
  ),
];
