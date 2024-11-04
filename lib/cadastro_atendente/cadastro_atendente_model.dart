import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets_compartilhados/sidenav/sidenav_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cadastro_atendente_widget.dart' show CadastroAtendenteWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroAtendenteModel extends FlutterFlowModel<CadastroAtendenteWidget> {
  ///  Local state fields for this page.

  String? padrao = '123456';

  int? countUser = 0;

  ///  State fields for stateful widgets in this page.

  // Model for Sidenav component.
  late SidenavModel sidenavModel;
  // State field(s) for nameUser widget.
  FocusNode? nameUserFocusNode;
  TextEditingController? nameUserTextController;
  String? Function(BuildContext, String?)? nameUserTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuarioRow>? possuiUser;
  Completer<List<UsuarioRow>>? requestCompleter;
  // State field(s) for Checkbox widget.
  Map<UsuarioRow, bool> checkboxValueMap = {};
  List<UsuarioRow> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    nameUserFocusNode?.dispose();
    nameUserTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
