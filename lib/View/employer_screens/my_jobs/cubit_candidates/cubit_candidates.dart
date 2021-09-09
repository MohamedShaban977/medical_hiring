import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/cubit_candidates/state_candidates.dart';
import 'package:medical_hiring/constants.dart';

class CandidatesCubit extends Cubit<CandidatesStates> {
  CandidatesCubit() : super(CandidatesInitial());

  static CandidatesCubit get(context) => BlocProvider.of(context);

  bool all = false, needToConfirm = false, accepted = false, rejected = false;
  Color activeColor = kSecondColor;
  Color inactiveColor = kWhiteColor;
  Color activeTextColor = kWhiteColor;
  Color inactiveTextColor = kSecondColor;

  void changeColor() {}
  void changeToAll() {
    emit(CandidatesLoading());
    Future.delayed(Duration(milliseconds: 1000), () {
      all = true;
      needToConfirm = false;
      accepted = false;
      rejected = false;

      emit(CandidatesAll(all));
    });
  }

  void changeToNeedToConfirm() {
    emit(CandidatesLoading());
    Future.delayed(Duration(milliseconds: 1000), () {
      all = false;
      needToConfirm = true;
      accepted = false;
      rejected = false;
      // isChange = !isChange;

      emit(CandidatesNeedToConfirm(needToConfirm));
    });
  }

  void changeToAccepted() {
    emit(CandidatesLoading());
    Future.delayed(Duration(milliseconds: 1000), () {
      all = false;
      needToConfirm = false;
      accepted = true;
      rejected = false;

      emit(CandidatesAccepted(accepted));
    });
  }

  void changeToRejected() {
    emit(CandidatesLoading());
    Future.delayed(Duration(milliseconds: 1000), () {
      all = false;
      needToConfirm = false;
      accepted = false;
      rejected = true;

      emit(CandidatesRejected(rejected));
    });
  }
}
