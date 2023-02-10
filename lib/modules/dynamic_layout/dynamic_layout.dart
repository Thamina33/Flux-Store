import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';
import '../../common/tools.dart';
import '../../models/index.dart';
import '../../prescription_feature/prescription.dart';
import '../../routes/flux_navigate.dart';
import '../../services/index.dart';
import 'banner/banner_animate_items.dart';
import 'banner/banner_group_items.dart';
import 'banner/banner_horizontal.dart';
import 'banner/banner_slider.dart';
import 'blog/blog_grid.dart';
import 'brand/brand_layout.dart';
import 'button/button.dart';
import 'category/category_icon.dart';
import 'category/category_image.dart';
import 'category/category_menu_with_products.dart';
import 'category/category_text.dart';
import 'config/brand_config.dart';
import 'config/index.dart';
import 'divider/divider.dart';
import 'header/header_search.dart';
import 'header/header_text.dart';
import 'helper/helper.dart';
import 'instagram_story/instagram_story.dart';
import 'logo/logo.dart';
import 'product/product_list_simple.dart';
import 'product/product_recent_placeholder.dart';
import 'slider_testimonial/index.dart';
import 'spacer/spacer.dart';
import 'story/index.dart';
import 'testimonial/index.dart';
import 'tiktok/index.dart';
import 'video/index.dart';

class DynamicLayout extends StatelessWidget {
  final config;
  final bool cleanCache;

