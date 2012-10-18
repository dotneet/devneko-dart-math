library dn_math;

import 'dart:math';

import 'src/util.dart';

class Vector {
  List<num> _elems;
  Vector(int d) {
    _elems = new List<num>(d);
  }
  Vector.zero(int d) {
    _elems = new List<num>(d);
    for ( var i = 0; i < d; i++ ) {
      _elems[i] = 0;
    }
  }
  factory Vector.fromElements(List<num> elems) {
    switch ( elems.length ) {
      case 2:
        return new Vector2D(elems[0], elems[1]);
      case 3:
        return new Vector3D(elems[0], elems[1], elems[2]);
      default:
        var v = new Vector(elems.length);
        v._elems = elems;
        return v;
    }
  }

  num get length() {
    var s = 0.0;
    _elems.forEach( (i) { s += i * i; } );
    return sqrt(s);
  }

  num distance(Vector v) {
    var diff = v - this;
    return diff.length;
  }

  num operator [] (int idx) {
    return _elems[idx];
  }

  void operator []= (int idx, num value) {
    _elems[idx] = value;
  }

  num operator * (Vector v) {
    assert( this._elems.length == v._elems.length );
    var len = this._elems.length; 
    var result = 0;
    for ( var i = 0; i < len; i++ ) {
      result += _elems[i] * v[i];
    }
    return result;
  }

  Vector operator - (Vector v) {
    // 次元数が異なるベクトルの差は計算不可
    assert( this._elems.length == v._elems.length );
    var len = this._elems.length;
    var d = new List<num>(len);
    for ( var i = 0; i < len; i++ ) {
      d[i] = this._elems[i] - v._elems[i];
    }
    return new Vector.fromElements(d);
  }

  Vector normal() {
    var len = this.length;
    var size = this._elems.length;
    var result = new List<num>(size);
    for ( var i = 0;i < size; i++ ) {
      result[i] = this._elems[i] / len;
    }
    return new Vector.fromElements(result);
  }

  String toString() {
    var sb = new StringBuffer();
    sb.add('[');
    sb.add(join(_elems, ', '));
    sb.add(']');
    return sb.toString();
  }
}

class Vector2D extends Vector {
  Vector2D([x = 0, y = 0]) : super(2) {
    this._elems[0] = x;
    _elems[1] = y;
  }
  String toString() {
    return "Vector2D(${x},${y})";
  }
  num get x() {
    return _elems[0];
  }
  void set x(num _x) {
    _elems[0] = _x;
  }
  num get y() {
    return _elems[1];
  }
  void set y(num _y) {
    _elems[1] = _y;
  }
}

class Vector3D extends Vector {
  Vector3D([x = 0, y = 0, z = 0]) : super(3) { 
    _elems[0] = x;
    _elems[1] = y;
    _elems[2] = z;
  }

  num get x() => _elems[0];
  void set x(n) { _elems[0] = n; }
  num get y() => _elems[1];
  void set y(n) { _elems[1] = n; }
  num get z() => _elems[2];
  void set z(n) { _elems[2] = n; }

  Vector3D cross(v) {
    return vector(
        [ y * v.z - z * v.y,
          z * v.x - x * v.z,
          x * v.y - y * v.x ] );
  }
  
  String toString() {
    return "Vector3D(${x},${y},${z})";
  }
}

Vector vector(List<num> elems) {
  return new Vector.fromElements(elems);
}
