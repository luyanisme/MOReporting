//
//	 ______    ______    ______    
//	/\  __ \  /\  ___\  /\  ___\   
//	\ \  __<  \ \  __\_ \ \  __\_ 
//	 \ \_____\ \ \_____\ \ \_____\ 
//	  \/_____/  \/_____/  \/_____/ 
//
//	Powered by BeeFramework
//
//
//  DataGridBoard_iPhone.m
//  MOReport
//
//  Created by 卢棪 on 2/27/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "DataGridBoard_iPhone.h"
#import "DataGridCell.h"

#pragma mark -

@interface DataFormCell : UITableViewCell

@property(nonatomic, strong) UIImageView *sepLine;
@property(nonatomic, strong) UILabel     *month;
@property(nonatomic, strong) DataGridCell *dataGridCell;

@end

@implementation DataFormCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        self.sepLine = [[UIImageView alloc] init];
        self.sepLine.backgroundColor = [UIColor colorWithRed:0.49f green:0.50f blue:0.50f alpha:1.00f];
        [self.contentView addSubview:self.sepLine];
        
        self.month = [[UILabel alloc] init];
        self.month.backgroundColor = [UIColor clearColor];
        self.month.textColor = [UIColor colorWithRed:0.49f green:0.50f blue:0.50f alpha:1.00f];
        [self.contentView addSubview:self.month];
        
        self.dataGridCell = [DataGridCell cell];
        self.dataGridCell.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.dataGridCell];
        
    }
    return self;
}

- (void)prepareForReuse{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    // [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)layoutSubviews{
    self.sepLine.frame = CGRectMake(0, 0, self.contentView.frame.size.width, 1);
    self.month.frame = CGRectMake(10, 10, 40, 20);
}

@end

@interface DataGridBoard_iPhone()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_dataList;
    NSArray *_testArray;
}
@end

@implementation DataGridBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    _dataList = [[UITableView alloc] init];
    _dataList.backgroundColor = [UIColor clearColor];
    _dataList.separatorStyle = NO;
    _dataList.delegate = self;
    _dataList.dataSource = self;
    _dataList.showsVerticalScrollIndicator = NO;
    
    [self loadData];
    
}

- (void)unload
{
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
    self.view.backgroundColor = [UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f];
    
    [self.view addSubview:_dataList];
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
    _dataList.frame = CGRectMake(100, 100, SCREEN_WIDTH-200, SCREEN_HEIGHT-200);
}

ON_WILL_APPEAR( signal )
{
}

ON_DID_APPEAR( signal )
{
}

ON_WILL_DISAPPEAR( signal )
{
}

ON_DID_DISAPPEAR( signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, LEFT_TOUCHED, signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, RIGHT_TOUCHED, signal )
{
}

- (void)loadData{
    DATAFORM *dataForm1 = [[DATAFORM alloc] init];
    dataForm1.month = @"1月";
    dataForm1.dataList = @[@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04"];
    
    DATAFORM *dataForm2 = [[DATAFORM alloc] init];
    dataForm2.month = @"2月";
    dataForm2.dataList = @[@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04"];
    
    DATAFORM *dataForm3 = [[DATAFORM alloc] init];
    dataForm3.month = @"3月";
    dataForm3.dataList = @[@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04"];
    
    DATAFORM *dataForm4 = [[DATAFORM alloc] init];
    dataForm4.month = @"4月";
    dataForm4.dataList = @[@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04"];
    
    DATAFORM *dataForm5 = [[DATAFORM alloc] init];
    dataForm5.month = @"5月";
    dataForm5.dataList = @[@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04",@"2016-02-04"];
    
    _testArray = @[dataForm1,dataForm2,dataForm3,dataForm4,dataForm5];
}

#pragma mark - delegate of tableview
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _testArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DATAFORM *dataForm = _testArray[indexPath.row];
    return 50+(dataForm.dataList.count%6 == 0 ? dataForm.dataList.count*100/6 : ((dataForm.dataList.count/6)+1)*100);
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* id = @"DataCell";
    //cell只会初始化一次
    DataFormCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if (!cell) {
        cell = [[DataFormCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    
    DATAFORM *dataForm = _testArray[indexPath.row];
    cell.month.text = dataForm.month;
    if (dataForm.dataList.count%6 == 0) {
        cell.dataGridCell.frame = CGRectMake(0, 40, SCREEN_WIDTH-200, dataForm.dataList.count*100/6);
    } else {
        cell.dataGridCell.frame = CGRectMake(0, 40, SCREEN_WIDTH-200, ((dataForm.dataList.count/6)+1)*100);
    }
    
    cell.dataGridCell.dataList = dataForm.dataList;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
