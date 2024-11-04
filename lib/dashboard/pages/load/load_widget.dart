import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'load_model.dart';
export 'load_model.dart';

class LoadWidget extends StatefulWidget {
  const LoadWidget({super.key});

  @override
  State<LoadWidget> createState() => _LoadWidgetState();
}

class _LoadWidgetState extends State<LoadWidget> {
  late LoadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.consultaUsuario = await UsuarioTable().queryRows(
        queryFn: (q) => q.eq(
          'user',
          currentUserUid,
        ),
      );
      if ((_model.consultaUsuario != null &&
              (_model.consultaUsuario)!.isNotEmpty) !=
          true) {
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        return;
      }
      _model.permissao = valueOrDefault<int>(
        _model.consultaUsuario?.first?.permissao,
        0,
      );
      _model.passwordDefault = _model.consultaUsuario?.first?.passwordDefault;
      safeSetState(() {});
      FFAppState().permissao = valueOrDefault<int>(
        _model.permissao,
        0,
      );
      FFAppState().UsuarioNome = valueOrDefault<String>(
        _model.consultaUsuario?.first?.nome,
        'Nome Usuário',
      );
      FFAppState().FotoUsuario = valueOrDefault<String>(
        _model.consultaUsuario?.first?.foto,
        'Null',
      );
      FFAppState().pagina = Pagina.dashboard;
      FFAppState().update(() {});
      if (_model.permissao == 1) {
        _model.painelGestor = await ObterPainelCardsCall.call(
          userId: currentUserUid,
          permissao: FFAppState().permissao.toString(),
        );

        FFAppState().totalLeadGestor = valueOrDefault<int>(
          ObterPainelCardsCall.total(
            (_model.painelGestor?.jsonBody ?? ''),
          ),
          0,
        );
        FFAppState().totalConcluidoGestor = valueOrDefault<int>(
          ObterPainelCardsCall.concluidos(
            (_model.painelGestor?.jsonBody ?? ''),
          ),
          0,
        );
        FFAppState().totalRealizadasGestor = valueOrDefault<int>(
          ObterPainelCardsCall.vendidos(
            (_model.painelGestor?.jsonBody ?? ''),
          ),
          0,
        );
        FFAppState().totalFaturamentoGestor = valueOrDefault<double>(
          ObterPainelCardsCall.faturado(
            (_model.painelGestor?.jsonBody ?? ''),
          )?.toDouble(),
          0.0,
        );
        FFAppState().update(() {});
        if (_model.passwordDefault!) {
          context.goNamedAuth('AlterarSenha', context.mounted);

          return;
        } else {
          context.pushNamedAuth('HomePageGestor', context.mounted);

          return;
        }
      } else {
        if (_model.permissao == 2) {
          if (_model.passwordDefault!) {
            context.goNamedAuth('AlterarSenha', context.mounted);
          } else {
            _model.painelA = await ObterPainelCardsCall.call(
              userId: currentUserUid,
              permissao: valueOrDefault<String>(
                FFAppState().permissao.toString(),
                '2',
              ),
            );

            FFAppState().valorMetaDashboard = valueOrDefault<double>(
              ObterPainelCardsCall.meta(
                (_model.painelA?.jsonBody ?? ''),
              )?.toDouble(),
              0.0,
            );
            FFAppState().totalLead = valueOrDefault<int>(
              ObterPainelCardsCall.total(
                (_model.painelA?.jsonBody ?? ''),
              ),
              0,
            );
            FFAppState().totalLigacoesAtendente = valueOrDefault<int>(
              ObterPainelCardsCall.ligacao(
                (_model.painelA?.jsonBody ?? ''),
              ),
              0,
            );
            FFAppState().totalRealizados = valueOrDefault<int>(
              ObterPainelCardsCall.concluidos(
                (_model.painelA?.jsonBody ?? ''),
              ),
              0,
            );
            FFAppState().totalVendasAtendente = valueOrDefault<int>(
              ObterPainelCardsCall.vendidos(
                (_model.painelA?.jsonBody ?? ''),
              ),
              0,
            );
            FFAppState().totalFaturamentoAtendente = valueOrDefault<int>(
              ObterPainelCardsCall.faturado(
                (_model.painelA?.jsonBody ?? ''),
              ),
              0,
            );
            FFAppState().update(() {});
            _model.concluir = await ConcluirAntigosDiasOuMaisCall.call();

            context.goNamedAuth('HomePage', context.mounted);
          }

          return;
        } else {
          if (_model.permissao == 3) {
            context.goNamedAuth('CadastroUsuarios', context.mounted);

            return;
          } else {
            return;
          }
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        context.goNamedAuth('Login', context.mounted);
                      },
                      child: Lottie.asset(
                        'assets/jsons/Animation_-_Loading.json',
                        width: 266.0,
                        height: 200.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
