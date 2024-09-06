table 50103 "Customer Ledger Status Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "RA ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'RA ID';
            Editable = true;
            TableRelation = "Reservation Agreement";

        }

        field(2; "Client Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Client #';
            TableRelation = Customer;

            trigger OnValidate()
            var
                CustomerRec: Record Customer;
            begin
                if CustomerRec.Get("Client Number") then
                    "Client Name" := CustomerRec.Name
                else
                    "Client Name" := '';
            end;
        }
        field(3; "Client Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Client Name';
            Editable = false;

            // FieldClass = FlowField;
            // CalcFormula = Lookup(Customer.Name WHERE("No." = field("Client #")));
            // Editable = false;
            // Caption = 'Client Name';
        }

        field(4; "Property ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Property ID';

            TableRelation = Property;

        }
        field(5; "Project Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project Name';
        }
        field(6; "Property Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Property Name';
        }
        field(7; "Total Selling Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Total Selling Price';
        }
        field(8; "Status"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
        }

    }

    keys
    {
        key(PK; "Property ID")
        {
            Clustered = true;
        }
    }
}
