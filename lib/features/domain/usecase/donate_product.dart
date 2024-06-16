import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/core/usecases/usecase.dart';
import 'package:ngo/features/data/remote/responses/response.dart';
import 'package:ngo/features/domain/repository/ngo_repository.dart';

class DonateProductUseCase
    implements UseCase<DataState<GeneralResponse>, List<dynamic>> {
  final NGORepository _ngoRepository;
  DonateProductUseCase(this._ngoRepository);

  @override
  Future<DataState<GeneralResponse>> call({List<dynamic>? parms}) {
    return _ngoRepository.donateProduct(parms![0], parms[1], parms[2]);
  }
}
