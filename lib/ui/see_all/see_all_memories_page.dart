import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rpl_b/common_widget/image_card_widget.dart';
import 'package:rpl_b/ui/upload_photo_page.dart';

import '../../common_widget/text_field_widget.dart';

class SeeAllMemoriesPage extends StatefulWidget {
  static const routeName = '/see_all_page';

  const SeeAllMemoriesPage({Key? key}) : super(key: key);

  @override
  State<SeeAllMemoriesPage> createState() => _SeeAllMemoriesPageState();
}

class _SeeAllMemoriesPageState extends State<SeeAllMemoriesPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            UploadPhotoPage.routeName,
            arguments: 'memories',
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            TextfieldWidget(
              hintText: 'Cari Gambar',
              controller: _searchController,
              prefixIcon: const Icon(Icons.search),
            ),
            SizedBox(
              child: MasonryGridView.count(
                itemCount: 5,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ImageCardWidget(index: index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
