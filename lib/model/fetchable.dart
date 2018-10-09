// Models an enum with a value that can be fetched remotely using three mutually exclusive states:
//  - loading
//  - success (with an object of some type)
//  - error (with an Error object)

import 'package:meta/meta.dart';

abstract class Fetchable<T> {
  factory Fetchable.loading() = FetchableLoading<T>;
  factory Fetchable.success(T object) = FetchableSuccess<T>;
  factory Fetchable.error(Error error) = FetchableError<T>;

  /// transform this fetchable object into a different fetchable type
  Fetchable<U> map<U>(U f(T t));

  /// returns the object that's contained by this fetchable object (under
  /// the assumption that it is successful). If not successful, the object
  /// contained in `or` will be returned instead.
  T resolveSuccessfulObject({@required T or});
}

class FetchableLoading<T> implements Fetchable<T> {
  const FetchableLoading();

  Fetchable<U> map<U>(U f(T t)) {
    return Fetchable<U>.loading();
  }

  T resolveSuccessfulObject({@required T or}) {
    return or;
  }
}

class FetchableSuccess<T> implements Fetchable<T> {
  final T object;
  const FetchableSuccess(this.object);

  Fetchable<U> map<U>(U f(T t)) {
    return Fetchable<U>.success(f(object));
  }

  T resolveSuccessfulObject({@required T or}) {
    return object;
  }
}

class FetchableError<T> implements Fetchable<T> {
  final Error error;

  const FetchableError(this.error);

  Fetchable<U> map<U>(U f(T t)) {
    return Fetchable.error(error);
  }

  T resolveSuccessfulObject({@required T or}) {
    return or;
  }
}
