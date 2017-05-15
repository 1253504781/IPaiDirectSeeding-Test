//
//  DataModel.h
//  Diandian
//
//  Created by 王 理 on 15/1/11.
//  Copyright (c) 2015年 王 理. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBShop : NSObject

@property (retain, nonatomic) NSString* merchant_id;
@property (retain, nonatomic) NSString* name;
@property (retain, nonatomic) NSString* address;
@property (retain, nonatomic) NSString* brief;
@property (retain, nonatomic) NSString* disabled;
@property (retain, nonatomic) NSString* distance;
@property (retain, nonatomic) NSString* goodsnum;
@property (retain, nonatomic) NSString* logo;
@property (retain, nonatomic) NSString* tel;
@property (retain, nonatomic) NSString* addressDistance;


@end

@interface KBProduct : NSObject

@property (retain, nonatomic) NSString* goods_id;
@property (retain, nonatomic) NSString* name;
@property (retain, nonatomic) NSString* sn;
@property (retain, nonatomic) NSString* brand_id;
@property (retain, nonatomic) NSString* brand_name;
@property (retain, nonatomic) NSString* merchant_id;
@property (retain, nonatomic) NSString* cat_id;
@property (retain, nonatomic) NSString* cat_name;
@property (retain, nonatomic) NSString* weight;
@property (retain, nonatomic) NSString* image_default;
@property (retain, nonatomic) NSString* image_file;
@property (retain, nonatomic) NSString* brief;
@property (retain, nonatomic) NSString* intro;
@property (retain, nonatomic) NSString* price;
@property (retain, nonatomic) NSString* cost;
@property (retain, nonatomic) NSString* mktprice;
@property (retain, nonatomic) NSString* store;
@property (retain, nonatomic) NSString* unit;
@property (retain, nonatomic) NSString* max_price;
@property (retain, nonatomic) NSString* min_price;
@property (retain, nonatomic) NSString* review;
@property (retain, nonatomic) NSString* have_spec;
@property (retain, nonatomic) NSString* adjuncts;
@property (retain, nonatomic) NSString* create_time;
@property (retain, nonatomic) NSString* last_modify;
@property (retain, nonatomic) NSString* view_count;
@property (retain, nonatomic) NSString* buy_count;
@property (retain, nonatomic) NSString* disabled;//0启用
@property (retain, nonatomic) NSString* point;
@property (retain, nonatomic) NSString* page_title;
@property (retain, nonatomic) NSString* meta_keywords;
@property (retain, nonatomic) NSString* meta_description;
@property (retain, nonatomic) NSString* p1__pn;
@property (retain, nonatomic) NSString* sord;
@property (retain, nonatomic) NSString* have_field;
@property (retain, nonatomic) NSString* isgroup;
@property (retain, nonatomic) NSString* islimit;
@property (retain, nonatomic) NSString* grade;
@property (retain, nonatomic) NSString* limitbuyid;
@property (retain, nonatomic) NSString* limitprice;
@property (retain, nonatomic) NSString* params;
@property (retain, nonatomic) NSString* paramList;
@property (retain, nonatomic) NSString* specs;


@property (assign, nonatomic) int cartcount;//购物车中的数量
@property (assign, nonatomic) BOOL selected;//购物车中选中状态
@property (retain, nonatomic) KBShop* shop;

@end

@interface KBAddress : NSObject

@property (retain, nonatomic) NSString* name;
@property (retain, nonatomic) NSString* phone;
@property (retain, nonatomic) NSString* province;
@property (retain, nonatomic) NSString* city;
@property (retain, nonatomic) NSString* address;

@end



