import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'load_widget.dart' show LoadWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoadModel extends FlutterFlowModel<LoadWidget> {
  ///  Local state fields for this page.

  int? permissao = 0;

  bool? passwordDefault = false;

  DateTime? dataInicial;

  DateTime? dataFinal;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Load widget.
  List<UsuarioRow>? consultaUsuario;
  // Stores action output result for [Backend Call - API (obter painel cards)] action in Load widget.
  ApiCallResponse? painelGestor;
  // Stores action output result for [Backend Call - API (obter painel cards)] action in Load widget.
  ApiCallResponse? painelA;
  // Stores action output result for [Backend Call - API (Concluir antigos  dias ou mais)] action in Load widget.
  ApiCallResponse? concluir;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
