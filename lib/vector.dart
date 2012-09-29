library dn_math;

import 'dart:math';

class Vector2D {
  num x;
  num y;
  Vector2D([this.x, this.y]) {}
  String toString() {
    return "Vector2D(${x},${y})";
  }
  num get length() {
    return sqrt(x+y);
  }
  num distance(Vector2D v) {
    return sqrt((this.x - v.x).abs() + (this.y - v.y).abs());
  }
}

class Vector3D {
  num x;
  num y;
  num z;
  Vector3D([this.x, this.y, this.z]){
  }
  String toString() {
    return "Vector3D(${x},${y},${z})";
  }
}