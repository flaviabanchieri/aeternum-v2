import '../database.dart';

class RankingTable extends SupabaseTable<RankingRow> {
  @override
  String get tableName => 'ranking';

  @override
  RankingRow createRow(Map<String, dynamic> data) => RankingRow(data);
}

class RankingRow extends SupabaseDataRow {
  RankingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RankingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get usuario => getField<String>('usuario')!;
  set usuario(String value) => setField<String>('usuario', value);

  int? get quantidadeVendas => getField<int>('quantidade_vendas');
  set quantidadeVendas(int? value) => setField<int>('quantidade_vendas', value);

  double? get faturamento => getField<double>('faturamento');
  set faturamento(double? value) => setField<double>('faturamento', value);

  String? get produtoMaisVendido => getField<String>('produto_mais_vendido');
  set produtoMaisVendido(String? value) =>
      setField<String>('produto_mais_vendido', value);

  String? get referencia => getField<String>('referencia');
  set referencia(String? value) => setField<String>('referencia', value);
}
