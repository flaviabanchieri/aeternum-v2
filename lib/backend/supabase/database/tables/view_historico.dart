import '../database.dart';

class ViewHistoricoTable extends SupabaseTable<ViewHistoricoRow> {
  @override
  String get tableName => 'view_historico';

  @override
  ViewHistoricoRow createRow(Map<String, dynamic> data) =>
      ViewHistoricoRow(data);
}

class ViewHistoricoRow extends SupabaseDataRow {
  ViewHistoricoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewHistoricoTable();

  int? get idHistorico => getField<int>('id_historico');
  set idHistorico(int? value) => setField<int>('id_historico', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);

  String? get usuarioId => getField<String>('usuario_id');
  set usuarioId(String? value) => setField<String>('usuario_id', value);

  String? get nomeUsuario => getField<String>('nome_usuario');
  set nomeUsuario(String? value) => setField<String>('nome_usuario', value);

  int? get leadId => getField<int>('lead_id');
  set leadId(int? value) => setField<int>('lead_id', value);

  String? get nomeLead => getField<String>('nome_lead');
  set nomeLead(String? value) => setField<String>('nome_lead', value);
}
