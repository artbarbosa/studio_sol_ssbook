import 'package:studio_sol_ssbook/src/core/shared/failures/failures.dart';

class BookRemoteDataSourceError extends Failure {
  BookRemoteDataSourceError({
    StackTrace? stackTrace,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}

class BookRepositoryError extends Failure {
  BookRepositoryError({
    StackTrace? stackTrace,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}
