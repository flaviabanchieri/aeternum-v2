import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/criar_lead_manual_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/widgets_compartilhados/header/header_widget.dart';
import '/widgets_compartilhados/sidenav/sidenav_widget.dart';
import 'leads_gestor_widget.dart' show LeadsGestorWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LeadsGestorModel extends FlutterFlowModel<LeadsGestorWidget> {
  ///  Local state fields for this page.

  int view = 1;

  List<String> emAndamento = ['Thais Robertson', 'João Rocha', 'Anna Silva'];
  void addToEmAndamento(String item) => emAndamento.add(item);
  void removeFromEmAndamento(String item) => emAndamento.remove(item);
  void removeAtIndexFromEmAndamento(int index) => emAndamento.removeAt(index);
  void insertAtIndexInEmAndamento(int index, String item) =>
      emAndamento.insert(index, item);
  void updateEmAndamentoAtIndex(int index, Function(String) updateFn) =>
      emAndamento[index] = updateFn(emAndamento[index]);

  List<String> entrarEmContato = ['Maria Roca', 'Luis de Sá'];
  void addToEntrarEmContato(String item) => entrarEmContato.add(item);
  void removeFromEntrarEmContato(String item) => entrarEmContato.remove(item);
  void removeAtIndexFromEntrarEmContato(int index) =>
      entrarEmContato.removeAt(index);
  void insertAtIndexInEntrarEmContato(int index, String item) =>
      entrarEmContato.insert(index, item);
  void updateEntrarEmContatoAtIndex(int index, Function(String) updateFn) =>
      entrarEmContato[index] = updateFn(entrarEmContato[index]);

  List<dynamic> listaLeadEntrarEmContato = [];
  void addToListaLeadEntrarEmContato(dynamic item) =>
      listaLeadEntrarEmContato.add(item);
  void removeFromListaLeadEntrarEmContato(dynamic item) =>
      listaLeadEntrarEmContato.remove(item);
  void removeAtIndexFromListaLeadEntrarEmContato(int index) =>
      listaLeadEntrarEmContato.removeAt(index);
  void insertAtIndexInListaLeadEntrarEmContato(int index, dynamic item) =>
      listaLeadEntrarEmContato.insert(index, item);
  void updateListaLeadEntrarEmContatoAtIndex(
          int index, Function(dynamic) updateFn) =>
      listaLeadEntrarEmContato[index] =
          updateFn(listaLeadEntrarEmContato[index]);

  String? listaCodigoProduto = '';

  bool? exibirPesquisaEntrarEmContato = false;

  List<String> listaNomeLead = [];
  void addToListaNomeLead(String item) => listaNomeLead.add(item);
  void removeFromListaNomeLead(String item) => listaNomeLead.remove(item);
  void removeAtIndexFromListaNomeLead(int index) =>
      listaNomeLead.removeAt(index);
  void insertAtIndexInListaNomeLead(int index, String item) =>
      listaNomeLead.insert(index, item);
  void updateListaNomeLeadAtIndex(int index, Function(String) updateFn) =>
      listaNomeLead[index] = updateFn(listaNomeLead[index]);

  List<dynamic> listaLeadEmProgresso = [];
  void addToListaLeadEmProgresso(dynamic item) =>
      listaLeadEmProgresso.add(item);
  void removeFromListaLeadEmProgresso(dynamic item) =>
      listaLeadEmProgresso.remove(item);
  void removeAtIndexFromListaLeadEmProgresso(int index) =>
      listaLeadEmProgresso.removeAt(index);
  void insertAtIndexInListaLeadEmProgresso(int index, dynamic item) =>
      listaLeadEmProgresso.insert(index, item);
  void updateListaLeadEmProgressoAtIndex(
          int index, Function(dynamic) updateFn) =>
      listaLeadEmProgresso[index] = updateFn(listaLeadEmProgresso[index]);

  List<dynamic> listaLeadAguardandoAprovacao = [];
  void addToListaLeadAguardandoAprovacao(dynamic item) =>
      listaLeadAguardandoAprovacao.add(item);
  void removeFromListaLeadAguardandoAprovacao(dynamic item) =>
      listaLeadAguardandoAprovacao.remove(item);
  void removeAtIndexFromListaLeadAguardandoAprovacao(int index) =>
      listaLeadAguardandoAprovacao.removeAt(index);
  void insertAtIndexInListaLeadAguardandoAprovacao(int index, dynamic item) =>
      listaLeadAguardandoAprovacao.insert(index, item);
  void updateListaLeadAguardandoAprovacaoAtIndex(
          int index, Function(dynamic) updateFn) =>
      listaLeadAguardandoAprovacao[index] =
          updateFn(listaLeadAguardandoAprovacao[index]);

  List<dynamic> listaLeadConcluido = [];
  void addToListaLeadConcluido(dynamic item) => listaLeadConcluido.add(item);
  void removeFromListaLeadConcluido(dynamic item) =>
      listaLeadConcluido.remove(item);
  void removeAtIndexFromListaLeadConcluido(int index) =>
      listaLeadConcluido.removeAt(index);
  void insertAtIndexInListaLeadConcluido(int index, dynamic item) =>
      listaLeadConcluido.insert(index, item);
  void updateListaLeadConcluidoAtIndex(int index, Function(dynamic) updateFn) =>
      listaLeadConcluido[index] = updateFn(listaLeadConcluido[index]);

  bool carregando = true;

  List<dynamic> listaLeadVendido = [];
  void addToListaLeadVendido(dynamic item) => listaLeadVendido.add(item);
  void removeFromListaLeadVendido(dynamic item) =>
      listaLeadVendido.remove(item);
  void removeAtIndexFromListaLeadVendido(int index) =>
      listaLeadVendido.removeAt(index);
  void insertAtIndexInListaLeadVendido(int index, dynamic item) =>
      listaLeadVendido.insert(index, item);
  void updateListaLeadVendidoAtIndex(int index, Function(dynamic) updateFn) =>
      listaLeadVendido[index] = updateFn(listaLeadVendido[index]);

  DateTime? dataIncial;

  DateTime? dataFinal;

  List<dynamic> listaLeadCancelado = [];
  void addToListaLeadCancelado(dynamic item) => listaLeadCancelado.add(item);
  void removeFromListaLeadCancelado(dynamic item) =>
      listaLeadCancelado.remove(item);
  void removeAtIndexFromListaLeadCancelado(int index) =>
      listaLeadCancelado.removeAt(index);
  void insertAtIndexInListaLeadCancelado(int index, dynamic item) =>
      listaLeadCancelado.insert(index, item);
  void updateListaLeadCanceladoAtIndex(int index, Function(dynamic) updateFn) =>
      listaLeadCancelado[index] = updateFn(listaLeadCancelado[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Leads Gestor )] action in LeadsGestor widget.
  ApiCallResponse? entrarEmContatoApi;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in LeadsGestor widget.
  ApiCallResponse? andamentoApi;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in LeadsGestor widget.
  ApiCallResponse? aprovacaoApi;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in LeadsGestor widget.
  ApiCallResponse? concluidoApi;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in LeadsGestor widget.
  ApiCallResponse? vendidoApi;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in LeadsGestor widget.
  ApiCallResponse? canceladoApi;
  // Model for Sidenav component.
  late SidenavModel sidenavModel;
  // Model for header component.
  late HeaderModel headerModel;
  // State field(s) for DropDownProdutos widget.
  String? dropDownProdutosValue;
  FormFieldController<String>? dropDownProdutosValueController;
  // State field(s) for DropDownOrigem widget.
  String? dropDownOrigemValue;
  FormFieldController<String>? dropDownOrigemValueController;
  // State field(s) for TextFieldNome widget.
  FocusNode? textFieldNomeFocusNode;
  TextEditingController? textFieldNomeTextController;
  String? Function(BuildContext, String?)? textFieldNomeTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? entrarEmContatoApiCopy;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? andamentoApiCopy;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? aprovacaoApiCopy;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? concluidoApiCopy;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? vendidoApi1;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? canceladoApi1;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? entrarEmContatoApiCopy1;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? andamentoApiCopy1;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? aprovacaoApiCopy1;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? concluidoApiCopy1;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? vendidoApi2;
  // Stores action output result for [Backend Call - API (Leads Gestor )] action in ButtonLimparFiltros widget.
  ApiCallResponse? canceladoApi2;

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    headerModel.dispose();
    textFieldNomeFocusNode?.dispose();
    textFieldNomeTextController?.dispose();
  }
}
