import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets_compartilhados/header/header_widget.dart';
import '/widgets_compartilhados/sidenav/sidenav_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'detalhes_atendente_widget.dart' show DetalhesAtendenteWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalhesAtendenteModel extends FlutterFlowModel<DetalhesAtendenteWidget> {
  ///  Local state fields for this page.

  double? vendasRealizadas;

  double? faturamento;

  int? ligacoesRealizadas;

  String? tempoMedio;

  String? nome;

  String? email;

  String? img;

  String? codigo;

  List<dynamic> pontoLista = [];
  void addToPontoLista(dynamic item) => pontoLista.add(item);
  void removeFromPontoLista(dynamic item) => pontoLista.remove(item);
  void removeAtIndexFromPontoLista(int index) => pontoLista.removeAt(index);
  void insertAtIndexInPontoLista(int index, dynamic item) =>
      pontoLista.insert(index, item);
  void updatePontoListaAtIndex(int index, Function(dynamic) updateFn) =>
      pontoLista[index] = updateFn(pontoLista[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Relatorio Ligacoes)] action in detalhesAtendente widget.
  ApiCallResponse? apiResultRelatorioFiltro;
  // Stores action output result for [Backend Call - API (Quantidade de vendas por atendente)] action in detalhesAtendente widget.
  ApiCallResponse? vendas;
  // Stores action output result for [Backend Call - API (Count Relatorio Ligacoes)] action in detalhesAtendente widget.
  ApiCallResponse? queryCountLigacoesEmAndamentoPesquisa;
  // Stores action output result for [Backend Call - API (Count Relatorio Ligacoes)] action in detalhesAtendente widget.
  ApiCallResponse? apiResultRelatorioCountFiltro;
  // Stores action output result for [Backend Call - API (Relatorio Tempo Ligacoes)] action in detalhesAtendente widget.
  ApiCallResponse? apiResultRelatorioTempoLigacaoFiltro;
  // Stores action output result for [Backend Call - API (Relatorio Media Tempo Ligacao)] action in detalhesAtendente widget.
  ApiCallResponse? apiResultRelatorioMediaTempoLigacaoFiltro;
  // Stores action output result for [Backend Call - API (Relatorio Faturamento)] action in detalhesAtendente widget.
  ApiCallResponse? pesquisaApiFaturamento;
  // Stores action output result for [Backend Call - Query Rows] action in detalhesAtendente widget.
  List<UsuarioRow>? supabaseAtendente;
  // Stores action output result for [Backend Call - API (getUsuarioPontoLista)] action in detalhesAtendente widget.
  ApiCallResponse? pontoUsuario;
  // Model for Sidenav component.
  late SidenavModel sidenavModel;
  // Model for header component.
  late HeaderModel headerModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    headerModel.dispose();
    tabBarController?.dispose();
  }
}
