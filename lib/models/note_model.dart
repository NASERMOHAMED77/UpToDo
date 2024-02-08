import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoteModel {
  final String title;
  final String description;
  final String category;
  final String category_color;
  final String category_icon;
  final int priorty;
  final int id;
  final bool completed;
  final String time;
  final String date;
  NoteModel({
    required this.title,
    required this.description,
    required this.category,
    required this.category_color,
    required this.category_icon,
    required this.priorty,
    required this.completed,
    required this.time,
    required this.date,
    required this.id
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'category': category,
      'category_color': category_color,
      'category_icon': category_icon,
      'priorty': priorty,
      'completed': completed,
      'time': time,
      'date': date,
      'id':id
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      category_color: map['category_color'] as String,
      category_icon: map['category_icon'] as String,
      priorty: map['priorty'] as int,
      completed: map['completed'] as bool,
      time: map['time'] as String,
      date: map['date'] as String,
      id:map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) => NoteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
