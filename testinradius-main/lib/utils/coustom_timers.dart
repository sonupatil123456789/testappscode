import 'dart:async';

class CoustomCounterController {

  dynamic ResendOtpSeconds = "";
  Timer? countdownTimer;
  Duration otpDuration = Duration(seconds: 20);

  final StreamController<int> _secondsController = StreamController<int>.broadcast();



  
  StreamSink<int> get secondsSink => _secondsController.sink;
  Stream<int> get secondsStream => _secondsController.stream;


  startTimer() {
    otpDuration = Duration(seconds: 20);
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      const reduceSecondsBy = 1;
      ResendOtpSeconds = otpDuration.inSeconds - reduceSecondsBy;
      if (ResendOtpSeconds < 0) {
        countdownTimer!.cancel();
      } else {
        otpDuration = Duration(seconds: ResendOtpSeconds);
        secondsSink.add(ResendOtpSeconds);
        
      }
    });
  }
}
