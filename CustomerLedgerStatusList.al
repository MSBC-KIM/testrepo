page 50113 "Customer Ledger Status List"
{
    PageType = List;
    SourceTable = "Customer Ledger Status Table";
    ApplicationArea = All;
    Caption = 'Customer Ledger Status List';
    UsageCategory = Lists;


    //CardPageId = "Customer List + Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("RA ID"; Rec."RA ID")
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    var
                        ReservationAgreementPage: Page "Reservation Agreement Card";
                        ReservationAgreement: Record "Reservation Agreement";
                    begin
                        // Retrieve the record from the Reservation Agreement table based on RA ID
                        if ReservationAgreement.GET(Rec."RA ID") then begin
                            ReservationAgreementPage.SETRECORD(ReservationAgreement);
                            ReservationAgreementPage.RUNMODAL;
                        end else
                            Error('Reservation Agreement with RA ID %1 not found.', Rec."RA ID");
                    end;

                }
                field("Client Number"; Rec."Client Number")
                {
                    ApplicationArea = All;
                }
                field("Client Name"; Rec."Client Name")
                {
                    ApplicationArea = All;
                }
                field("Property ID"; Rec."Property ID")
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    var
                        CustomerLedgerStatusCard: Page "Customer Ledger Status";
                        CustomerLedgerStatusTable: Record "Customer Ledger Status Table";
                    begin
                        // Retrieve the record from the Reservation Agreement table based on RA ID
                        if CustomerLedgerStatusTable.GET(Rec."Property ID") then begin
                            CustomerLedgerStatusCard.SETRECORD(CustomerLedgerStatusTable);
                            CustomerLedgerStatusCard.RUNMODAL;
                        end else
                            Error('Reservation Agreement with RA ID %1 not found.', Rec."Property ID");
                    end;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                }
                field("Property Name"; Rec."Property Name")
                {
                    ApplicationArea = All;
                }
                field("Total Selling Price"; Rec."Total Selling Price")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action(NewRecord)
            {
                Caption = 'New';
                Promoted = true;
                PromotedCategory = New;
                ApplicationArea = All;
                trigger OnAction()
                var
                    CLStatus: Record "Customer Ledger Status Table";
                begin
                    CLStatus.Init();
                    PAGE.Run(PAGE::"Customer Ledger Status Card", Rec);
                end;
            }
            action(EditRecord)
            {
                Caption = 'Edit';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Customer Ledger Status Card", Rec);
                end;
            }
            action(OverrideDelete)
            {
                Caption = 'Delete';
                ApplicationArea = All;
                Visible = false;
            }

        }
    }

}