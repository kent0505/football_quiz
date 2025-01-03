class Quiz {
  Quiz({
    required this.level,
    required this.title,
    required this.asset,
  });

  final int level;
  final String title;
  final String asset;
}

List<Quiz> quizesList = [
  Quiz(
    level: 1,
    title: 'Arsenal',
    asset: 'assets/logo/1.png',
  ),
  Quiz(
    level: 1,
    title: 'Milan',
    asset: 'assets/logo/2.png',
  ),
  Quiz(
    level: 1,
    title: 'Bayern',
    asset: 'assets/logo/3.png',
  ),
  Quiz(
    level: 1,
    title: 'Everton',
    asset: 'assets/logo/4.png',
  ),
  Quiz(
    level: 1,
    title: 'Barcelona',
    asset: 'assets/logo/5.png',
  ),
  Quiz(
    level: 1,
    title: 'Inter',
    asset: 'assets/logo/6.png',
  ),
  Quiz(
    level: 1,
    title: 'Juventus',
    asset: 'assets/logo/7.png',
  ),
  Quiz(
    level: 1,
    title: 'Leicester City',
    asset: 'assets/logo/8.png',
  ),
];
