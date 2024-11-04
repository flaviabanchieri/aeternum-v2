import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/produtos/cadastrar_categorias/cadastrar_categorias_widget.dart';
import '/widgets_compartilhados/header/header_widget.dart';
import '/widgets_compartilhados/sidenav/sidenav_widget.dart';
import 'editar_produto_widget.dart' show EditarProdutoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarProdutoModel extends FlutterFlowModel<EditarProdutoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for Sidenav component.
  late SidenavModel sidenavModel;
  // Model for header component.
  late HeaderModel headerModel;
  // State field(s) for TextFieldNome widget.
  FocusNode? textFieldNomeFocusNode;
  TextEditingController? textFieldNomeTextController;
  String? Function(BuildContext, String?)? textFieldNomeTextControllerValidator;
  String? _textFieldNomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo nome é obrigatório!';
    }

    return null;
  }

  // State field(s) for TextFieldCodigo widget.
  FocusNode? textFieldCodigoFocusNode;
  TextEditingController? textFieldCodigoTextController;
  String? Function(BuildContext, String?)?
      textFieldCodigoTextControllerValidator;
  String? _textFieldCodigoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo código é obrigatório!';
    }

    return null;
  }

  // State field(s) for TextFieldUrl widget.
  FocusNode? textFieldUrlFocusNode;
  TextEditingController? textFieldUrlTextController;
  String? Function(BuildContext, String?)? textFieldUrlTextControllerValidator;
  String? _textFieldUrlTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo url é obrigatório!';
    }

    return null;
  }

  // State field(s) for DropDownProdutoPai widget.
  int? dropDownProdutoPaiValue;
  FormFieldController<int>? dropDownProdutoPaiValueController;
  // State field(s) for TextFieldPreco widget.
  FocusNode? textFieldPrecoFocusNode;
  TextEditingController? textFieldPrecoTextController;
  String? Function(BuildContext, String?)?
      textFieldPrecoTextControllerValidator;
  String? _textFieldPrecoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo preço é obrigatório!';
    }

    return null;
  }

  // State field(s) for TextFieldDescricao widget.
  FocusNode? textFieldDescricaoFocusNode;
  TextEditingController? textFieldDescricaoTextController;
  String? Function(BuildContext, String?)?
      textFieldDescricaoTextControllerValidator;
  String? _textFieldDescricaoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo descrição é obrigatório!';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validation;

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
    headerModel = createModel(context, () => HeaderModel());
    textFieldNomeTextControllerValidator =
        _textFieldNomeTextControllerValidator;
    textFieldCodigoTextControllerValidator =
        _textFieldCodigoTextControllerValidator;
    textFieldUrlTextControllerValidator = _textFieldUrlTextControllerValidator;
    textFieldPrecoTextControllerValidator =
        _textFieldPrecoTextControllerValidator;
    textFieldDescricaoTextControllerValidator =
        _textFieldDescricaoTextControllerValidator;
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    headerModel.dispose();
    textFieldNomeFocusNode?.dispose();
    textFieldNomeTextController?.dispose();

    textFieldCodigoFocusNode?.dispose();
    textFieldCodigoTextController?.dispose();

    textFieldUrlFocusNode?.dispose();
    textFieldUrlTextController?.dispose();

    textFieldPrecoFocusNode?.dispose();
    textFieldPrecoTextController?.dispose();

    textFieldDescricaoFocusNode?.dispose();
    textFieldDescricaoTextController?.dispose();
  }
}
