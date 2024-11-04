import '../database.dart';

class ViewRankingTable extends SupabaseTable<ViewRankingRow> {
  @override
  String get tableName => 'view_ranking';

  @override
  ViewRankingRow createRow(Map<String, dynamic> data) => ViewRankingRow(data);
}

class ViewRankingRow extends SupabaseDataRow {
  ViewRankingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewRankingTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get idUsuario => getField<String>('id_usuario');
  set idUsuario(String? value) => setField<String>('id_usuario', value);

  String? get nomeUsuario => getField<String>('nome_usuario');
  set nomeUsuario(String? value) => setField<String>('nome_usuario', value);

  String? get fotoUsuario => getField<String>('foto_usuario');
  set fotoUsuario(String? value) => setField<String>('foto_usuario', value);

  int? get quantidadeVendas => getField<int>('quantidade_vendas');
  set quantidadeVendas(int? value) => setField<int>('quantidade_vendas', value);

  double? get faturamento => getField<double>('faturamento');
  set faturamento(double? value) => setField<double>('faturamento', value);

  String? get codigoProduto => getField<String>('codigo_produto');
  set codigoProduto(String? value) => setField<String>('codigo_produto', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  String? get referencia => getField<String>('referencia');
  set referencia(String? value) => setField<String>('referencia', value);

  String? get filtro => getField<String>('filtro');
  set filtro(String? value) => setField<String>('filtro', value);
}
