import 'package:flutter/material.dart';
import 'package:flutter_state_management/dont/home_page.dart';

bool darkMode = true;

class LoginMainPage extends StatefulWidget {
  @override
  _LoginMainPageState createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  void onThemeUpdated(bool isDark) {
    setState(() {
      darkMode = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkMode ? ThemeData.dark() : ThemeData.light(),
        home: LoginPage(
          onThemeSelected: onThemeUpdated,
        ));
  }
}

class LoginPage extends StatelessWidget {
  final ValueChanged<bool> onThemeSelected;
  const LoginPage({Key key, this.onThemeSelected}) : super(key: key);

  void _onTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => HomePage(onThemeSelected: onThemeSelected),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'LOGIN',
      )),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Username',
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 30),
            RaisedButton(
              child: Text('LOGIN'),
              onPressed: () => _onTap(context),
            ),
          ],
        ),
      ),
    );
  }
}
