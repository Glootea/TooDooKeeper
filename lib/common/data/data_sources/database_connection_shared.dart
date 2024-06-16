export 'database_connection_unsupported.dart'
    if (dart.library.ffi) 'database_connection_native.dart'
    if (dart.library.html) 'database_connection_web.dart';
