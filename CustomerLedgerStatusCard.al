page 50112 "Customer Ledger Status Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Customer Ledger Status Table";
    Caption = 'Customer Ledger Status';

    //CardPageId = "Customer Ledger Status Card";

    layout
    {
        area(content)
        {

            group(General)
            {
                group("Property Details")
                {

                    field("Property ID"; Rec."RA ID")
                    {
                        ApplicationArea = All;
                    }
                    field(Project; Rec."Client Number")
                    {
                        ApplicationArea = All;
                    }
                    field(Phase; Rec."Client Name")
                    {
                        ApplicationArea = All;

                    }
                    field(Block; Rec."Property ID")
                    {
                        ApplicationArea = All;
                    }
                    field(Lot; Rec."Project Name")
                    {
                        ApplicationArea = All;
                    }
                    field("Area (sqm)"; Rec."Property Name")
                    {
                        ApplicationArea = All;
                    }
                    field("Lot Status"; Rec."Total Selling Price")
                    {
                        ApplicationArea = All;
                    }
                    field("Lot Type"; Rec."Status")
                    {
                        ApplicationArea = All;
                    }

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SaveAndClose)
            {
                Caption = 'Save and Close';
                Promoted = true;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CurrPage.SaveRecord();
                    CurrPage.Close();
                end;
            }
        }
    }
}



