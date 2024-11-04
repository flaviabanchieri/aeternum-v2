import '../database.dart';

class HistoricoTable extends SupabaseTable<HistoricoRow> {
  @override
  String get tableName => 'historico';

  @override
  HistoricoRow createRow(Map<String, dynamic> data) => HistoricoRow(data);
}

class HistoricoRow extends SupabaseDataRow {
  HistoricoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HistoricoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  String? get usuarioId => getField<String>('usuario_id');
  set usuarioId(String? value) => setField<String>('usuario_id', value);

  int? get leadId => getField<int>('lead_id');
  set leadId(int? value) => setField<int>('lead_id', value);
}
