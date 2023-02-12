import 'package:equatable/equatable.dart';

class AttachmentModel extends Equatable {
  const AttachmentModel({
    required this.image,
    this.description = 'No Description',
    this.time,
  });
  final String image;
  final DateTime? time;
  final String description;

  @override
  List<Object?> get props => [image, time, description];
}
