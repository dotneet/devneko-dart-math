library dn_ui;

String join(list, [String sep = '']) {
  var s = new StringBuffer();
  var len = list.length;
  for ( var i = 0; i < len; i++ ) {
    s.add(list[i]);
    if ( i + 1 != len ) {
      s.add(sep);
    }
  }
  return s.toString();
}


