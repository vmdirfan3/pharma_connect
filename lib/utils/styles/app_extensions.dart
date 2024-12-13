import 'package:flutter/material.dart';

extension ExtNum on num {
  Widget get vs => SizedBox(height: toDouble());

  Widget get hs => SizedBox(width: toDouble());
}
