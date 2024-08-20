import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  @JsonKey(name:'id')
  final int? id;
  @JsonKey(name:'title')
  final String? title;
  @JsonKey(name: 'completed')
  final bool? completed;
  @JsonKey(name: 'userId')
  final int? userId;

  Task({
      this.id,
      this.completed,
      this.title,
      this.userId
      });

  factory Task.fromJson(final Map<String, dynamic> json) {
    debugPrint("json_response= ${json.toString()}");
    return _$TaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskToJson(this);

}