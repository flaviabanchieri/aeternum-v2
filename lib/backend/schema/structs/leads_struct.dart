// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadsStruct extends BaseStruct {
  LeadsStruct({
    String? createdAt,
    String? idLead,
    String? nomeLead,
    String? telefone,
    String? produtoCodigo,
    String? nomeProduto,
    String? dataAgendamento,
    String? dataFiltro,
    String? status,
    String? origem,
    String? usuario,
    String? nomeUsuario,
    String? email,
    String? link,
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
        _nomeUsuario = nomeUsuario,
        _email = email,
        _link = link;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "id_lead" field.
  String? _idLead;
  String get idLead => _idLead ?? '';
  set idLead(String? val) => _idLead = val;

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
  String? _dataAgendamento;
  String get dataAgendamento => _dataAgendamento ?? '';
  set dataAgendamento(String? val) => _dataAgendamento = val;

  bool hasDataAgendamento() => _dataAgendamento != null;

  // "data_filtro" field.
  String? _dataFiltro;
  String get dataFiltro => _dataFiltro ?? '';
  set dataFiltro(String? val) => _dataFiltro = val;

  bool hasDataFiltro() => _dataFiltro != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "origem" field.
  String? _origem;
  String get origem => _origem ?? '';
  set origem(String? val) => _origem = val;

  bool hasOrigem() => _origem != null;

  // "usuario" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  set usuario(String? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "nome_usuario" field.
  String? _nomeUsuario;
  String get nomeUsuario => _nomeUsuario ?? '';
  set nomeUsuario(String? val) => _nomeUsuario = val;

  bool hasNomeUsuario() => _nomeUsuario != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  static LeadsStruct fromMap(Map<String, dynamic> data) => LeadsStruct(
        createdAt: data['created_at'] as String?,
        idLead: data['id_lead'] as String?,
        nomeLead: data['nome_lead'] as String?,
        telefone: data['telefone'] as String?,
        produtoCodigo: data['produto_codigo'] as String?,
        nomeProduto: data['nome_produto'] as String?,
        dataAgendamento: data['data_agendamento'] as String?,
        dataFiltro: data['data_filtro'] as String?,
        status: data['status'] as String?,
        origem: data['origem'] as String?,
        usuario: data['usuario'] as String?,
        nomeUsuario: data['nome_usuario'] as String?,
        email: data['email'] as String?,
        link: data['link'] as String?,
      );

  static LeadsStruct? maybeFromMap(dynamic data) =>
      data is Map ? LeadsStruct.fromMap(data.cast<String, dynamic>()) : null;

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
        'nome_usuario': _nomeUsuario,
        'email': _email,
        'link': _link,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'id_lead': serializeParam(
          _idLead,
          ParamType.String,
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
          ParamType.String,
        ),
        'data_filtro': serializeParam(
          _dataFiltro,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'origem': serializeParam(
          _origem,
          ParamType.String,
        ),
        'usuario': serializeParam(
          _usuario,
          ParamType.String,
        ),
        'nome_usuario': serializeParam(
          _nomeUsuario,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeadsStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeadsStruct(
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        idLead: deserializeParam(
          data['id_lead'],
          ParamType.String,
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
          ParamType.String,
          false,
        ),
        dataFiltro: deserializeParam(
          data['data_filtro'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        origem: deserializeParam(
          data['origem'],
          ParamType.String,
          false,
        ),
        usuario: deserializeParam(
          data['usuario'],
          ParamType.String,
          false,
        ),
        nomeUsuario: deserializeParam(
          data['nome_usuario'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LeadsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeadsStruct &&
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
        nomeUsuario == other.nomeUsuario &&
        email == other.email &&
        link == other.link;
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
        nomeUsuario,
        email,
        link
      ]);
}

LeadsStruct createLeadsStruct({
  String? createdAt,
  String? idLead,
  String? nomeLead,
  String? telefone,
  String? produtoCodigo,
  String? nomeProduto,
  String? dataAgendamento,
  String? dataFiltro,
  String? status,
  String? origem,
  String? usuario,
  String? nomeUsuario,
  String? email,
  String? link,
}) =>
    LeadsStruct(
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
      nomeUsuario: nomeUsuario,
      email: email,
      link: link,
    );
