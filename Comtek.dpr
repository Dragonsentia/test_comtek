program Comtek;



uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FrmMain},
  uSelectWorkstation in 'uSelectWorkstation.pas' {FrmSelectWorkstation},
  uOperatorWorkstation in 'uOperatorWorkstation.pas' {FrmOperator},
  uFindPerson in 'uFindPerson.pas' {FrmFind},
  uStatistWorkstation in 'uStatistWorkstation.pas' {FrmStatist},
  uAddPerson in 'uAddPerson.pas' {FrmAddPerson},
  uAddMedReport in 'uAddMedReport.pas' {FrmAddMedReport},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmSelectWorkstation, FrmSelectWorkstation);
  Application.Run;
end.
