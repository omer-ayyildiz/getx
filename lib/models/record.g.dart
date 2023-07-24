// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Record _$$_RecordFromJson(Map<String, dynamic> json) => _$_Record(
      dateTime: DateTime.parse(json['dateTime'] as String),
      weight: json['weight'] as int,
      note: json['note'] as String?,
      photoURL: json['photoURL'] as String?,
    );

Map<String, dynamic> _$$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'weight': instance.weight,
      'note': instance.note,
      'photoURL': instance.photoURL,
    };
