import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/core/usecases/usecase.dart';
import 'package:ngo/features/data/remote/responses/verify_response.dart';
import 'package:ngo/features/domain/repository/ngo_repository.dart';

class VerifyDonorUseCase implements UseCase<DataState<VerifyResponse>, String> {
  final NGORepository _ngoRepository;

  VerifyDonorUseCase(this._ngoRepository);

  @override
  Future<DataState<VerifyResponse>> call({String? parms}) {
    return _ngoRepository.verifyDonor(parms ?? "notoken");
  }
}
