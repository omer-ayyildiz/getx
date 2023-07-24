// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
part 'record.freezed.dart';
part 'record.g.dart';

@freezed
sealed class Record with _$Record {
  factory Record(
      {required DateTime dateTime,
      required int weight,
      String? note,
      String? photoURL}) = _Record;
  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}
