class AppEndpoints {
  static const String baseUrl = 'http://192.168.0.108:8000/api';
  static const String baseImage = '$baseUrl/image/';

  // Auth endpoints
  static const String login = '/user/login';
  static const String register = '/user/register';
  static const String logout = '/user/logout';
  static const String profile = '/user/profile';

  // Product endpoints
  static const String getProducts = '/products';
  static const String getProductById = '/product';
  static const String getProductsByIds = '/products-by-ids';
  static const String getProductsWithDiscount = '/products/with-discount';
}
