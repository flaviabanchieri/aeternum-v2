// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ViewLeadStruct extends BaseStruct {
  ViewLeadStruct({
    DateTime? createdAt,
    int? idLead,
    String? nomeLead,
    String? telefone,
    String? produtoCodigo,
    String? nomeProduto,
    DateTime? dataAgendamento,
    String? dataFiltro,
    int? status,
    String? origem,
    int? usuario,
    String? email,
  })  : _createdAt = createdAt,
        _idLead = idLead,
        _nomeLead = nomeLead,
        _telefone = telefone,
        _produtoCodigo = produtoCodigo,
        _nomeProduto = nomeProduto,
        _dataAgendamento = dataAgendamento,
        _dataFiltro = dataFiltro,
        _status = status,
        _origem = origem,
        _usuario = usuario,
        _email = email;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "id_lead" field.
  int? _idLead;
  int get idLead => _idLead ?? 0;
  set idLead(int? val) => _idLead = val;

  void incrementIdLead(int amount) => idLead = idLead + amount;

  bool hasIdLead() => _idLead != null;

  // "nome_lead" field.
  String? _nomeLead;
  String get nomeLead => _nomeLead ?? '';
  set nomeLead(String? val) => _nomeLead = val;

  bool hasNomeLead() => _nomeLead != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  set telefone(String? val) => _telefone = val;

  bool hasTelefone() => _telefone != null;

  // "produto_codigo" field.
  String? _produtoCodigo;
  String get produtoCodigo => _produtoCodigo ?? '';
  set produtoCodigo(String? val) => _produtoCodigo = val;

  bool hasProdutoCodigo() => _produtoCodigo != null;

  // "nome_produto" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  set nomeProduto(String? val) => _nomeProduto = val;

  bool hasNomeProduto() => _nomeProduto != null;

  // "data_agendamento" field.
  DateTime? _dataAgendamento;
  DateTime? get dataAgendamento => _dataAgendamento;
  set dataAgendamento(DateTime? val) => _dataAgendamento = val;

  bool hasDataAgendamento() => _dataAgendamento != null;

  // "data_filtro" field.
  String? _dataFiltro;
  String get dataFiltro => _dataFiltro ?? '';
  set dataFiltro(String? val) => _dataFiltro = val;

  bool hasDataFiltro() => _dataFiltro != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  // "origem" field.
  String? _origem;
  String get origem => _origem ?? '';
  set origem(String? val) => _origem = val;

  bool hasOrigem() => _origem != null;

  // "usuario" field.
  int? _usuario;
  int get usuario => _usuario ?? 0;
  set usuario(int? val) => _usuario = val;

  void incrementUsuario(int amount) => usuario = usuario + amount;

  bool hasUsuario() => _usuario != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  static ViewLeadStruct fromMap(Map<String, dynamic> data) => ViewLeadStruct(
        createdAt: data['created_at'] as DateTime?,
        idLead: castToType<int>(data['id_lead']),
        nomeLead: data['nome_lead'] as String?,
        telefone: data['telefone'] as String?,
        produtoCodigo: data['produto_codigo'] as String?,
        nomeProduto: data['nome_produto'] as String?,
        dataAgendamento: data['data_agendamento'] as DateTime?,
        dataFiltro: data['data_filtro'] as String?,
        status: castToType<int>(data['status']),
        origem: data['origem'] as String?,
        usuario: castToType<int>(data['usuario']),
        email: data['email'] as String?,
      );

  static ViewLeadStruct? maybeFromMap(dynamic data) =>
      data is Map ? ViewLeadStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'id_lead': _idLead,
        'nome_lead': _nomeLead,
        'telefone': _telefone,
        'produto_codigo': _produtoCodigo,
        'nome_produto': _nomeProduto,
        'data_agendamento': _dataAgendamento,
        'data_filtro': _dataFiltro,
        'status': _status,
        'origem': _origem,
        'usuario': _usuario,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'id_lead': serializeParam(
          _idLead,
          ParamType.int,
        ),
        'nome_lead': serializeParam(
          _nomeLead,
          ParamType.String,
        ),
        'telefone': serializeParam(
          _telefone,
          ParamType.String,
        ),
        'produto_codigo': serializeParam(
          _produtoCodigo,
          ParamType.String,
        ),
        'nome_produto': serializeParam(
          _nomeProduto,
          ParamType.String,
        ),
        'data_agendamento': serializeParam(
          _dataAgendamento,
          ParamType.DateTime,
        ),
        'data_filtro': serializeParam(
          _dataFiltro,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'origem': serializeParam(
          _origem,
          ParamType.String,
        ),
        'usuario': serializeParam(
          _usuario,
          ParamType.int,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static ViewLeadStruct fromSerializableMap(Map<String, dynamic> data) =>
      ViewLeadStruct(
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        idLead: deserializeParam(
          data['id_lead'],
          ParamType.int,
          false,
        ),
        nomeLead: deserializeParam(
          data['nome_lead'],
          ParamType.String,
          false,
        ),
        telefone: deserializeParam(
          data['telefone'],
          ParamType.String,
          false,
        ),
        produtoCodigo: deserializeParam(
          data['produto_codigo'],
          ParamType.String,
          false,
        ),
        nomeProduto: deserializeParam(
          data['nome_produto'],
          ParamType.String,
          false,
        ),
        dataAgendamento: deserializeParam(
          data['data_agendamento'],
          ParamType.DateTime,
          false,
        ),
        dataFiltro: deserializeParam(
          data['data_filtro'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        origem: deserializeParam(
          data['origem'],
          ParamType.String,
          false,
        ),
        usuario: deserializeParam(
          data['usuario'],
          ParamType.int,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ViewLeadStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ViewLeadStruct &&
        createdAt == other.createdAt &&
        idLead == other.idLead &&
        nomeLead == other.nomeLead &&
        telefone == other.telefone &&
        produtoCodigo == other.produtoCodigo &&
        nomeProduto == other.nomeProduto &&
        dataAgendamento == other.dataAgendamento &&
        dataFiltro == other.dataFiltro &&
        status == other.status &&
        origem == other.origem &&
        usuario == other.usuario &&
        email == other.email;
  }

  @override
  int get hashCode => const ListEquality().hash([
        createdAt,
        idLead,
        nomeLead,
        telefone,
        produtoCodigo,
        nomeProduto,
        dataAgendamento,
        dataFiltro,
        status,
        origem,
        usuario,
        email
      ]);
}

ViewLeadStruct createViewLeadStruct({
  DateTime? createdAt,
  int? idLead,
  String? nomeLead,
  String? telefone,
  String? produtoCodigo,
  String? nomeProduto,
  DateTime? dataAgendamento,
  String? dataFiltro,
  int? status,
  String? origem,
  int? usuario,
  String? email,
}) =>
    ViewLeadStruct(
      createdAt: createdAt,
      idLead: idLead,
      nomeLead: nomeLead,
      telefone: telefone,
      produtoCodigo: produtoCodigo,
      nomeProduto: nomeProduto,
      dataAgendamento: dataAgendamento,
      dataFiltro: dataFiltro,
      status: status,
      origem: origem,
      usuario: usuario,
      email: email,
    );
