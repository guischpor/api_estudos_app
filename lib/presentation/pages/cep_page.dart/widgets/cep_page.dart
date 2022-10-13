import 'package:api_estudos_app/core/validator/cep.dart';
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
  late final controllerApp = Provider.of<ControllerApp>(context);

  final formKey = GlobalKey<FormState>();
  final _cepController = TextEditingController();

  bool loading = false;

  @override
  void initState() {
    super.initState();
    Provider.of<ControllerApp>(context, listen: false).clearCep();
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
                        Provider.of<ControllerApp>(
                          context,
                          listen: false,
                        ).clearCep();
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
                    try {
                      setState(() {
                        loading = true;
                      });

                      await controllerApp.getCEP(_cepController.text);

                      setState(() {
                        loading = false;
                      });
                    } catch (e) {
                      setState(() {
                        loading = false;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro ao buscar o endereço!'),
                        ),
                      );
                    }
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
              child: _cep(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cep() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controllerApp.cep.length,
      itemBuilder: (context, index) {
        final cep = controllerApp.cep[index];
        return Visibility(
          child: Column(
            children: [
              Text(
                cep.bairro,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                cep.cep,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                cep.complemento == ''
                    ? 'Complemento Não informado'
                    : cep.complemento,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                cep.ddd,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                cep.gia == '' ? 'Gia não informado' : cep.gia,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                cep.ibge,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                cep.localidade,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                cep.logradouro,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                cep.siafi,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                cep.uf,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      },
    );
  }
}
