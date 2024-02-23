sealed class Result<T> {
    Result<V> map<V>(V Function(T t) fn);
}

class Ok<T> extends Result<T> {
  final T value;
  Ok(this.value);

  @override
  Result<V> map<V>(V Function(T t) fn) {
      return Ok(fn(this.value));
  }
}

class Failure<T> extends Result<T> {
  String message;
  Failure(this.message);

  @override
  Result<V> map<V>(V Function(T t) fn) {
      return Failure(this.message);
  }
}

