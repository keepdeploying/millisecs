/// Exposes functions and extensions to convert between milliseconds and time
/// formats and vice versa.
///
/// This is Dart & Flutter adaptation of
/// [Vercel's ms npm package](https://github.com/vercel/ms).
library ms;

const _s = 1000;
const _m = _s * 60;
const _h = _m * 60;
const _d = _h * 24;
const _w = _d * 7;
const _y = _d * 365.25;

/// Parses the given [str] and return milliseconds. Throws [ArgumentError] if
/// [str] is empty or doesn't match the expected format.
num parse(String str) {
  if (str.isEmpty) throw ArgumentError('str to be parsed must not be empty.');

  final match = RegExp(
    r'^(?<value>-?(?:\d+)?\.?\d+) *(?<type>milliseconds?|msecs?|ms|seconds?|secs?|s|minutes?|mins?|m|hours?|hrs?|h|days?|d|weeks?|w|years?|yrs?|y)?$',
    caseSensitive: false,
  ).firstMatch(str);
  if (match == null) {
    throw ArgumentError('Provided string does not match expected format.');
  }

  final n = num.parse(match.namedGroup('value')!);
  final type = (match.namedGroup('type') ?? 'ms').toLowerCase();

  switch (type) {
    case 'years':
    case 'year':
    case 'yrs':
    case 'yr':
    case 'y':
      return n * _y;
    case 'weeks':
    case 'week':
    case 'w':
      return n * _w;
    case 'days':
    case 'day':
    case 'd':
      return n * _d;
    case 'hours':
    case 'hour':
    case 'hrs':
    case 'hr':
    case 'h':
      return n * _h;
    case 'minutes':
    case 'minute':
    case 'mins':
    case 'min':
    case 'm':
      return n * _m;
    case 'seconds':
    case 'second':
    case 'secs':
    case 'sec':
    case 's':
      return n * _s;
    case 'milliseconds':
    case 'millisecond':
    case 'msecs':
    case 'msec':
    case 'ms':
      return n;
    default:
      // This should never occur.
      throw ArgumentError(
          'The unit $type was matched, but no matching case exists.');
  }
}

/// Same as [parse] but returns `null` instead of throwing errors.
num? tryParse(String str) {
  try {
    return parse(str);
  } catch (_) {
    return null;
  }
}

String _fmtShort(num millisecs) {
  final msAbs = millisecs.abs();
  if (msAbs >= _y) {
    return '${(millisecs / _y).round()}y';
  } else if (msAbs >= _w) {
    return '${(millisecs / _w).round()}w';
  } else if (msAbs >= _d) {
    return '${(millisecs / _d).round()}d';
  } else if (msAbs >= _h) {
    return '${(millisecs / _h).round()}h';
  } else if (msAbs >= _m) {
    return '${(millisecs / _m).round()}m';
  } else if (msAbs >= _s) {
    return '${(millisecs / _s).round()}s';
  } else {
    return '${millisecs}ms';
  }
}

String _plural(num millisecs, num msAbs, num n, String name) {
  final isPlural = msAbs >= n * 1.5;
  return '${(millisecs / n).round()} $name${isPlural ? 's' : ''}';
}

String _fmtLong(num millisecs) {
  final msAbs = millisecs.abs();
  if (msAbs >= _y) {
    return _plural(millisecs, msAbs, _y, 'year');
  } else if (msAbs >= _w) {
    return _plural(millisecs, msAbs, _w, 'week');
  } else if (msAbs >= _d) {
    return _plural(millisecs, msAbs, _d, 'day');
  } else if (msAbs >= _h) {
    return _plural(millisecs, msAbs, _h, 'hour');
  } else if (msAbs >= _m) {
    return _plural(millisecs, msAbs, _m, 'minute');
  } else if (msAbs >= _s) {
    return _plural(millisecs, msAbs, _s, 'second');
  } else {
    return '$millisecs ms';
  }
}

/// Formats the provided [millisecs] into a String. Returns longer unit names
/// if [long] is `true`. [long] is `false` by default. Throws an [ArgumentError]
/// if the provided [millisecs] is not finite.
String format(num millisecs, {bool long = false}) {
  if (!millisecs.isFinite) {
    throw ArgumentError('millisecs provided to format() must be finite');
  }
  return long ? _fmtLong(millisecs) : _fmtShort(millisecs);
}

/// Same as [format] but returns `null` instead of throwing errors.
String? tryFormat(num millisecs, {bool long = false}) {
  try {
    return format(millisecs, long: long);
  } catch (_) {
    return null;
  }
}

/// Parses or formats [value]. If [value] is a `String`, parses and returns
/// milliseconds. If [value] is `num`, formats and returns a `String`. [long]
/// is used during formatting to use long unit names. Throws an [ArgumentError]
/// if the provided [value] is not a `String` or `num`, or if parsing or
/// formatting wasn't successful.
dynamic ms(dynamic value, {bool long = false}) {
  if (value is String) {
    return parse(value);
  } else if (value is num) {
    return format(value, long: long);
  } else {
    throw ArgumentError('Value provided to ms() must be a string or number.');
  }
}

/// Same as [ms] but returns `null` instead of throwing errors.
dynamic tryMS(dynamic value, {bool long = false}) {
  try {
    return ms(value, long: long);
  } catch (_) {
    return null;
  }
}

/// Provides [ms]'s features directly on Strings. Specifically, allows you to
/// parse Strings into milliseconds.
extension StringMS on String {
  /// Parses this String and return milliseconds. Throws [ArgumentError] if
  /// this String is empty or doesn't match the expected format.
  num parseMS() => parse(this);

  /// Same as [parseMS] but returns `null` instead of throwing errors.
  num? tryParseMS() => tryParse(this);
}

/// Provides [ms]'s features directly on numbers. Specifically, allows you to
/// format the number into Strings.
extension NumMS on num {
  /// Formats this number into a String. Returns longer unit names
  /// if [long] is `true`. [long] is `false` by default. Throws an
  /// [ArgumentError] if this number is not finite.
  String formatMS({bool long = false}) => format(this, long: long);

  /// Same as [formatMS] but returns `null` instead of throwing errors.
  String? tryFormatMS({bool long = false}) => tryFormat(this, long: long);
}
