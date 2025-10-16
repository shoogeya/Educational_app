import 'package:flutter/cupertino.dart';

class RemoveScrollGlow extends ScrollBehavior {
  const RemoveScrollGlow();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}