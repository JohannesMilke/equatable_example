import 'package:equatable/equatable.dart';
import 'package:equatable_example/widget/compare_widget.dart';
import 'package:equatable_example/widget/title_widget.dart';
import 'package:flutter/material.dart';

// Alternatively we can use:
// class User extends Object with EquatableMixin {
class User extends Equatable {
  final String name;
  final String urlImage;

  const User({
    required this.name,
    required this.urlImage,
  });

  @override
  List<Object> get props => [name, urlImage];

  Map<String, dynamic> toJson() => {
        'name': name,
        'urlImage': urlImage,
      };
}

class EquatablePage extends StatefulWidget {
  @override
  _EquatablePageState createState() => _EquatablePageState();
}

class _EquatablePageState extends State<EquatablePage> {
  User createJames() => User(
        name: 'James',
        urlImage:
            'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80',
      );

  User createSarah() => User(
        name: 'Sarah',
        urlImage:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
      );

  @override
  Widget build(BuildContext context) {
    final james = createJames();
    final sarah = createSarah();
    final sarah2 = createSarah();

    final isFirstEquals = sarah == sarah2;
    final isSecondEquals = sarah == james;

    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        TitleWidget(text: 'Equatable'),
        CompareWidget(
          isEquals: isFirstEquals,
          userOne: sarah.toJson(),
          userTwo: sarah2.toJson(),
        ),
        const SizedBox(height: 32),
        CompareWidget(
          isEquals: isSecondEquals,
          userOne: sarah.toJson(),
          userTwo: james.toJson(),
        ),
      ],
    );
  }
}
