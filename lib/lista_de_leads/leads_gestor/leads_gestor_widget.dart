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
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'leads_gestor_model.dart';
export 'leads_gestor_model.dart';

class LeadsGestorWidget extends StatefulWidget {
  const LeadsGestorWidget({super.key});

  @override
  State<LeadsGestorWidget> createState() => _LeadsGestorWidgetState();
}

class _LeadsGestorWidgetState extends State<LeadsGestorWidget> {
  late LeadsGestorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadsGestorModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_model.dropDownProdutosValue != null &&
          _model.dropDownProdutosValue != '') {
        _model.listaCodigoProduto = _model.dropDownProdutosValue;
        safeSetState(() {});
      } else {
        _model.listaCodigoProduto = '';
        safeSetState(() {});
      }

      _model.entrarEmContatoApi = await LeadsGestorCall.call(
        nome: _model.textFieldNomeTextController.text,
        produto: _model.dropDownProdutosValue,
        origem: _model.dropDownOrigemValue,
        dataInicial: valueOrDefault<String>(
          _model.dataIncial?.toString(),
          '1999-01-01',
        ),
        dataFinal: valueOrDefault<String>(
          _model.dataFinal?.toString(),
          '2999-01-01',
        ),
        status: '1',
        aprovado: false,
      );

      _model.andamentoApi = await LeadsGestorCall.call(
        nome: _model.textFieldNomeTextController.text,
        produto: _model.dropDownProdutosValue,
        origem: _model.dropDownOrigemValue,
        dataInicial: valueOrDefault<String>(
          _model.dataIncial?.toString(),
          '1999-01-01',
        ),
        dataFinal: valueOrDefault<String>(
          _model.dataFinal?.toString(),
          '2999-01-01',
        ),
        status: '2',
        aprovado: false,
      );

      _model.aprovacaoApi = await LeadsGestorCall.call(
        nome: _model.textFieldNomeTextController.text,
        produto: _model.dropDownProdutosValue,
        origem: _model.dropDownOrigemValue,
        dataInicial: valueOrDefault<String>(
          _model.dataIncial?.toString(),
          '1999-01-01',
        ),
        dataFinal: valueOrDefault<String>(
          _model.dataFinal?.toString(),
          '2999-01-01',
        ),
        status: '3',
        aprovado: false,
      );

      _model.concluidoApi = await LeadsGestorCall.call(
        nome: _model.textFieldNomeTextController.text,
        produto: _model.dropDownProdutosValue,
        origem: _model.dropDownOrigemValue,
        dataInicial: valueOrDefault<String>(
          _model.dataIncial?.toString(),
          '1999-01-01',
        ),
        dataFinal: valueOrDefault<String>(
          _model.dataFinal?.toString(),
          '2999-01-01',
        ),
        status: '4',
        aprovado: false,
      );

      _model.vendidoApi = await LeadsGestorCall.call(
        nome: _model.textFieldNomeTextController.text,
        produto: _model.dropDownProdutosValue,
        origem: _model.dropDownOrigemValue,
        dataInicial: valueOrDefault<String>(
          _model.dataIncial?.toString(),
          '1999-01-01',
        ),
        dataFinal: valueOrDefault<String>(
          _model.dataFinal?.toString(),
          '2999-01-01',
        ),
        status: '4',
        aprovado: true,
      );

      _model.canceladoApi = await LeadsGestorCall.call(
        nome: _model.textFieldNomeTextController.text,
        produto: _model.dropDownProdutosValue,
        origem: _model.dropDownOrigemValue,
        dataInicial: valueOrDefault<String>(
          _model.dataIncial?.toString(),
          '1999-01-01',
        ),
        dataFinal: valueOrDefault<String>(
          _model.dataFinal?.toString(),
          '2999-01-01',
        ),
        status: '6',
        aprovado: false,
      );

      _model.listaLeadEntrarEmContato =
          (_model.entrarEmContatoApi?.jsonBody ?? '').toList().cast<dynamic>();
      _model.listaLeadAguardandoAprovacao =
          (_model.aprovacaoApi?.jsonBody ?? '').toList().cast<dynamic>();
      _model.listaLeadConcluido =
          (_model.concluidoApi?.jsonBody ?? '').toList().cast<dynamic>();
      _model.listaLeadEmProgresso =
          (_model.andamentoApi?.jsonBody ?? '').toList().cast<dynamic>();
      _model.carregando = false;
      _model.listaLeadVendido =
          (_model.vendidoApi?.jsonBody ?? '').toList().cast<dynamic>();
      _model.listaLeadCancelado =
          (_model.canceladoApi?.jsonBody ?? '').toList().cast<dynamic>();
      safeSetState(() {});
    });

    _model.textFieldNomeTextController ??= TextEditingController();
    _model.textFieldNomeFocusNode ??= FocusNode();

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              wrapWithModel(
                model: _model.sidenavModel,
                updateCallback: () => safeSetState(() {}),
                child: SidenavWidget(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.headerModel,
                            updateCallback: () => safeSetState(() {}),
                            child: HeaderWidget(
                              page: 'Leads',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: FutureBuilder<List<ProdutoRow>>(
                                      future: ProdutoTable().queryRows(
                                        queryFn: (q) => q.order('nome'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
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
                                            dropDownProdutosProdutoRowList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownProdutosValueController ??=
                                              FormFieldController<String>(
                                            _model.dropDownProdutosValue ??= '',
                                          ),
                                          options: List<String>.from(
                                              dropDownProdutosProdutoRowList
                                                  .map((e) => e.codigo)
                                                  .withoutNulls
                                                  .toList()),
                                          optionLabels:
                                              dropDownProdutosProdutoRowList
                                                  .map((e) => e.nome)
                                                  .toList(),
                                          onChanged: (val) => safeSetState(() =>
                                              _model.dropDownProdutosValue =
                                                  val),
                                          width: 300.0,
                                          height: 50.0,
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
                                          hintText: 'Filtrar por Produto',
                                          searchHintText: 'Pesquise pelo nome',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
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
                                        0.0, 0.0, 8.0, 0.0),
                                    child: FutureBuilder<List<LeadOrigemRow>>(
                                      future: LeadOrigemTable().queryRows(
                                        queryFn: (q) => q.in_(
                                          'id',
                                          [2, 5, 9, 10],
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
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
                                          onChanged: (val) => safeSetState(() =>
                                              _model.dropDownOrigemValue = val),
                                          width: 300.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'Filtrar por Origem',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
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
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller:
                                        _model.textFieldNomeTextController,
                                    focusNode: _model.textFieldNomeFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Nome',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .textFieldNomeTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final _datePicked1Date =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2050),
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
                                        _model.dataIncial = _model.datePicked1;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                  "dd/MM/yyyy",
                                                  _model.dataIncial,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'Data inicial',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
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
                                        _model.dataFinal = _model.datePicked2;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                  "dd/MM/yyyy",
                                                  _model.dataFinal,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'Data Final',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.carregando = true;
                                      safeSetState(() {});
                                      _model.entrarEmContatoApiCopy =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '1',
                                        aprovado: false,
                                      );

                                      _model.andamentoApiCopy =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '2',
                                        aprovado: false,
                                      );

                                      _model.aprovacaoApiCopy =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '3',
                                        aprovado: false,
                                      );

                                      _model.concluidoApiCopy =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '4',
                                        aprovado: false,
                                      );

                                      _model.vendidoApi1 =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '4',
                                        aprovado: true,
                                      );

                                      _model.canceladoApi1 =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '6',
                                        aprovado: false,
                                      );

                                      _model.listaLeadEntrarEmContato = (_model
                                                  .entrarEmContatoApiCopy
                                                  ?.jsonBody ??
                                              '')
                                          .toList()
                                          .cast<dynamic>();
                                      _model.listaLeadAguardandoAprovacao =
                                          (_model.aprovacaoApiCopy?.jsonBody ??
                                                  '')
                                              .toList()
                                              .cast<dynamic>();
                                      _model.listaLeadConcluido =
                                          (_model.concluidoApiCopy?.jsonBody ??
                                                  '')
                                              .toList()
                                              .cast<dynamic>();
                                      _model.listaLeadEmProgresso =
                                          (_model.andamentoApiCopy?.jsonBody ??
                                                  '')
                                              .toList()
                                              .cast<dynamic>();
                                      _model.carregando = false;
                                      _model.listaLeadVendido =
                                          (_model.vendidoApi1?.jsonBody ?? '')
                                              .toList()
                                              .cast<dynamic>();
                                      _model.listaLeadCancelado =
                                          (_model.canceladoApi1?.jsonBody ?? '')
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    text: 'Filtrar',
                                    options: FFButtonOptions(
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF804DFC),
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      safeSetState(() {
                                        _model.dropDownProdutosValueController
                                            ?.reset();
                                        _model.dropDownOrigemValueController
                                            ?.reset();
                                      });
                                      safeSetState(() {
                                        _model.textFieldNomeTextController
                                            ?.clear();
                                      });
                                      _model.dataIncial = null;
                                      _model.dataFinal = null;
                                      safeSetState(() {});
                                      _model.carregando = true;
                                      safeSetState(() {});
                                      _model.entrarEmContatoApiCopy1 =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '1',
                                        aprovado: false,
                                      );

                                      _model.andamentoApiCopy1 =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '2',
                                        aprovado: false,
                                      );

                                      _model.aprovacaoApiCopy1 =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '3',
                                        aprovado: false,
                                      );

                                      _model.concluidoApiCopy1 =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '4',
                                        aprovado: false,
                                      );

                                      _model.vendidoApi2 =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '4',
                                        aprovado: true,
                                      );

                                      _model.canceladoApi2 =
                                          await LeadsGestorCall.call(
                                        nome: _model
                                            .textFieldNomeTextController.text,
                                        produto: _model.dropDownProdutosValue,
                                        origem: _model.dropDownOrigemValue,
                                        dataInicial: valueOrDefault<String>(
                                          _model.dataIncial?.toString(),
                                          '1999-01-01',
                                        ),
                                        dataFinal: valueOrDefault<String>(
                                          _model.dataFinal?.toString(),
                                          '2999-01-01',
                                        ),
                                        status: '6',
                                        aprovado: false,
                                      );

                                      _model.listaLeadEntrarEmContato = (_model
                                                  .entrarEmContatoApiCopy1
                                                  ?.jsonBody ??
                                              '')
                                          .toList()
                                          .cast<dynamic>();
                                      _model.listaLeadAguardandoAprovacao =
                                          (_model.aprovacaoApiCopy1?.jsonBody ??
                                                  '')
                                              .toList()
                                              .cast<dynamic>();
                                      _model.listaLeadConcluido =
                                          (_model.concluidoApiCopy1?.jsonBody ??
                                                  '')
                                              .toList()
                                              .cast<dynamic>();
                                      _model.listaLeadEmProgresso =
                                          (_model.andamentoApiCopy1?.jsonBody ??
                                                  '')
                                              .toList()
                                              .cast<dynamic>();
                                      _model.carregando = false;
                                      _model.listaLeadVendido =
                                          (_model.vendidoApi2?.jsonBody ?? '')
                                              .toList()
                                              .cast<dynamic>();
                                      _model.listaLeadCancelado =
                                          (_model.canceladoApi2?.jsonBody ?? '')
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    text: 'Limpar Filtros',
                                    options: FFButtonOptions(
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).warning,
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
                                ),
                                Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(dialogContext)
                                                      .unfocus(),
                                              child: Container(
                                                width: 600.0,
                                                child: CriarLeadManualWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    text: 'Novo lead',
                                    options: FFButtonOptions(
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
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
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 20.0),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Entrar em contato',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      if (!_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final item = _model
                                                                      .listaLeadEntrarEmContato
                                                                      .toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount: item
                                                                        .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                10.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            itemIndex) {
                                                                      final itemItem =
                                                                          item[
                                                                              itemIndex];
                                                                      return Visibility(
                                                                        visible: getJsonField(
                                                                              itemItem,
                                                                              r'''$.id_lead''',
                                                                            ) !=
                                                                            null,
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              1.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                278.0,
                                                                            height:
                                                                                189.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'InfoLead',
                                                                                  queryParameters: {
                                                                                    'lead': serializeParam(
                                                                                      getJsonField(
                                                                                        itemItem,
                                                                                        r'''$.nome_lead''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'id': serializeParam(
                                                                                      valueOrDefault<int>(
                                                                                        getJsonField(
                                                                                          itemItem,
                                                                                          r'''$.id_lead''',
                                                                                        ),
                                                                                        0,
                                                                                      ),
                                                                                      ParamType.int,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  itemItem,
                                                                                                  r'''$.nome_lead''',
                                                                                                )?.toString(),
                                                                                                '-',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  itemItem,
                                                                                                  r'''$.telefone''',
                                                                                                )?.toString(),
                                                                                                '-',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            getJsonField(
                                                                                                              itemItem,
                                                                                                              r'''$.nome_produto''',
                                                                                                            )?.toString(),
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        width: 100.0,
                                                                                                        height: 31.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).accent3,
                                                                                                          borderRadius: BorderRadius.circular(6.0),
                                                                                                        ),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                            child: Text(
                                                                                                              getJsonField(
                                                                                                                itemItem,
                                                                                                                r'''$.origem''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Manrope',
                                                                                                                    color: Color(0xFF6F7E16),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: getJsonField(
                                                                                                      itemItem,
                                                                                                      r'''$.created_at''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 6.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
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
                                                        ),
                                                      if (_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Lottie
                                                                      .network(
                                                                    'https://lottie.host/0acbd425-3c29-4199-8740-1d90d3bed317/XS62D98ToP.json',
                                                                    width:
                                                                        150.0,
                                                                    height:
                                                                        150.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    animate:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(height: 6.0)),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Em progresso',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      if (!_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final item = _model
                                                                      .listaLeadEmProgresso
                                                                      .toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount: item
                                                                        .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                10.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            itemIndex) {
                                                                      final itemItem =
                                                                          item[
                                                                              itemIndex];
                                                                      return Visibility(
                                                                        visible: getJsonField(
                                                                              itemItem,
                                                                              r'''$.id_lead''',
                                                                            ) !=
                                                                            null,
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              1.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                278.0,
                                                                            height:
                                                                                189.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'InfoLead',
                                                                                  queryParameters: {
                                                                                    'lead': serializeParam(
                                                                                      getJsonField(
                                                                                        itemItem,
                                                                                        r'''$.nome_lead''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'id': serializeParam(
                                                                                      valueOrDefault<int>(
                                                                                        getJsonField(
                                                                                          itemItem,
                                                                                          r'''$.id_lead''',
                                                                                        ),
                                                                                        0,
                                                                                      ),
                                                                                      ParamType.int,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  itemItem,
                                                                                                  r'''$.nome_lead''',
                                                                                                )?.toString(),
                                                                                                '-',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  itemItem,
                                                                                                  r'''$.telefone''',
                                                                                                )?.toString(),
                                                                                                '-',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            getJsonField(
                                                                                                              itemItem,
                                                                                                              r'''$.nome_produto''',
                                                                                                            )?.toString(),
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        width: 100.0,
                                                                                                        height: 31.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).accent3,
                                                                                                          borderRadius: BorderRadius.circular(6.0),
                                                                                                        ),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                            child: Text(
                                                                                                              getJsonField(
                                                                                                                itemItem,
                                                                                                                r'''$.origem''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Manrope',
                                                                                                                    color: Color(0xFF6F7E16),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: getJsonField(
                                                                                                      itemItem,
                                                                                                      r'''$.created_at''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 6.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
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
                                                        ),
                                                      if (_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Lottie
                                                                      .network(
                                                                    'https://lottie.host/0acbd425-3c29-4199-8740-1d90d3bed317/XS62D98ToP.json',
                                                                    width:
                                                                        150.0,
                                                                    height:
                                                                        150.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    animate:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(height: 6.0)),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Aguardando aprovação do gestor',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      if (!_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final item = _model
                                                                      .listaLeadAguardandoAprovacao
                                                                      .toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount: item
                                                                        .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                10.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            itemIndex) {
                                                                      final itemItem =
                                                                          item[
                                                                              itemIndex];
                                                                      return Visibility(
                                                                        visible: getJsonField(
                                                                              itemItem,
                                                                              r'''$.id_lead''',
                                                                            ) !=
                                                                            null,
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              1.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                278.0,
                                                                            height:
                                                                                189.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'InfoLead',
                                                                                  queryParameters: {
                                                                                    'lead': serializeParam(
                                                                                      getJsonField(
                                                                                        itemItem,
                                                                                        r'''$.nome_lead''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'id': serializeParam(
                                                                                      valueOrDefault<int>(
                                                                                        getJsonField(
                                                                                          itemItem,
                                                                                          r'''$.id_lead''',
                                                                                        ),
                                                                                        0,
                                                                                      ),
                                                                                      ParamType.int,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  itemItem,
                                                                                                  r'''$.nome_lead''',
                                                                                                )?.toString(),
                                                                                                '-',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  itemItem,
                                                                                                  r'''$.telefone''',
                                                                                                )?.toString(),
                                                                                                '-',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            getJsonField(
                                                                                                              itemItem,
                                                                                                              r'''$.nome_produto''',
                                                                                                            )?.toString(),
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        width: 100.0,
                                                                                                        height: 31.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).accent3,
                                                                                                          borderRadius: BorderRadius.circular(6.0),
                                                                                                        ),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                            child: Text(
                                                                                                              getJsonField(
                                                                                                                itemItem,
                                                                                                                r'''$.origem''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Manrope',
                                                                                                                    color: Color(0xFF6F7E16),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: getJsonField(
                                                                                                      itemItem,
                                                                                                      r'''$.created_at''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 6.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
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
                                                        ),
                                                      if (_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Lottie
                                                                      .network(
                                                                    'https://lottie.host/0acbd425-3c29-4199-8740-1d90d3bed317/XS62D98ToP.json',
                                                                    width:
                                                                        150.0,
                                                                    height:
                                                                        150.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    animate:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(height: 6.0)),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Concluido',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      if (!_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final item = _model
                                                                      .listaLeadConcluido
                                                                      .toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount: item
                                                                        .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                10.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            itemIndex) {
                                                                      final itemItem =
                                                                          item[
                                                                              itemIndex];
                                                                      return Visibility(
                                                                        visible: getJsonField(
                                                                              itemItem,
                                                                              r'''$.id_lead''',
                                                                            ) !=
                                                                            null,
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              1.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                278.0,
                                                                            height:
                                                                                189.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'InfoLead',
                                                                                  queryParameters: {
                                                                                    'lead': serializeParam(
                                                                                      getJsonField(
                                                                                        itemItem,
                                                                                        r'''$.nome_lead''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'id': serializeParam(
                                                                                      valueOrDefault<int>(
                                                                                        getJsonField(
                                                                                          itemItem,
                                                                                          r'''$.id_lead''',
                                                                                        ),
                                                                                        0,
                                                                                      ),
                                                                                      ParamType.int,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  itemItem,
                                                                                                  r'''$.nome_lead''',
                                                                                                )?.toString(),
                                                                                                '-',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  itemItem,
                                                                                                  r'''$.telefone''',
                                                                                                )?.toString(),
                                                                                                '-',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            getJsonField(
                                                                                                              itemItem,
                                                                                                              r'''$.nome_produto''',
                                                                                                            )?.toString(),
                                                                                                            '-',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        width: 100.0,
                                                                                                        height: 31.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).accent3,
                                                                                                          borderRadius: BorderRadius.circular(6.0),
                                                                                                        ),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                            child: Text(
                                                                                                              getJsonField(
                                                                                                                itemItem,
                                                                                                                r'''$.origem''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Manrope',
                                                                                                                    color: Color(0xFF6F7E16),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: getJsonField(
                                                                                                      itemItem,
                                                                                                      r'''$.created_at''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 6.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
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
                                                        ),
                                                      if (_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Lottie
                                                                      .network(
                                                                    'https://lottie.host/0acbd425-3c29-4199-8740-1d90d3bed317/XS62D98ToP.json',
                                                                    width:
                                                                        150.0,
                                                                    height:
                                                                        150.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    animate:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(height: 6.0)),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Concluido - Aprovado',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      if (!_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final listConcluido = _model
                                                                      .listaLeadVendido
                                                                      .toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        listConcluido
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                10.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            listConcluidoIndex) {
                                                                      final listConcluidoItem =
                                                                          listConcluido[
                                                                              listConcluidoIndex];
                                                                      return Visibility(
                                                                        visible: getJsonField(
                                                                              listConcluidoItem,
                                                                              r'''$.id_lead''',
                                                                            ) !=
                                                                            null,
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              1.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                278.0,
                                                                            height:
                                                                                189.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'InfoLead',
                                                                                  queryParameters: {
                                                                                    'lead': serializeParam(
                                                                                      getJsonField(
                                                                                        listConcluidoItem,
                                                                                        r'''$.nome_lead''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'id': serializeParam(
                                                                                      getJsonField(
                                                                                        listConcluidoItem,
                                                                                        r'''$.id_lead''',
                                                                                      ),
                                                                                      ParamType.int,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: Text(
                                                                                              getJsonField(
                                                                                                listConcluidoItem,
                                                                                                r'''$.nome_lead''',
                                                                                              ).toString(),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: Text(
                                                                                              getJsonField(
                                                                                                listConcluidoItem,
                                                                                                r'''$.telefone''',
                                                                                              ).toString(),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Text(
                                                                                                          getJsonField(
                                                                                                            listConcluidoItem,
                                                                                                            r'''$.nome_produto''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        width: 100.0,
                                                                                                        height: 31.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).accent3,
                                                                                                          borderRadius: BorderRadius.circular(6.0),
                                                                                                        ),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                            child: Text(
                                                                                                              getJsonField(
                                                                                                                listConcluidoItem,
                                                                                                                r'''$.origem''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Manrope',
                                                                                                                    color: Color(0xFF6F7E16),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: getJsonField(
                                                                                                      listConcluidoItem,
                                                                                                      r'''$.created_at''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 6.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
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
                                                        ),
                                                      if (_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Lottie
                                                                  .network(
                                                                'https://lottie.host/0acbd425-3c29-4199-8740-1d90d3bed317/XS62D98ToP.json',
                                                                width: 150.0,
                                                                height: 150.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                                animate: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(height: 6.0)),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Cancelado',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      if (!_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final listConcluido = _model
                                                                      .listaLeadCancelado
                                                                      .toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        listConcluido
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                10.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            listConcluidoIndex) {
                                                                      final listConcluidoItem =
                                                                          listConcluido[
                                                                              listConcluidoIndex];
                                                                      return Visibility(
                                                                        visible: getJsonField(
                                                                              listConcluidoItem,
                                                                              r'''$.id_lead''',
                                                                            ) !=
                                                                            null,
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              1.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                278.0,
                                                                            height:
                                                                                189.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                            ),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'InfoLead',
                                                                                  queryParameters: {
                                                                                    'lead': serializeParam(
                                                                                      getJsonField(
                                                                                        listConcluidoItem,
                                                                                        r'''$.nome_lead''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'id': serializeParam(
                                                                                      getJsonField(
                                                                                        listConcluidoItem,
                                                                                        r'''$.id_lead''',
                                                                                      ),
                                                                                      ParamType.int,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: Text(
                                                                                              getJsonField(
                                                                                                listConcluidoItem,
                                                                                                r'''$.nome_lead''',
                                                                                              ).toString(),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: Text(
                                                                                              getJsonField(
                                                                                                listConcluidoItem,
                                                                                                r'''$.telefone''',
                                                                                              ).toString(),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Manrope',
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                        child: Text(
                                                                                                          getJsonField(
                                                                                                            listConcluidoItem,
                                                                                                            r'''$.nome_produto''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Manrope',
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        width: 100.0,
                                                                                                        height: 31.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).accent3,
                                                                                                          borderRadius: BorderRadius.circular(6.0),
                                                                                                        ),
                                                                                                        child: Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                            child: Text(
                                                                                                              getJsonField(
                                                                                                                listConcluidoItem,
                                                                                                                r'''$.origem''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Manrope',
                                                                                                                    color: Color(0xFF6F7E16),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: getJsonField(
                                                                                                      listConcluidoItem,
                                                                                                      r'''$.created_at''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 6.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
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
                                                        ),
                                                      if (_model.carregando)
                                                        Expanded(
                                                          child: Container(
                                                            width: 298.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Lottie
                                                                  .network(
                                                                'https://lottie.host/0acbd425-3c29-4199-8740-1d90d3bed317/XS62D98ToP.json',
                                                                width: 150.0,
                                                                height: 150.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                                animate: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(height: 6.0)),
                                                  ),
                                                ].divide(SizedBox(width: 14.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 9.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 6.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
