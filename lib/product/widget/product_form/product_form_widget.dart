import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/product/models/product_list/product_list.dart';

class ProductFormWidget extends StatefulWidget {
  const ProductFormWidget({Key? key}) : super(key: key);

  @override
  State<ProductFormWidget> createState() => _ProductFormWidgetState();
}

class _ProductFormWidgetState extends State<ProductFormWidget> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.dispose();
    _imageUrlFocus.removeListener(updateImage);
  }

  void updateImage() {
    setState(() {});
  }

  bool isValidImagUrl(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg');
    return isValidUrl && endsWithFile;
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    _formKey.currentState?.save();

    Provider.of<ProductList>(
      context,
      listen: false,
    ).addProductFromData(_formData);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Produto'),
        actions: [
          IconButton(onPressed: _submitForm, icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocus);
                  },
                  onSaved: (name) => _formData['name'] = name ?? '',
                  validator: (_name) {
                    final name = _name ?? '';
                    if (name.trim().isEmpty) {
                      return 'Nome é obrigatorio';
                    }
                    if (name.trim().length < 3) {
                      return 'Nome precisa ter no mínimo de 3 letras.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Preço'),
                  textInputAction: TextInputAction.next,
                  focusNode: _priceFocus,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocus);
                  },
                  onSaved: (price) =>
                      _formData['price'] = double.parse(price ?? '0'),
                  validator: (_price) {
                    final priceString = _price ?? '';
                    final price = double.tryParse(priceString) ?? -1;

                    if (price <= 0) {
                      return 'Informe um preço valido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  textInputAction: TextInputAction.next,
                  focusNode: _descriptionFocus,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onSaved: (description) =>
                      _formData['description'] = description ?? '',
                  validator: (_description) {
                    final name = _description ?? '';
                    if (name.trim().isEmpty) {
                      return 'Descrição é obrigatorio';
                    }
                    if (name.trim().length < 10) {
                      return 'Descrição precisa ter no mínimo de 10 letras.';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Url da imagem'),
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocus,
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _submitForm(),
                        onSaved: (imageUrl) =>
                            _formData['imageUrl'] = imageUrl ?? '',
                        validator: (_imageUrl) {
                          final imageUrl = _imageUrl ?? '';

                          if (!isValidImagUrl(imageUrl)) {
                            return 'Informe uma Url valida!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: _imageUrlController.text.isEmpty
                          ? const Text('Informe uma url')
                          : FittedBox(
                              child: Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
