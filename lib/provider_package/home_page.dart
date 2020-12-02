import 'package:flutter/material.dart';
import 'package:gestion_estados_flutter/provider_package/home_state.dart';
import 'package:gestion_estados_flutter/provider_package/login_state.dart';
import 'package:gestion_estados_flutter/provider_package/menu_page.dart';
import 'package:gestion_estados_flutter/provider_package/total_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeState = HomeState();
  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context, listen: false);
    return ChangeNotifierProvider<HomeState>(
      create: (_) => homeState,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home App'),
        ),
        drawer: Drawer(
          child: MenuPage(),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  loginState.isDarkMode
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
                          onTap: homeState.increment,
                          child: FittedBox(
                            child: Text('+'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: homeState.decrement,
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
          child: TotalWidget(),
        ),
      ),
    );
  }
}
