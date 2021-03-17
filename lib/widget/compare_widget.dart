import 'package:equatable_example/widget/user_widget.dart';
import 'package:flutter/material.dart';

class CompareWidget extends StatelessWidget {
  final bool isEquals;
  final Map<String, dynamic> userOne;
  final Map<String, dynamic> userTwo;

  const CompareWidget({
    Key? key,
    required this.isEquals,
    required this.userOne,
    required this.userTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = isEquals ? Colors.green : Colors.red;
    final icon = Icon(isEquals ? Icons.done : Icons.clear, color: Colors.white);

    final user1Name = userOne['name'];
    final user1UrlImage = userOne['urlImage'];
    final user2Name = userTwo['name'];
    final user2UrlImage = userTwo['urlImage'];

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                'Check Equality',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          UserWidget(name: user1Name, urlImage: user1UrlImage),
          const SizedBox(height: 8),
          Text(
            'VS',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 8),
          UserWidget(name: user2Name, urlImage: user2UrlImage),
        ],
      ),
    );
  }
}
