import '../database.dart';

class LigacoesTable extends SupabaseTable<LigacoesRow> {
  @override
  String get tableName => 'ligacoes';

  @override
  LigacoesRow createRow(Map<String, dynamic> data) => LigacoesRow(data);
}

class LigacoesRow extends SupabaseDataRow {
  LigacoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LigacoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get urlGravacao => getField<String>('url_gravacao');
  set urlGravacao(String? value) => setField<String>('url_gravacao', value);

  DateTime? get horaInicio => getField<DateTime>('hora_inicio');
  set horaInicio(DateTime? value) => setField<DateTime>('hora_inicio', value);

  DateTime? get horaFim => getField<DateTime>('hora_fim');
  set horaFim(DateTime? value) => setField<DateTime>('hora_fim', value);

  String? get observacao => getField<String>('observacao');
  set observacao(String? value) => setField<String>('observacao', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  int? get lead => getField<int>('lead');
  set lead(int? value) => setField<int>('lead', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get goToLigacaoRetorno => getField<String>('goTo_ligacao_retorno');
  set goToLigacaoRetorno(String? value) =>
      setField<String>('goTo_ligacao_retorno', value);

  String? get recordId => getField<String>('record_id');
  set recordId(String? value) => setField<String>('record_id', value);
}
