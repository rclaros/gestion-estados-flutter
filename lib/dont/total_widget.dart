import 'package:flutter/material.dart';

class TotalWidget extends StatelessWidget {
  final int counter;
  const TotalWidget({Key key, this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FittedBox(
          child: Text(counter.toString()),
        ),
      ),
    );
  }
}
