#!/bin/bash
### Exit codes
###             0: Success
###             else: Fial

display() {
        mysql -u root  -e "select * from invoices.invoices, invoices.invoice_details where id = $1"
}

delete() {
        mysql -u root  -e "delete from invoices.invoice_details where invoice_id = $1"
        mysql -u root  -e "delete from invoices.invoices where id = $1"
        echo "Deleted"
}

insert() {
        INV=$(awk '{print "insert into invoices.invoices values(" $1 ", \"" $2 "\", \"" $3 "\", " $4 ");"}' invoices.txt)
        INVD=$(awk '{print "insert into invoices.invoice_details (invoice_id, item, price, quantity) values(" $1 ", \"" $2 "\", " $3 ", " $4 ");"}' invoice_details.txt)
        mysql -u root  -e "$INV"
        mysql -u root  -e "$INVD"
        echo "Inserted"
}



