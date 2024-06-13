import 'package:json_annotation/json_annotation.dart';
import 'package:student_management_starter/features/course/data/model/course_api_model.dart';

part 'get_all_courses_dto.g.dart';

@JsonSerializable()
class GetAllCoursesDto {
  final bool success;
  final int count;
  final List<CourseApiModel> data;

  GetAllCoursesDto({
    required this.success,
    required this.count,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$GetAllCoursesDtoToJson(this);

  factory GetAllCoursesDto.fromJson(Map<String, dynamic> json) =>
      _$GetAllCoursesDtoFromJson(json);
}
