import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_app/models/category_model.dart';
import 'package:motor_app/ui/admin/products_manager/show_products/categories_manager_screen.dart';
import 'package:motor_app/manager/category_manager.dart';
import 'package:motor_app/ui/widgets/custom_appbar.dart';
import 'package:motor_app/ui/widgets/header_container.dart';
import 'package:motor_app/ui/widgets/text_form.dart';
import 'package:provider/provider.dart';

class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({super.key, required this.idCategory});

  final int idCategory;

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  late final CategoryModel _categoryModel;
  bool _showImagePathForm = false;

  final TextEditingController imageController = TextEditingController();
  final TextEditingController categoryName = TextEditingController();

  @override
  void initState() {
    super.initState();
    _categoryModel =
        context.read<CategoryManager>().findById(widget.idCategory)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(
              child: Column(
                children: [
                  CustomAppbar(
                    showBackArrow: true,
                    title: Text(
                      'Chỉnh sửa thông tin hãng xe',
                      style: Theme.of(context).textTheme.headlineMedium,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Text(
                'Tên hãng xe',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: TextForm(
                  controller: categoryName,
                  text: _categoryModel.categoryName,
                  textInputType: TextInputType.text,
                  obscure: false,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Text(
                'Hình ảnh của hãng xe',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 7,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  _categoryModel.categoryImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showImagePathForm = !_showImagePathForm;
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 40),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Cập nhật ảnh hãng xe'),
              ),
            ),
            if (_showImagePathForm)
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15, left: 15, top: 15),
                    child: Container(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: TextFormField(
                        controller: imageController,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        style: Theme.of(context).textTheme.titleSmall,
                        autofocus: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CategoryManager>().updateCategoryImage(
                          widget.idCategory, imageController.text);
                      Fluttertoast.showToast(
                        msg: "Cập nhật hình ảnh thành công",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 40),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Chọn hình ảnh'),
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            context
                .read<CategoryManager>()
                .updateCategoryName(widget.idCategory, categoryName.text);
            Fluttertoast.showToast(
              msg: "Cập nhật thành công",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoriesManagerScreen(),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Cập nhật'),
          ),
        ),
      ),
    );
  }
}
