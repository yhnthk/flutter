// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Student _$StudentFromJson(Map<String, dynamic> json) => _Student(
  id: json['id'] as String,
  nama: json['nama'] as String,
  username: json['username'] as String,
  password: json['password'] as String,
  profileImageUrl: json['profileImageUrl'] as String?,
);

Map<String, dynamic> _$StudentToJson(_Student instance) => <String, dynamic>{
  'id': instance.id,
  'nama': instance.nama,
  'username': instance.username,
  'password': instance.password,
  'profileImageUrl': instance.profileImageUrl,
};
