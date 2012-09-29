library dn_math;

import 'dart:math';
import 'vector.dart';

// 重力加速度
const double GRAVITY_ACCELERATION = 9.80665;

class PhysicalObject2D {
  Vector2D position;
  Vector2D speed;
  num mass;

  PhysicalObject2D([this.position, this.speed, this.mass = 0]) {
  }

  void move(u) {
    position.x += speed.x * u;
    position.y += speed.y * u;
  }

  /** 
   * return normal component of reaction
   */
  double get normalReaction() {
    return mass * GRAVITY_ACCELERATION;
  }

  /**
   * calculate frictional force.
   * @param cof coefficient of friction
   */
  double getFrictionalForce( num cof ) {
    return cof * normalReaction;
  }
}