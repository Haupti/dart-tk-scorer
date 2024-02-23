sealed class Result<T> {}

class Ok<T> extends Result<T> {
  final T value;
  Ok(this.value);
}

class Failure<T> extends Result<T> {
  String message;
  Failure(this.message);
}
