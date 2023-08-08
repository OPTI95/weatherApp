class GetWindDirection {
  static String getWindDirection(int degrees) {
    if ((degrees >= 337.5 && degrees <= 360) ||
        (degrees >= 0 && degrees < 22.5)) {
      return "Северный";
    } else if (degrees >= 22.5 && degrees < 67.5) {
      return "Северо-восточный";
    } else if (degrees >= 67.5 && degrees < 112.5) {
      return "Восточный";
    } else if (degrees >= 112.5 && degrees < 157.5) {
      return "Юго-восточный";
    } else if (degrees >= 157.5 && degrees < 202.5) {
      return "Южный";
    } else if (degrees >= 202.5 && degrees < 247.5) {
      return "Юго-западный";
    } else if (degrees >= 247.5 && degrees < 292.5) {
      return "Западный";
    } else if (degrees >= 292.5 && degrees < 337.5) {
      return "Северо-западный";
    } else {
      return "Неизвестное направление";
    }
  }
}
