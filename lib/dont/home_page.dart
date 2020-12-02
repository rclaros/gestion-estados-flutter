import 'package:flutter/material.dart';
import 'package:flutter_state_management/dont/login_page.dart';
import 'package:flutter_state_management/dont/menu_page.dart';
import 'package:flutter_state_management/dont/total_widget.dart';

class HomePage extends StatefulWidget {
  final ValueChanged<bool> onThemeSelected;
  const HomePage({Key key, this.onThemeSelected}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  void _increment() {
    setState(() {
      counter++;
    });
  }

  void _decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home App'),
      ),
      drawer: Drawer(
        child: MenuPage(onThemeSelected: widget.onThemeSelected),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                darkMode
                    ? 'assets/unmsm_patrio.png'
                    : 'assets/unmsm_patrio.png',
                height: 150,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: _increment,
                        child: FittedBox(
                          child: Text('+'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: _decrement,
                        child: FittedBox(
                          child: Text('-'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: TotalWidget(counter: counter),
      ),
    );
  }
}
