import 'package:flutter/material.dart';
import 'package:gestion_estados_flutter/no_package/home_page.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = HomeInheritedWidget.of(context).homeBloc;
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AnimatedBuilder(
            animation: homeBloc,
            builder: (context, _) {
              return FittedBox(
                child: Text(homeBloc.counter.toString()),
              );
            }),
      ),
    );
  }
}
