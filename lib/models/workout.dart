import 'package:flutter_bloc_gym_app/models/exercise.dart';

class Workout {
  final String? title;
  final List<Exercise> exercises;

  Workout({
    required this.title,
    required this.exercises
  });

  factory Workout.fromJson(Map<String, dynamic> json){
    List<Exercise> exercise = [];
    int index = 0;
    int startTime = 0;
    for (var element in json['exercises']) {
      exercise.add(Exercise.fromJson(json, index, startTime));
      index ++;
      startTime += exercise.last.prelude + exercise.last.duration;
    }

    return Workout(title: json['title'], exercises: exercise);
  }

  Map<String, dynamic> toJson() => {
      "title": title,
      "exercises": exercises //List<dynamic>.from(exercises.map((x) => x.toJson())),
  };
}