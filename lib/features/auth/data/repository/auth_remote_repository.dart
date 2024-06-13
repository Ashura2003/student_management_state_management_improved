import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/core/failure/failure.dart';
import 'package:student_management_starter/features/auth/data/data_source/local/auth_remote_datasource.dart';
import 'package:student_management_starter/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management_starter/features/auth/domain/repository/i_auth_repository.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRepository(
    ref.read(authRemoteDatasourceProvider),
  );
});

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRemoteRepository(this.authRemoteDatasource);

  @override
  Future<Either<Failure, bool>> addStudent(AuthEntity auth) {
    // TODO: implement addStudent
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    return authRemoteDatasource.uploadProfilePicture(file);
  }
}
