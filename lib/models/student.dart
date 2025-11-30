import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
abstract class Student with _$Student {
  const factory Student({
    required String id,
    required String nama,
    required String username,
    required String password,
    String? profileImageUrl,
  }) = _Student;
  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
}

// Backwards-compatible alias: some generated files reference `StudentModel`.
// Keep this alias so older generated code or hand-edited files compile.
typedef StudentModel = Student;
