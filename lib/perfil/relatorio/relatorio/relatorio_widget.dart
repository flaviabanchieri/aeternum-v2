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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'relatorio_model.dart';
export 'relatorio_model.dart';

class RelatorioWidget extends StatefulWidget {
  const RelatorioWidget({super.key});

  @override
  State<RelatorioWidget> createState() => _RelatorioWidgetState();
}

class _RelatorioWidgetState extends State<RelatorioWidget> {
  late RelatorioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RelatorioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.queryCountLigacoes = await CountRelatorioLigacoesCall.call();

      _model.queryCountLigacoesEmAndamento =
          await CountRelatorioLigacoesCall.call(
        status: 'Entrar em contato',
        dataInicial: valueOrDefault<String>(
          _model.dataInicial?.toString(),
          '1990-01-01 00:00:00',
        ),
        dataFinal: valueOrDefault<String>(
          _model.dataFinal?.toString(),
          '2222-12-31 23:59:59',
        ),
      );

      _model.queryRetornoRelatorioIniciar = await RelatorioLigacoesCall.call();

      _model.retornoTempoDeLigacao = await RelatorioTempoLigacoesCall.call();

      _model.retornoMediaTempoDeLigacao =
          await RelatorioMediaTempoLigacaoCall.call();

      _model.retornoApiRelatorioFaturamento =
          await RelatorioFaturamentoCall.call();

