class ClassifyHumidity {
  static String classifyHumidity(double relativeHumidity) {
    if (relativeHumidity < 30) {
      return "Низкая влажность";
    } else if (relativeHumidity >= 30 && relativeHumidity <= 60) {
      return "Умеренная влажность";
    } else if (relativeHumidity > 60) {
      return "Высокая влажность";
    } else {
      return "Неопределенная влажность";
    }
  }
}
