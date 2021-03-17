import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserWidget({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          tileColor: Colors.white,
          leading: CircleAvatar(backgroundImage: NetworkImage(urlImage)),
          title: Text(name, style: TextStyle(fontSize: 20)),
        ),
      );
}
