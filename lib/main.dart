import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ProfileApp());
}

/// Color theme: midnight navy + gold accent
class AppColors {
  static const navy = Color(0xFF14213D);
  static const indigo = Color(0xFF1F3A68);
  static const accent = Color(0xFFFCA311);
  static const accentLight = Color(0xFFFFD27A);
  static const accentDark = Color(0xFFE08A00);
  static const background = Color(0xFFF5F6FA);
  static const textDark = Color(0xFF1F2937);
  static const textGrey = Color(0xFF6B7280);
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aatiqa Bibi',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.accent,
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String email = 'sp25-bcs-062@cuiatk.edu.pk';

  static const List<(String, IconData)> techSkills = [
    ('Front-End Development', Icons.web),
    ('Back-End Development', Icons.storage),
    ('Git & GitHub', Icons.merge_type),
    ('Artificial Intelligence', Icons.psychology),
    ('AI Basics', Icons.lightbulb_outline),
    ('Python', Icons.code),
    ('Python Libraries', Icons.library_books),
    ('App Development', Icons.phone_android),
  ];

  static const List<(String, IconData)> softSkills = [
    ('Communication Skills', Icons.record_voice_over),
    ('Logical Thinking', Icons.account_tree),
    ('Problem Solving', Icons.extension),
  ];

  // ---------- Reusable widgets ----------

  Widget card(Widget child) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 22,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 10),
          Icon(icon, color: AppColors.navy, size: 22),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: AppColors.navy,
            ),
          ),
        ],
      ),
    );
  }

  Widget statTile(IconData icon, String value, String label, Color iconColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0x1FFFFFFF),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0x33FFFFFF)),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(color: AppColors.accentLight, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget contactRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0x1AFCA311),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.accent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textGrey)),
                const SizedBox(height: 2),
                Text(value,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget skillChips(List<(String, IconData)> skills, Color color) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final s in skills)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withAlpha(90)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(s.$2, size: 18, color: color),
                const SizedBox(width: 6),
                Text(
                  s.$1,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  // ---------- Header ----------

  Widget header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.navy, AppColors.indigo],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(36)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Container(
                width: 140,
                height: 140,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppColors.accent, AppColors.accentLight],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ClipOval(
                    child: CustomPaint(
                      size: const Size.square(126),
                      painter: GirlAvatarPainter(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Aatiqa Bibi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Computer Science Student  •  AI & Software Developer',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.accentLight, fontSize: 14),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  statTile(Icons.star_rounded, '3.95', 'CGPA', AppColors.accent),
                  const SizedBox(width: 10),
                  statTile(Icons.school, '4th', 'Semester', AppColors.accentLight),
                  const SizedBox(width: 10),
                  statTile(Icons.computer, 'BS CS', 'Program', AppColors.accentLight),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Page ----------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.account_circle, color: AppColors.accent, size: 30),
        title: const Text(
          'My Portfolio',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        actions: [
          IconButton(
            tooltip: 'Copy email',
            icon: const Icon(Icons.email_outlined),
            onPressed: () {
              Clipboard.setData(const ClipboardData(text: email));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Email copied to clipboard!')),
              );
            },
          ),
          IconButton(
            tooltip: 'About',
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Aatiqa Bibi'),
                  content: const Text(
                    'BS Computer Science, 4th Semester'
                    'COMSATS University Islamabad, Attock Campus',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),

                      // About
                      card(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sectionTitle('About Me', Icons.person),
                          const Text(
                            'I am Aatiqa, a 4th semester Computer Science student at '
                            'COMSATS University Islamabad, Attock Campus.My area of  '
                            'interest is coding, development, and learning soft skills. '
                            'I also have a strong interest in AI.',
                            style: TextStyle(
                                fontSize: 15,
                                height: 1.6,
                                color: AppColors.textDark),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'I enjoy building the logic behind applications through '
                            'back-end development with Python, and I use Git and GitHub '
                            'to manage my projects. Alongside this, I am currently working'
                            'app development and keep learning Python libraries and '
                            'AI basics to grow as a well-rounded developer.',
                            style: TextStyle(
                                fontSize: 15,
                                height: 1.6,
                                color: AppColors.textDark),
                          ),
                        ],
                      )),

                      // Contact
                      card(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sectionTitle('Contact', Icons.contact_mail),
                          contactRow(Icons.email_outlined, 'Email', email),
                          contactRow(Icons.account_balance_outlined, 'University',
                              'COMSATS University Islamabad'),
                          contactRow(Icons.location_on_outlined, 'Campus',
                              'Attock Campus, Pakistan'),
                        ],
                      )),

                      // Technical skills
                      card(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sectionTitle('Technical Skills', Icons.code),
                          skillChips(techSkills, AppColors.indigo),
                        ],
                      )),

                      // Soft skills
                      card(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sectionTitle('Non-Technical Skills', Icons.groups),
                          skillChips(softSkills, AppColors.accentDark),
                        ],
                      )),

                      // Button
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Clipboard.setData(const ClipboardData(text: email));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Email copied to clipboard!'),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: AppColors.navy,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.send_rounded),
                          label: const Text(
                            'Contact Me',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            foregroundColor: AppColors.navy,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '© 2026 Aatiqa Bibi',
                        style: TextStyle(color: AppColors.textGrey, fontSize: 12),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Draws a professional, faceless girl avatar (no image file needed).
class GirlAvatarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final skin = Paint()..color = const Color(0xFFF1C9A5);
    final hair = Paint()..color = const Color(0xFF2B1B17);

    canvas.drawRect(
        Rect.fromLTWH(0, 0, w, h), Paint()..color = const Color(0xFFE8ECF4));

    // long hair (back)
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset(w * 0.5, h * 0.46), width: w * 0.46, height: h * 0.52),
        Radius.circular(w * 0.23),
      ),
      hair,
    );

    // blazer
    final body = Path()
      ..moveTo(w * 0.1, h)
      ..quadraticBezierTo(w * 0.12, h * 0.68, w * 0.5, h * 0.66)
      ..quadraticBezierTo(w * 0.88, h * 0.68, w * 0.9, h)
      ..close();
    canvas.drawPath(body, Paint()..color = AppColors.navy);

    // neck
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
            center: Offset(w * 0.5, h * 0.62), width: w * 0.13, height: h * 0.14),
        const Radius.circular(8),
      ),
      skin,
    );

    // collar
    final collar = Path()
      ..moveTo(w * 0.41, h * 0.67)
      ..lineTo(w * 0.5, h * 0.82)
      ..lineTo(w * 0.59, h * 0.67)
      ..close();
    canvas.drawPath(collar, Paint()..color = Colors.white);

    // head (no face)
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(w * 0.5, h * 0.42), width: w * 0.3, height: h * 0.36),
      skin,
    );

    // hair on top
    canvas.drawArc(
      Rect.fromCenter(
          center: Offset(w * 0.5, h * 0.385), width: w * 0.33, height: h * 0.31),
      math.pi,
      math.pi,
      false,
      hair,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}