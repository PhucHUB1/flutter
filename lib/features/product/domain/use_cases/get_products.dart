import '../../data/repositories/product_repository.dart';
import '../entities/product.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts({required this.repository});

  Future<List<Product>> call() async {
    return await repository.getAllProducts();
  }
}
