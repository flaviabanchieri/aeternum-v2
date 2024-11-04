import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets_compartilhados/user_header/user_header_widget.dart';
import 'header_widget.dart' show HeaderWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderModel extends FlutterFlowModel<HeaderWidget> {
  ///  Local state fields for this component.

  bool contando = false;

  ///  State fields for stateful widgets in this component.

  // Model for UserHeader component.
  late UserHeaderModel userHeaderModel;

  @override
  void initState(BuildContext context) {
    userHeaderModel = createModel(context, () => UserHeaderModel());
  }

  @override
  void dispose() {
    userHeaderModel.dispose();
  }
}
