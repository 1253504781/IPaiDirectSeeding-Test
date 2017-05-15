//
//  MyGuanzZhuViewController.m
//  IPaiDirectSeeding
//
//  Created by Yuwei on 17/5/12.
//  Copyright © 2017年 HZY. All rights reserved.
//

#import "MyGuanzZhuViewController.h"
#import "GuanZhuListCell.h"

@interface MyGuanzZhuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyGuanzZhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self setUp];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //数组初始化
    self.dataSource = [[NSMutableArray alloc]init];
    for (int num = 1; num <= 20; num ++) {
        [self.dataSource addObject:[NSString stringWithFormat:@"我是第%d个被关注人",num]];
    }
    NSLog(@"%@",self.dataSource);
    
    //自定义导航栏的返回按钮
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1];
    
    UIView *leftCustom = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 60, 40)];
    UIImageView *imageVc = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 21, 20)];
    imageVc.image = [UIImage imageNamed:@"icon_return_g"];
    [leftCustom addSubview:imageVc];
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 34)];
    [backBtn addTarget:self action:@selector(left:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.backgroundColor = [UIColor clearColor];
    [leftCustom addSubview:backBtn];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftCustom];
    
    self.title = [NSString stringWithFormat:@"我的关注(%lu)",(unsigned long)self.dataSource.count];
    //导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1];
    //导航栏上的字体颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
}

#pragma --- 返回
- (void)left:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


//搭建UI
- (void)setUp{
    CGRect rectOfNavigationbar = self.navigationController.navigationBar.frame;
    NSLog(@"navigationbar height: %f", rectOfNavigationbar.size.height);   // 高度
//    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height ) style:UITableViewStylePlain];
//    [self.view addSubview:self.tableView];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    //注册tableVie
    [self.tableView registerNib:[UINib nibWithNibName:@"GuanZhuListCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
}


#pragma  ----- UITableViewDelegate
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return   UITableViewCellEditingStyleDelete;
}

/*改变删除按钮的title*/
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"取消关注";
}

/*删除用到的函数*/
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle ==UITableViewCellEditingStyleDelete)
    {
        [self.dataSource removeObjectAtIndex:indexPath.row];  //删除数组里的数据
        [tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];  //删除对应数据的cell
     
    }
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     self.title = [NSString stringWithFormat:@"我的关注(%lu)",(unsigned long)self.dataSource.count];
    return self.dataSource.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GuanZhuListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.zhuboLabel.text = [NSString stringWithFormat:@"%@",self.dataSource[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 90;
}



@end
