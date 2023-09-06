import 'dart:ui';

Color getIndicatorColor(String motionName) {
  switch (motionName) {
    case "Modified Skull Crushers":
      return const Color(0xFFe3342f);
    case "Seated Rows":
      return const Color(0xFFfb5c18);
    case "Reserve Flyes":
      return const Color(0xFF3E537F);
    case "Forward Punches":
      return const Color(0xFF38c172);
    case "Diagonal Shoulder Raise":
      return const Color(0xFF4dc0b5);
    case "Overhead Triceps":
      return const Color(0xFF3490dc);
    case "Lateral Raise":
      return const Color(0xFF6574cd);
    case "Bicep Curls":
      return const Color(0xFF9561e2);
    case "Overhead Press":
      return const Color(0xFFf66d9b);
    default:
      return const Color.fromARGB(15, 37, 32, 39);
  }
}
