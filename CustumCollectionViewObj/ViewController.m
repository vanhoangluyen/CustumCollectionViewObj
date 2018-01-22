//
//  ViewController.m
//  CustumCollectionViewObj
//
//  Created by LuyenBG on 1/22/18.
//  Copyright © 2018 LuyenBG. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong) UIImage* myImage;
@property int cellPadding;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.cellPadding = 10;
    self.myImage = [UIImage imageNamed:@"funtap"];
    [self.collectionView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark <UICollectionViewDataSource>
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    // Configure the cell
    cell.myimageView.image = self.myImage;
    return cell;
}
#pragma mark <UICollectionViewDelegate>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:   (UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    int colecctionWidth = collectionView.frame.size.width;
    int numberCellRow = 3;
    int padding = (numberCellRow - 1) * self.cellPadding + 2 * self.cellPadding;
    int availabelWidth = colecctionWidth - (CGFloat)padding;
    int cellWidth = availabelWidth / numberCellRow;
    return CGSizeMake(cellWidth, cellWidth);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return (CGFloat)self.cellPadding;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return (CGFloat)self.cellPadding;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake((CGFloat)self.cellPadding, (CGFloat)self.cellPadding, (CGFloat)self.cellPadding, (CGFloat)self.cellPadding);
}

@end
