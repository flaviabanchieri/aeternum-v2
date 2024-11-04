import '../database.dart';

class LeadStatusTable extends SupabaseTable<LeadStatusRow> {
  @override
  String get tableName => 'lead_status';

  @override
  LeadStatusRow createRow(Map<String, dynamic> data) => LeadStatusRow(data);
}

class LeadStatusRow extends SupabaseDataRow {
  LeadStatusRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LeadStatusTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);
}
