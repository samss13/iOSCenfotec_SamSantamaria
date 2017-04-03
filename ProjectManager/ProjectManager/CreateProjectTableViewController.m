//
//  CreateProjectTableViewController.m
//  ProjectManager
//
//  Created by SYSCO on 3/27/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import "CreateProjectTableViewController.h"
#import "RealmManager.h"
#import "Proyecto.h"
#import "TeamWork.h"

@interface CreateProjectTableViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *rqTextField;
@property (weak, nonatomic) IBOutlet UITextField *descripcionTextField;
@property (weak, nonatomic) IBOutlet UITextField *encargadoTextField;
@property (weak, nonatomic) IBOutlet UITextField *horasEstimadasTextField;
@property (weak, nonatomic) IBOutlet UITextField *horasConsumidasTextField;
@property (weak, nonatomic) IBOutlet UITextField *horasTotalesTextField;
@property (weak, nonatomic) IBOutlet UITextField *estadoTextField;
@property (weak, nonatomic) IBOutlet UITextField *fechaInicialSelectionTextField;
@property (weak, nonatomic) IBOutlet UITextField *fechaFinalSelectionTextField;
@property (strong, nonatomic) UIDatePicker *datePickerFechaInicial;
@property (strong, nonatomic) UIDatePicker *datePickerFechaFinal;
@property (strong, nonatomic) NSMutableArray *pickerData;
@property (strong, nonatomic) UIPickerView *pickerViewEstado;
@property (strong, nonatomic) NSString *pickerViewEstadoSelected;

@property (strong, nonatomic) NSMutableArray *pickerDataTeamWork;
@property (strong,nonatomic) RLMResults *teamsWorkArray;
@property (weak, nonatomic) IBOutlet UITextView *teamWorkTextView;
@property (strong, nonatomic) UIPickerView *pickerViewTeamWork;
@property (strong, nonatomic) NSString *pickerViewTeamWorkSelected;
@property (strong, nonatomic) TeamWork *teamWorkSelected;
@end

@implementation CreateProjectTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataToModify];
    [self createDatePickerFechaInicial];
    [self createDatePickerFechaFinal];
    [self saveProjectButton];
    [self createPickerViewEstado];
    [self createPickerViewTeamWork];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)loadDataToModify{
    if (self.proyectoSelected != nil) {
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"dd/MMM/YYYY"];
        
        self.rqTextField.text = self.proyectoSelected.identificador;
        self.descripcionTextField.text = self.proyectoSelected.descripcionProject;
        self.encargadoTextField.text = self.proyectoSelected.coordinadorIce;
        self.fechaInicialSelectionTextField.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.proyectoSelected.fechaInicial]];
        self.fechaFinalSelectionTextField.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.proyectoSelected.fechaFinal]];
        [self.datePickerFechaInicial setDate:self.proyectoSelected.fechaInicial];
        [self.datePickerFechaFinal setDate:self.proyectoSelected.fechaFinal];
        self.horasEstimadasTextField.text = [NSString stringWithFormat:@"%@", self.proyectoSelected.horasEstimadas];
        self.horasConsumidasTextField.text = [NSString stringWithFormat:@"%@", self.proyectoSelected.horasConsumidas];
        self.horasTotalesTextField.text = [NSString stringWithFormat:@"%@", self.proyectoSelected.horasTotales];
        self.estadoTextField.text = self.proyectoSelected.estado;
        self.teamWorkTextView.text = self.proyectoSelected.teamWork.team;
    }
}

-(void)saveProjectButton{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveProjectAction)];
    self.navigationItem.rightBarButtonItem = addButton;
}

