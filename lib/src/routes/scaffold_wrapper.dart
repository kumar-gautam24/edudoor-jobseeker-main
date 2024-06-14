import 'package:edudoor_jobseeker/src/firebase/firebase_analytics.dart';
import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatefulWidget {
  final Widget child;
  final String screenName;
  const ScaffoldWrapper({super.key, required this.child, required this.screenName});

  @override
  State<ScaffoldWrapper> createState() => _ScaffoldWrapperState();
}

class _ScaffoldWrapperState extends State<ScaffoldWrapper> with AutomaticKeepAliveClientMixin<ScaffoldWrapper> {
  _hideKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  late DateTime startTime;

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now();
    TrackingService.logScreenView(widget.screenName);
  }

  @override
  void dispose() {
    final duration = DateTime.now().difference(startTime);
    TrackingService.logEvent(
      'screen_view',
      parameters: {
        'screen_name': widget.screenName,
        'duration_seconds': duration.inSeconds,
      },
    );
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () => _hideKeyboard(),
      child: widget.child,
    );
  }
}
