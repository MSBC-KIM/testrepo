page 50115 "Customer Ledger Status"
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

            grid(ItemDetailGrid)
            {
                group("Customer Details")
                {

                    field("Client #"; Rec."Client Number")
                    {
                        ApplicationArea = All;
                    }
                    field("Customer Name"; Rec."Client Name")
                    {
                        ApplicationArea = All;
                    }

                    group("Payment List")
                    {
                        part(""; "Payment List")
                        {
                            SubPageLink = "Reservation ID" = field("RA ID");
                            ApplicationArea = All;
                        }

                    }
                }
                group("Reservation Agreement Details")
                {
                    part(ReservationAgreementDetails; "Reservation Agreement Part")
                    {
                        SubPageLink = "Property ID" = field("Property ID");
                        ApplicationArea = All;
                    }
                }
            }

            group("RA Payment Schedule")
            {
                part(RAPayments; "RA Payment Part")
                {
                    SubPageLink = "Reservation ID" = field("RA ID");
                    ApplicationArea = All;
                }
            }
        }
    }


}
