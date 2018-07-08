abstract class Model {
  Map<String, dynamic> toJson();

  /**
   * isValid:   Boolean 
   * 
   * return true if all required fields are non-null
   */
  bool isValid();
}