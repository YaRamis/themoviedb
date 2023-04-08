import 'package:flutter/material.dart';

class MovieDetailsCastWidget extends StatelessWidget {
  const MovieDetailsCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: _TopBilledCastWidget(),
    );
  }
}

class _TopBilledCastWidget extends StatelessWidget {
  const _TopBilledCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemExtent: 10,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            color: Colors.red,
            width: 70,
            height: 100,
            child: Center(child: Text('$index')),
          ),
        );
      },
    );
  }
}
