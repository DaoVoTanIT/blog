import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/feature/domain/bloc/domain.dart';
import 'package:cmms/feature/domain/repository/domain_repository.dart';
import 'package:get_it/get_it.dart';

class DomainBloc extends Bloc<DomainEvent, DomainState> {
  DomainBloc() : super(DomainInitial()) {
    on<CheckDomainEvent>((event, emit) async {
      try {
        emit(DomainLoading());
        var domainRepository = await GetIt.I.getAsync<DomainRepository>();
        await domainRepository.checkToken(event.domain);
        emit(DomainSuccess());
      } catch (e) {
        emit(const DomainFailure(error: ''));
      }
    });
  }
}
