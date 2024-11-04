import '../database.dart';

class VendasViewTable extends SupabaseTable<VendasViewRow> {
  @override
  String get tableName => 'vendas_view';

  @override
  VendasViewRow createRow(Map<String, dynamic> data) => VendasViewRow(data);
}

class VendasViewRow extends SupabaseDataRow {
  VendasViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VendasViewTable();

  String? get nomeLead => getField<String>('nome_lead');
  set nomeLead(String? value) => setField<String>('nome_lead', value);

  String? get usuario => getField<String>('usuario');
  set usuario(String? value) => setField<String>('usuario', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  double? get valorProduto => getField<double>('valor_produto');
  set valorProduto(double? value) => setField<double>('valor_produto', value);

  DateTime? get lastLigacaoCreatedAt =>
      getField<DateTime>('last_ligacao_created_at');
  set lastLigacaoCreatedAt(DateTime? value) =>
      setField<DateTime>('last_ligacao_created_at', value);
}
