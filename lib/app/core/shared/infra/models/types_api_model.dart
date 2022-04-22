import 'package:json_annotation/json_annotation.dart';

import '../../domain/enitities/types_api.dart';
import 'type_api_model.dart';

part 'types_api_model.g.dart';

@JsonSerializable()
class TypesApiModel extends TypesApi {

  final TypeApiModel? type;

  TypesApiModel({this.type}):super(type: type);

  factory TypesApiModel.fromJson(Map<String, dynamic> json) =>
      _$TypesApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$TypesApiModelToJson(this);
}