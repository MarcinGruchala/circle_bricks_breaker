import 'dart:math';

import 'package:flame/game.dart';

/// Type alias for radians.
typedef Rad = double;

/// Calculates the angle in radians between two vectors.
///
/// Returns the angle in radians in the range -pi to pi.
/// If value is positive the angle is in range (0, pi], otherwise the angle is
/// in range [-pi, 0).
Rad findAngle(Vector2 firstVector, Vector2 secondVector) {
  final dot = firstVector.dot(secondVector);
  final det = firstVector.cross(secondVector);

  return atan2(det, dot);
}

extension ConvertToDegrees on Rad {
  double toDegrees() => this * 180 / pi;
}

extension NormalizedRadians on Rad {
  Rad normalize() {
    if (this < 0) {
      return this + 2 * pi;
    }
    return this;
  }
}
