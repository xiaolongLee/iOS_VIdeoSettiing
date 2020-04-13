//
//  CQVideoSettingViewController.m
//  VIdeoSettiing
//
//  Created by 李小龙 on 2020/4/13.
//  Copyright © 2020 李小龙. All rights reserved.
//

#import "CQVideoSettingViewController.h"
#import "CQVideoSetting.h"
@interface CQVideoSettingViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation CQVideoSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"视频设置";
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        NSArray *titleArr = @[@"码流类型",@"视频编码",@"分辨率",@"帧率",@"码率控制",@"画质"];
        NSArray *contentArr = @[@"复合流",@"H.265",@"1920*1080",@"20",@"可变码率",@"中等"];
        [titleArr enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
            [contentArr enumerateObjectsUsingBlock:^(NSString *content, NSUInteger idy, BOOL * _Nonnull stop) {
                if (idx == idy) {
                    CQVideoSetting *model = [CQVideoSetting new];
                    model.name = title;
                    model.content = content;
                    [_dataArray addObject:model];
                }
                
            }];
        }];
    }
    
    return _dataArray;
}

//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;
}
//返回区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

//设置cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   static NSString *str=@"indexpath";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
    //将cell设置为可点击(默认yes)
   // cell.userInteractionEnabled = YES;
    CQVideoSetting *model = self.dataArray[indexPath.row];
    
    cell.textLabel.text= model.name;
    cell.detailTextLabel.text = model.content;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
//点击cell执行该方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];//反选
    NSArray *array = [NSArray array];
    switch (indexPath.row){
        case 0:
            array = @[@"复合流",@"视频流"];
            break;
        case 1:
            array = @[@"H.264",@"H.265"];
            break;
        case 2:
            array = @[@"1920*1080",@"1280*720"];
            break;
        case 3:
            array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30"];
            break;
        case 4:
            array = @[@"固定码率",@"可变码率"];
            break;
        case 5:
            array = @[@"低等",@"中等",@"高等"];
            break;
        default:
            break;
    }
 
    [self createAlertSheetWithActionArray:array indexPath:indexPath];

}

- (void)createAlertSheetWithActionArray:(NSArray *)array indexPath:(NSIndexPath *)indexPath {
       CQVideoSetting *model = self.dataArray[indexPath.row];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:model.name message: @"请选择" preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
     [alertController addAction:cancelAction];
    for (int i =0 ; i <array.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:array[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            model.content = action.title;
            [self.mainTableView reloadData];
        }];
            [alertController addAction:action];
    }
    [self presentViewController:alertController animated:YES completion:nil];
    
}


@end
