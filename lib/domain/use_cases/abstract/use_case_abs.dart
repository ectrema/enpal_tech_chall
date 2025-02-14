/// [UseCaseWithParams]
abstract interface class UseCaseWithParams<T, P> {
  /// execute
  T execute(P params);
}

/// [UseCase]
abstract interface class UseCase<T> {
  /// execute
  T execute();
}
