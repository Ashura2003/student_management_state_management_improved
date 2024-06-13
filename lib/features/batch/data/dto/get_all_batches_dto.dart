import 'package:json_annotation/json_annotation.dart';
import 'package:student_management_starter/features/batch/data/model/batch_api_model.dart';


part 'get_all_batches_dto.g.dart';

@JsonSerializable()
class GetAllBatchesDto {
  final bool success;
  final int count;
  final List<BatchApiModel> data;

  GetAllBatchesDto({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllBatchesDtoToJson(this);

  factory GetAllBatchesDto.fromJson(Map<String, dynamic> json) =>
      _$GetAllBatchesDtoFromJson(json);
}
