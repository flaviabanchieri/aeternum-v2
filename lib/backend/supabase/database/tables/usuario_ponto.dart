import '../database.dart';

class UsuarioPontoTable extends SupabaseTable<UsuarioPontoRow> {
  @override
  String get tableName => 'usuario_ponto';

  @override
  UsuarioPontoRow createRow(Map<String, dynamic> data) => UsuarioPontoRow(data);
}

class UsuarioPontoRow extends SupabaseDataRow {
  UsuarioPontoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarioPontoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get clockIn => getField<DateTime>('clock_in');
  set clockIn(DateTime? value) => setField<DateTime>('clock_in', value);

  DateTime? get clockOut => getField<DateTime>('clock_out');
  set clockOut(DateTime? value) => setField<DateTime>('clock_out', value);

  String get user => getField<String>('user')!;
  set user(String value) => setField<String>('user', value);
}
