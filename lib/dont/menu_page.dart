import 'package:flutter/material.dart';
import 'package:gestion_estado_flutter/dont/login_page.dart';

class MenuPage extends StatelessWidget {
  final ValueChanged<bool> onThemeSelected;
  const MenuPage({Key key, this.onThemeSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30),
      children: <Widget>[
        FittedBox(
          child: Text('Settings'),
        ),
        Divider(
          thickness: 2,
        ),
        SwitchListTile(
          value: darkMode,
          onChanged: (value) {
            onThemeSelected(value);
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
                  builder: (_) => LoginPage(
                    onThemeSelected: onThemeSelected,
                  ),
                ),
                (route) => false);
          },
          trailing: Icon(Icons.exit_to_app),
        ),
      ],
    );
  }
}
