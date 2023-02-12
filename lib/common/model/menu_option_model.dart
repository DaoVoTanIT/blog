import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MenuOptionModel extends Equatable {
  const MenuOptionModel({
    required this.title,
    this.color,
    this.function,
  });
  final String title;
  final Color? color;
  final Function? function;

  @override
  List<Object?> get props => [
        title,
        color,
        function,
      ];
}
