import 'package:flutter_test/flutter_test.dart';
import 'package:ms/ms.dart';

void main() {
  group('parse(string)', () {
    test('should not throw an error', () {
      expect(() => parse('1m'), returnsNormally);
    });

    test('should preserve ms', () {
      expect(parse('100'), 100);
    });

    test('should convert from m to ms', () {
      expect(parse('1m'), 60000);
    });

    test('should convert from h to ms', () {
      expect(parse('1h'), 3600000);
    });

    test('should convert d to ms', () {
      expect(parse('2d'), 172800000);
    });

    test('should convert w to ms', () {
      expect(parse('3w'), 1814400000);
    });

    test('should convert s to ms', () {
      expect(parse('1s'), 1000);
    });

    test('should convert ms to ms', () {
      expect(parse('100ms'), 100);
    });

    test('should convert y to ms', () {
      expect(parse('1y'), 31557600000);
    });

    test('should work with ms', () {
      expect(parse('1.5h'), 5400000);
    });

    test('should work with multiple spaces', () {
      expect(parse('1   s'), 1000);
    });

    test('should be case-insensitive', () {
      expect(parse('1.5H'), 5400000);
    });

    test('should work with numbers starting with .', () {
      expect(parse('.5ms'), 0.5);
    });

    test('should work with negative integers', () {
      expect(parse('-100ms'), -100);
    });

    test('should work with negative decimals', () {
      expect(parse('-1.5h'), -5400000);
      expect(parse('-10.5h'), -37800000);
    });

    test('should work with negative decimals starting with "."', () {
      expect(parse('-.5h'), -1800000);
    });
  });

  group('parse(long string)', () {
    test('should not throw an error', () {
      expect(() => parse('53 milliseconds'), returnsNormally);
    });

    test('should convert milliseconds to ms', () {
      expect(parse('53 milliseconds'), 53);
    });

    test('should convert msecs to ms', () {
      expect(parse('17 msecs'), 17);
    });

    test('should convert sec to ms', () {
      expect(parse('1 sec'), 1000);
    });

    test('should convert from min to ms', () {
      expect(parse('1 min'), 60000);
    });

    test('should convert from hr to ms', () {
      expect(parse('1 hr'), 3600000);
    });

    test('should convert days to ms', () {
      expect(parse('2 days'), 172800000);
    });

    test('should convert weeks to ms', () {
      expect(parse('1 week'), 604800000);
    });

    test('should convert years to ms', () {
      expect(parse('1 year'), 31557600000);
    });

    test('should work with decimals', () {
      expect(parse('1.5 hours'), 5400000);
    });

    test('should work with negative integers', () {
      expect(parse('-100 milliseconds'), -100);
    });

    test('should work with negative decimals', () {
      expect(parse('-1.5 hours'), -5400000);
    });

    test('should work with negative decimals starting with "."', () {
      expect(parse('-.5 hr'), -1800000);
    });
  });

  group('parse(invalid inputs)', () {
    test('should throw an error, when parse("")', () {
      expect(() => ms(''), throwsArgumentError);
    });

    test('should throw an error, when parse non-numeric strings', () {
      expect(() => parse('🎯'), throwsArgumentError);
      expect(() => parse('foo'), throwsArgumentError);
    });

    test('should throw an error, when parse invalid numeric symbols combo', () {
      expect(() => parse('10-.5'), throwsArgumentError);
    });
  });

  group('tryParse', () {
    test('should return expected values with valid inputs', () {
      expect(parse('100'), 100);
      expect(parse('2d'), 172800000);
      expect(parse('1y'), 31557600000);
      expect(parse('1.5H'), 5400000);
      expect(parse('-.5 hr'), -1800000);
    });

    test('should return null with invalid inputs', () {
      expect(tryParse(''), null);
      expect(tryParse('🎯'), null);
      expect(tryParse('foo'), null);
      expect(tryParse('10-.5'), null);
    });
  });
}
