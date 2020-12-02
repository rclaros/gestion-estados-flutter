import 'package:flutter/material.dart';
import 'package:gestion_estados_flutter/provider_package/login_page.dart';
import 'package:gestion_estados_flutter/provider_package/login_state.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context, listen: false);
    return ListView(
      padding: const EdgeInsets.all(30),
      children: <Widget>[
        FittedBox(
          child: Text('Settings App'),
        ),
        Divider(
          thickness: 2,
        ),
        SwitchListTile(
          value: loginState.isDarkMode,
          onChanged: (value) {
            loginState.onThemeUpdated(value);
          },
          title: Text('Dark Mode'),
        ),
        const SizedBox(height: 200),
        Divider(
          thickness: 2,
        ),
        ListTile(
          title: Text('Log Out'),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => LoginPage(),
                ),
                (route) => false);
          },
          trailing: Icon(Icons.exit_to_app),
        ),
      ],
    );
  }
}
