import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets_compartilhados/header/header_widget.dart';
import '/widgets_compartilhados/sidenav/sidenav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int? countPonto = 0;

  List<RankingRow> listaHanking = [];
  void addToListaHanking(RankingRow item) => listaHanking.add(item);
  void removeFromListaHanking(RankingRow item) => listaHanking.remove(item);
  void removeAtIndexFromListaHanking(int index) => listaHanking.removeAt(index);
  void insertAtIndexInListaHanking(int index, RankingRow item) =>
      listaHanking.insert(index, item);
  void updateListaHankingAtIndex(int index, Function(RankingRow) updateFn) =>
      listaHanking[index] = updateFn(listaHanking[index]);

  int? countAgendamento = 0;

  int? countAtrasados = 0;

  String? nomeLead = 'Nome Lead';

  String? telefoneLead;

  String? nomeProduto;

  String? origemLead;

  int? idLead;

  int? minutosProximoAgendamento;

  int? leadCarrinhoAbandonado;

  int? leadCartaoCancelado;

  int? leadPix;

  int? outrosLeads;

  double? faturamento = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Obter ultimo usuario ponto)] action in HomePage widget.
  ApiCallResponse? apiRetornoUsuarioPonto;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<RankingRow>? listaHankingInicial;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<ViewLeadRow>? retornoLeadsAgendadosHoje;
  // Stores action output result for [Backend Call - API (ProximoLead)] action in HomePage widget.
  ApiCallResponse? proximo;
  // Model for Sidenav component.
  late SidenavModel sidenavModel;
  // Model for header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    sidenavModel = createModel(context, () => SidenavModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    sidenavModel.dispose();
    headerModel.dispose();
  }
}