-(void)saveProjectAction{
    NSNumberFormatter *formatString = [[NSNumberFormatter alloc] init];
    if (self.proyectoSelected == nil) {
        [RealmManager createProjectWithIdentificador:self.rqTextField.text descripcion:self.descripcionTextField.text coordinadorIce:self.encargadoTextField.text fechaInicial:self.datePickerFechaInicial.date fechaFinal:self.datePickerFechaFinal.date horasEstimadas:[formatString numberFromString:self.horasEstimadasTextField.text] horasConsumidas:[formatString numberFromString:self.horasConsumidasTextField.text] horasTotales:[formatString numberFromString:self.horasTotalesTextField.text] estado:self.estadoTextField.text teamWork:self.teamWorkSelected];
        [self.navigationController popViewControllerAnimated:true];
    }else{
        [RealmManager modifyProjectWithIdentificador:self.rqTextField.text descripcion:self.descripcionTextField.text coordinadorIce:self.encargadoTextField.text fechaInicial:self.datePickerFechaInicial.date fechaFinal:self.datePickerFechaFinal.date horasEstimadas:[formatString numberFromString:self.horasEstimadasTextField.text] horasConsumidas:[formatString numberFromString:self.horasConsumidasTextField.text] horasTotales:[formatString numberFromString:self.horasTotalesTextField.text] estado:self.estadoTextField.text teamWork:self.teamWorkSelected project:self.proyectoSelected];
        
        [self.navigationController popViewControllerAnimated:true];
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (pickerView == self.pickerViewEstado) {
        return self.pickerData.count;
    }else{
     return self.pickerDataTeamWork.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView == self.pickerViewEstado) {
        return self.pickerData[row];
    }else{
        return self.pickerDataTeamWork[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == self.pickerViewEstado) {
        self.pickerViewEstadoSelected = [self.pickerData objectAtIndex:row];
    }else{
        self.pickerViewTeamWorkSelected = [self.pickerDataTeamWork objectAtIndex:row];
    }
}

-(void)createPickerViewEstado{
    self.pickerData = [NSMutableArray new];
    [self.pickerData addObjectsFromArray:@[@"Analisis", @"Ejecucion", @"Pruebas", @"PreQA", @"QA", @"Finalizado"]];
    self.pickerViewEstadoSelected = @"Analisis";
    self.pickerViewEstado=[[UIPickerView alloc]init];
    [self.pickerViewEstado setDataSource:self];
    [self.pickerViewEstado setDelegate:self];
    [self.estadoTextField setInputView:self.pickerViewEstado];
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    [toolBar setBackgroundColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(ShowSelectedEstado)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.estadoTextField setInputAccessoryView:toolBar];
}

-(void)ShowSelectedEstado{
    self.estadoTextField.text=self.pickerViewEstadoSelected;
    [self.estadoTextField resignFirstResponder];
}

-(void)createDatePickerFechaInicial{
    self.datePickerFechaInicial=[[UIDatePicker alloc]init];
    self.datePickerFechaInicial.datePickerMode=UIDatePickerModeDate;
    [self.fechaInicialSelectionTextField setInputView:self.datePickerFechaInicial];
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    [toolBar setBackgroundColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(ShowSelectedDateFechaInicial)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.fechaInicialSelectionTextField setInputAccessoryView:toolBar];
}

-(void)ShowSelectedDateFechaInicial{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MMM/YYYY"];
    self.fechaInicialSelectionTextField.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePickerFechaInicial.date]];
    [self.fechaInicialSelectionTextField resignFirstResponder];
}

-(void)createDatePickerFechaFinal{
    self.datePickerFechaFinal=[[UIDatePicker alloc]init];
    self.datePickerFechaFinal.datePickerMode=UIDatePickerModeDate;
    [self.fechaFinalSelectionTextField setInputView:self.datePickerFechaFinal];
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    [toolBar setBackgroundColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(ShowSelectedDateFechaFinal)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.fechaFinalSelectionTextField setInputAccessoryView:toolBar];
}

-(void)ShowSelectedDateFechaFinal{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MMM/YYYY"];
    self.fechaFinalSelectionTextField.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePickerFechaFinal.date]];
    [self.fechaFinalSelectionTextField resignFirstResponder];
}

-(void)createPickerViewTeamWork{
    self.pickerDataTeamWork = [NSMutableArray new];
    self.teamsWorkArray = [RealmManager getAllTeamsWork];
    for (int count = 0; count < self.teamsWorkArray.count; count++) {
        TeamWork *teamWork = self.teamsWorkArray[count];
        if (count == 0) {
            self.pickerViewTeamWorkSelected = teamWork.name;
        }
        [self.pickerDataTeamWork addObject:teamWork.name];
    }
    
    self.pickerViewTeamWork=[[UIPickerView alloc]init];
    [self.pickerViewTeamWork setDataSource:self];
    [self.pickerViewTeamWork setDelegate:self];
    [self.teamWorkTextView setInputView:self.pickerViewTeamWork];
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    [toolBar setBackgroundColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(ShowSelectedTeamWork)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.teamWorkTextView setInputAccessoryView:toolBar];
}

-(void)ShowSelectedTeamWork{
    for (int count = 0; count < self.teamsWorkArray.count; count++) {
        TeamWork *teamWork = self.teamsWorkArray[count];
        if ([teamWork.name isEqualToString:self.pickerViewTeamWorkSelected]) {
            self.teamWorkTextView.text = teamWork.team;
            self.teamWorkSelected = teamWork;
        }
    }
    [self.teamWorkTextView resignFirstResponder];
}


@end
