import '../database.dart';

class ViewLeadComprovantesTable extends SupabaseTable<ViewLeadComprovantesRow> {
  @override
  String get tableName => 'view_lead_comprovantes';

  @override
  ViewLeadComprovantesRow createRow(Map<String, dynamic> data) =>
      ViewLeadComprovantesRow(data);
}

class ViewLeadComprovantesRow extends SupabaseDataRow {
  ViewLeadComprovantesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewLeadComprovantesTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get aprovado => getField<bool>('aprovado');
  set aprovado(bool? value) => setField<bool>('aprovado', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);

  int? get leadId => getField<int>('lead_id');
  set leadId(int? value) => setField<int>('lead_id', value);

  String? get nomeLead => getField<String>('nome_lead');
  set nomeLead(String? value) => setField<String>('nome_lead', value);

  String? get anexadoPor => getField<String>('anexado_por');
  set anexadoPor(String? value) => setField<String>('anexado_por', value);

  String? get nomeQuemAnexou => getField<String>('nome_quem_anexou');
  set nomeQuemAnexou(String? value) =>
      setField<String>('nome_quem_anexou', value);
}
