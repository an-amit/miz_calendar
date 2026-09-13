/// A discriminated union for success/failure results.
///
/// Avoids using exceptions for expected failure paths and keeps
/// return types explicit throughout the domain and data layers.
library;

import 'package:meta/meta.dart';

/// Represents either a successful [Ok] value or a [Err] failure.
@immutable
sealed class Result<T, E> {
  const Result();

  /// Returns true if this is an [Ok].
  bool get isOk => this is Ok<T, E>;

  /// Returns true if this is an [Err].
  bool get isErr => this is Err<T, E>;

  /// Returns the success value, or null if [Err].
  T? get valueOrNull => switch (this) {
        Ok(:final value) => value,
        Err() => null,
      };

  /// Returns the error, or null if [Ok].
  E? get errorOrNull => switch (this) {
        Ok() => null,
        Err(:final error) => error,
      };

  /// Maps the success value.
  Result<U, E> map<U>(U Function(T value) transform) => switch (this) {
        Ok(:final value) => Ok(transform(value)),
        Err(:final error) => Err(error),
      };

  /// Maps the error value.
  Result<T, F> mapErr<F>(F Function(E error) transform) => switch (this) {
        Ok(:final value) => Ok(value),
        Err(:final error) => Err(transform(error)),
      };

  /// Chains result-producing operations.
  Result<U, E> flatMap<U>(Result<U, E> Function(T value) transform) =>
      switch (this) {
        Ok(:final value) => transform(value),
        Err(:final error) => Err(error),
      };

  /// Extracts the value or throws the error.
  T unwrap() => switch (this) {
        Ok(:final value) => value,
        Err(:final error) => throw StateError('Called unwrap() on Err: $error'),
      };

  /// Extracts the value or returns [defaultValue].
  T unwrapOr(T defaultValue) => switch (this) {
        Ok(:final value) => value,
        Err() => defaultValue,
      };

  /// Executes [onOk] or [onErr] depending on the result.
  R when<R>({
    required R Function(T value) onOk,
    required R Function(E error) onErr,
  }) =>
      switch (this) {
        Ok(:final value) => onOk(value),
        Err(:final error) => onErr(error),
      };
}

/// A successful result containing [value].
@immutable
final class Ok<T, E> extends Result<T, E> {
  const Ok(this.value);

  final T value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Ok<T, E> && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Ok($value)';
}

/// A failure result containing [error].
@immutable
final class Err<T, E> extends Result<T, E> {
  const Err(this.error);

  final E error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Err<T, E> && other.error == error;

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'Err($error)';
}
