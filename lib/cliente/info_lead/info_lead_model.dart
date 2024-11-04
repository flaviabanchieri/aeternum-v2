import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/cliente/arquivo/arquivo_widget.dart';
import '/cliente/arquivo_visualizar/arquivo_visualizar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/widgets_compartilhados/header/header_widget.dart';
import '/widgets_compartilhados/sidenav/sidenav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'info_lead_widget.dart' show InfoLeadWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InfoLeadModel extends FlutterFlowModel<InfoLeadWidget> {
  ///  Local state fields for this page.

  bool mostrarDadosPessoais = false;

  String? urlCheckout;

  double? vlrProduto = 0.0;

  DateTime? dataInicial;

  DateTime? dataFinal;

  bool ligacaoTerminou = false;

  bool agendado = false;

  int? idLigacao = 0;

  ///  State fields for stateful widgets in this page.

  // Model for Sidenav component.
  late SidenavModel sidenavModel;
  // Model for header component.
  late HeaderModel headerModel;
  // State field(s) for DropDownUser widget.
  String? dropDownUserValue;
  FormFieldController<String>? dropDownUserValueController;
  // State field(s) for DropDown widget.
  int? dropDownValue1;
  FormFieldController<int>? dropDownValueController1;
  // Stores action output result for [Backend Call - API (Click to Call)] action in Button widget.
  ApiCallResponse? fazerligacao;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ProdutoRow>? queryListaProdutosUrl;
  Completer<List<ViewLeadComprovantesRow>>? requestCompleter;
  // Stores action output result for [Backend Call - API (Relatorio Faturamento)] action in btn_aprovar_venda widget.
  ApiCallResponse? apiFaturamentoUsuario;
  // Stores action output result for [Backend Call - API (Quantidade de vendas por atendente)] action in btn_aprovar_venda widget.
  ApiCallResponse? apiQuantifadeVendas;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (Terminar Ligacao)] action in Button widget.
  ApiCallResponse? terminarLigacao;
  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;

  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;

  // Stores action output result for [Backend Call - API (gravacoes)] action in IconButton widget.
  ApiCallResponse? apiResult218;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    headerModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    tabBarController1?.dispose();
    tabBarController2?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
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

  String? get radioButtonValue => radioButtonValueController?.value;
}
