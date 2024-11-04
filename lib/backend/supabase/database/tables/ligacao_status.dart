import '../database.dart';

class LigacaoStatusTable extends SupabaseTable<LigacaoStatusRow> {
  @override
  String get tableName => 'ligacao_status';

  @override
  LigacaoStatusRow createRow(Map<String, dynamic> data) =>
      LigacaoStatusRow(data);
}

class LigacaoStatusRow extends SupabaseDataRow {
  LigacaoStatusRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LigacaoStatusTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);
}
