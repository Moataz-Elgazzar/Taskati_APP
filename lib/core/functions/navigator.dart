import 'package:flutter/material.dart';

pushTo (BuildContext context , Widget screen){
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

pop (BuildContext context) {
  Navigator.pop(context);
}


pushWithReplacement (BuildContext context , Widget screen) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen));
}


pushAndRemoveUntil (BuildContext context , Widget screen) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => screen), (route) => false);
}