import 'package:flutter/material.dart';
import 'package:flutter_state_management/no_package/home_bloc.dart';
import 'package:flutter_state_management/no_package/login_page.dart';
import 'package:flutter_state_management/no_package/menu_page.dart';
import 'package:flutter_state_management/no_package/total_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    final loginBloc = MyInheritedWidget.of(context).loginBloc;
    return HomeInheritedWidget(
      homeBloc: homeBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home No Package'),
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
                  loginBloc.isDarkMode
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
                          onTap: homeBloc.increment,
                          child: FittedBox(
                            child: Text('+'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: homeBloc.decrement,
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

class HomeInheritedWidget extends InheritedWidget {
  final Widget child;
  final HomeBloc homeBloc;

  HomeInheritedWidget({@required this.child, this.homeBloc});

  static HomeInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
