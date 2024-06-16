import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/core/usecases/usecase.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/domain/repository/ngo_repository.dart';

class GetProductUseCase
    implements UseCase<DataState<List<ProductModel>>, void> {
  final NGORepository _ngoRepository;

  GetProductUseCase(this._ngoRepository);

  @override
  Future<DataState<List<ProductModel>>> call({void parms}) {
    return _ngoRepository.getAllProducts();
  }
}
