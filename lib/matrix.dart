library dn_math;

import 'dart:math';
import 'vector.dart';

class Matrix {
  List<Vector> _mat;
  int _col;
  int _row;

  Matrix(this._col, this._row) {
    _mat = new List<Vector>( _row );
    for ( var r = 0; r < _row; r++ ) {
      _mat[r] = new Vector(_col);
    }
  }

  Matrix.fromLists(List<List<num>> list) {
    _row = list.length;
    _col = list[0].length;
    _mat = new List<Vector>(_row);
    for ( var i = 0; i < _row; i++ ) {
      _mat[i] = vector(list[i]);
    }
  }

  Matrix.zero(this._col, this._row) {
    _mat = new List<Vector>( _row );
    for ( var r = 0; r < _row; r++ ) {
      _mat[r] = new Vector.zero(_col);
    }
  }

  Matrix.unit(int size) {
    _col = _row = size;
    _mat = new List<Vector>( _row );
    for ( var r = 0; r < _row; r++ ) {
      _mat[r] = new Vector.zero(_col);
      _mat[r][r] = 1;
    }
  }

  operator * (Matrix m) {
    if ( _col != m._row ) {
      throw new Exception('invalid size.');
    }
    var result = new Matrix(m._col, _row);
    for ( int r = 0; r < _row; r++ ) {
      for ( int c = 0; c < m._col; c++ ) {
        result[r][c] = this[r] * m.column(c);
      }
    }
    return result;
  }

  /**
   * return column vector.
   */
  Vector column(int c) {
    var v = new Vector(_row);
    for ( var i = 0; i < _row; i++ ) {
      v[i] = this[i][c];
    }
    return v;
  }

  operator [](row) {
    return _mat[row];
  }

  void dump() {
    var sb = new StringBuffer();
    for ( var r = 0; r < _row; r++ ) {
      print(this[r]);
    }
  }

  static rotate2D(num theta) {
    return new Matrix.fromLists(
      [
        [cos(theta), -sin(theta), 0],
        [sin(theta), cos(theta), 0],
        [0, 0, 1]
      ] );
  }

  static rotateX(num theta) {
    return new Matrix.fromLists(
      [
        [1, 0, 0, 0],
        [0, cos(theta), -sin(theta), 0],
        [0, sin(theta), cos(theta), 0 ],
        [0, 0, 0, 1 ]
      ] );
  }

  static rotateY(num theta) {
    return new Matrix.fromLists(
      [
        [cos(theta), 0, sin(theta), 0],
        [0, 1, 0, 0],
        [-sin(theta), 0, cos(theta), 0],
        [0, 0, 0, 1 ]
      ] );
  }

  static rotateZ(num theta) {
    return new Matrix.fromLists(
      [
        [cos(theta), -sin(theta), 0, 0],
        [sin(theta), cos(theta),  0, 0],
        [0, 0, 1, 0 ],
        [0, 0, 0, 1 ]
      ] );
  }
}

