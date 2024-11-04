import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets_compartilhados/header/header_widget.dart';
import '/widgets_compartilhados/sidenav/sidenav_widget.dart';
import 'alterar_senha_usuario_widget.dart' show AlterarSenhaUsuarioWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlterarSenhaUsuarioModel
    extends FlutterFlowModel<AlterarSenhaUsuarioWidget> {
  ///  Local state fields for this page.

  String? erro;

  String? msgErro;

  ///  State fields for stateful widgets in this page.

  // Model for Sidenav component.
  late SidenavModel sidenavModel;
  // Model for header component.
  late HeaderModel headerModel;
  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  // State field(s) for txtSenha widget.
  FocusNode? txtSenhaFocusNode;
  TextEditingController? txtSenhaTextController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaTextControllerValidator;
  // State field(s) for txtConfirmaSenha widget.
  FocusNode? txtConfirmaSenhaFocusNode;
  TextEditingController? txtConfirmaSenhaTextController;
  late bool txtConfirmaSenhaVisibility;
  String? Function(BuildContext, String?)?
      txtConfirmaSenhaTextControllerValidator;
  // Stores action output result for [Backend Call - API (Alterar Senha)] action in Button widget.
  ApiCallResponse? retornoAlterarSenhaUsuario;

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
    headerModel = createModel(context, () => HeaderModel());
    txtSenhaVisibility = false;
    txtConfirmaSenhaVisibility = false;
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    headerModel.dispose();
    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtSenhaFocusNode?.dispose();
    txtSenhaTextController?.dispose();

    txtConfirmaSenhaFocusNode?.dispose();
    txtConfirmaSenhaTextController?.dispose();
  }
}
