// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_batches_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBatchesDto _$GetAllBatchesDtoFromJson(Map<String, dynamic> json) =>
    GetAllBatchesDto(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => BatchApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBatchesDtoToJson(GetAllBatchesDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
