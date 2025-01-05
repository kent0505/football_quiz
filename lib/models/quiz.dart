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
      ' '
    ],
    completed: false,
  ),

  //
  Quiz(
    level: 3,
    title: 'Leipzig',
    asset: 'assets/logo/17.png',
    letters: ['L', 'E', 'I', 'P', 'Z', 'I', 'G', 'R', 'T', 'O', 'N', 'S'],
    completed: false,
  ),
  Quiz(
    level: 3,
    title: 'Napoli',
    asset: 'assets/logo/18.png',
    letters: ['N', 'A', 'P', 'O', 'L', 'I', 'R', 'T', 'S', 'V', 'M', 'K'],
    completed: false,
  ),
  Quiz(
    level: 3,
    title: 'Roma',
    asset: 'assets/logo/19.png',
    letters: ['R', 'O', 'M', 'A', 'T', 'L', 'P', 'E', 'S', 'N', 'K', 'V'],
    completed: false,
  ),
  Quiz(
    level: 3,
    title: 'Atletico Madrid',
    asset: 'assets/logo/20.png',
    letters: [
      'A',
      'T',
      'L',
      'E',
      'T',
      'I',
      'C',
      'O',
      'M',
      'A',
      'D',
      'R',
      'I',
      'D',
      'P',
      'N',
      'L',
      'S',
      'K',
      ' '
    ],
    completed: false,
  ),
  Quiz(
    level: 3,
    title: 'Sevilla',
    asset: 'assets/logo/21.png',
    letters: ['S', 'E', 'V', 'I', 'L', 'L', 'A', 'R', 'T', 'O', 'P', 'M'],
    completed: false,
  ),
  Quiz(
    level: 3,
    title: 'Villarreal',
    asset: 'assets/logo/22.png',
    letters: ['V', 'I', 'L', 'L', 'A', 'R', 'R', 'E', 'A', 'L', 'T', 'S'],
    completed: false,
  ),
  Quiz(
    level: 3,
    title: 'Ajax',
    asset: 'assets/logo/23.png',
    letters: ['A', 'J', 'A', 'X', 'R', 'T', 'O', 'L', 'S', 'M', 'N', 'P'],
    completed: false,
  ),
  Quiz(
    level: 3,
    title: 'Benfica',
    asset: 'assets/logo/24.png',
    letters: ['B', 'E', 'N', 'F', 'I', 'C', 'A', 'R', 'T', 'O', 'L', 'S'],
    completed: false,
  ),

  //
  Quiz(
    level: 4,
    title: 'Porto',
    asset: 'assets/logo/25.png',
    letters: ['P', 'O', 'R', 'T', 'O', 'A', 'L', 'B', 'E', 'S', 'N', 'K'],
    completed: false,
  ),
  Quiz(
    level: 4,
    title: 'Sporting',
    asset: 'assets/logo/26.png',
    letters: ['S', 'P', 'O', 'R', 'T', 'I', 'N', 'G', 'A', 'V', 'L', 'X'],
    completed: false,
  ),
  Quiz(
    level: 4,
    title: 'Celtic',
    asset: 'assets/logo/27.png',
    letters: ['C', 'E', 'L', 'T', 'I', 'C', 'A', 'R', 'S', 'M', 'P', 'B'],
    completed: false,
  ),
  Quiz(
    level: 4,
    title: 'Rangers',
    asset: 'assets/logo/28.png',
    letters: ['R', 'A', 'N', 'G', 'E', 'R', 'S', 'T', 'O', 'V', 'L', 'P'],
    completed: false,
  ),
  Quiz(
    level: 4,
    title: 'Galatasaray',
    asset: 'assets/logo/29.png',
    letters: ['G', 'A', 'L', 'A', 'T', 'A', 'S', 'A', 'R', 'A', 'Y', 'B'],
    completed: false,
  ),
  Quiz(
    level: 4,
    title: 'Fenerbahce',
    asset: 'assets/logo/30.png',
    letters: ['F', 'E', 'N', 'E', 'R', 'B', 'A', 'H', 'C', 'E', 'T', 'S'],
    completed: false,
  ),
  Quiz(
    level: 4,
    title: 'PSV',
    asset: 'assets/logo/31.png',
    letters: ['P', 'S', 'V', 'A', 'L', 'I', 'R', 'T', 'O', 'N', 'M', 'U'],
    completed: false,
  ),
  Quiz(
    level: 4,
    title: 'Feyenoord',
    asset: 'assets/logo/32.png',
    letters: ['F', 'E', 'Y', 'E', 'N', 'O', 'O', 'R', 'D', 'L', 'A', 'T'],
    completed: false,
  ),

  //
  Quiz(
    level: 5,
    title: 'River Plate',
    asset: 'assets/logo/33.png',
    letters: ['R', 'I', 'V', 'E', 'R', 'P', 'L', 'A', 'T', 'E', 'S', ' '],
    completed: false,
  ),
  Quiz(
    level: 5,
    title: 'Flamengo',
    asset: 'assets/logo/34.png',
    letters: ['F', 'L', 'A', 'M', 'E', 'N', 'G', 'O', 'R', 'T', 'S', 'P'],
    completed: false,
  ),
  Quiz(
    level: 5,
    title: 'Palmeiras',
    asset: 'assets/logo/35.png',
    letters: ['P', 'A', 'L', 'M', 'E', 'I', 'R', 'A', 'S', 'T', 'O', 'V'],
    completed: false,
  ),
  Quiz(
    level: 5,
    title: 'Santos',
    asset: 'assets/logo/36.png',
    letters: ['S', 'A', 'N', 'T', 'O', 'S', 'P', 'L', 'I', 'R', 'C', 'X'],
    completed: false,
  ),
  Quiz(
    level: 5,
    title: 'Corinthians',
    asset: 'assets/logo/37.png',
    letters: ['C', 'O', 'R', 'I', 'N', 'T', 'H', 'I', 'A', 'N', 'S', 'V'],
    completed: false,
  ),
  Quiz(
    level: 5,
    title: 'Internacional',
    asset: 'assets/logo/38.png',
    letters: ['I', 'N', 'T', 'E', 'R', 'N', 'A', 'C', 'I', 'O', 'N', 'A', 'L'],
    completed: false,
  ),
  Quiz(
    level: 5,
    title: 'Gremio',
    asset: 'assets/logo/39.png',
    letters: ['G', 'R', 'E', 'M', 'I', 'O', 'T', 'S', 'P', 'L', 'A', 'K'],
    completed: false,
  ),
  Quiz(
    level: 5,
    title: 'Boca Juniors',
    asset: 'assets/logo/40.png',
    letters: ['B', 'O', 'C', 'A', 'J', 'U', 'N', 'I', 'O', 'R', 'S', ' '],
    completed: false,
  ),

  //

  Quiz(
    level: 6,
    title: 'Newcastle',
    asset: 'assets/logo/41.png',
    letters: ['N', 'E', 'W', 'C', 'A', 'S', 'T', 'L', 'E', 'P', 'O', 'R'],
    completed: false,
  ),
  Quiz(
    level: 6,
    title: 'Shakhtar',
    asset: 'assets/logo/42.png',
    letters: ['S', 'H', 'A', 'K', 'T', 'H', 'A', 'R', 'D', 'O', 'N', 'E'],
    completed: false,
  ),
  Quiz(
    level: 6,
    title: 'Dynamo',
    asset: 'assets/logo/43.png',
    letters: ['D', 'Y', 'N', 'A', 'M', 'O', 'K', 'Y', 'I', 'V', 'R', 'T'],
    completed: false,
  ),
  Quiz(
    level: 6,
    title: 'Red Star',
    asset: 'assets/logo/44.png',
    letters: ['R', 'E', 'D', 'S', 'T', 'A', 'R', 'B', 'E', 'L', ' ', 'A'],
    completed: false,
  ),
  Quiz(
    level: 6,
    title: 'Olympiacos',
    asset: 'assets/logo/45.png',
    letters: ['O', 'L', 'Y', 'M', 'P', 'I', 'A', 'C', 'O', 'S', 'T', 'R'],
    completed: false,
  ),
  Quiz(
    level: 6,
    title: 'PAOK',
    asset: 'assets/logo/46.png',
    letters: ['P', 'A', 'O', 'K', 'L', 'S', 'T', 'R', 'O', 'M', 'N', 'V'],
    completed: false,
  ),
  Quiz(
    level: 6,
    title: 'CSKA',
    asset: 'assets/logo/47.png',
    letters: ['C', 'S', 'K', 'A', 'M', 'O', 'S', 'C', 'O', 'W', 'T', 'R'],
    completed: false,
  ),
  Quiz(
    level: 6,
    title: 'Spartak',
    asset: 'assets/logo/48.png',
    letters: ['S', 'P', 'A', 'R', 'T', 'A', 'K', 'M', 'O', 'S', 'C', 'W'],
    completed: false,
  ),
];
