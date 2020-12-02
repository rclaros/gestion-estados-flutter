import 'package:flutter/material.dart';
import 'package:gestion_estados_flutter/dont/login_page.dart' as dont;
import 'package:gestion_estados_flutter/no_package/login_page.dart'
    as no_package;
import 'package:gestion_estados_flutter/provider_package/login_page.dart'
    as provider_package;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainStateManagement(),
    ));

class MainStateManagement extends StatelessWidget {
  void _onPressed(BuildContext context, Widget child) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => child),
    );
  }

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(height: 20);
    return Scaffold(
      appBar: AppBar(title: Text('APP STATUS')),
      body: ListView(
        padding: const EdgeInsets.all(40.0),
        children: <Widget>[
          RaisedButton(
            child: Text('Don\'t do this!'),
            onPressed: () => _onPressed(
              context,
              dont.LoginMainPage(),
            ),
          ),
          separator,
          RaisedButton(
            child: Text('Without any Package'),
            onPressed: () => _onPressed(
              context,
              no_package.LoginMainPage(),
            ),
          ),
          separator,
          RaisedButton(
            child: Text('Using a Provider Package'),
            onPressed: () => _onPressed(
              context,
              provider_package.LoginMainPage(),
            ),
          ),
        ],
      ),
    );
  }
}
