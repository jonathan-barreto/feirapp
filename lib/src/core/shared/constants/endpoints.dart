class EndPoints {
  static const String baseUrlImage =
      'https://sabor-natural-app.s3.sa-east-1.amazonaws.com/images/';

  static const String baseUrl = 'http://192.168.0.108:8000/api';
  static const String getAllProducts = '/products';
  static const String getProductsByName = '/products/name';
  static const String getProductsByCategory = '/products/category';
  static const String getProductsByOrder = '/products/order';
  static const String getProductsByIds = '/products';
  static const String getDiscountedProducts = '/discounted-products';
}
