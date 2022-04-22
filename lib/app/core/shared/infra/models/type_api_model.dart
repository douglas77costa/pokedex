import 'package:json_annotation/json_annotation.dart';

import '../../domain/enitities/type_api.dart';

part 'type_api_model.g.dart';

@JsonSerializable()
class TypeApiModel extends TypeApi{
  TypeApiModel():super();

  factory TypeApiModel.fromJson(Map<String, dynamic> json) =>
      _$TypeApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$TypeApiModelToJson(this);
}
