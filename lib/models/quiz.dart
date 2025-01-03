class Quiz {
  Quiz({
    required this.level,
    required this.title,
    required this.asset,
    required this.letters,
  });

  final int level;
  final String title;
  final String asset;
  final List<String> letters;
}

List<Quiz> quizesList = [
  Quiz(
    level: 1,
    title: 'Arsenal',
    asset: 'assets/logo/1.png',
    letters: ["A", "R", "S", "E", "N", "A", "L", "T", "M", "O", "P", "C"],
  ),
  Quiz(
    level: 1,
    title: 'Milan',
    asset: 'assets/logo/2.png',
    letters: ["M", "I", "L", "A", "N", "T", "R", "O", "S", "P", "E", "C"],
  ),
  Quiz(
    level: 1,
    title: 'Bayern',
    asset: 'assets/logo/3.png',
    letters: ["B", "A", "Y", "E", "R", "N", "L", "T", "S", "M", "O", "C"],
  ),
  Quiz(
    level: 1,
    title: 'Everton',
    asset: 'assets/logo/4.png',
    letters: ["E", "V", "E", "R", "T", "O", "N", "A", "L", "S", "M", "C"],
  ),
  Quiz(
    level: 1,
    title: 'Barcelona',
    asset: 'assets/logo/5.png',
    letters: ["B", "A", "R", "C", "E", "L", "O", "N", "A", "T", "S", "M"],
  ),
  Quiz(
    level: 1,
    title: 'Inter',
    asset: 'assets/logo/6.png',
    letters: ["I", "N", "T", "E", "R", "A", "L", "S", "M", "O", "P", "C"],
  ),
  Quiz(
    level: 1,
    title: 'Juventus',
    asset: 'assets/logo/7.png',
    letters: ["J", "U", "V", "E", "N", "T", "U", "S", "A", "L", "R", "P"],
  ),
  Quiz(
    level: 1,
    title: 'Leicester',
    asset: 'assets/logo/8.png',
    letters: ["L", "E", "I", "C", "E", "S", "T", "E", "R", "A", "N", "P"],
  ),
];
