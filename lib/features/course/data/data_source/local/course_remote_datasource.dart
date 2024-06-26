import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/app/constants/api_endpoint.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/core/networking/remote/http_service.dart';
import 'package:student_management_starter/features/course/data/dto/get_all_courses_dto.dart';
import 'package:student_management_starter/features/course/data/model/course_api_model.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';

final courseRemoteDataSourceProvider = Provider(
  (ref) => CourseRemoteDatasource(
    dio: ref.read(httpServiceProvider),
    courseApiModel: ref.read(courseApiModelProvider),
  ),
);

class CourseRemoteDatasource {
  final Dio dio;
  final CourseApiModel courseApiModel;

  CourseRemoteDatasource({
    required this.dio,
    required this.courseApiModel,
  });

  Future<Either<Failure, bool>> addCourse(CourseEntity course) async {
    try {
      var response = await dio.post(
        ApiEndpoints.createCourse,
        data: courseApiModel.fromEntity(course).toJson(),
      );

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllCourse);
      if (response.statusCode == 200) {
        GetAllCoursesDto courseAddDto =
            GetAllCoursesDto.fromJson(response.data);
        return Right(
          courseApiModel.toEntityList(courseAddDto.data),
        );
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  // Future<Either<Failure, bool>> deleteCourse(CourseEntity course) async {
  //   try {
  //     var response = await dio.delete(
  //       '${ApiEndpoints.deleteCourse}/${course.courseId}',
  //     );
  //     if (response.statusCode == 200) {
  //       return const Right(true);
  //     } else {
  //       return Left(
  //         Failure(
  //           error: response.data['message'],
  //           statusCode: response.statusCode.toString(),
  //         ),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Left(
  //       Failure(
  //         error: e.message.toString(),
  //       ),
  //     );
  //   }
  // }
}
