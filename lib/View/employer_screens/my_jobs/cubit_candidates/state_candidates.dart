abstract class CandidatesStates {}

class CandidatesInitial extends CandidatesStates {}

class CandidatesLoading extends CandidatesStates {}

class CandidatesAll extends CandidatesStates {
  final bool all;
  CandidatesAll( this.all);
}

class CandidatesNeedToConfirm extends CandidatesStates {
  CandidatesNeedToConfirm(bool isChange);

}

class CandidatesAccepted extends CandidatesStates {
  CandidatesAccepted(bool isChange);
}

class CandidatesRejected extends CandidatesStates {
  CandidatesRejected(bool isChange);
}
