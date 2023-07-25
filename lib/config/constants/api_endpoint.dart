class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://localhost:3000/";
  // static const String baseUrl = "http://192.168.1.64:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "/login";
  static const String register = "/register";
  static const String getAllUser = "/users";
  static const String deleteUser = "/users/:id";
  static const String updateUser = "/users/:id";

  // ====================== Pet Routes ======================
  static const String createPet = "/pets";
  static const String deletePet = "/pets/:id";
  static const String getAllPets = "/pets";
  static const String imageUrl = "http://localhost:3000/uploads/";

  // ====================== Adoption Form Routes ======================
  static const String postAdoptionForm = "/adoptionForm";
  static const String getAllAdoptionForms = "/adoptionForm";

  // ====================== Liked Pet Routes ======================
  static const String saveLikedPet = "/liked-pets";
  static const String getLikedPetsByUserId = "/liked-pets/:userId";
}
