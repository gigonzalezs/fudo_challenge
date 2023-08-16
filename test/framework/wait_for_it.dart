
Future waitForIt(
      Object description,
      dynamic Function() body,
      {Duration duration = const Duration(milliseconds: 100)}
    ) async {

   await Future.delayed(duration, body);
}