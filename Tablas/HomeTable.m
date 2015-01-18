//
//  ViewController.m
//  Tablas
//
//  Created by Alejandra B on 18/01/15.
//  Copyright (c) 2015 Alejandra B. All rights reserved.
//

#import "HomeTable.h"
#import "CellOaxaca.h"
NSMutableArray *maNames;
NSMutableArray *maImgs;
NSMutableArray *maRole;
NSMutableArray *maAge;

UIAlertView     *alert;
NSInteger seleccionado;

@interface HomeTable ()

@end

@implementation HomeTable

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self InitControler];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)InitControler{
    maNames = [NSMutableArray arrayWithObjects: @"Walter", @"Alejandra",@"Raziel",@"Juan",@"Pedro",nil];
    
    maAge = [NSMutableArray arrayWithObjects:@"35", @"25",@"25",@"25",@"25", nil];
    
     maImgs =  [NSMutableArray arrayWithObjects: @"chavo.png", @"chilindrina.png", @"jaimito.png", @"nono.png", @"clotilde.png", nil];
    
    maRole = [NSMutableArray arrayWithObjects:@"Maestro Guapo", @"Alumna",@"Alumno",@"Alumno",@"Alumno", nil];
    
}

/**********************************************************************************************
 Table Functions
 **********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maNames.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 154;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"CellOaxaca");
    static NSString *CellIdentifier = @"CellOaxaca";
    
    CellOaxaca *cell = (CellOaxaca *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[CellOaxaca alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.lblName.text       = maNames[indexPath.row];
    cell.lblRole.text       = maRole[indexPath.row];
    cell.lblAge.text        = maAge[indexPath.row];
    cell.image.image      = [UIImage imageNamed:maImgs[indexPath.row]];
    cell.image.clipsToBounds = YES;
    return cell;
}

//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    seleccionado = indexPath.row;
    self.lblSelectedName.text = maNames[indexPath.row];
    NSString *strTemp;
    
    strTemp = [self.lblSelectedName.text stringByAppendingString: @" fué seleccionado"];
    
    NSLog(strTemp);
    
    
    if (indexPath.row == 2)
    {
        alert = [[UIAlertView alloc] initWithTitle:@"Alerta Oaxaca"
                                           message:strTemp
                                          delegate:self
                                 cancelButtonTitle:@"Cancelar"
                                 otherButtonTitles:@"Guardar", @"Publicar", nil];
        [alert show];
    }
}

- (IBAction)btnCompartir:(id)sender {
    NSString                    *strMsg;
    NSArray                     *activityItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actVC;
    
    imgShare = [UIImage imageNamed:@"chavo.png"];
    strMsg = [self.lblSelectedName.text stringByAppendingString: @" fué seleccionado"];
    
    activityItems = @[imgShare, strMsg];
    
    //Init activity view controller
    actVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    actVC.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actVC animated:YES completion:nil];
}
@end
