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

int getIndex(String motionName) {
  switch (motionName) {
    case "Modified Skull Crushers":
      return 0;
    case "Seated Rows":
      return 1;
    case "Reserve Flyes":
      return 2;
    case "Forward Punches":
      return 3;
    case "Diagonal Shoulder Raise":
      return 4;
    case "Overhead Triceps":
      return 5;
    case "Lateral Raise":
      return 6;
    case "Bicep Curls":
      return 7;
    case "Overhead Press":
      return 8;
    default:
      return 9;
  }
}
