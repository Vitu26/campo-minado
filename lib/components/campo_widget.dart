import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;
  const CampoWidget(
      {super.key,
      required this.campo,
      required this.onAbrir,
      required this.onAlternarMarcacao});

  Widget _getImage() {
    int qtdeMinas = campo.qtdeMinasNaVizinhaca;

    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (campo.aberto) {
      return Image.asset('assets/images/aberto_$qtdeMinas.jpeg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),
    );
  }
}
