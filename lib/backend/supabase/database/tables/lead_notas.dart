import '../database.dart';

class LeadNotasTable extends SupabaseTable<LeadNotasRow> {
  @override
  String get tableName => 'lead_notas';

  @override
  LeadNotasRow createRow(Map<String, dynamic> data) => LeadNotasRow(data);
}

class LeadNotasRow extends SupabaseDataRow {
  LeadNotasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LeadNotasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get idLead => getField<int>('id_lead');
  set idLead(int? value) => setField<int>('id_lead', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);
}
