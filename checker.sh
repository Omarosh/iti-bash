#!/bin/bash

checkDatabase() {
        res=`mysql -u root  --skip-column-names -e "show databases like 'invoices'"`
        if [ $res == 'invoices' ]; then
                echo "Database exists"
        else
                echo "Database doesn't exist"
        fi
}

checkTables() {
        TABLE1=`mysql -u root  --skip-column-names -e "use invoices; show tables like 'invoices'"`
        TABLE2=`mysql -u root  --skip-column-names -e "use invoices; show tables like 'invoice_details'"`

        if [ $TABLE1 == 'invoices' ] && [ $TABLE2 == 'invoice_details' ]; then
                echo "Tables exist"
        else
                echo "Tables don't exist"
        fi
}

checkInvoice() {
        res=`mysql -u root  --skip-column-names -e "select * from invoices.invoices where id = $1"`
        if [ -z "$res" ]; then
                echo "Not found"
        else
                echo $res
        fi
}

checkDatabase
checkTables
checkInvoice 1