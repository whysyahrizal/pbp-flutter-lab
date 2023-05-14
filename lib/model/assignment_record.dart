// To parse this JSON data, do
//
//     final assignmentRecord = assignmentRecordFromJson(jsonString);

import 'dart:convert';

List<AssignmentRecord> assignmentRecordFromJson(String str) =>
    List<AssignmentRecord>.from(
        json.decode(str).map((x) => AssignmentRecord.fromJson(x)));

String assignmentRecordToJson(List<AssignmentRecord> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssignmentRecord {
  String model;
  int pk;
  Fields fields;

  AssignmentRecord({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory AssignmentRecord.fromJson(Map<String, dynamic> json) =>
      AssignmentRecord(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  String name;
  String subject;
  DateTime dueDate;
  String description;

  Fields({
    required this.name,
    required this.subject,
    required this.dueDate,
    required this.description,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        subject: json["subject"],
        dueDate: DateTime.parse(json["due_date"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "subject": subject,
        "due_date": dueDate.toIso8601String(),
        "description": description,
      };
}
