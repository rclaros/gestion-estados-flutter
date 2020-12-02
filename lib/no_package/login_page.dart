import 'package:flutter/material.dart';
import 'package:flutter_state_management/no_package/home_page.dart';
import 'login_bloc.dart';

class LoginMainPage extends StatefulWidget {
  @override
  _LoginMainPageState createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  final loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      loginBloc: loginBloc,
      child: AnimatedBuilder(
        animation: loginBloc,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: loginBloc.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: LoginPage(),
          );
        },
      ),
    );
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

class MyInheritedWidget extends InheritedWidget {
  final Widget child;
  final LoginBloc loginBloc;

  MyInheritedWidget({@required this.child, this.loginBloc});

  static MyInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
