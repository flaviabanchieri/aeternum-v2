import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'criar_lead_manual_widget.dart' show CriarLeadManualWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CriarLeadManualModel extends FlutterFlowModel<CriarLeadManualWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  String? _nomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Insira um nome';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'por favor insira um e-mail válido';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for telefone widget.
  FocusNode? telefoneFocusNode;
  TextEditingController? telefoneTextController;
  final telefoneMask = MaskTextInputFormatter(mask: '+55 (##) # ####-####');
  String? Function(BuildContext, String?)? telefoneTextControllerValidator;
  String? _telefoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'por favor insira um telefone com DDD';
    }

    if (val.length < 9) {
      return 'Insira um telefone com DDD';
    }

    return null;
  }

  // State field(s) for documento widget.
  FocusNode? documentoFocusNode;
  TextEditingController? documentoTextController;
  String? Function(BuildContext, String?)? documentoTextControllerValidator;
  // State field(s) for tag widget.
  String? tagValue;
  FormFieldController<String>? tagValueController;
  // State field(s) for atendente widget.
  String? atendenteValue;
  FormFieldController<String>? atendenteValueController;
  // State field(s) for produto widget.
  String? produtoValue;
  FormFieldController<String>? produtoValueController;
  // State field(s) for numeroCEP widget.
  FocusNode? numeroCEPFocusNode;
  TextEditingController? numeroCEPTextController;
  String? Function(BuildContext, String?)? numeroCEPTextControllerValidator;
  // State field(s) for logradouro widget.
  FocusNode? logradouroFocusNode;
  TextEditingController? logradouroTextController;
  String? Function(BuildContext, String?)? logradouroTextControllerValidator;
  // State field(s) for numero widget.
  FocusNode? numeroFocusNode;
  TextEditingController? numeroTextController;
  String? Function(BuildContext, String?)? numeroTextControllerValidator;
  // State field(s) for bairro widget.
  FocusNode? bairroFocusNode;
  TextEditingController? bairroTextController;
  String? Function(BuildContext, String?)? bairroTextControllerValidator;
  // State field(s) for cidade widget.
  FocusNode? cidadeFocusNode;
  TextEditingController? cidadeTextController;
  String? Function(BuildContext, String?)? cidadeTextControllerValidator;
  // State field(s) for Estado widget.
  String? estadoValue;
  FormFieldController<String>? estadoValueController;
  // State field(s) for clonableURL widget.
  FocusNode? clonableURLFocusNode;
  TextEditingController? clonableURLTextController;
  String? Function(BuildContext, String?)? clonableURLTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nomeTextControllerValidator = _nomeTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    telefoneTextControllerValidator = _telefoneTextControllerValidator;
  }

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    telefoneFocusNode?.dispose();
    telefoneTextController?.dispose();

    documentoFocusNode?.dispose();
    documentoTextController?.dispose();

    numeroCEPFocusNode?.dispose();
    numeroCEPTextController?.dispose();

    logradouroFocusNode?.dispose();
    logradouroTextController?.dispose();

    numeroFocusNode?.dispose();
    numeroTextController?.dispose();

    bairroFocusNode?.dispose();
    bairroTextController?.dispose();

    cidadeFocusNode?.dispose();
    cidadeTextController?.dispose();

    clonableURLFocusNode?.dispose();
    clonableURLTextController?.dispose();
  }
}
