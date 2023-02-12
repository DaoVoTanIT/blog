class KPIDetailTaskModel {
  KPIDetailTaskModel({
    this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.finishTime,
  });

  String? id;
  String? name;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? finishTime;

  factory KPIDetailTaskModel.fromJson(Map<String, dynamic> json) =>
      KPIDetailTaskModel(
        id: json['id'],
        name: json['name'],
        startTime: json['start_time'] == null
            ? null
            : DateTime.parse(json['start_time']),
        endTime:
            json['end_time'] == null ? null : DateTime.parse(json['end_time']),
        finishTime: json['finish_time'] == null
            ? null
            : DateTime.parse(json['finish_time']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'start_time': startTime!.toIso8601String(),
        'end_time': endTime!.toIso8601String(),
      };
}
