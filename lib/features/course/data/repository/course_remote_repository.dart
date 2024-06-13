import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/course/data/data_source/local/course_remote_datasource.dart';
import 'package:student_management_starter/features/course/domain/entity/course_entity.dart';
import 'package:student_management_starter/features/course/domain/repository/i_course_repository.dart';

final courseRemoteRepositoryProvider = Provider<ICourseRepository>((ref) {
  return CourseRemoteRepository(
    courseRemoteDatasource: ref.read(
      courseRemoteDataSourceProvider,
    ),
  );
});

class CourseRemoteRepository implements ICourseRepository {
  final CourseRemoteDatasource courseRemoteDatasource;

  CourseRemoteRepository({
    required this.courseRemoteDatasource,
  });

  @override
  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseRemoteDatasource.addCourse(course);
  }

  @override
  Future<Either<Failure, bool>> deleteCourse(CourseEntity course) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseRemoteDatasource.getAllCourses();
  }
}
