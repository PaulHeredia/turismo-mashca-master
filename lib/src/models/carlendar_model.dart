// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  String? title;
  EventModel({
    this.title = "",
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}
