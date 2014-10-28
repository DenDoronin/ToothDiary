//
//  SlideMenuController.m
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import "SlideMenuController.h"
#import "SlideMenuView.h"
#import "SlideNavigationController.h"

@interface SlideMenuController ()

@property (nonatomic,strong) SlideMenuView* view;

@end

@implementation SlideMenuController

static CGFloat const rowHeight = 60;
static CGFloat const smallRowHeight = 47;
static CGFloat const logoRowHeight = 114;
static NSInteger rowsCount = 1;
static NSInteger smallRowCount = 0;
static CGFloat const tableViewTopInset = 20;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSParameterAssert(self.model);
    NSParameterAssert(self.view);
    
    [self setupTableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTableView
{
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars=NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self.view.tableView setDelegate:self];
    [self.view.tableView setDataSource:self];
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.model numberOfSection];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.model numberOfRowInSection:section];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[UIView alloc]initWithFrame:CGRectZero];
    headerView.backgroundColor=[UIColor clearColor];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return rowHeight;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        CGFloat tableviewHeight = self.view.tableView.bounds.size.height;
        CGFloat sectionHeight = tableviewHeight - rowsCount * rowHeight  - smallRowCount * smallRowHeight-tableViewTopInset-logoRowHeight;
        return sectionHeight;
    } else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SlideMenuCell";
    
    SlideMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        
        cell = [SlideMenuCell new];
    }
    
    cell.lblTitle.text = [self.model titleForIndexPath:indexPath];
    cell.ivTitleImageView.image = [self.model imageForIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIViewController *vc;
    if ([indexPath section] == 0) {
        
        switch (indexPath.row) {
            case 0:
                // News
            {
                NSLog(@"first row pressed");
            }
                break;
                

            default:
                break;
        }
        
        if (vc && ![[[SlideNavigationController sharedInstance] topViewController] isMemberOfClass:[vc class]])
            [[SlideNavigationController sharedInstance] pushViewController:vc animated:YES];
        else
            [[SlideNavigationController sharedInstance] closeMenuWithCompletion:^{
                }];
        
    }

}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
