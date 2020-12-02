import 'package:flutter/material.dart';
import 'package:gestion_estados_flutter/provider_package/home_page.dart';
import 'package:gestion_estados_flutter/provider_package/login_state.dart';
import 'package:provider/provider.dart';

class LoginMainPage extends StatefulWidget {
  @override
  _LoginMainPageState createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginState(),
        child: Consumer<LoginState>(
          builder: (context, state, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.isDarkMode ? ThemeData.dark() : ThemeData.light(),
              home: LoginPage(),
            );
          },
        ));
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  void _onTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => HomePage(),
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
