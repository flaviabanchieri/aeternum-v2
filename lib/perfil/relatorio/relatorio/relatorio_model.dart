import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/widgets_compartilhados/date_picker/date_picker_widget.dart';
import '/widgets_compartilhados/header/header_widget.dart';
import '/widgets_compartilhados/sidenav/sidenav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'relatorio_widget.dart' show RelatorioWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RelatorioModel extends FlutterFlowModel<RelatorioWidget> {
  ///  Local state fields for this page.

  DateTime? dataInicial;

  DateTime? dataFinal;

  int? countLigacoes = 0;

  List<dynamic> listaRelatorio = [];
  void addToListaRelatorio(dynamic item) => listaRelatorio.add(item);
  void removeFromListaRelatorio(dynamic item) => listaRelatorio.remove(item);
  void removeAtIndexFromListaRelatorio(int index) =>
      listaRelatorio.removeAt(index);
  void insertAtIndexInListaRelatorio(int index, dynamic item) =>
      listaRelatorio.insert(index, item);
  void updateListaRelatorioAtIndex(int index, Function(dynamic) updateFn) =>
      listaRelatorio[index] = updateFn(listaRelatorio[index]);

  String? tempoLigacao;

  String? tempoMedioLigacao;

  int? ligacoesEmAndamento;

  double? faturamento;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Count Relatorio Ligacoes)] action in Relatorio widget.
  ApiCallResponse? queryCountLigacoes;
  // Stores action output result for [Backend Call - API (Count Relatorio Ligacoes)] action in Relatorio widget.
  ApiCallResponse? queryCountLigacoesEmAndamento;
  // Stores action output result for [Backend Call - API (Relatorio Ligacoes)] action in Relatorio widget.
  ApiCallResponse? queryRetornoRelatorioIniciar;
  // Stores action output result for [Backend Call - API (Relatorio Tempo Ligacoes)] action in Relatorio widget.
  ApiCallResponse? retornoTempoDeLigacao;
  // Stores action output result for [Backend Call - API (Relatorio Media Tempo Ligacao)] action in Relatorio widget.
  ApiCallResponse? retornoMediaTempoDeLigacao;
  // Stores action output result for [Backend Call - API (Relatorio Faturamento)] action in Relatorio widget.
  ApiCallResponse? retornoApiRelatorioFaturamento;
  // Model for Sidenav component.
  late SidenavModel sidenavModel;
  // Model for header component.
  late HeaderModel headerModel;
  // Model for DatePicker component.
  late DatePickerModel datePickerModel1;
  DateTime? datePicked1;
  // Model for DatePicker component.
  late DatePickerModel datePickerModel2;
  DateTime? datePicked2;
  // State field(s) for DropDownAtendente widget.
  String? dropDownAtendenteValue;
  FormFieldController<String>? dropDownAtendenteValueController;
  // State field(s) for DropDownPorduto widget.
  String? dropDownPordutoValue;
  FormFieldController<String>? dropDownPordutoValueController;
  // State field(s) for DropDownOrigem widget.
  String? dropDownOrigemValue;
  FormFieldController<String>? dropDownOrigemValueController;
  // State field(s) for DropDownStatus widget.
  String? dropDownStatusValue;
  FormFieldController<String>? dropDownStatusValueController;
  // Stores action output result for [Backend Call - API (Relatorio Ligacoes)] action in Button widget.
  ApiCallResponse? apiResultRelatorioFiltro;
  // Stores action output result for [Backend Call - API (Count Relatorio Ligacoes)] action in Button widget.
  ApiCallResponse? queryCountLigacoesEmAndamentoPesquisa;
  // Stores action output result for [Backend Call - API (Count Relatorio Ligacoes)] action in Button widget.
  ApiCallResponse? apiResultRelatorioCountFiltro;
  // Stores action output result for [Backend Call - API (Relatorio Tempo Ligacoes)] action in Button widget.
  ApiCallResponse? apiResultRelatorioTempoLigacaoFiltro;
  // Stores action output result for [Backend Call - API (Relatorio Media Tempo Ligacao)] action in Button widget.
  ApiCallResponse? apiResultRelatorioMediaTempoLigacaoFiltro;
  // Stores action output result for [Backend Call - API (Relatorio Faturamento)] action in Button widget.
  ApiCallResponse? pesquisaApiFaturamento;

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
    headerModel = createModel(context, () => HeaderModel());
    datePickerModel1 = createModel(context, () => DatePickerModel());
    datePickerModel2 = createModel(context, () => DatePickerModel());
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    headerModel.dispose();
    datePickerModel1.dispose();
    datePickerModel2.dispose();
  }
}
