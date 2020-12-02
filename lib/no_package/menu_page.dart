import 'package:flutter/material.dart';
import 'package:gestion_estado_flutter/no_package/login_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = MyInheritedWidget.of(context).loginBloc;
    return ListView(
      padding: const EdgeInsets.all(30),
      children: <Widget>[
        FittedBox(
          child: Text('Setting'),
        ),
        Divider(
          thickness: 2,
        ),
        SwitchListTile(
          value: loginBloc.isDarkMode,
          onChanged: (value) {
            loginBloc.onThemeUpdated(value);
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
