class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://localhost:3000/";
  // static const String baseUrl = "http://192.168.1.64:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String getAllUser = "/auth/users";
  static const String deleteUser = "/auth/users/:id";
  static const String updateUser = "/auth/users/:id";
  // static const String uploadImage = "auth/uploadImage";

  // ====================== Pet Routes ======================
  static const String createPet = "/pets";
  static const String deletePet = "/pets";
  static const String getAllPets = "/pets";
  static const String imageUrl = "http://localhost:3000/uploads/";

  // ====================== Adoption Form Routes ======================
  static const String postAdoptionForm = "/adoptionForm";
  static const String getAllAdoptionForms = "/adoptionForm";

  // ====================== Liked Pet Routes ======================
  static const String likePet = "/liked-pets";
  static const String getLikedPetsByUserId = "/liked-pets";
  static const String unlikePet = "/liked-pets=";
}
