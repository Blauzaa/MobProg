import 'package:flutter/material.dart';
import 'package:mobileapps/Finance.dart';
import 'package:mobileapps/GlobalVariabel.dart';
import 'package:mobileapps/Profile.dart';
import 'package:mobileapps/Qris.dart';
import 'package:mobileapps/main.dart';

void main() {
  runApp(const History());
}

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    // Buat objek Historys
    final historys = Historys();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        body: Column(
          children: [
            Navbar(),
            Expanded(
              child: ListView.builder(
                itemCount: historys.nama.length,
                itemBuilder: (BuildContext context, int index) {
                  return Isi(
                    historys: historys,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
        // bottomNavigationBar: BNBar(),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 100,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          const Positioned(
            left: 20,
            top: 75, // Mengatur top ke 0 agar tetap di atas
            child: Text(
              'History',
              style: TextStyle(
                color: Color(0xFF118EEA),
                fontSize: 36,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0.03,
                letterSpacing: 0.38,
              ),
            ),
          ),
          Positioned(
            left: 327,
            top: 25, // Mengatur top ke 9 agar tetap di atas
            child: InkWell(
              onTap: () {
                // Pindah ke halaman Profile.dart
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
              child: Container(
                width: 28,
                height: 28,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/profileicon.png'),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 20,
            top: 25, // Mengatur top ke 9 agar tetap di atas
            child: Text(
              'ECO-M',
              style: TextStyle(
                color: Color(0xFF118EEA),
                fontSize: 18,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Isi extends StatelessWidget {
  const Isi({Key? key, required this.historys, required this.index})
      : super(key: key);

  final Historys historys;
  final int index;

  @override
  Widget build(BuildContext context) {
    // Gunakan class Historys seperti biasa
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              width: double.infinity,
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                    left: 1.15,
                    top: 0,
                    child: Container(
                      width: 357.85,
                      height: 50.21,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 116.59,
                              height: 28.91,
                              child: Text(
                                historys.nama[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 28.91,
                            child: SizedBox(
                              width: 165.07,
                              height: 21.30,
                              child: Text(
                                historys.date[index],
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 11,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 279.35,
                            top: 16.73,
                            child: SizedBox(
                              width: 78.50,
                              height: 24.34,
                              child: Text(
                                historys.money[index],
                                style: TextStyle(
                                  color: historys.money[index].startsWith("+")
                                      ? Colors.green
                                      : Colors
                                          .red, // Ganti warna sesuai kebutuhan
                                  fontSize: 11,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BNBar extends StatefulWidget {
  @override
  _BNBarState createState() => _BNBarState();
}

class _BNBarState extends State<BNBar> {
  int _selectedIndex = 0; // Define the selected index for BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Handle item selection
    });

    if (index == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Finance()));
    } else if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyApp()));
    } else if (index == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Qris()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.graphic_eq),
          label: 'Finance',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: 'Qris',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color.fromARGB(255, 6, 112, 187),
      unselectedItemColor: Color(0xFF118EEA),
      onTap: _onItemTapped,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}
