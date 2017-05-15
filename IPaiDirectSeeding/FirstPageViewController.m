//
//  FirstPageViewController.m
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/8.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "FirstPageViewController.h"

#import "FGGAutoScrollView.h"

#import "PaiMaiViewCell.h"


@interface FirstPageViewController ()<UITableViewDelegate,UITableViewDataSource>

//自动循环滚动视图
@property(nonatomic,strong)FGGAutoScrollView *bannerView;


@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //从导航栏以下开始显示
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //顶部隔开的 View
    UIView *topBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    topBackView.backgroundColor = [UIColor blueColor];
    self.tableView.tableHeaderView = topBackView;
    
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.frame = CGRectMake(0, _bannerView.bounds.size.height + 120 + 20, self.view.bounds.size.width, self.view.bounds.size.height  - 59-44 );
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.tableView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:self.tableView];
    
    
    //注册 cell
    [self.tableView registerNib:[UINib nibWithNibName:@"PaiMaiViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];

    
    [self setup];
    [self createUI];
    
    __weak typeof(self) wkSelf=self;
    //调下载完数据后再调用setter方法刷新视图
    [self downloadDataWithCompletionHandle:^(NSArray *imgsArray){
        wkSelf.bannerView.imageURLArray=imgsArray;
    }];

}



//初始化
-(void)setup
{
    self.view.backgroundColor=[UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1];
    self.automaticallyAdjustsScrollViewInsets=NO;
}
//创建自动循环滚动视图
-(void)createUI
{
    //初始化自动循环滚动视图，并且定义图片的点击事件
    _bannerView=[[FGGAutoScrollView alloc]initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 120) placeHolderImage:nil imageURLs:nil imageDidSelectedBlock:^(NSInteger selectedIndex) {
        switch (selectedIndex) {
            case 0:
                NSLog(@"你选择了第%ld张图片",selectedIndex);
                break;
            case 1:
                NSLog(@"你选择了第%ld张图片",selectedIndex);
                break;
            case 2:
                NSLog(@"你选择了第%ld张图片",selectedIndex);
                break;
            default:
                break;
        }
    }];
    //还可以设置自动滚动时的回调事件（可不设置）
    _bannerView.imageDidScrolledBlock=^(NSInteger index){
        NSLog(@"滚动到了第%ld张",index);
    };
    _bannerView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_bannerView];
}
//下载数据
-(void)downloadDataWithCompletionHandle:(void(^)(NSArray *imgsArray))completion
{
    //....下载数据...假设下载完得到的数据是array
    NSArray *array = @[@"http://i.okaybuy.cn/images/multipic/new/201506/fe/fe6b322427edad3dd6c7916116a9a15b.jpg",
                       @"http://i.okaybuy.cn/images/multipic/new/201505/88/888d8cf6a769c401af2ced0140fa90f3.jpg",
                       @"http://i.okaybuy.cn/images/multipic/new/201506/53/532a6028830f9d7e39b5bce9e5e60e52.jpg"];
    
    //完成后调用完成的回调代码块
    if(completion)
        completion(array);
}





#pragma mark - tableView 代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85.0f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor lightGrayColor];
    view.alpha = 0.3;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PaiMaiViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //cell.textLabel.text = @"你好啊";
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了第%ld组第%ld行",(long)indexPath.section,(long)indexPath.row);
    
}



@end
