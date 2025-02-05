
import 'package:provider/single_child_widget.dart';

//! Add Provider to your pubspect.yaml file

/// Shared providers for all configurations.
List<SingleChildWidget> _sharedProviders = [];

List<SingleChildWidget> get providersRemote {
  return [
    //! Add your remote providers here
    ..._sharedProviders,
  ];
}

List<SingleChildWidget> get providersLocal {
  return [
    //! Add your local providers here
    ..._sharedProviders,
  ];
}

  