library dn_math;

import 'dart:math';

num average(List<num> list) {
  var sum = 0;
  list.forEach( (i){ sum += i; } );
  return sum / list.length;
}

num variance(List<num> list) {
  var avg = average(list);
  var s = 0;
  list.forEach( (n){
    d = avg - n;
    s += d * d;
  });
  return s;
}

num stddev(List<num> list) {
  var v = variance(list);
  return sqrt(v);
}

num covariance(List<num> l1, List<num> l2) {
  assert( l1.length == l2.length);

  var sd1 = stddev(l1);
  var sd2 = stddev(l2);
  var s = 0;
  for ( var i = 0; i < l1.length; i++ ) {
    s += (l1[i] - sd1) * (l2[i] - sd2);
  }
  return s / l1.length;
}

num correlation(List<num> l1, List<num> l2) {
  assert( l1.length == l2.length );

  var sd1 = stddev(l1);
  var sd2 = stddev(l2);
  var s = 0;
  for ( var i = 0; i < l1.length; i++ ) {
    s += (l1[i] - sd1) * (l2[i] - sd2);
  }
  return (s / l1.length) / (sd1 * sd2);
}

