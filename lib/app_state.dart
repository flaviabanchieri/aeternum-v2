import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _IsLightMode = prefs.getBool('ff_IsLightMode') ?? _IsLightMode;
    });
    _safeInit(() {
      _permissao = prefs.getInt('ff_permissao') ?? _permissao;
    });
    _safeInit(() {
      _UsuarioNome = prefs.getString('ff_UsuarioNome') ?? _UsuarioNome;
    });
    _safeInit(() {
      _FotoUsuario = prefs.getString('ff_FotoUsuario') ?? _FotoUsuario;
    });
    _safeInit(() {
      _valorMeta = prefs.getDouble('ff_valorMeta') ?? _valorMeta;
    });
    _safeInit(() {
      _valorMetaDashboard =
          prefs.getDouble('ff_valorMetaDashboard') ?? _valorMetaDashboard;
    });
    _safeInit(() {
      _totalLeadGestor = prefs.getInt('ff_totalLeadGestor') ?? _totalLeadGestor;
    });
    _safeInit(() {
      _totalConcluidoGestor =
          prefs.getInt('ff_totalConcluidoGestor') ?? _totalConcluidoGestor;
    });
    _safeInit(() {
      _totalRealizadasGestor =
          prefs.getInt('ff_totalRealizadasGestor') ?? _totalRealizadasGestor;
    });
    _safeInit(() {
      _totalFaturamentoGestor = prefs.getDouble('ff_totalFaturamentoGestor') ??
          _totalFaturamentoGestor;
    });
    _safeInit(() {
      _totalLead = prefs.getInt('ff_totalLead') ?? _totalLead;
    });
    _safeInit(() {
      _totalLigacoesAtendente =
          prefs.getInt('ff_totalLigacoesAtendente') ?? _totalLigacoesAtendente;
    });
    _safeInit(() {
      _totalRealizados = prefs.getInt('ff_totalRealizados') ?? _totalRealizados;
    });
    _safeInit(() {
      _totalFaturamentoAtendente =
          prefs.getInt('ff_totalFaturamentoAtendente') ??
              _totalFaturamentoAtendente;
    });
    _safeInit(() {
      _totalVendasAtendente =
          prefs.getInt('ff_totalVendasAtendente') ?? _totalVendasAtendente;
    });
    _safeInit(() {
      _faturamentoRanking =
          prefs.getDouble('ff_faturamentoRanking') ?? _faturamentoRanking;
    });
    _safeInit(() {
      _ligacaoAtiva = prefs.getBool('ff_ligacaoAtiva') ?? _ligacaoAtiva;
    });
    _safeInit(() {
      _emLigacao = prefs.getInt('ff_emLigacao') ?? _emLigacao;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _IsLightMode = false;
  bool get IsLightMode => _IsLightMode;
  set IsLightMode(bool value) {
    _IsLightMode = value;
    prefs.setBool('ff_IsLightMode', value);
  }

  Pagina? _pagina = Pagina.dashboard;
  Pagina? get pagina => _pagina;
  set pagina(Pagina? value) {
    _pagina = value;
  }

  bool _contantoUsuarioPonto = false;
  bool get contantoUsuarioPonto => _contantoUsuarioPonto;
  set contantoUsuarioPonto(bool value) {
    _contantoUsuarioPonto = value;
  }

  int _permissao = 0;
  int get permissao => _permissao;
  set permissao(int value) {
    _permissao = value;
    prefs.setInt('ff_permissao', value);
  }

  String _UsuarioNome = '';
  String get UsuarioNome => _UsuarioNome;
  set UsuarioNome(String value) {
    _UsuarioNome = value;
    prefs.setString('ff_UsuarioNome', value);
  }

  String _FotoUsuario = '';
  String get FotoUsuario => _FotoUsuario;
  set FotoUsuario(String value) {
    _FotoUsuario = value;
    prefs.setString('ff_FotoUsuario', value);
  }

  double _valorMeta = 0.0;
  double get valorMeta => _valorMeta;
  set valorMeta(double value) {
    _valorMeta = value;
    prefs.setDouble('ff_valorMeta', value);
  }

  double _valorMetaDashboard = 0.0;
  double get valorMetaDashboard => _valorMetaDashboard;
  set valorMetaDashboard(double value) {
    _valorMetaDashboard = value;
    prefs.setDouble('ff_valorMetaDashboard', value);
  }

  int _totalLeadGestor = 0;
  int get totalLeadGestor => _totalLeadGestor;
  set totalLeadGestor(int value) {
    _totalLeadGestor = value;
    prefs.setInt('ff_totalLeadGestor', value);
  }

  int _totalConcluidoGestor = 0;
  int get totalConcluidoGestor => _totalConcluidoGestor;
  set totalConcluidoGestor(int value) {
    _totalConcluidoGestor = value;
    prefs.setInt('ff_totalConcluidoGestor', value);
  }

  int _totalRealizadasGestor = 0;
  int get totalRealizadasGestor => _totalRealizadasGestor;
  set totalRealizadasGestor(int value) {
    _totalRealizadasGestor = value;
    prefs.setInt('ff_totalRealizadasGestor', value);
  }

  double _totalFaturamentoGestor = 0.0;
  double get totalFaturamentoGestor => _totalFaturamentoGestor;
  set totalFaturamentoGestor(double value) {
    _totalFaturamentoGestor = value;
    prefs.setDouble('ff_totalFaturamentoGestor', value);
  }

  int _totalLead = 0;
  int get totalLead => _totalLead;
  set totalLead(int value) {
    _totalLead = value;
    prefs.setInt('ff_totalLead', value);
  }

  int _totalLigacoesAtendente = 0;
  int get totalLigacoesAtendente => _totalLigacoesAtendente;
  set totalLigacoesAtendente(int value) {
    _totalLigacoesAtendente = value;
    prefs.setInt('ff_totalLigacoesAtendente', value);
  }

  int _totalRealizados = 0;
  int get totalRealizados => _totalRealizados;
  set totalRealizados(int value) {
    _totalRealizados = value;
    prefs.setInt('ff_totalRealizados', value);
  }

  int _totalFaturamentoAtendente = 0;
  int get totalFaturamentoAtendente => _totalFaturamentoAtendente;
  set totalFaturamentoAtendente(int value) {
    _totalFaturamentoAtendente = value;
    prefs.setInt('ff_totalFaturamentoAtendente', value);
  }

  int _categoriaCadastrada = 0;
  int get categoriaCadastrada => _categoriaCadastrada;
  set categoriaCadastrada(int value) {
    _categoriaCadastrada = value;
  }

  int _totalVendasAtendente = 0;
  int get totalVendasAtendente => _totalVendasAtendente;
  set totalVendasAtendente(int value) {
    _totalVendasAtendente = value;
    prefs.setInt('ff_totalVendasAtendente', value);
  }

  double _faturamentoRanking = 0.0;
  double get faturamentoRanking => _faturamentoRanking;
  set faturamentoRanking(double value) {
    _faturamentoRanking = value;
    prefs.setDouble('ff_faturamentoRanking', value);
  }

  bool _ligacaoAtiva = false;
  bool get ligacaoAtiva => _ligacaoAtiva;
  set ligacaoAtiva(bool value) {
    _ligacaoAtiva = value;
    prefs.setBool('ff_ligacaoAtiva', value);
  }

  int _emLigacao = 0;
  int get emLigacao => _emLigacao;
  set emLigacao(int value) {
    _emLigacao = value;
    prefs.setInt('ff_emLigacao', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
