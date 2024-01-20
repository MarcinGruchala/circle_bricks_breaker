import 'dart:math';
import 'package:circle_bricks_breaker/utils/angles.dart';
import 'package:flame/components.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('findAngle function', () {
    test('Angle between two identical vectors is 0', () {
      final v1 = Vector2(1, 0);
      final v2 = Vector2(1, 0);
      expect(findAngle(v1, v2), equals(0.0));
    });

    test('Angle between opposite vectors is pi', () {
      final v1 = Vector2(1, 0);
      final v2 = Vector2(-1, 0);
      expect(findAngle(v1, v2), equals(pi));
    });

    test('Angle between perpendicular vectors is pi/2', () {
      final v1 = Vector2(1, 0);
      final v2 = Vector2(0, 1);
      expect(findAngle(v1, v2), equals(pi / 2));
    });

    test('Angle between vectors in second and fourth quadrants', () {
      final v1 = Vector2(-1, 1); // Second quadrant
      final v2 = Vector2(1, -1); // Fourth quadrant
      expect(findAngle(v1, v2), pi);
    });

    test('Angle between vectors with negative components', () {
      final v1 = Vector2(-1, -1);
      final v2 = Vector2(-1, 1);
      expect(findAngle(v1, v2), closeTo(-pi / 2, 0.0001));
    });

    // Additional tests can be added here for other scenarios
  });

  group('ConvertToDegrees extension', () {
    test('Converts 0 radians to 0 degrees', () {
      expect(0.0.toDegrees(), equals(0.0));
    });

    test('Converts pi/2 radians to 90 degrees', () {
      expect((pi / 2).toDegrees(), equals(90.0));
    });

    test('Converts pi radians to 180 degrees', () {
      expect(pi.toDegrees(), equals(180.0));
    });

    test('Converts 3*pi/2 radians to 270 degrees', () {
      expect((3 * pi / 2).toDegrees(), equals(270.0));
    });

    test('Converts 2*pi radians to 360 degrees', () {
      expect((2 * pi).toDegrees(), equals(360.0));
    });

    test('Converts a negative radian value', () {
      expect((-pi / 2).toDegrees(), equals(-90.0));
    });
  });
  group('NormalizedRadians extension', () {
    test('Normalizes a negative radian value to positive', () {
      expect((-1.0).normalize(), closeTo(2 * pi - 1, 0.0001));
    });

    test('Keeps a positive radian value unchanged', () {
      expect(1.0.normalize(), closeTo(1.0, 0.0001));
    });

    test('Keeps zero as zero', () {
      expect(0.0.normalize(), closeTo(0.0, 0.0001));
    });
  });
}
