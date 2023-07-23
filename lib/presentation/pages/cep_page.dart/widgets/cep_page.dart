import 'package:api_estudos_app/core/validator/cep.dart';
import 'package:api_estudos_app/data/model/cep.dart';
import 'package:api_estudos_app/presentation/pages/controller/controller_app.dart';
import 'package:api_estudos_app/presentation/widgets/custom_app_bar.dart';
import 'package:api_estudos_app/presentation/widgets/custom_icon_button.dart';
import 'package:api_estudos_app/presentation/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CepPage extends StatefulWidget {
  const CepPage({
    Key? key,
    required this.colorAppBar,
  }) : super(key: key);

  final Color colorAppBar;

  @override
  State<CepPage> createState() => CepPageState();
}

class CepPageState extends State<CepPage> {
  late final controllerApp = Provider.of<ControllerApp>(context, listen: false);

  final formKey = GlobalKey<FormState>();
  final _cepController = TextEditingController();

  bool loading = false;

  Cep cep = Cep();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cepController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Via CEP',
        backgroundColor: widget.colorAppBar,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextForm(
              hintText: 'Search CEP',
              keyboardType: TextInputType.number,
              controller: _cepController,
              onChanged: (value) {
                setState(() {});
              },
              preffix: const Icon(
                Icons.search,
              ),
              suffix: _cepController.text.isNotEmpty
                  ? CustomIconButton(
                      iconData: Icons.close,
                      iconSize: 21,
                      onTap: () {
                        _cepController.clear();
                        cep = Cep();
                        setState(() {});
                      },
                    )
                  : null,
              validator: (value) {
                return CEP(value ?? '').validator();
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.colorAppBar,
                ),
                onPressed: () async {
                  final valid = formKey.currentState?.validate() ?? false;

                  if (valid) {
                    setState(() {
                      loading = true;
                    });

                    await controllerApp
                        .getCEP(_cepController.text)
                        .then((value) {
                      setState(() {
                        loading = false;
                        cep = value;
                      });
                    }).onError((error, stackTrace) {
                      setState(() {
                        loading = false;
                      });
                      cep = Cep();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro ao buscar o endereço!'),
                        ),
                      );
                    });
                  }
                },
                child: Text(
                  'Search CEP',
                  style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: loading == true,
              child: CircularProgressIndicator(
                color: widget.colorAppBar,
              ),
            ),
            Visibility(
              visible: loading == false,
              child: _cardCep(cep),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardCep(Cep cep) {
    return Card(
      child: Column(
        children: [
          if (cep.bairro != null ||
              cep.cep != null ||
              cep.complemento != null ||
              cep.ddd != null ||
              cep.gia != null ||
              cep.ibge != null ||
              cep.logradouro != null ||
              cep.siafi != null ||
              cep.localidade != null ||
              cep.uf != null) ...[
            Text(
              cep.bairro == null ? 'Bairro não informado' : cep.bairro!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              cep.cep == null ? 'CEP não informado' : cep.cep!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              cep.complemento == ''
                  ? 'Complemento Não informado'
                  : cep.complemento!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              cep.ddd == '' ? 'DDD não informado' : cep.ddd!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              cep.gia == '' ? 'Gia não informado' : cep.gia!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              cep.ibge == '' ? 'IBGE não informado' : cep.ibge!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              cep.localidade == ''
                  ? 'Localidade não informado'
                  : cep.localidade!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              cep.logradouro == ''
                  ? 'Logradouro não informado'
                  : cep.logradouro!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              cep.siafi == '' ? 'Siafi não informado' : cep.siafi!,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              cep.uf == '' ? 'UF não informado' : cep.uf!,
              style: const TextStyle(color: Colors.black),
            ),
          ]
        ],
      ),
    );
  }
}
