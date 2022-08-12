part of 'widgets.dart';

class CacheImageCustom extends StatelessWidget {
  final String? url;
  final Widget Function(BuildContext, ImageProvider<Object>) imageBuilder;
  final double? sizeLoadingDefault;
  final bool isPerson, isProduct;
  // final Widget loading;
  const CacheImageCustom({
    Key? key,
    this.url,
    required this.imageBuilder,
    this.sizeLoadingDefault,
    this.isPerson = false,
    this.isProduct = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // loading(4.0),
        (url != null)
            ? CachedNetworkImage(
                imageUrl: url!,
                imageBuilder: imageBuilder,
                errorWidget: (context, url, error) => Icon(
                  isPerson ? Icons.person : Icons.image_not_supported,
                  size: 50,
                  color: mainColor,
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    loading(3, value: downloadProgress.progress, diameter: 30),
              )
            : isPerson
                ? const Icon(
                    Icons.person,
                    size: 50,
                    color: mainColor,
                  )
                : isProduct
                    ? Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(Icons.image_not_supported),
                      )
                    : const Icon(
                        Icons.image,
                        size: 50,
                        color: mainColor,
                      )
        // : Image.asset(
        //     'assets/icons/logo_grey.png',
        //     width: 100,
        //   ),
      ],
    );
  }
}
