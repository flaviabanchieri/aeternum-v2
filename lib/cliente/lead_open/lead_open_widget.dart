import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lead_open_model.dart';
export 'lead_open_model.dart';

class LeadOpenWidget extends StatefulWidget {
  const LeadOpenWidget({
    super.key,
    int? idLead,
    int? idLigacao,
    String? nomeLead,
  })  : this.idLead = idLead ?? 0,
        this.idLigacao = idLigacao ?? 0,
        this.nomeLead = nomeLead ?? '-';

  final int idLead;
  final int idLigacao;
  final String nomeLead;

  @override
  State<LeadOpenWidget> createState() => _LeadOpenWidgetState();
}

class _LeadOpenWidgetState extends State<LeadOpenWidget>
    with TickerProviderStateMixin {
  late LeadOpenModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadOpenModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 16.0),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 670.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12.0,
                    color: Color(0x1E000000),
                    offset: Offset(
                      0.0,
                      5.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sua ligação foi realizada',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
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
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder<List<LigacaoStatusRow>>(
                              future: LigacaoStatusTable().queryRows(
                                queryFn: (q) => q,
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
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<LigacaoStatusRow>
                                    radioButtonLigacaoStatusRowList =
                                    snapshot.data!;

                                return FlutterFlowRadioButton(
                                  options: radioButtonLigacaoStatusRowList
                                      .map((e) => valueOrDefault<String>(
                                            e.status,
                                            'status',
                                          ))
                                      .toList()
                                      .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() {});
                                    if ((_model.radioButtonValue ==
                                            'REAGENDAR LIGAÇÃO') ||
                                        (_model.radioButtonValue ==
                                            'AGUARDANDO PAGAMENTO DE PIX/CARTÃO')) {
                                      _model.mostrarReagendar = true;
                                      safeSetState(() {});
                                      return;
                                    } else {
                                      _model.mostrarReagendar = false;
                                      safeSetState(() {});
                                      return;
                                    }
                                  },
                                  controller:
                                      _model.radioButtonValueController ??=
                                          FormFieldController<String>(''),
                                  optionHeight: 32.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                  selectedTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveRadioButtonColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                );
                              },
                            ),
                            if (_model.mostrarReagendar == true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    150.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
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
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: getCurrentTimestamp,
                                              lastDate: DateTime(2050),
                                            );

                                            TimeOfDay? _datePickedTime;
                                            if (_datePickedDate != null) {
                                              _datePickedTime =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime:
                                                    TimeOfDay.fromDateTime(
                                                        getCurrentTimestamp),
                                              );
                                            }

                                            if (_datePickedDate != null &&
                                                _datePickedTime != null) {
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions.dataHoraAmPm(
                                                      _model.datePicked),
                                                  'dd/MM/aaaa hh:mm',
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
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Observações do atendimento',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Escreva aqui a sua observação',
                            alignLabelWithHint: true,
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                          maxLines: 5,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ]
                          .divide(SizedBox(height: 12.0))
                          .addToEnd(SizedBox(height: 16.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.05),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              if (_model.radioButtonValue == null ||
                                  _model.radioButtonValue == '') {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text(
                                          'Selecione o Status da Ligação.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                if (_model.textController.text == null ||
                                    _model.textController.text == '') {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text(
                                            'Informe uma descrição para essa ligação.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  _model.terminarLigacao =
                                      await TerminarLigacaoCall.call(
                                    userEmail: currentUserEmail,
                                    leadId: valueOrDefault<String>(
                                      widget!.idLead.toString(),
                                      '0',
                                    ),
                                    userId: currentUserUid,
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
                                    obs: _model.textController.text,
                                  );

                                  _shouldSetState = true;
                                  if ((_model.radioButtonValue ==
                                          'BOLETO GERADO') ||
                                      (_model.radioButtonValue ==
                                          'CARTÃO APROVADO') ||
                                      (_model.radioButtonValue ==
                                          'PIX CALL CENTER')) {
                                    await LeadTable().update(
                                      data: {
                                        'status': 3,
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget!.idLead,
                                      ),
                                    );
                                    Navigator.pop(context);

                                    context.pushNamed(
                                      'InfoLead',
                                      queryParameters: {
                                        'lead': serializeParam(
                                          valueOrDefault<String>(
                                            widget!.nomeLead,
                                            '-',
                                          ),
                                          ParamType.String,
                                        ),
                                        'id': serializeParam(
                                          widget!.idLead,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );

                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    if ((_model.radioButtonValue ==
                                            'LIGAÇÃO NÃO ATENDIDA') ||
                                        (_model.radioButtonValue ==
                                            'NÃO VENDI')) {
                                      await LeadTable().update(
                                        data: {
                                          'status': 1,
                                          'data_agendamento':
                                              supaSerialize<DateTime>(
                                                  functions.adicionarHoras(2)),
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget!.idLead,
                                        ),
                                      );
                                      Navigator.pop(context);

                                      context.pushNamed(
                                        'InfoLead',
                                        queryParameters: {
                                          'lead': serializeParam(
                                            valueOrDefault<String>(
                                              widget!.nomeLead,
                                              '-',
                                            ),
                                            ParamType.String,
                                          ),
                                          'id': serializeParam(
                                            widget!.idLead,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );

                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      if ((_model.radioButtonValue ==
                                              'REAGENDAR LIGAÇÃO') ||
                                          (_model.radioButtonValue ==
                                              'AGUARDANDO PAGAMENTO DE PIX/CARTÃO')) {
                                        if (_model.datePicked == null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Informe a data de agendamento.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
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
                                              'data_agendamento':
                                                  supaSerialize<DateTime>(
                                                      _model.datePicked),
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget!.idLead,
                                            ),
                                          );
                                          Navigator.pop(context);

                                          context.pushNamed(
                                            'InfoLead',
                                            queryParameters: {
                                              'lead': serializeParam(
                                                valueOrDefault<String>(
                                                  widget!.nomeLead,
                                                  '-',
                                                ),
                                                ParamType.String,
                                              ),
                                              'id': serializeParam(
                                                widget!.idLead,
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      } else {
                                        await LeadTable().update(
                                          data: {
                                            'status': 4,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget!.idLead,
                                          ),
                                        );
                                        Navigator.pop(context);

                                        context.pushNamed(
                                          'InfoLead',
                                          queryParameters: {
                                            'lead': serializeParam(
                                              valueOrDefault<String>(
                                                widget!.nomeLead,
                                                '-',
                                              ),
                                              ParamType.String,
                                            ),
                                            'id': serializeParam(
                                              widget!.idLead,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    }
                                  }
                                }
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: 'Salvar',
                            options: FFButtonOptions(
                              height: 44.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              hoverColor: FlutterFlowTheme.of(context).accent1,
                              hoverBorderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              hoverTextColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              hoverElevation: 0.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
          ),
        ],
      ),
    );
  }
}
