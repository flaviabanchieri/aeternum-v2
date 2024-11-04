import '../database.dart';

class ProdutoCategoriaTable extends SupabaseTable<ProdutoCategoriaRow> {
  @override
  String get tableName => 'produto_categoria';

  @override
  ProdutoCategoriaRow createRow(Map<String, dynamic> data) =>
      ProdutoCategoriaRow(data);
}

class ProdutoCategoriaRow extends SupabaseDataRow {
  ProdutoCategoriaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProdutoCategoriaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);
}
