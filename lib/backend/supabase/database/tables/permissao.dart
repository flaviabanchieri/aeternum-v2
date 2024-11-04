import '../database.dart';

class PermissaoTable extends SupabaseTable<PermissaoRow> {
  @override
  String get tableName => 'permissao';

  @override
  PermissaoRow createRow(Map<String, dynamic> data) => PermissaoRow(data);
}

class PermissaoRow extends SupabaseDataRow {
  PermissaoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PermissaoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get permissao => getField<String>('permissao');
  set permissao(String? value) => setField<String>('permissao', value);
}
