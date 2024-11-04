import '../database.dart';

class ViewProdutoTable extends SupabaseTable<ViewProdutoRow> {
  @override
  String get tableName => 'view_produto';

  @override
  ViewProdutoRow createRow(Map<String, dynamic> data) => ViewProdutoRow(data);
}

class ViewProdutoRow extends SupabaseDataRow {
  ViewProdutoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewProdutoTable();

  int? get idProduto => getField<int>('id_produto');
  set idProduto(int? value) => setField<int>('id_produto', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  String? get codigo => getField<String>('codigo');
  set codigo(String? value) => setField<String>('codigo', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  String? get descricaoProduto => getField<String>('descricao_produto');
  set descricaoProduto(String? value) =>
      setField<String>('descricao_produto', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  String? get nomeCategoria => getField<String>('nome_categoria');
  set nomeCategoria(String? value) => setField<String>('nome_categoria', value);

  String? get descricaoCategoria => getField<String>('descricao_categoria');
  set descricaoCategoria(String? value) =>
      setField<String>('descricao_categoria', value);
}
