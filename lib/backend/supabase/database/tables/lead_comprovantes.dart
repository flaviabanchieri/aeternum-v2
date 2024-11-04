import '../database.dart';

class LeadComprovantesTable extends SupabaseTable<LeadComprovantesRow> {
  @override
  String get tableName => 'lead_comprovantes';

  @override
  LeadComprovantesRow createRow(Map<String, dynamic> data) =>
      LeadComprovantesRow(data);
}

class LeadComprovantesRow extends SupabaseDataRow {
  LeadComprovantesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LeadComprovantesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);

  int? get leadId => getField<int>('lead_id');
  set leadId(int? value) => setField<int>('lead_id', value);

  String? get anexadoPor => getField<String>('anexado_por');
  set anexadoPor(String? value) => setField<String>('anexado_por', value);

  bool? get aprovado => getField<bool>('aprovado');
  set aprovado(bool? value) => setField<bool>('aprovado', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);
}
