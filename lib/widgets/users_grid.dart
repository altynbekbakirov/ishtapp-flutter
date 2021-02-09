import 'package:flutter/material.dart';

class UsersGrid extends StatelessWidget {

  // Variables
  final List<Widget> children;

  UsersGrid({@required this.children});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 1,
      childAspectRatio: 5 / 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: children
  );
 } 
}