  const DynamicLayout({this.config, this.cleanCache = false});

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context, listen: true);

    switch (config['layout']) {
      case Layout.logo:
        final themeConfig = appModel.themeConfig;
        return Logo(
          config: LogoConfig.fromJson(config),
          logo: themeConfig.logo,
          totalCart:
              Provider.of<CartModel>(context, listen: true).totalCartQuantity,
          notificationCount:
              Provider.of<NotificationModel>(context).unreadCount,
          onSearch: () {
            FluxNavigate.pushNamed(RouteList.homeSearch);
          },
          onCheckout: () {
            FluxNavigate.pushNamed(RouteList.cart);
          },
          onTapNotifications: () {
            FluxNavigate.pushNamed(RouteList.notify);
          },
          onTapDrawerMenu: () => NavigateTools.onTapOpenDrawerMenu(context),
        );

      case Layout.headerText:
        return HeaderText(
          config: HeaderConfig.fromJson(config),
        );

      case Layout.headerSearch:
        return HeaderSearch(
          config: HeaderConfig.fromJson(config),
          onSearch: () {
            FluxNavigate.pushNamed(
              RouteList.homeSearch,
              forceRootNavigator: true,
            );
          },
        );
      case Layout.featuredVendors:
        return Services().widget.renderFeatureVendor(config);
      case Layout.category:
        if (config['type'] == 'image') {
          return CategoryImages(
            config: CategoryConfig.fromJson(config),
          );
        }
        return Selector<CategoryModel, Map<String?, Category>>(
          selector: (_, model) => model.categoryList,
          builder: (context, categoryList, child) {
            var configValue = CategoryConfig.fromJson(config);
            var listCategoryName =
                categoryList.map((key, value) => MapEntry(key, value.name));
            void onShowProductList(CategoryItemConfig item) {
              FluxNavigate.pushNamed(
                RouteList.backdrop,
                arguments: BackDropArguments(
                  config: item.toJson(),
                  data: item.data,
                ),
              );
            }

            if (config['type'] == 'menuWithProducts') {
              return CategoryMenuWithProducts(
                config: configValue,
                listCategoryName: listCategoryName,
                onShowProductList: onShowProductList,
              );
            }

            if (config['type'] == 'text') {
              return CategoryTexts(
                config: configValue,
                listCategoryName: listCategoryName,
                onShowProductList: onShowProductList,
              );
            }



            return CategoryIcons(
              config: configValue,
              listCategoryName: listCategoryName,
              onShowProductList: onShowProductList,
            );
          },
        );
      case Layout.bannerAnimated:
        if (kIsWeb) return const SizedBox();
        return BannerAnimated(config: BannerConfig.fromJson(config));

      case Layout.bannerImage:
        if (config['isSlider'] == true) {
          return Column(
            children: [
              BannerSlider(
                config: BannerConfig.fromJson(config),
                onTap: (itemConfig) {
                  NavigateTools.onTapNavigateOptions(
                    context: context,
                    config: itemConfig,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>  Prescription()));
                      },
                      child: SizedBox(
                        width: 110,
                        height: 140,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)


                          ),
                          color: Color(0xFFD4F1F4),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Upload\nPrescription", style:
                                  TextStyle(
                                    fontSize: 12,
                                    color: Colors.black
                                  ),),
                                Spacer(),
                                Row(

                                  children: [
                                      SvgPicture.asset('assets/icons/prescriptions/for_icon.svg',
                                      width: 16,
                                      color: Color(0xFF0000FF),
                                      height: 16,),
                                    Spacer(),
                                    Image(image: AssetImage("assets/icons/prescriptions/pp_lg.png"),
                                    width: 34,
                                    height: 34,),
                                  ],
                                )
                              ],
                            ),
                          ),

                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 140,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)


                        ),
                        color: Color(0xFFD4F1F4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Call For Order\n01234567890", style:
                              TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                              ),),
                              Spacer(),
                              Row(

                                children: [
                                  SvgPicture.asset('assets/icons/prescriptions/for_icon.svg',
                                    width: 16,
                                    color: Color(0xFF32CD30),
                                    height: 16,),
                                  Spacer(),
                                  Image(image: AssetImage("assets/icons/prescriptions/hp.png"),
                                    width: 34,
                                    height: 34,),
                                ],
                              )
                            ],
                          ),
                        ),

                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 140,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)


                        ),
                        color: Color(0xFFD4F1F4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Healthcare\nProduct", style:
                              TextStyle(
                                  fontSize: 12,
                                  color: Colors.black
                              ),),
                              Spacer(),
                              Row(

                                children: [
                                  SvgPicture.asset('assets/icons/prescriptions/for_icon.svg',
                                    width: 16,
                                    color: Color(0xFF8F00FF),
                                    height: 16,),
                                  Spacer(),
                                  Image(image: AssetImage("assets/icons/prescriptions/health.png"),
                                    width: 34,
                                    height: 34,),
                                ],
                              )
                            ],
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }

        if (config['isHorizontal'] == true) {
          return BannerHorizontal(
            config: BannerConfig.fromJson(config),
            onTap: (itemConfig) {
              NavigateTools.onTapNavigateOptions(
                context: context,
                config: itemConfig,
              );
            },
          );
        }

        return BannerGroupItems(
          config: BannerConfig.fromJson(config),
          onTap: (itemConfig) {
            NavigateTools.onTapNavigateOptions(
              context: context,
              config: itemConfig,
            );
          },
        );

      case Layout.blog:
        return Column(
          children: [
            BlogGrid(config: BlogConfig.fromJson(config)),
          ],
        );

      case Layout.video:
        return VideoLayout(config: config);

      case Layout.story:
        return StoryWidget(
          config: config,
        );

      /// Product Layout styles
      case Layout.recentView:
        if (ServerConfig().isBuilder) {
          return ProductRecentPlaceholder();
        }
        return Services().widget.renderHorizontalListItem(config);
      case Layout.fourColumn:
      case Layout.threeColumn:
      case Layout.twoColumn:
      case Layout.staggered:
      case Layout.saleOff:
      case Layout.card:
      case Layout.listTile:
        return Services()
            .widget
            .renderHorizontalListItem(config, cleanCache: cleanCache);

      /// New product layout style.
      case Layout.largeCardHorizontalListItems:
      case Layout.largeCard:
        return Services().widget.renderLargeCardHorizontalListItems(config);
      case Layout.simpleVerticalListItems:
      case Layout.simpleList:
        return SimpleVerticalProductList(
          config: ProductConfig.fromJson(config),
        );

      case Layout.brand:
        return BrandLayout(
          config: BrandConfig.fromJson(config),
        );

      /// FluxNews
      case Layout.sliderList:
        return Services().widget.renderSliderList(config);
      case Layout.sliderItem:
        return Services().widget.renderSliderItem(config);

      case Layout.geoSearch:
        return Services().widget.renderGeoSearch(config);
      case Layout.divider:
        return DividerLayout(config: DividerConfig.fromJson(config));
      case Layout.spacer:
        return SpacerLayout(config: SpacerConfig.fromJson(config));
      case Layout.button:
        return ButtonLayout(config: ButtonConfig.fromJson(config));
      case Layout.testimonial:
        return TestimonialLayout(config: TestimonialConfig.fromJson(config));
      case Layout.sliderTestimonial:
        return SliderTestimonial(
          config: SliderTestimonialConfig.fromJson(config),
        );
      case Layout.instagramStory:
        return InstagramStory(
          config: InstagramStoryConfig.fromJson(config),
        );
      case Layout.tiktokVideos:
        if (ServerConfig().isBuilder || !isMobile) {
          return TikTokVideosPlaceholder();
        }
        return TikTokVideos(
          config: TikTokVideosConfig.fromJson(config),
        );
      default:
        return const SizedBox();
    }

  }

}
