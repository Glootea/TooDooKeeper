import 'dart:async';
import 'package:yandex_summer_school/main.dart';

class DebounceTransformer<T extends Debouncable> {
  final StreamController<T> _streamController = StreamController<T>();
  Timer? _timer;
  Stream<T> transform({required Duration duration, required Stream<T> stream}) {
    stream.listen(
      (data) {
        logger.d('Debounce received: $data');
        if (data.avoidDebounce) {
          _streamController.add(data);
          logger.d('$data has been sent without debounce');
          return;
        }
        _timer?.cancel();
        logger.d('Debounce timer has been canceled');
        _timer = Timer(duration, () {
          logger.d('Throw with debounce: $data');
          _streamController.add(data);
        });
      },
      cancelOnError: false,
      onDone: _streamController.close,
    );
    return _streamController.stream.asBroadcastStream();
  }
}

/// Implement in order for events to be debounced
abstract interface class Debouncable {
  /// Default value is false
  ///
  /// Pass to event to set custom behavior for the event
  bool get avoidDebounce => false;
}
