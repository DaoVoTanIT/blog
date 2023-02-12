import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
// import 'package:equatable/equatable.dart';

// abstract class TimerState extends Equatable {
//   const TimerState();

//   @override
//   List<Object> get props => [];
// }

// class TimerInitial extends TimerState {
//   const TimerInitial();

//   @override
//   String toString() => 'TimerInitial { duration:  }';
// }

// class TimerRunPause extends TimerState {
//   const TimerRunPause();

//   @override
//   String toString() => 'TimerRunPause { duration:  }';
// }

// class TimerRunInProgress extends TimerState {
//   const TimerRunInProgress();

//   @override
//   String toString() => 'TimerRunInProgress { duration:  }';
// }

// class TimerRunComplete extends TimerState {
//   const TimerRunComplete() : super();
// }