      _model.countLigacoes = getJsonField(
        (_model.queryCountLigacoes?.jsonBody ?? ''),
        r'''$''',
      );
      _model.listaRelatorio =
          (_model.queryRetornoRelatorioIniciar?.jsonBody ?? '')
              .toList()
              .cast<dynamic>();
      _model.tempoLigacao = getJsonField(
        (_model.retornoTempoDeLigacao?.jsonBody ?? ''),
        r'''$''',
      ).toString().toString();
      _model.tempoMedioLigacao = getJsonField(
        (_model.retornoMediaTempoDeLigacao?.jsonBody ?? ''),
        r'''$''',
      ).toString().toString();
      _model.ligacoesEmAndamento =
          (_model.queryCountLigacoesEmAndamento?.jsonBody ?? '');
      _model.faturamento =
          (_model.retornoApiRelatorioFaturamento?.jsonBody ?? '');
      safeSetState(() {});
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
                    wrapWithModel(
                      model: _model.headerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: HeaderWidget(
                        page: 'Relatório de Ligações',
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 1.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final _datePicked1Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2050),
                                                builder: (context, child) {
                                                  return wrapInMaterialDatePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    headerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                    pickerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    pickerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    selectedDateTimeBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    selectedDateTimeForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    actionButtonForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );

                                              if (_datePicked1Date != null) {
                                                safeSetState(() {
                                                  _model.datePicked1 = DateTime(
                                                    _datePicked1Date.year,
                                                    _datePicked1Date.month,
                                                    _datePicked1Date.day,
                                                  );
                                                });
                                              }
                                              _model.dataInicial =
                                                  _model.datePicked1;
                                              safeSetState(() {});
                                            },
                                            child: wrapWithModel(
                                              model: _model.datePickerModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DatePickerWidget(
                                                data: _model.dataInicial,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePicked2Date =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime(2050),
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  headerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                  pickerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  pickerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  selectedDateTimeBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  selectedDateTimeForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  actionButtonForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );

                                            if (_datePicked2Date != null) {
                                              safeSetState(() {
                                                _model.datePicked2 = DateTime(
                                                  _datePicked2Date.year,
                                                  _datePicked2Date.month,
                                                  _datePicked2Date.day,
                                                );
                                              });
                                            }
                                            _model.dataFinal =
                                                _model.datePicked2;
                                            safeSetState(() {});
                                          },
                                          child: wrapWithModel(
                                            model: _model.datePickerModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: DatePickerWidget(
                                              data: _model.dataFinal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: FutureBuilder<List<UsuarioRow>>(
                                        future: UsuarioTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'permissao',
                                                2,
                                              )
                                              .neq(
                                                'situacao',
                                                2,
                                              )
                                              .order('nome', ascending: true),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsuarioRow>
                                              dropDownAtendenteUsuarioRowList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownAtendenteValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownAtendenteValue ??=
                                                  '',
                                            ),
                                            options: List<String>.from(
                                                dropDownAtendenteUsuarioRowList
                                                    .map((e) => e.user)
                                                    .withoutNulls
                                                    .toList()),
                                            optionLabels:
                                                dropDownAtendenteUsuarioRowList
                                                    .map((e) => e.nome)
                                                    .withoutNulls
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                        .dropDownAtendenteValue =
                                                    val),
                                            width: 300.0,
                                            height: 56.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Atendente',
                                            searchHintText: 'Pesqusie por nome',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: FutureBuilder<List<ProdutoRow>>(
                                        future: ProdutoTable().queryRows(
                                          queryFn: (q) =>
                                              q.order('nome', ascending: true),
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ProdutoRow>
                                              dropDownPordutoProdutoRowList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownPordutoValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownPordutoValue ??=
                                                  '',
                                            ),
                                            options: List<String>.from(
                                                dropDownPordutoProdutoRowList
                                                    .map((e) => e.codigo)
                                                    .withoutNulls
                                                    .toList()),
                                            optionLabels:
                                                dropDownPordutoProdutoRowList
                                                    .map((e) => e.nome)
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                        .dropDownPordutoValue =
                                                    val),
                                            width: 300.0,
                                            height: 56.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Produto',
                                            searchHintText: 'Pesquise por nome',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: FutureBuilder<List<LeadOrigemRow>>(
                                        future: LeadOrigemTable().queryRows(
                                          queryFn: (q) => q,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<LeadOrigemRow>
                                              dropDownOrigemLeadOrigemRowList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownOrigemValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownOrigemValue ??= '',
                                            ),
                                            options: List<String>.from(
                                                dropDownOrigemLeadOrigemRowList
                                                    .map((e) => e.origem)
                                                    .withoutNulls
                                                    .toList()),
                                            optionLabels:
                                                dropDownOrigemLeadOrigemRowList
                                                    .map((e) => e.traducao)
                                                    .withoutNulls
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                    .dropDownOrigemValue = val),
                                            width: 300.0,
                                            height: 56.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Tag de origem',
                                            searchHintText: 'Pesquise pela tag',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: FutureBuilder<List<LeadStatusRow>>(
                                        future: LeadStatusTable().queryRows(
                                          queryFn: (q) => q,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<LeadStatusRow>
                                              dropDownStatusLeadStatusRowList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownStatusValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownStatusValue ??= '',
                                            ),
                                            options:
                                                dropDownStatusLeadStatusRowList
                                                    .map((e) => e.status)
                                                    .toList(),
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                    .dropDownStatusValue = val),
                                            width: 300.0,
                                            height: 56.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Status',
                                            searchHintText:
                                                'Pesquise o nome status',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 12.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.listaRelatorio =
                                            (_model.queryRetornoRelatorioIniciar
                                                        ?.jsonBody ??
                                                    '')
                                                .toList()
                                                .cast<dynamic>();
                                        _model.dataInicial = null;
                                        _model.dataFinal = null;
                                        _model.tempoLigacao = (_model
                                                    .retornoTempoDeLigacao
                                                    ?.jsonBody ??
                                                '')
                                            .toString();
                                        _model.tempoMedioLigacao = (_model
                                                    .retornoMediaTempoDeLigacao
                                                    ?.jsonBody ??
                                                '')
                                            .toString();
                                        _model.ligacoesEmAndamento = (_model
                                                .queryCountLigacoesEmAndamento
                                                ?.jsonBody ??
                                            '');
                                        _model.faturamento =
                                            valueOrDefault<double>(
                                          (_model.retornoApiRelatorioFaturamento
                                                  ?.jsonBody ??
                                              ''),
                                          0.0,
                                        );
                                        _model.countLigacoes = (_model
                                                .queryCountLigacoes?.jsonBody ??
                                            '');
                                        safeSetState(() {});
                                        safeSetState(() {
                                          _model
                                              .dropDownAtendenteValueController
                                              ?.reset();
                                          _model.dropDownPordutoValueController
                                              ?.reset();
                                          _model.dropDownOrigemValueController
                                              ?.reset();
                                          _model.dropDownStatusValueController
                                              ?.reset();
                                        });
                                      },
                                      text: 'Limpar Filtros',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF69ABE9),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.apiResultRelatorioFiltro =
                                          await RelatorioLigacoesCall.call(
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataInicial?.toString(),
                                          '1990-01-01 00:00:00',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2222-12-31 23:59:59',
                                        ),
                                        atendente:
                                            _model.dropDownAtendenteValue,
                                        produto: _model.dropDownPordutoValue,
                                        origem: _model.dropDownOrigemValue,
                                        status: _model.dropDownStatusValue,
                                      );

                                      _model.queryCountLigacoesEmAndamentoPesquisa =
                                          await CountRelatorioLigacoesCall.call(
                                        status: 'Entrar em contato',
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataInicial?.toString(),
                                          '1990-01-01 00:00:00',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2222-12-31 23:59:59',
                                        ),
                                        atendente:
                                            _model.dropDownAtendenteValue,
                                        produto: _model.dropDownPordutoValue,
                                        origem: _model.dropDownOrigemValue,
                                      );

                                      _model.apiResultRelatorioCountFiltro =
                                          await CountRelatorioLigacoesCall.call(
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataInicial?.toString(),
                                          '1990-01-01 00:00:00',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2222-12-31 23:59:59',
                                        ),
                                        atendente:
                                            _model.dropDownAtendenteValue,
                                        produto: _model.dropDownPordutoValue,
                                        origem: _model.dropDownOrigemValue,
                                        status: _model.dropDownStatusValue,
                                      );

                                      _model.apiResultRelatorioTempoLigacaoFiltro =
                                          await RelatorioTempoLigacoesCall.call(
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataInicial?.toString(),
                                          '1990-01-01 00:00:00',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2222-12-31 23:59:59',
                                        ),
                                        atendente:
                                            _model.dropDownAtendenteValue,
                                        produto: _model.dropDownPordutoValue,
                                        origem: _model.dropDownOrigemValue,
                                        status: _model.dropDownStatusValue,
                                      );

                                      _model.apiResultRelatorioMediaTempoLigacaoFiltro =
                                          await RelatorioMediaTempoLigacaoCall
                                              .call(
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataInicial?.toString(),
                                          '1990-01-01 00:00:00',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2222-12-31 23:59:59',
                                        ),
                                        atendente:
                                            _model.dropDownAtendenteValue,
                                        produto: _model.dropDownPordutoValue,
                                        origem: _model.dropDownOrigemValue,
                                        status: _model.dropDownStatusValue,
                                      );

                                      _model.pesquisaApiFaturamento =
                                          await RelatorioFaturamentoCall.call(
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataInicial?.toString(),
                                          '1990-01-01 00:00:00',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2222-12-31 23:59:59',
                                        ),
                                        produto: _model.dropDownPordutoValue,
                                        usuario: _model.dropDownAtendenteValue,
                                      );

                                      _model.listaRelatorio = (_model
                                                  .apiResultRelatorioFiltro
                                                  ?.jsonBody ??
                                              '')
                                          .toList()
                                          .cast<dynamic>();
                                      _model.countLigacoes = getJsonField(
                                        (_model.apiResultRelatorioCountFiltro
                                                ?.jsonBody ??
                                            ''),
                                        r'''$''',
                                      );
                                      _model.tempoLigacao = getJsonField(
                                        (_model.apiResultRelatorioTempoLigacaoFiltro
                                                ?.jsonBody ??
                                            ''),
                                        r'''$''',
                                      ).toString();
                                      _model.tempoMedioLigacao = getJsonField(
                                        (_model.apiResultRelatorioMediaTempoLigacaoFiltro
                                                ?.jsonBody ??
                                            ''),
                                        r'''$''',
                                      ).toString();
                                      _model.faturamento = (_model
                                              .pesquisaApiFaturamento
                                              ?.jsonBody ??
                                          '');
                                      _model.ligacoesEmAndamento = (_model
                                              .queryCountLigacoesEmAndamentoPesquisa
                                              ?.jsonBody ??
                                          '');
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    text: 'Filtrar Relatório',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Wrap(
                                      spacing: 30.0,
                                      runSpacing: 30.0,
                                      alignment: WrapAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Ligações realizadas',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                _model.countLigacoes
                                                    ?.toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Tempo de ligação',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                _model.tempoLigacao,
                                                '00:00:00',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Tempo médio de ligação',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                _model.tempoMedioLigacao,
                                                '00:00:00',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Ligações entrar em contato',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                _model.ligacoesEmAndamento
                                                    ?.toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Faturamento',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                functions.mascaraValorReal(
                                                    _model.faturamento),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 8.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
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
                                                        'Data',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Text(
                                                      'Lead',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      'Atendente',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      'Origem',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
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
                                                        'Tempo da ligação',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'Produto',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      'Status',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_back,
                                                    color: Color(0x00161C24),
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final relatorio = _model
                                                  .listaRelatorio
                                                  .toList();

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: relatorio.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 10.0),
                                                itemBuilder:
                                                    (context, relatorioIndex) {
                                                  final relatorioItem =
                                                      relatorio[relatorioIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 1.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 0.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            offset: Offset(
                                                              0.0,
                                                              1.0,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                            ))
                                                              Expanded(
                                                                flex: 2,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.dataHoraAmPm(
                                                                          functions
                                                                              .converterStringParaData(getJsonField(
                                                                        relatorioItem,
                                                                        r'''$.data_lead''',
                                                                      ).toString())),
                                                                      '00/00/0000 00:00:00',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Manrope',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    relatorioItem,
                                                                    r'''$.lead_nome''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                getJsonField(
                                                                  relatorioItem,
                                                                  r'''$.atendente''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                getJsonField(
                                                                  relatorioItem,
                                                                  r'''$.origem''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      letterSpacing:
                                                                          0.0,
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
                                                                  getJsonField(
                                                                    relatorioItem,
                                                                    r'''$.duracao_ligacao''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                  ))
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          relatorioItem,
                                                                          r'''$.nome_produto''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                  ))
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          relatorioItem,
                                                                          r'''$.status_lead''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                  if (getJsonField(
                                                                        relatorioItem,
                                                                        r'''$.url_gravacao''',
                                                                      ) !=
                                                                      null) {
                                                                    await launchURL(
                                                                        getJsonField(
                                                                      relatorioItem,
                                                                      r'''$.url_gravacao''',
                                                                    ).toString());
                                                                    return;
                                                                  } else {
                                                                    return;
                                                                  }
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .download_sharp,
                                                                  color: getJsonField(
                                                                            relatorioItem,
                                                                            r'''$.url_gravacao''',
                                                                          ) !=
                                                                          null
                                                                      ? FlutterFlowTheme.of(context).primaryText
                                                                      : Colors.transparent,
                                                                  size: 24.0,
                                                                ),
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 20.0)),
                          ),
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
  }
}
