import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/utils/api_services.dart';

class AssetScreen extends StatefulWidget {
  const AssetScreen({super.key});
  static const routName = 'asset';

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  final CallApi api = CallApi(); // Tạo một đối tượng CallApi

  List<dynamic> assets = []; // Danh sách tài sản

  @override
  void initState() {
    super.initState();
    // Gọi hàm để tải danh sách tài sản khi màn hình được khởi tạo
    fetchAssetData();
  }

  // Hàm để tải danh sách tài sản từ API
  void fetchAssetData() async {
    final response = await api.getArticleData('asset');
    if (response != 'failed') {
      setState(() {
        assets = response;
      });
    } else {
      // Xử lý lỗi ở đây nếu cần thiết
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBarCom(
        appBarText: 'My assets',
        leading: true,
        leftIcon: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorPalette.bgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: assets.length,
        itemBuilder: (context, index) {
          final asset = assets[index];
          return ListTile(
            title: Text(asset['assetName']),
            subtitle: Text(asset['assetDescription']),
            // Thêm các thông tin khác của tài sản ở đây.
          );
        },
      ),
    );
  }
}
