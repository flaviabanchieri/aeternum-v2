import '../database.dart';

class LeadOrigemTable extends SupabaseTable<LeadOrigemRow> {
  @override
  String get tableName => 'lead_origem';

  @override
  LeadOrigemRow createRow(Map<String, dynamic> data) => LeadOrigemRow(data);
}

class LeadOrigemRow extends SupabaseDataRow {
  LeadOrigemRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LeadOrigemTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get origem => getField<String>('origem');
  set origem(String? value) => setField<String>('origem', value);

  String? get traducao => getField<String>('traducao');
  set traducao(String? value) => setField<String>('traducao', value);
}
