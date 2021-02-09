import 'package:check_it_fixed_version/constants.dart';
import 'package:flutter/material.dart';

const SnackBar RemovedSnackBar = SnackBar(
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRadius),
          topRight: Radius.circular(kRadius))),
  content: Text('Task Removed'),
  duration: Duration(seconds: 1),
  //TODO: add undo ability
);
