import '../database.dart';

class UsuarioSituacaoTable extends SupabaseTable<UsuarioSituacaoRow> {
  @override
  String get tableName => 'usuario_situacao';

  @override
  UsuarioSituacaoRow createRow(Map<String, dynamic> data) =>
      UsuarioSituacaoRow(data);
}

class UsuarioSituacaoRow extends SupabaseDataRow {
  UsuarioSituacaoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuarioSituacaoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get situacao => getField<String>('situacao')!;
  set situacao(String value) => setField<String>('situacao', value);
}
