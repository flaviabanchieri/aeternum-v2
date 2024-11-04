import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'cadastrar_categorias_widget.dart' show CadastrarCategoriasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastrarCategoriasModel
    extends FlutterFlowModel<CadastrarCategoriasWidget> {
  ///  Local state fields for this component.

  bool? mostrarReagendar = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldNome widget.
  FocusNode? textFieldNomeFocusNode;
  TextEditingController? textFieldNomeTextController;
  String? Function(BuildContext, String?)? textFieldNomeTextControllerValidator;
  String? _textFieldNomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo nome da categoria é obrigatório!';
    }

    return null;
  }

  // State field(s) for TextFieldObservacao widget.
  FocusNode? textFieldObservacaoFocusNode;
  TextEditingController? textFieldObservacaoTextController;
  String? Function(BuildContext, String?)?
      textFieldObservacaoTextControllerValidator;
  String? _textFieldObservacaoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo de observação é obrigatório!';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validation;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ProdutoCategoriaRow? returnInsertCategoria;

  @override
  void initState(BuildContext context) {
    textFieldNomeTextControllerValidator =
        _textFieldNomeTextControllerValidator;
    textFieldObservacaoTextControllerValidator =
        _textFieldObservacaoTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldNomeFocusNode?.dispose();
    textFieldNomeTextController?.dispose();

    textFieldObservacaoFocusNode?.dispose();
    textFieldObservacaoTextController?.dispose();
  }
}
