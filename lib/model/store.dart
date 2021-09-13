import 'package:flutter/material.dart';

class Store {
  String name;
  Color brandColor;
  String queryPrefix;
  String queryPostfix;
  String productNameElementClassName;
  String productPriceElementClassName;
  String productImageUrlContainerElementClassName;
  String productSiteUrlContainerElementClassName;

  Store({
    required this.name,
    required this.brandColor,
    required this.queryPrefix,
    required this.queryPostfix,
    required this.productNameElementClassName,
    required this.productPriceElementClassName,
    required this.productImageUrlContainerElementClassName,
    required this.productSiteUrlContainerElementClassName,
  });
}

List<Store> stores = [
  // Store(
  //   name: 'Shopee',
  //   brandColor: Colors.orange,
  //   queryPrefix: 'https://shopee.co.id/search?keyword=',
  //   queryPostfix: '',
  //   productNameElementClassName: 'yQmmFK _1POlWt _36CEnF',
  //   productPriceElementClassName: '_24JoLh',
  //   productImageUrlContainerElementClassName: 'customized-overlay-image',
  //   productSiteUrlContainerElementClassName:
  //       'col-xs-2-4 shopee-search-item-result__item',
  // ),
  Store(
    name: 'Tokopedia',
    brandColor: Colors.green,
    queryPrefix: 'https://www.tokopedia.com/search?q=',
    queryPostfix: '&source=universe&st=product&navsource=home',
    productNameElementClassName: 'css-1f4mp12',
    productPriceElementClassName: 'css-rhd610',
    productImageUrlContainerElementClassName: 'css-1d1aa4',
    productSiteUrlContainerElementClassName: 'css-1ehqh5q',
  ),
  // Store(
  //   name: 'Bukalapak',
  //   brandColor: Colors.red,
  //   queryPrefix:
  //       'https://www.bukalapak.com/products?from=omnisearch&from_keyword_history=false&search%5Bkeywords%5D=',
  //   queryPostfix: '&search_source=omnisearch_keyword&source=navbar',
  //   productNameElementClassName: 'bl-link',
  //   productPriceElementClassName:
  //       'bl-text bl-text--subheading-2 bl-text--semi-bold bl-text--ellipsis__1',
  //   productImageUrlContainerElementClassName: 'slide',
  //   productSiteUrlContainerElementClassName:
  //       'bl-text bl-text--body-small bl-text--ellipsis__2',
  // ),
];
