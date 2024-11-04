import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? imgUsuarioTexto(String nome) {
  // return first letter of each word from a sentence
  String sentence = nome;
  List<String> words = sentence.split(" ");
  String result = "";
  for (String word in words) {
    result += word[0];
  }
  return result;
}

List<DateTime>? returnDates(DateTime? date) {
  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE, MMMM d, y');
    return formatter.format(date);
  }

  List<String> getAllDates(DateTime startDate, DateTime endDate) {
    List<String> dates = [];
    DateTime currentDate = startDate;
    while (currentDate.isBefore(endDate) ||
        currentDate.isAtSameMomentAs(endDate)) {
      String formattedDate = formatDate(currentDate);
      dates.add(formattedDate);
      currentDate = currentDate.add(Duration(days: 1));
    }
    return dates;
  }
}

DateTime? dataAtual() {
  // return current datetime
  return DateTime.now();
}

String? mascaraValorReal(double? valor) {
  // pt-br value mask from a value
  // This function takes a double value and returns a string with the Brazilian Real currency format.
  double? value = valor;
  if (value == null) {
    return null;
  } else if (value == 0) {
    return 'R\$ 0,00'; // Retorna a formatação para o valor zero
  } else {
    // Controla o número de casas decimais com "minimumFractionDigits" e "maximumFractionDigits"
    final formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2, // Garante que tenha exatamente duas casas decimais
    );
    return formatter.format(value);
  }
}

int? mesAtual() {
  // a function that returns the current month as an integer
  final now = DateTime.now();
  return now.month;
}

int? anoAtual() {
  // a function that returns the current year and month
  final now = DateTime.now();
  return now.year;
}

String? mesAnoAtual() {
  // a function that returns the current year and month
  final now = DateTime.now();
  final formatter = DateFormat('MM/yyyy');
  return formatter.format(now);
}

DateTime? montarData(
  int? dia,
  int? mes,
  int? ano,
  bool? dataFinal,
) {
  // Verifica se todos os parâmetros são válidos (não nulos)
  if (dia == null || mes == null || ano == null) {
    return null;
  }

  try {
    // Cria uma instância de DateTime usando ano, mês e dia (nessa ordem)
    if (dataFinal == true) {
      // Se dataFinal for true, define a hora como 23:59:59
      return DateTime(ano, mes, dia, 23, 59, 59);
    } else {
      // Se dataFinal for false ou null, define a hora como 00:00:00
      return DateTime(ano, mes, dia, 0, 0, 0);
    }
  } catch (e) {
    // Retorna null se houver algum erro ao criar a data
    return null;
  }
}

int? retornaUltimoDiaMes(
  int? mes,
  int? ano,
) {
  // If the conversion fails, return null
  if (mes == null || ano == null) {
    return null;
  }

  // Get the last day of the month
  final lastDay = DateTime(mes, ano + 1, 0);

  // Return the day as an integer
  return lastDay.day;
}

double? primeiroNumero(double? number) {
  if (number == null) {
    return 0.0;
  }

  // Obtém o valor absoluto do número e converte para string
  String numString = number.abs().toString();

  // Retorna o número com 0. concatenado à esquerda
  return double.parse('0.' + numString);
}

int? posicaoHanking(
  List<RankingRow>? ranking,
  String? usuario,
) {
  if (ranking == null || ranking.isEmpty || usuario == null) {
    return null;
  }

  // Sort the ranking list by faturamento in descending order
  ranking.sort((a, b) {
    final faturamentoA =
        a.faturamento ?? 0; // Default to 0 if faturamento is null
    final faturamentoB =
        b.faturamento ?? 0; // Default to 0 if faturamento is null
    return faturamentoB.compareTo(faturamentoA); // Descending order
  });

  // Find the position of the specified usuario
  for (int i = 0; i < ranking.length; i++) {
    if (ranking[i].usuario == usuario) {
      return i + 1; // Adding 1 to return a 1-based position
    }
  }

  // Return null if the usuario is not found
  return null;
}

int? quantosMinutosProximoAgendamento(DateTime? dataAgendamento) {
  if (dataAgendamento == null ||
      dataAgendamento
          .isAtSameMomentAs(DateTime.fromMillisecondsSinceEpoch(0))) {
    return 11;
  }

  int minuteDifference = 0;
  final date1 = DateTime.now();
  final date2 = dataAgendamento;
  final difference = date2.difference(date1);
  minuteDifference = difference.inMinutes;

  return minuteDifference;
}

String? dataHoraAmPm(DateTime? data) {
  // Check if data is null
  if (data == null) {
    return null;
  }

  // Convert the provided date and time to UTC-4
  DateTime utcMinusFour = data.toUtc().subtract(Duration(hours: 4));

  // Format the date to 'dd/MM/yyyy hh:mm' and return it as a string
  String formattedDateTime =
      DateFormat('dd/MM/yyyy HH:mm').format(utcMinusFour);

  return formattedDateTime;
}

DateTime? converterStringParaData(String? data) {
  // Convert string to DateTime
  return data != null ? DateTime.parse(data) : null;
}

String? intToString(int? valor) {
  // convert int to string
  return valor?.toString();
}

List<String>? datasParaFiltro() {
  List<String> months = [];
  DateTime startDate = DateTime.now().subtract(const Duration(days: 180));
  DateTime currentDate = DateTime.now();
  while (startDate.isBefore(currentDate)) {
    String monthYear = DateFormat('MM/yyyy').format(startDate);
    months.add(monthYear);
    startDate = DateTime(startDate.year, startDate.month + 1);
  }
  return months;
}

double? progress(
  double? goal,
  double? actual,
) {
  // given the goal and the value made, i want it to reurnt the progress made in a range from 0 to 1

  if (goal == null || actual == null || goal == 0) {
    return null;
  }

  double progress = actual / goal;
  return progress > 1
      ? 1
      : progress < 0
          ? 0
          : progress;
}

DateTime? adicionarHoras(int horas) {
  // return datetime in 1 hour from now
  return DateTime.now().add(Duration(hours: horas));
}

String? setTelefone(String? telefone) {
  // given telefone adjust it to be a brazilian number
  if (telefone == null || telefone.isEmpty) {
    return telefone;
  }

  // Remove all non-digit characters from the telefone
  String cleanedTelefone = telefone.replaceAll(RegExp(r'\D'), '');

  // Check if the telefone already has the country code (55 for Brazil)
  if (cleanedTelefone.length == 11 && cleanedTelefone.startsWith('55')) {
    // No need to modify as the country code is already present
    return cleanedTelefone;
  } else if (cleanedTelefone.length == 10) {
    // If the number has 10 digits, add the country code
    cleanedTelefone = '55$cleanedTelefone';
  }

  return cleanedTelefone;
}

List<dynamic>? newCustomFunction(List<dynamic>? apiCall) {
  //   // given a api call return the json body
  if (apiCall != null) {
    // process the api call and return the json body
    return apiCall;
  } else {
    return null;
  }
}
