import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'alterar_senha_widget.dart' show AlterarSenhaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlterarSenhaModel extends FlutterFlowModel<AlterarSenhaWidget> {
  ///  Local state fields for this page.

  String? erro;

  String? msgErro;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for password_confirmed widget.
  FocusNode? passwordConfirmedFocusNode;
  TextEditingController? passwordConfirmedTextController;
  late bool passwordConfirmedVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmedTextControllerValidator;
  // Stores action output result for [Backend Call - API (Alterar Senha)] action in Button widget.
  ApiCallResponse? retornoAlterarSenha;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordConfirmedVisibility = false;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmedFocusNode?.dispose();
    passwordConfirmedTextController?.dispose();
  }
}
