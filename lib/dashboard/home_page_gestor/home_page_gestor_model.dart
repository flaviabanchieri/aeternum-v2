import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/widgets_compartilhados/header/header_widget.dart';
import '/widgets_compartilhados/sidenav/sidenav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_gestor_widget.dart' show HomePageGestorWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageGestorModel extends FlutterFlowModel<HomePageGestorWidget> {
  ///  Local state fields for this page.

  int? countConfiguracao = 0;

  String? dia;

  String? mes;

  String? ano;

  DateTime? dataInicial;

  DateTime? dataFinal;

  int? countLeads;

  int? countLeadsConcluido;

  int? countVendasRealizadas;

  double? faturamentoMensal;

  List<dynamic> ranking = [];
  void addToRanking(dynamic item) => ranking.add(item);
  void removeFromRanking(dynamic item) => ranking.remove(item);
  void removeAtIndexFromRanking(int index) => ranking.removeAt(index);
  void insertAtIndexInRanking(int index, dynamic item) =>
      ranking.insert(index, item);
  void updateRankingAtIndex(int index, Function(dynamic) updateFn) =>
      ranking[index] = updateFn(ranking[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in HomePageGestor widget.
  List<ConfiguracoesRow>? queryConfiguracaoInicial;
  // Model for Sidenav component.
  late SidenavModel sidenavModel;
  // Model for header component.
  late HeaderModel headerModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

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
