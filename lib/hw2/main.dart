import 'package:flutter/material.dart';

void main() {
  runApp(const SportCatalogApp());
}

class SportSection {
  final String title;
  final String coachAndAge;
  final List<String> tags;
  final Color coverColor;
  final bool isFavorite;
  final IconData icon;

  const SportSection({
    required this.title,
    required this.coachAndAge,
    required this.tags,
    required this.coverColor,
    required this.isFavorite,
    required this.icon,
  });
}

class SportCatalogApp extends StatelessWidget {
  const SportCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Спортивные секции',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F5F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0.5,
          centerTitle: false,
        ),
      ),
      home: const CatalogScreen(),
    );
  }
}
class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  final List<SportSection> sections = const [
    SportSection(
      title: 'Футбол',
      coachAndAge: 'Иван Петров · 8–14 лет',
      tags: ['Командный', 'Мяч'],
      coverColor: Color(0xFF238636),
      isFavorite: true,
      icon: Icons.sports_soccer,
    ),
    SportSection(
      title: 'Баскетбол',
      coachAndAge: 'Анна Смирнова · 10–16 лет',
      tags: ['Командный', 'Мяч'],
      coverColor: Color(0xFFE66A1F),
      isFavorite: false,
      icon: Icons.sports_basketball,
    ),
    SportSection(
      title: 'Волейбол',
      coachAndAge: 'Дмитрий Орлов · 10–17 лет',
      tags: ['Командный', 'Мяч'],
      coverColor: Color(0xFF2878B5),
      isFavorite: true,
      icon: Icons.sports_volleyball,
    ),
    SportSection(
      title: 'Плавание',
      coachAndAge: 'Мария Соколова · 7–15 лет',
      tags: ['Вода', 'Оздоровительный'],
      coverColor: Color(0xFF008C95),
      isFavorite: true,
      icon: Icons.pool,
    ),
    SportSection(
      title: 'Теннис',
      coachAndAge: 'Алексей Морозов · 8–16 лет',
      tags: ['Индивидуальный', 'Ракетка'],
      coverColor: Color(0xFF8BAA27),
      isFavorite: false,
      icon: Icons.sports_tennis,
    ),
    SportSection(
      title: 'Художественная гимнастика',
      coachAndAge: 'Елена Волкова · 6–14 лет',
      tags: ['Гимнастика', 'Техника'],
      coverColor: Color(0xFFC34A82),
      isFavorite: true,
      icon: Icons.sports_gymnastics,
    ),
    SportSection(
      title: 'Бокс',
      coachAndAge: 'Сергей Иванов · 10–18 лет',
      tags: ['Единоборства', 'Сила'],
      coverColor: Color(0xFFB52B32),
      isFavorite: false,
      icon: Icons.sports_mma,
    ),
    SportSection(
      title: 'Лёгкая атлетика',
      coachAndAge: 'Олег Кузнецов · 9–17 лет',
      tags: ['Бег', 'Выносливость'],
      coverColor: Color(0xFF6C4BB3),
      isFavorite: true,
      icon: Icons.directions_run,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Спортивные секции',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF20242B),
              ),
            ),
            Text(
              '${sections.length} секций в каталоге',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            itemCount: sections.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
            itemBuilder: (context, index) {
              return SportCard(
                section: sections[index],
              );
            },
          ),
        ),
      ),
    );
  }
}

class SportCard extends StatelessWidget {
  final SportSection section;

  const SportCard({
    super.key,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCover(),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E212D),
                    height: 1.25,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  section.coachAndAge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 10),

                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: section.tags
                      .map((tag) => _buildTag(tag))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCover() {
    return SizedBox(
      width: 82,
      height: 98,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                color: section.coverColor,
                child: Center(
                  child: Icon(
                    section.icon,
                    size: 44,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 6,
            right: 6,
            child: Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Icon(
                section.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 15,
                color: section.isFavorite
                    ? Colors.red
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F0EA),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF356044),
        ),
      ),
    );
  }
}