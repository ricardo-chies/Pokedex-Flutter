class PokemonUtils {
  static String transformWeight(int weight) {
    double weightInKg = weight / 10;
    String weightString = weightInKg.toString();
    
    if (weightString.indexOf('.') != -1) {
      int decimalPlaces = weightString.split('.')[1].length;
      if (decimalPlaces < 1) {
        weightString += '0';
      }
    } else {
      weightString += '.0';
    }
    
    return '$weightString Kg';
  }

  static String transformHeight(int height) {
    double heightInMeters = height / 10;
    String heightString = heightInMeters.toStringAsFixed(2); // Limita para uma casa decimal
    
    return '$heightString m';
  }
}
