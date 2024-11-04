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
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'info_lead_model.dart';
export 'info_lead_model.dart';

class InfoLeadWidget extends StatefulWidget {
  const InfoLeadWidget({
    super.key,
    String? lead,
    int? id,
  })  : this.lead = lead ?? 'lead',
        this.id = id ?? 0;

  final String lead;
  final int id;

  @override
  State<InfoLeadWidget> createState() => _InfoLeadWidgetState();
}

class _InfoLeadWidgetState extends State<InfoLeadWidget>
    with TickerProviderStateMixin {
  late InfoLeadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoLeadModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((widget!.id == null) ||
          (widget!.lead == null || widget!.lead == '')) {
        context.pop();
      }
      _model.dataInicial = functions.montarData(
          1, functions.mesAtual(), functions.anoAtual(), false);
      _model.dataFinal = functions.montarData(
          functions.retornaUltimoDiaMes(
              functions.mesAtual(), functions.anoAtual()),
          functions.mesAtual(),
          functions.anoAtual(),
          true);
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.tabBarController1 = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.tabBarController2 = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textFieldFocusNode2 ??= FocusNode();

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

    return FutureBuilder<List<ViewLeadRow>>(
      future: ViewLeadTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id_lead',
          valueOrDefault<int>(
            widget!.id,
            0,
          ),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ViewLeadRow> infoLeadViewLeadRowList = snapshot.data!;

        final infoLeadViewLeadRow = infoLeadViewLeadRowList.isNotEmpty
            ? infoLeadViewLeadRowList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.sidenavModel,
                    updateCallback: () => safeSetState(() {}),
                    child: SidenavWidget(),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.headerModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: HeaderWidget(
                                    page: ' ',
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      12.0,
                                                                      12.0,
                                                                      12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 75.0,
                                                                height: 75.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.imgUsuarioTexto(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        widget!
                                                                            .lead,
                                                                        'Sem Lead',
                                                                      )),
                                                                      'Sem Lead',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child: SelectionArea(
                                                                        child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        infoLeadViewLeadRow
                                                                            ?.nomeLead,
                                                                        '-',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    )),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .email_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      SelectionArea(
                                                                          child:
                                                                              Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          infoLeadViewLeadRow
                                                                              ?.email,
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      )),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await launchURL(
                                                                            'https://wa.me/${valueOrDefault<String>(
                                                                          functions
                                                                              .setTelefone(infoLeadViewLeadRow?.telefone),
                                                                          '67999999999',
                                                                        )}');
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                6.0,
                                                                                0.0),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.whatsapp,
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            valueOrDefault<String>(
                                                                              infoLeadViewLeadRow?.telefone,
                                                                              '-',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          )),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  infoLeadViewLeadRow
                                                                      ?.nomeProduto,
                                                                  '-',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              )),
                                                              if (FFAppState()
                                                                      .permissao !=
                                                                  1)
                                                                SelectionArea(
                                                                    child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    infoLeadViewLeadRow
                                                                        ?.nomeUsuario,
                                                                    '-',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                )),
                                                              if (FFAppState()
                                                                      .permissao ==
                                                                  1)
                                                                FutureBuilder<
                                                                    List<
                                                                        UsuarioRow>>(
                                                                  future: UsuarioTable()
                                                                      .queryRows(
                                                                    queryFn:
                                                                        (q) => q
                                                                            .eq(
                                                                              'permissao',
                                                                              2,
                                                                            )
                                                                            .eq(
                                                                              'situacao',
                                                                              1,
                                                                            ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UsuarioRow>
                                                                        dropDownUserUsuarioRowList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .dropDownUserValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.dropDownUserValue ??=
                                                                            infoLeadViewLeadRow?.usuario,
                                                                      ),
                                                                      options: List<String>.from(dropDownUserUsuarioRowList
                                                                          .map((e) =>
                                                                              e.user)
                                                                          .withoutNulls
                                                                          .toList()),
                                                                      optionLabels: dropDownUserUsuarioRowList
                                                                          .map((e) =>
                                                                              e.nome)
                                                                          .withoutNulls
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) async {
                                                                        safeSetState(() =>
                                                                            _model.dropDownUserValue =
                                                                                val);
                                                                        await LeadTable()
                                                                            .update(
                                                                          data: {
                                                                            'usuario':
                                                                                _model.dropDownUserValue,
                                                                          },
                                                                          matchingRows: (rows) =>
                                                                              rows.eq(
                                                                            'id',
                                                                            widget!.id,
                                                                          ),
                                                                        );
                                                                      },
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          'Select...',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  if (FFAppState()
                                                                          .permissao ==
                                                                      1)
                                                                    FutureBuilder<
                                                                        List<
                                                                            LeadStatusRow>>(
                                                                      future: LeadStatusTable()
                                                                          .queryRows(
                                                                        queryFn:
                                                                            (q) =>
                                                                                q,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<LeadStatusRow>
                                                                            dropDownLeadStatusRowList =
                                                                            snapshot.data!;

                                                                        return FlutterFlowDropDown<
                                                                            int>(
                                                                          controller: _model.dropDownValueController1 ??=
                                                                              FormFieldController<int>(
                                                                            _model.dropDownValue1 ??=
                                                                                infoLeadViewLeadRow?.status,
                                                                          ),
                                                                          options: List<int>.from(dropDownLeadStatusRowList
                                                                              .map((e) => valueOrDefault<int>(
                                                                                    e.id,
                                                                                    0,
                                                                                  ))
                                                                              .toList()),
                                                                          optionLabels: dropDownLeadStatusRowList
                                                                              .map((e) => valueOrDefault<String>(
                                                                                    e.status,
                                                                                    'Outros',
                                                                                  ))
                                                                              .toList(),
                                                                          onChanged:
                                                                              (val) async {
                                                                            safeSetState(() =>
                                                                                _model.dropDownValue1 = val);
                                                                            await LeadTable().update(
                                                                              data: {
                                                                                'status': _model.dropDownValue1,
                                                                              },
                                                                              matchingRows: (rows) => rows.eq(
                                                                                'id',
                                                                                widget!.id,
                                                                              ),
                                                                            );
                                                                          },
                                                                          width:
                                                                              200.0,
                                                                          height:
                                                                              40.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          hintText:
                                                                              'Select...',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderWidth:
                                                                              0.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isOverButton:
                                                                              false,
                                                                          isSearchable:
                                                                              false,
                                                                          isMultiSelect:
                                                                              false,
                                                                        );
                                                                      },
                                                                    ),
                                                                  if (FFAppState()
                                                                          .permissao !=
                                                                      1)
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        'Status: ${valueOrDefault<String>(
                                                                          () {
                                                                            if (infoLeadViewLeadRow?.status ==
                                                                                1) {
                                                                              return 'Entrar em contato';
                                                                            } else if (infoLeadViewLeadRow?.status ==
                                                                                2) {
                                                                              return 'Em progresso';
                                                                            } else if (infoLeadViewLeadRow?.status ==
                                                                                3) {
                                                                              return 'Aguardando aprovação do Gestor';
                                                                            } else {
                                                                              return 'Concluído';
                                                                            }
                                                                          }(),
                                                                          'Sem status',
                                                                        )}',
                                                                        'Sem status',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    )),
                                                                ],
                                                              ),
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  'Data de criação: ${valueOrDefault<String>(
                                                                    dateTimeFormat(
                                                                      "dd/MM/yyyy HH:mm",
                                                                      infoLeadViewLeadRow
                                                                          ?.createdAt,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    '-',
                                                                  )}',
                                                                  'Data de criação',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              )),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                        34.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            6.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                        child: SelectionArea(
                                                                            child: Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            'Origem: ${valueOrDefault<String>(
                                                                              infoLeadViewLeadRow?.origem,
                                                                              'Status não definido',
                                                                            )}',
                                                                            'Origem',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        )),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              if (FFAppState()
                                                                      .emLigacao >
                                                                  0)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          LigacoesRow>>(
                                                                    future: LigacoesTable()
                                                                        .queryRows(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eq(
                                                                        'lead',
                                                                        infoLeadViewLeadRow
                                                                            ?.idLead,
                                                                      ),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<LigacoesRow>
                                                                          buttonLigacoesRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      return FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          FFAppState().emLigacao =
                                                                              0;
                                                                          FFAppState().ligacaoAtiva =
                                                                              false;
                                                                          FFAppState()
                                                                              .update(() {});
                                                                          _model.ligacaoTerminou =
                                                                              true;
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'Terminar ligação',
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .phoneSlash,
                                                                          size:
                                                                              14.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              24.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              if (FFAppState()
                                                                      .emLigacao <=
                                                                  0)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;
                                                                      if (FFAppState()
                                                                              .contantoUsuarioPonto ==
                                                                          true) {
                                                                        _model.fazerligacao =
                                                                            await ClickToCallCall.call(
                                                                          dialString:
                                                                              infoLeadViewLeadRow?.telefone,
                                                                          userId:
                                                                              currentUserUid,
                                                                          userEmail:
                                                                              valueOrDefault<String>(
                                                                            (currentUserEmail == 'corporateaeternum@gmail.com') || (currentUserEmail == 'gestor@gmail.com')
                                                                                ? 'mariana.rubbo@gmail.com'
                                                                                : currentUserEmail,
                                                                            'mariana.rubbo@gmail.com',
                                                                          ),
                                                                          lead:
                                                                              widget!.id,
                                                                        );

                                                                        _shouldSetState =
                                                                            true;
                                                                        FFAppState().ligacaoAtiva =
                                                                            true;
                                                                        FFAppState().emLigacao =
                                                                            widget!.id;
                                                                        FFAppState()
                                                                            .update(() {});
                                                                        await HistoricoTable()
                                                                            .insert({
                                                                          'texto':
                                                                              'Ligação Realizada.',
                                                                          'data':
                                                                              supaSerialize<DateTime>(functions.dataAtual()),
                                                                          'usuario_id':
                                                                              currentUserUid,
                                                                          'lead_id':
                                                                              widget!.id,
                                                                        });
                                                                      } else if (FFAppState()
                                                                              .emLigacao >
                                                                          0) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Ação negada'),
                                                                              content: Text('Usuário já está em uma ligação'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Ação negada'),
                                                                              content: Text('Por favor, bater ponto para ligar para cliente'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                    },
                                                                    text:
                                                                        'Ligar',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .phone,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: Color(
                                                                          0xFF6E9C26),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ].divide(SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                FutureBuilder<List<LeadRow>>(
                                                  future: LeadTable()
                                                      .querySingleRow(
                                                    queryFn: (q) => q.eq(
                                                      'id',
                                                      widget!.id,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<LeadRow>
                                                        rowLeadRowList =
                                                        snapshot.data!;

                                                    final rowLeadRow =
                                                        rowLeadRowList
                                                                .isNotEmpty
                                                            ? rowLeadRowList
                                                                .first
                                                            : null;

                                                    return Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.mostrarDadosPessoais =
                                                                        !_model
                                                                            .mostrarDadosPessoais;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            20.0,
                                                                            12.0,
                                                                            20.0),
                                                                        child:
                                                                            Text(
                                                                          'Dados pessoais',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if (_model
                                                                          .mostrarDadosPessoais)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_up_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      if (!_model
                                                                          .mostrarDadosPessoais)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (_model
                                                                    .mostrarDadosPessoais)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            20.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .stretch,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Documento:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                rowLeadRow?.documento,
                                                                                'documento',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Endereço',
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'CEP:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                rowLeadRow?.cep?.toString(),
                                                                                'cep',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Logradouro:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                rowLeadRow?.logradouro,
                                                                                'logradouro',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Nº:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                rowLeadRow?.numEndereco,
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Bairro:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                rowLeadRow?.bairro,
                                                                                'bairro',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Cidade:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                rowLeadRow?.cidade,
                                                                                'cidade',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Estado:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                rowLeadRow?.estado,
                                                                                'estado',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 4.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Pais:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                rowLeadRow?.pais,
                                                                                'pais',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 4.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      12.0,
                                                                      12.0,
                                                                      12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child: FutureBuilder<
                                                                          List<
                                                                              ProdutoRow>>(
                                                                        future:
                                                                            ProdutoTable().queryRows(
                                                                          queryFn: (q) =>
                                                                              q,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: CircularProgressIndicator(
                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<ProdutoRow>
                                                                              dropDownProdutoRowList =
                                                                              snapshot.data!;

                                                                          return FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.dropDownValueController2 ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropDownValue2 ??= infoLeadViewLeadRow?.produtoCodigo,
                                                                            ),
                                                                            options:
                                                                                List<String>.from(dropDownProdutoRowList.map((e) => e.codigo).withoutNulls.toList()),
                                                                            optionLabels:
                                                                                dropDownProdutoRowList.map((e) => e.nome).toList(),
                                                                            onChanged: (val) =>
                                                                                safeSetState(() => _model.dropDownValue2 = val),
                                                                            width:
                                                                                300.0,
                                                                            height:
                                                                                56.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintText:
                                                                                'Checkout',
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                4.0,
                                                                                16.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isOverButton:
                                                                                true,
                                                                            isSearchable:
                                                                                false,
                                                                            isMultiSelect:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    _model.queryListaProdutosUrl =
                                                                        await ProdutoTable()
                                                                            .queryRows(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eq(
                                                                        'codigo',
                                                                        _model
                                                                            .dropDownValue2,
                                                                      ),
                                                                    );
                                                                    _model.urlCheckout = _model
                                                                        .queryListaProdutosUrl
                                                                        ?.first
                                                                        ?.link;
                                                                    safeSetState(
                                                                        () {});
                                                                    await launchURL(
                                                                        valueOrDefault<
                                                                            String>(
                                                                      '${_model.urlCheckout}?${infoLeadViewLeadRow?.link}',
                                                                      'www.404.com',
                                                                    ));

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text:
                                                                      'Ir para checkout',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0xFF6E9C26),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          color:
                                                                              Colors.white,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      12.0,
                                                                      12.0,
                                                                      12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Text(
                                                                        'Arquivos',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: ArquivoWidget(
                                                                                    idLead: widget!.id,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));

                                                                          safeSetState(() =>
                                                                              _model.requestCompleter = null);
                                                                          await _model
                                                                              .waitForRequestCompleted();
                                                                        },
                                                                        text:
                                                                            'Anexar Documentos',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .attach_file,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              0.0,
                                                                              24.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              Color(0xFF6E9C26),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              FutureBuilder<
                                                                  List<
                                                                      ViewLeadComprovantesRow>>(
                                                                future: (_model.requestCompleter ??= Completer<
                                                                        List<
                                                                            ViewLeadComprovantesRow>>()
                                                                      ..complete(
                                                                          ViewLeadComprovantesTable()
                                                                              .queryRows(
                                                                        queryFn:
                                                                            (q) =>
                                                                                q.eq(
                                                                          'lead_id',
                                                                          widget!
                                                                              .id,
                                                                        ),
                                                                      )))
                                                                    .future,
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<ViewLeadComprovantesRow>
                                                                      listViewAnexosViewLeadComprovantesRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        listViewAnexosViewLeadComprovantesRowList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            listViewAnexosIndex) {
                                                                      final listViewAnexosViewLeadComprovantesRow =
                                                                          listViewAnexosViewLeadComprovantesRowList[
                                                                              listViewAnexosIndex];
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            listViewAnexosViewLeadComprovantesRow.descricao,
                                                                                            'Descrição',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          listViewAnexosViewLeadComprovantesRow.aprovado! ? 'Aprovador pelo Gestor' : 'Aguardando aprovação do Gestor',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            functions.dataHoraAmPm(listViewAnexosViewLeadComprovantesRow.createdAt),
                                                                                            '00/00/0000 00:00',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                TextSpan(
                                                                                                  text: 'Anexado por: ',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: valueOrDefault<String>(
                                                                                                    listViewAnexosViewLeadComprovantesRow.nomeQuemAnexou,
                                                                                                    'Anexado por',
                                                                                                  ),
                                                                                                  style: TextStyle(),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                isDismissible: false,
                                                                                                enableDrag: false,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return GestureDetector(
                                                                                                    onTap: () => FocusScope.of(context).unfocus(),
                                                                                                    child: Padding(
                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                      child: ArquivoVisualizarWidget(
                                                                                                        id: listViewAnexosViewLeadComprovantesRow.id!,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => safeSetState(() {}));

                                                                                              safeSetState(() => _model.requestCompleter = null);
                                                                                              await _model.waitForRequestCompleted();
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.remove_red_eye,
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (FFAppState().permissao == 1)
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return AlertDialog(
                                                                                                        title: Text('Deseja remover comprovante?'),
                                                                                                        actions: [
                                                                                                          TextButton(
                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                            child: Text('Não'),
                                                                                                          ),
                                                                                                          TextButton(
                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                            child: Text('Sim'),
                                                                                                          ),
                                                                                                        ],
                                                                                                      );
                                                                                                    },
                                                                                                  ) ??
                                                                                                  false;
                                                                                              if (confirmDialogResponse) {
                                                                                                await deleteSupabaseFileFromPublicUrl(listViewAnexosViewLeadComprovantesRow.url!);
                                                                                                await LeadComprovantesTable().delete(
                                                                                                  matchingRows: (rows) => rows.eq(
                                                                                                    'id',
                                                                                                    listViewAnexosViewLeadComprovantesRow.id,
                                                                                                  ),
                                                                                                );
                                                                                                safeSetState(() => _model.requestCompleter = null);
                                                                                                await _model.waitForRequestCompleted();
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Anexo removido com sucesso!',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 1800),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).success,
                                                                                                  ),
                                                                                                );
                                                                                                return;
                                                                                              } else {
                                                                                                return;
                                                                                              }
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.delete,
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                1.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (FFAppState().permissao == 1)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      if (FFAppState()
                                                              .permissao ==
                                                          1)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              await LeadTable()
                                                                  .update(
                                                                data: {
                                                                  'status': 4,
                                                                },
                                                                matchingRows:
                                                                    (rows) =>
                                                                        rows.eq(
                                                                  'id',
                                                                  widget!.id,
                                                                ),
                                                              );
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Lead atualizado',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                ),
                                                              );

                                                              context.pushNamed(
                                                                  'LeadsGestor');
                                                            },
                                                            text:
                                                                'Rejeitar Venda',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                      if (FFAppState()
                                                              .permissao ==
                                                          1)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.apiFaturamentoUsuario =
                                                                  await RelatorioFaturamentoCall
                                                                      .call(
                                                                usuario:
                                                                    infoLeadViewLeadRow
                                                                        ?.usuario,
                                                                dataInicial: _model
                                                                    .dataInicial
                                                                    ?.toString(),
                                                                dataFinal: _model
                                                                    .dataFinal
                                                                    ?.toString(),
                                                              );

                                                              _model.apiQuantifadeVendas =
                                                                  await QuantidadeDeVendasPorAtendenteCall
                                                                      .call(
                                                                atendente:
                                                                    infoLeadViewLeadRow
                                                                        ?.usuario,
                                                                dataInicial: _model
                                                                    .dataInicial
                                                                    ?.toString(),
                                                                dataFinal: _model
                                                                    .dataFinal
                                                                    ?.toString(),
                                                              );

                                                              _model.vlrProduto =
                                                                  valueOrDefault<
                                                                      double>(
                                                                valueOrDefault<
                                                                        double>(
                                                                      (_model.apiFaturamentoUsuario
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      0.0,
                                                                    ) +
                                                                    valueOrDefault<
                                                                        double>(
                                                                      infoLeadViewLeadRow
                                                                          ?.valorProduto,
                                                                      0.0,
                                                                    ),
                                                                0.0,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              await RankingTable()
                                                                  .update(
                                                                data: {
                                                                  'faturamento':
                                                                      valueOrDefault<
                                                                          double>(
                                                                    (_model.apiFaturamentoUsuario?.jsonBody ??
                                                                            '') +
                                                                        (infoLeadViewLeadRow!
                                                                            .valorProduto!),
                                                                    0.0,
                                                                  ),
                                                                  'quantidade_vendas':
                                                                      valueOrDefault<
                                                                          int>(
                                                                    (_model.apiQuantifadeVendas?.jsonBody ??
                                                                            '') +
                                                                        1,
                                                                    0,
                                                                  ),
                                                                },
                                                                matchingRows:
                                                                    (rows) =>
                                                                        rows.eq(
                                                                  'usuario',
                                                                  _model
                                                                      .dropDownUserValue,
                                                                ),
                                                              );
                                                              await LeadTable()
                                                                  .update(
                                                                data: {
                                                                  'status': 4,
                                                                  'aprovacao_gestor':
                                                                      true,
                                                                },
                                                                matchingRows:
                                                                    (rows) =>
                                                                        rows.eq(
                                                                  'id',
                                                                  widget!.id,
                                                                ),
                                                              );
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Venda aprovada com sucesso',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          1900),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                ),
                                                              );

                                                              context.pushNamed(
                                                                  'Load');

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text:
                                                                'Validar Venda',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xFF6E9C26),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                        if (_model.ligacaoTerminou)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 586.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  20.0,
                                                                  24.0,
                                                                  0.0),
                                                      child: FutureBuilder<
                                                          List<LigacoesRow>>(
                                                        future: LigacoesTable()
                                                            .querySingleRow(
                                                          queryFn: (q) => q.eq(
                                                            'id',
                                                            _model.idLigacao,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<LigacoesRow>
                                                              columnLigacoesRowList =
                                                              snapshot.data!;

                                                          final columnLigacoesRow =
                                                              columnLigacoesRowList
                                                                      .isNotEmpty
                                                                  ? columnLigacoesRowList
                                                                      .first
                                                                  : null;

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            columnLigacoesRow?.id != null
                                                                                ? 'Editar ligação'
                                                                                : 'Sua ligação foi realizada',
                                                                            style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  FutureBuilder<
                                                                      List<
                                                                          LigacaoStatusRow>>(
                                                                    future: LigacaoStatusTable()
                                                                        .queryRows(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<LigacaoStatusRow>
                                                                          radioButtonLigacaoStatusRowList =
                                                                          snapshot
                                                                              .data!;

                                                                      return FlutterFlowRadioButton(
                                                                        options: radioButtonLigacaoStatusRowList
                                                                            .map((e) => valueOrDefault<String>(
                                                                                  e.status,
                                                                                  'status',
                                                                                ))
                                                                            .toList()
                                                                            .toList(),
                                                                        onChanged:
                                                                            (val) async {
                                                                          safeSetState(
                                                                              () {});
                                                                          if ((_model.radioButtonValue == 'REAGENDAR LIGAÇÃO') ||
                                                                              (_model.radioButtonValue == 'AGUARDANDO PAGAMENTO DE PIX/CARTÃO')) {
                                                                            _model.agendado =
                                                                                true;
                                                                            safeSetState(() {});
                                                                            return;
                                                                          } else {
                                                                            _model.agendado =
                                                                                false;
                                                                            safeSetState(() {});
                                                                            return;
                                                                          }
                                                                        },
                                                                        controller: _model
                                                                            .radioButtonValueController ??= FormFieldController<
                                                                                String>(
                                                                            ''),
                                                                        optionHeight:
                                                                            32.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        selectedTextStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        buttonPosition:
                                                                            RadioButtonPosition.left,
                                                                        direction:
                                                                            Axis.vertical,
                                                                        radioButtonColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        inactiveRadioButtonColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                        toggleable:
                                                                            false,
                                                                        horizontalAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalAlignment:
                                                                            WrapCrossAlignment.start,
                                                                      );
                                                                    },
                                                                  ),
                                                                  if (_model
                                                                      .agendado)
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Reagendar para',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                final _datePickedDate = await showDatePicker(
                                                                                  context: context,
                                                                                  initialDate: getCurrentTimestamp,
                                                                                  firstDate: getCurrentTimestamp,
                                                                                  lastDate: DateTime(2050),
                                                                                );

                                                                                TimeOfDay? _datePickedTime;
                                                                                if (_datePickedDate != null) {
                                                                                  _datePickedTime = await showTimePicker(
                                                                                    context: context,
                                                                                    initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                                  );
                                                                                }

                                                                                if (_datePickedDate != null && _datePickedTime != null) {
                                                                                  safeSetState(() {
                                                                                    _model.datePicked = DateTime(
                                                                                      _datePickedDate.year,
                                                                                      _datePickedDate.month,
                                                                                      _datePickedDate.day,
                                                                                      _datePickedTime!.hour,
                                                                                      _datePickedTime.minute,
                                                                                    );
                                                                                  });
                                                                                }
                                                                              },
                                                                              child: Container(
                                                                                width: 206.0,
                                                                                height: 46.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      functions.dataHoraAmPm(_model.datePicked),
                                                                                      'dd/MM/aaaa hh:mm',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 12.0)),
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        30.0)),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Observações do atendimento',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              TextFormField(
                                                                controller: _model
                                                                    .textController1,
                                                                focusNode: _model
                                                                    .textFieldFocusNode1,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Escreva aqui a sua observação',
                                                                  alignLabelWithHint:
                                                                      true,
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                maxLines: 5,
                                                                validator: _model
                                                                    .textController1Validator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ]
                                                                .divide(SizedBox(
                                                                    height:
                                                                        12.0))
                                                                .addToEnd(SizedBox(
                                                                    height:
                                                                        16.0)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  12.0,
                                                                  24.0,
                                                                  24.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.05),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                var _shouldSetState =
                                                                    false;
                                                                if ((_model.idLigacao !=
                                                                        null) &&
                                                                    (_model.idLigacao !=
                                                                        0)) {
                                                                  await LigacoesTable()
                                                                      .update(
                                                                    data: {
                                                                      'status':
                                                                          () {
                                                                        if (_model.radioButtonValue ==
                                                                            'BOLETO GERADO') {
                                                                          return 1;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'CARTÃO APROVADO') {
                                                                          return 2;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'PIX CALL CENTER') {
                                                                          return 3;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'LIGAÇÃO NÃO ATENDIDA') {
                                                                          return 4;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'NÃO VENDI') {
                                                                          return 5;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'REAGENDAR LIGAÇÃO') {
                                                                          return 6;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'AGUARDANDO PAGAMENTO DE PIX/CARTÃO') {
                                                                          return 7;
                                                                        } else {
                                                                          return 8;
                                                                        }
                                                                      }(),
                                                                      'observacao': _model
                                                                          .textController1
                                                                          .text,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eq(
                                                                      'id',
                                                                      _model
                                                                          .idLigacao,
                                                                    ),
                                                                  );
                                                                  if (_model
                                                                          .datePicked ==
                                                                      null) {
                                                                    Navigator.pop(
                                                                        context);
                                                                    _model.ligacaoTerminou =
                                                                        false;
                                                                    _model.agendado =
                                                                        false;
                                                                    _model.idLigacao =
                                                                        0;
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    await LeadTable()
                                                                        .update(
                                                                      data: {
                                                                        'status':
                                                                            2,
                                                                        'data_agendamento':
                                                                            supaSerialize<DateTime>(_model.datePicked),
                                                                      },
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eq(
                                                                        'id',
                                                                        widget!
                                                                            .id,
                                                                      ),
                                                                    );
                                                                    Navigator.pop(
                                                                        context);
                                                                    _model.ligacaoTerminou =
                                                                        false;
                                                                    _model.agendado =
                                                                        false;
                                                                    _model.idLigacao =
                                                                        0;
                                                                    safeSetState(
                                                                        () {});
                                                                  }

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                                if (_model.radioButtonValue ==
                                                                        null ||
                                                                    _model.radioButtonValue ==
                                                                        '') {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Selecione o Status da Ligação.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                } else {
                                                                  if (_model.textController1
                                                                              .text ==
                                                                          null ||
                                                                      _model.textController1
                                                                              .text ==
                                                                          '') {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Informe uma descrição para essa ligação.'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  } else {
                                                                    _model.terminarLigacao =
                                                                        await TerminarLigacaoCall
                                                                            .call(
                                                                      userEmail:
                                                                          currentUserEmail,
                                                                      leadId: widget!
                                                                          .id
                                                                          .toString(),
                                                                      userId:
                                                                          currentUserUid,
                                                                      status: () {
                                                                        if (_model.radioButtonValue ==
                                                                            'BOLETO GERADO') {
                                                                          return 1;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'CARTÃO APROVADO') {
                                                                          return 2;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'PIX CALL CENTER') {
                                                                          return 3;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'LIGAÇÃO NÃO ATENDIDA') {
                                                                          return 4;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'NÃO VENDI') {
                                                                          return 5;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'REAGENDAR LIGAÇÃO') {
                                                                          return 6;
                                                                        } else if (_model.radioButtonValue ==
                                                                            'AGUARDANDO PAGAMENTO DE PIX/CARTÃO') {
                                                                          return 7;
                                                                        } else {
                                                                          return 8;
                                                                        }
                                                                      }()
                                                                          .toString(),
                                                                      obs: _model
                                                                          .textController1
                                                                          .text,
                                                                    );

                                                                    _shouldSetState =
                                                                        true;
                                                                    if ((_model.radioButtonValue == 'BOLETO GERADO') ||
                                                                        (_model.radioButtonValue ==
                                                                            'CARTÃO APROVADO') ||
                                                                        (_model.radioButtonValue ==
                                                                            'PIX CALL CENTER')) {
                                                                      await LeadTable()
                                                                          .update(
                                                                        data: {
                                                                          'status':
                                                                              3,
                                                                        },
                                                                        matchingRows:
                                                                            (rows) =>
                                                                                rows.eq(
                                                                          'id',
                                                                          widget!
                                                                              .id,
                                                                        ),
                                                                      );
                                                                      _model.ligacaoTerminou =
                                                                          false;
                                                                      _model.agendado =
                                                                          false;
                                                                      _model.idLigacao =
                                                                          0;
                                                                      safeSetState(
                                                                          () {});
                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    } else {
                                                                      if ((_model.radioButtonValue ==
                                                                              'LIGAÇÃO NÃO ATENDIDA') ||
                                                                          (_model.radioButtonValue ==
                                                                              'NÃO VENDI')) {
                                                                        await LeadTable()
                                                                            .update(
                                                                          data: {
                                                                            'status':
                                                                                1,
                                                                            'data_agendamento':
                                                                                supaSerialize<DateTime>(functions.adicionarHoras(2)),
                                                                          },
                                                                          matchingRows: (rows) =>
                                                                              rows.eq(
                                                                            'id',
                                                                            widget!.id,
                                                                          ),
                                                                        );
                                                                        _model.ligacaoTerminou =
                                                                            false;
                                                                        _model.agendado =
                                                                            false;
                                                                        _model.idLigacao =
                                                                            0;
                                                                        safeSetState(
                                                                            () {});
                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
                                                                      } else {
                                                                        if ((_model.radioButtonValue ==
                                                                                'REAGENDAR LIGAÇÃO') ||
                                                                            (_model.radioButtonValue ==
                                                                                'AGUARDANDO PAGAMENTO DE PIX/CARTÃO')) {
                                                                          if (_model.datePicked ==
                                                                              null) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Informe a data de agendamento.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          } else {
                                                                            await LeadTable().update(
                                                                              data: {
                                                                                'status': 2,
                                                                                'data_agendamento': supaSerialize<DateTime>(_model.datePicked),
                                                                              },
                                                                              matchingRows: (rows) => rows.eq(
                                                                                'id',
                                                                                widget!.id,
                                                                              ),
                                                                            );
                                                                            _model.ligacaoTerminou =
                                                                                false;
                                                                            _model.agendado =
                                                                                false;
                                                                            _model.idLigacao =
                                                                                0;
                                                                            safeSetState(() {});
                                                                          }
                                                                        } else {
                                                                          await LeadTable()
                                                                              .update(
                                                                            data: {
                                                                              'status': 4,
                                                                            },
                                                                            matchingRows: (rows) =>
                                                                                rows.eq(
                                                                              'id',
                                                                              widget!.id,
                                                                            ),
                                                                          );
                                                                          _model.ligacaoTerminou =
                                                                              false;
                                                                          _model.agendado =
                                                                              false;
                                                                          _model.idLigacao =
                                                                              0;
                                                                          safeSetState(
                                                                              () {});
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                              },
                                                              text: 'Salvar',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 44.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 3.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                hoverColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                hoverBorderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 1.0,
                                                                ),
                                                                hoverTextColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                hoverElevation:
                                                                    0.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (!_model.ligacaoTerminou)
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      if (FFAppState()
                                                              .permissao ==
                                                          2)
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      Alignment(
                                                                          0.0,
                                                                          0),
                                                                  child: TabBar(
                                                                    labelColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    unselectedLabelColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    unselectedLabelStyle:
                                                                        TextStyle(),
                                                                    indicatorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    tabs: [
                                                                      Tab(
                                                                        text:
                                                                            'Observações',
                                                                      ),
                                                                      Tab(
                                                                        text:
                                                                            'Histórico',
                                                                      ),
                                                                      Tab(
                                                                        text:
                                                                            'Notas',
                                                                      ),
                                                                    ],
                                                                    controller:
                                                                        _model
                                                                            .tabBarController1,
                                                                    onTap:
                                                                        (i) async {
                                                                      [
                                                                        () async {},
                                                                        () async {},
                                                                        () async {}
                                                                      ][i]();
                                                                    },
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      TabBarView(
                                                                    controller:
                                                                        _model
                                                                            .tabBarController1,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                        child: FutureBuilder<
                                                                            List<ViewLigacoesRow>>(
                                                                          future:
                                                                              ViewLigacoesTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .eq(
                                                                                  'id_lead',
                                                                                  widget!.id,
                                                                                )
                                                                                .order('hora_inicio'),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<ViewLigacoesRow>
                                                                                listViewLigacoesAtendenteViewLigacoesRowList =
                                                                                snapshot.data!;

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.fromLTRB(
                                                                                0,
                                                                                16.0,
                                                                                0,
                                                                                16.0,
                                                                              ),
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewLigacoesAtendenteViewLigacoesRowList.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 0.0),
                                                                              itemBuilder: (context, listViewLigacoesAtendenteIndex) {
                                                                                final listViewLigacoesAtendenteViewLigacoesRow = listViewLigacoesAtendenteViewLigacoesRowList[listViewLigacoesAtendenteIndex];
                                                                                return Container(
                                                                                  width: double.infinity,
                                                                                  constraints: BoxConstraints(
                                                                                    maxWidth: 570.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 15.0,
                                                                                            height: 15.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                              shape: BoxShape.circle,
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                listViewLigacoesAtendenteViewLigacoesRow.leadNome,
                                                                                                'Lead',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                            child: Text(
                                                                                              '|',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  listViewLigacoesAtendenteViewLigacoesRow.statusLigacao,
                                                                                                  'Sem status',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.dataHoraAmPm(listViewLigacoesAtendenteViewLigacoesRow.horaInicio),
                                                                                              'dd/MM/aaaa hh:mm',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 0.0,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                offset: Offset(
                                                                                                  -2.0,
                                                                                                  0.0,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    listViewLigacoesAtendenteViewLigacoesRow.observacao,
                                                                                                    'Sem observação',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Divider(
                                                                                                  height: 1.0,
                                                                                                  thickness: 1.0,
                                                                                                  indent: 0.0,
                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                              ].addToEnd(SizedBox(height: 12.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                12.0,
                                                                                20.0,
                                                                                0.0),
                                                                            child:
                                                                                FutureBuilder<List<ViewHistoricoRow>>(
                                                                              future: ViewHistoricoTable().queryRows(
                                                                                queryFn: (q) => q
                                                                                    .eq(
                                                                                      'usuario_id',
                                                                                      currentUserUid,
                                                                                    )
                                                                                    .eq(
                                                                                      'lead_id',
                                                                                      widget!.id,
                                                                                    ),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<ViewHistoricoRow> listViewViewHistoricoRowList = snapshot.data!;

                                                                                return ListView.separated(
                                                                                  padding: EdgeInsets.fromLTRB(
                                                                                    0,
                                                                                    16.0,
                                                                                    0,
                                                                                    0,
                                                                                  ),
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: listViewViewHistoricoRowList.length,
                                                                                  separatorBuilder: (_, __) => SizedBox(height: 0.0),
                                                                                  itemBuilder: (context, listViewIndex) {
                                                                                    final listViewViewHistoricoRow = listViewViewHistoricoRowList[listViewIndex];
                                                                                    return Container(
                                                                                      width: double.infinity,
                                                                                      constraints: BoxConstraints(
                                                                                        maxWidth: 570.0,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 15.0,
                                                                                                height: 15.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  shape: BoxShape.circle,
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                ),
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewViewHistoricoRow.nomeUsuario,
                                                                                                      'Usuario',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  functions.dataHoraAmPm(listViewViewHistoricoRow.dataField),
                                                                                                  '00/00/0000 00:00',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                boxShadow: [
                                                                                                  BoxShadow(
                                                                                                    blurRadius: 0.0,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    offset: Offset(
                                                                                                      -2.0,
                                                                                                      0.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        listViewViewHistoricoRow.texto,
                                                                                                        'Observação',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Manrope',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Divider(
                                                                                                      height: 1.0,
                                                                                                      thickness: 1.0,
                                                                                                      indent: 0.0,
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                    ),
                                                                                                  ].addToEnd(SizedBox(height: 12.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                0.0,
                                                                                20.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 15.0,
                                                                                      height: 15.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                        shape: BoxShape.circle,
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Sistema',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions.dataHoraAmPm(infoLeadViewLeadRow?.createdAt),
                                                                                        '00/00/0000 00:00',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Lead distribuido por sorteio',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                          Divider(
                                                                                            height: 1.0,
                                                                                            thickness: 1.0,
                                                                                            indent: 0.0,
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                        ].addToEnd(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      FutureBuilder<
                                                                          List<
                                                                              LeadNotasRow>>(
                                                                        future:
                                                                            LeadNotasTable().querySingleRow(
                                                                          queryFn: (q) =>
                                                                              q.eq(
                                                                            'id_lead',
                                                                            widget!.id,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: CircularProgressIndicator(
                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<LeadNotasRow>
                                                                              columnLeadNotasRowList =
                                                                              snapshot.data!;

                                                                          final columnLeadNotasRow = columnLeadNotasRowList.isNotEmpty
                                                                              ? columnLeadNotasRowList.first
                                                                              : null;

                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.stretch,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(20.0),
                                                                                  child: SelectionArea(
                                                                                      child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      columnLeadNotasRow?.texto,
                                                                                      'Sem anotações',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  )),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      if (FFAppState()
                                                              .permissao ==
                                                          1)
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      Alignment(
                                                                          0.0,
                                                                          0),
                                                                  child: TabBar(
                                                                    labelColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    unselectedLabelColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    unselectedLabelStyle:
                                                                        TextStyle(),
                                                                    indicatorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    tabs: [
                                                                      Tab(
                                                                        text:
                                                                            'Observações',
                                                                      ),
                                                                      Tab(
                                                                        text:
                                                                            'Gravações',
                                                                      ),
                                                                      Tab(
                                                                        text:
                                                                            'Histórico',
                                                                      ),
                                                                      Tab(
                                                                        text:
                                                                            'Notas',
                                                                      ),
                                                                    ],
                                                                    controller:
                                                                        _model
                                                                            .tabBarController2,
                                                                    onTap:
                                                                        (i) async {
                                                                      [
                                                                        () async {},
                                                                        () async {},
                                                                        () async {},
                                                                        () async {}
                                                                      ][i]();
                                                                    },
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      TabBarView(
                                                                    controller:
                                                                        _model
                                                                            .tabBarController2,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            12.0,
                                                                            20.0,
                                                                            12.0),
                                                                        child: FutureBuilder<
                                                                            List<ViewLigacoesRow>>(
                                                                          future:
                                                                              ViewLigacoesTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .eq(
                                                                                  'id_lead',
                                                                                  widget!.id,
                                                                                )
                                                                                .order('hora_inicio'),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 40.0,
                                                                                  height: 40.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<ViewLigacoesRow>
                                                                                listViewLigacoesAtendenteViewLigacoesRowList =
                                                                                snapshot.data!;

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.fromLTRB(
                                                                                0,
                                                                                16.0,
                                                                                0,
                                                                                16.0,
                                                                              ),
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: listViewLigacoesAtendenteViewLigacoesRowList.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 0.0),
                                                                              itemBuilder: (context, listViewLigacoesAtendenteIndex) {
                                                                                final listViewLigacoesAtendenteViewLigacoesRow = listViewLigacoesAtendenteViewLigacoesRowList[listViewLigacoesAtendenteIndex];
                                                                                return Container(
                                                                                  width: double.infinity,
                                                                                  constraints: BoxConstraints(
                                                                                    maxWidth: 570.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 15.0,
                                                                                            height: 15.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                              shape: BoxShape.circle,
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                listViewLigacoesAtendenteViewLigacoesRow.leadNome,
                                                                                                'Lead',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                            child: Text(
                                                                                              '|',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  listViewLigacoesAtendenteViewLigacoesRow.statusLigacao,
                                                                                                  'Sem status',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.dataHoraAmPm(listViewLigacoesAtendenteViewLigacoesRow.horaInicio),
                                                                                              'dd/MM/aaaa hh:mm',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                _model.ligacaoTerminou = true;
                                                                                                _model.idLigacao = listViewLigacoesAtendenteViewLigacoesRow.idLigacao;
                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              child: Icon(
                                                                                                Icons.edit,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 18.0,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: double.infinity,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            boxShadow: [
                                                                                              BoxShadow(
                                                                                                blurRadius: 0.0,
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                offset: Offset(
                                                                                                  -2.0,
                                                                                                  0.0,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    listViewLigacoesAtendenteViewLigacoesRow.observacao,
                                                                                                    'Sem observação',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                Divider(
                                                                                                  height: 1.0,
                                                                                                  thickness: 1.0,
                                                                                                  indent: 0.0,
                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                ),
                                                                                              ].addToEnd(SizedBox(height: 12.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                16.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                  bottomRight: Radius.circular(0.0),
                                                                                  topLeft: Radius.circular(8.0),
                                                                                  topRight: Radius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                    ))
                                                                                      Expanded(
                                                                                        flex: 2,
                                                                                        child: Text(
                                                                                          'Cadastro',
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    Expanded(
                                                                                      flex: 4,
                                                                                      child: Text(
                                                                                        'Observação',
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                    ))
                                                                                      Expanded(
                                                                                        flex: 2,
                                                                                        child: Text(
                                                                                          'Produto',
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Text(
                                                                                        'Ações',
                                                                                        textAlign: TextAlign.end,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          FutureBuilder<
                                                                              List<ViewLigacoesRow>>(
                                                                            future:
                                                                                ViewLigacoesTable().queryRows(
                                                                              queryFn: (q) => q
                                                                                  .eq(
                                                                                    'id_lead',
                                                                                    widget!.id,
                                                                                  )
                                                                                  .order('hora_inicio'),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<ViewLigacoesRow> listViewViewLigacoesRowList = snapshot.data!;

                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                shrinkWrap: true,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: listViewViewLigacoesRowList.length,
                                                                                itemBuilder: (context, listViewIndex) {
                                                                                  final listViewViewLigacoesRow = listViewViewLigacoesRowList[listViewIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 0.0,
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            offset: Offset(
                                                                                              0.0,
                                                                                              1.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                              tablet: false,
                                                                                            ))
                                                                                              Expanded(
                                                                                                flex: 2,
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    functions.dataHoraAmPm(listViewViewLigacoesRow.horaInicio),
                                                                                                    '00/00/0000 00:00',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Manrope',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            Expanded(
                                                                                              flex: 4,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                listViewViewLigacoesRow.observacao,
                                                                                                                'Observação',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Manrope',
                                                                                                                    letterSpacing: 0.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  listViewViewLigacoesRow.origem,
                                                                                                                  'origem',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: 'Manrope',
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                            ))
                                                                                              Expanded(
                                                                                                flex: 2,
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    listViewViewLigacoesRow.nomeProduto,
                                                                                                    'produto',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                        fontFamily: 'Outfit',
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            Expanded(
                                                                                              flex: 1,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: [
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 44.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.download,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 20.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                                        SnackBar(
                                                                                                          content: Text(
                                                                                                            'Aguarde alguns instantes',
                                                                                                            style: TextStyle(
                                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                                            ),
                                                                                                          ),
                                                                                                          duration: Duration(milliseconds: 4000),
                                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                        ),
                                                                                                      );
                                                                                                      _model.apiResult218 = await GravacoesCall.call(
                                                                                                        userId: currentUserUid,
                                                                                                        ligacaoId: listViewViewLigacoesRow.idLigacao?.toString(),
                                                                                                      );

                                                                                                      if ((_model.apiResult218?.succeeded ?? true)) {
                                                                                                        await launchURL(valueOrDefault<String>(
                                                                                                          GravacoesCall.url(
                                                                                                            (_model.apiResult218?.jsonBody ?? ''),
                                                                                                          ),
                                                                                                          'www.google.com',
                                                                                                        ));
                                                                                                      }

                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ].divide(SizedBox(height: 6.0)),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                12.0,
                                                                                20.0,
                                                                                0.0),
                                                                            child:
                                                                                FutureBuilder<List<ViewHistoricoRow>>(
                                                                              future: ViewHistoricoTable().queryRows(
                                                                                queryFn: (q) => q
                                                                                    .eq(
                                                                                      'usuario_id',
                                                                                      currentUserUid,
                                                                                    )
                                                                                    .eq(
                                                                                      'lead_id',
                                                                                      widget!.id,
                                                                                    ),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<ViewHistoricoRow> listViewViewHistoricoRowList = snapshot.data!;

                                                                                return ListView.separated(
                                                                                  padding: EdgeInsets.fromLTRB(
                                                                                    0,
                                                                                    16.0,
                                                                                    0,
                                                                                    0,
                                                                                  ),
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: listViewViewHistoricoRowList.length,
                                                                                  separatorBuilder: (_, __) => SizedBox(height: 0.0),
                                                                                  itemBuilder: (context, listViewIndex) {
                                                                                    final listViewViewHistoricoRow = listViewViewHistoricoRowList[listViewIndex];
                                                                                    return Container(
                                                                                      width: double.infinity,
                                                                                      constraints: BoxConstraints(
                                                                                        maxWidth: 570.0,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 15.0,
                                                                                                height: 15.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  shape: BoxShape.circle,
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    width: 2.0,
                                                                                                  ),
                                                                                                ),
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      listViewViewHistoricoRow.nomeUsuario,
                                                                                                      'Usuario',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  functions.dataHoraAmPm(listViewViewHistoricoRow.dataField),
                                                                                                  '00/00/0000 00:00',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                boxShadow: [
                                                                                                  BoxShadow(
                                                                                                    blurRadius: 0.0,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    offset: Offset(
                                                                                                      -2.0,
                                                                                                      0.0,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        listViewViewHistoricoRow.texto,
                                                                                                        'Observação',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Manrope',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Divider(
                                                                                                      height: 1.0,
                                                                                                      thickness: 1.0,
                                                                                                      indent: 0.0,
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                    ),
                                                                                                  ].addToEnd(SizedBox(height: 12.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                0.0,
                                                                                20.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 15.0,
                                                                                      height: 15.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                        shape: BoxShape.circle,
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Sistema',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Manrope',
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions.dataHoraAmPm(infoLeadViewLeadRow?.createdAt),
                                                                                        '00/00/0000 00:00',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Lead distribuido por sorteio',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  letterSpacing: 0.0,
                                                                                                ),
                                                                                          ),
                                                                                          Divider(
                                                                                            height: 1.0,
                                                                                            thickness: 1.0,
                                                                                            indent: 0.0,
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                        ].addToEnd(SizedBox(height: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      FutureBuilder<
                                                                          List<
                                                                              LeadNotasRow>>(
                                                                        future:
                                                                            LeadNotasTable().querySingleRow(
                                                                          queryFn: (q) =>
                                                                              q.eq(
                                                                            'id_lead',
                                                                            widget!.id,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: CircularProgressIndicator(
                                                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                                                    FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<LeadNotasRow>
                                                                              columnLeadNotasRowList =
                                                                              snapshot.data!;

                                                                          final columnLeadNotasRow = columnLeadNotasRowList.isNotEmpty
                                                                              ? columnLeadNotasRowList.first
                                                                              : null;

                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.stretch,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                                                                                  child: Container(
                                                                                    width: 200.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.textController2 ??= TextEditingController(
                                                                                        text: columnLeadNotasRow?.texto,
                                                                                      ),
                                                                                      focusNode: _model.textFieldFocusNode2,
                                                                                      autofocus: false,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        hintText: 'Escreva aqui....',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: Color(0x00000000),
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Manrope',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      maxLines: 400,
                                                                                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                      validator: _model.textController2Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        if (columnLeadNotasRow?.id != null) {
                                                                                          await LeadNotasTable().update(
                                                                                            data: {
                                                                                              'texto': _model.textController2.text,
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eq(
                                                                                              'id_lead',
                                                                                              widget!.id,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          await LeadNotasTable().insert({
                                                                                            'id_lead': widget!.id,
                                                                                            'texto': _model.textController2.text,
                                                                                          });
                                                                                        }
                                                                                      },
                                                                                      text: 'Salvar',
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: 'Manrope',
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 20.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
