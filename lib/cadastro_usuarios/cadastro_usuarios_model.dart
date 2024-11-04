import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cadastro_usuarios_widget.dart' show CadastroUsuariosWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroUsuariosModel extends FlutterFlowModel<CadastroUsuariosWidget> {
  ///  Local state fields for this page.

  String? padrao = '123456';

  int? countUser = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for nameUser widget.
  FocusNode? nameUserFocusNode;
  TextEditingController? nameUserTextController;
  String? Function(BuildContext, String?)? nameUserTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for permissao widget.
  int? permissaoValue;
  FormFieldController<int>? permissaoValueController;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuarioRow>? possuiUser;
  Completer<List<UsuarioRow>>? requestCompleter;
  // Stores action output result for [Backend Call - API (apagarUsuario)] action in IconButton widget.
  ApiCallResponse? apiResultnla;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
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
