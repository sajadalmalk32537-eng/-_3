import 'package:flutter/material.dart';

void main() {
  runApp(const TumaneenaApp());
}

class TumaneenaApp extends StatelessWidget {
  const TumaneenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'طُمَأْنِينَة',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
        fontFamily: 'sans-serif',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق طُمَأْنِينَة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        centerTitle: true,
        backgroundColor: Colors.teal.shade800,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade800, Colors.teal.shade600],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text(
                    'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6),
                  Text(
                    'دليل الشاب المؤمن • أدعية، زيارات، ومناجيات',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: [
                _buildMenuCard(context, 'القرآن الكريم', Icons.menu_book_rounded, Colors.green, const QuranScreen()),
                _buildMenuCard(context, 'أوقات الصلاة', Icons.access_time_filled_rounded, Colors.amber.shade800, const PrayerTimesScreen()),
                _buildMenuCard(context, 'الأدعية والأذكار', Icons.menu_open_rounded, Colors.teal, const AzkarScreen()),
                _buildMenuCard(context, 'المناجيات الإلهية', Icons.volunteer_activism_rounded, Colors.indigo, const MunajatScreen()),
                _buildMenuCard(context, 'الزيارات الكاملة', Icons.mosque_rounded, Colors.brown, const ZeyaratScreen()),
                _buildMenuCard(context, 'فضائل أهل البيت (ع)', Icons.auto_awesome_rounded, Colors.purple, const AhlulbaytScreen()),
                _buildMenuCard(context, 'فضل صلاة الليل', Icons.nights_stay_rounded, Colors.deepPurple, const NightPrayerScreen()),
                _buildMenuCard(context, 'المسبحة الإلكترونية', Icons.touch_app_rounded, Colors.blue, const TasabeehScreen()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, Widget targetScreen) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: color.withOpacity(0.12),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 1. شاشة القرآن الكريم
class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('القرآن الكريم'), backgroundColor: Colors.green),
      body: const Center(child: Text('هنا سيتم عرض سور القرآن الكريم وتلاوته', style: TextStyle(fontSize: 16))),
    );
  }
}

// 2. شاشة أوقات الصلاة الشرعية
class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أوقات الصلاة (الشرعية)'), backgroundColor: Colors.amber),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('الفجر'), trailing: Text('04:45 ص')),
          ListTile(title: Text('الشروق'), trailing: Text('06:15 ص')),
          ListTile(title: Text('الظهر'), trailing: Text('11:50 م')),
          ListTile(title: Text('المغرب'), trailing: Text('06:10 م')),
          ListTile(title: Text('منتصف الليل الشرعي'), trailing: Text('11:30 م')),
        ],
      ),
    );
  }
}

// 3. شاشة الأدعية والأذكار
class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأدعية والأذكار'), backgroundColor: Colors.teal),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('دعاء كميل بن زياد'), subtitle: Text('يقرأ ليلة الجمعة')),
          ListTile(title: Text('دعاء العهد'), subtitle: Text('يقرأ كل صباح')),
          ListTile(title: Text('أذكار الصباح والمساء')),
        ],
      ),
    );
  }
}

// 4. شاشة المناجيات الإلهية
class MunajatScreen extends StatelessWidget {
  const MunajatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المناجيات الخمس عشرة'), backgroundColor: Colors.indigo),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('مناجاة التائبين')),
          ListTile(title: Text('مناجاة الشاكين')),
          ListTile(title: Text('مناجاة المحبين')),
        ],
      ),
    );
  }
}

// 5. شاشة الزيارات الكاملة
class ZeyaratScreen extends StatelessWidget {
  const ZeyaratScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الزيارات الكاملة'), backgroundColor: Colors.brown),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('زيارة عاشوراء المباركة')),
          ListTile(title: Text('زيارة أمين الله')),
          ListTile(title: Text('زيارة الإمام الحسين (ع) يوم الاربعين')),
        ],
      ),
    );
  }
}

// 6. شاشة فضائل أهل البيت (ع)
class AhlulbaytScreen extends StatelessWidget {
  const AhlulbaytScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('فضائل أهل البيت (ع) للشباب'), backgroundColor: Colors.purple),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'قال الإمام علي (ع): "إِنَّ شَبَابَ الْبَدْءِ وَطُلَّابَ الْعِلْمِ حَقِيقُونَ بِتَعَلُّمِ الْأَخْلَاقِ وَالْقِيَمِ..."\n\nمحطات من سيرة المعصومين (عليهم السلام) تبني شخصية الشاب الواعي.',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }
}

// 7. شاشة فضل صلاة الليل
class NightPrayerScreen extends StatelessWidget {
  const NightPrayerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('فضل صلاة الليل وطريقتها'), backgroundColor: Colors.deepPurple),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'صلاة الليل من أعظم المستحبات.\n\nتتكون من 11 ركعة:\n- 8 ركعات نافذة الليل (تصلى ركعتين ركعتين).\n- ركعتا الشفع.\n- ركعة الوتر (يقنت فيها ويستغفر للمؤمنين 40 مرة).\n\nروي عن الإمام الصادق (ع): "شرف المؤمن صلاته بالليل".',
          style: TextStyle(fontSize: 15, height: 1.6),
        ),
      ),
    );
  }
}

// 8. شاشة المسبحة الإلكترونية
class TasabeehScreen extends StatefulWidget {
  const TasabeehScreen({super.key});

  @override
  State<TasabeehScreen> createState() => _TasabeehScreenState();
}

class _TasabeehScreenState extends State<TasabeehScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المسبحة الإلكترونية'), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('سُبْحَانَ اللَّهِ وَبِحَمْدِهِ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal)),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: _incrementCounter,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade100,
                  border: Border.all(color: Colors.blue, width: 4),
                ),
                child: Center(
                  child: Text(
                    '$_counter',
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _resetCounter,
              icon: const Icon(Icons.refresh),
              label: const Text('تصفير العدّاد'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400, foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}