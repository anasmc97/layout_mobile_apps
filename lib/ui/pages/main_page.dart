part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavCurrentIndex = 2;
  List<Widget> container = const [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: container[bottomNavCurrentIndex],
        bottomNavigationBar: buildBottomNavigation());
  }

  Widget buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          bottomNavCurrentIndex = index;
        });
      },
      currentIndex: bottomNavCurrentIndex,
      items: [
        const BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.assignment,
              color: Color(0xFF3C7DD9),
            ),
            icon: Icon(
              Icons.assignment,
              color: Color(0xFFC6C4C4),
            ),
            label: 'Lounge'),
        BottomNavigationBarItem(
            activeIcon: Container(
              height: 20,
              child: Image.asset("assets/Vector.png"),
              color: const Color(0xFF3C7DD9),
            ),
            icon: Container(
              height: 20,
              child: Image.asset("assets/Vector.png"),
            ),
            label: "Order"),
        const BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Color(0xFF3C7DD9),
            ),
            icon: Icon(
              Icons.home,
              color: Color(0xFFC6C4C4),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            activeIcon: Container(
              height: 20,
              child: Image.asset("assets/Vector2.png"),
              color: const Color(0xFF3C7DD9),
            ),
            icon: Container(
              height: 20,
              child: Image.asset("assets/Vector2.png"),
            ),
            label: 'History'),
        const BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Color(0xFF3C7DD9),
            ),
            icon: Icon(
              Icons.person,
              color: Color(0xFFC6C4C4),
            ),
            label: 'Profile'),
      ],
    );
  }
}
