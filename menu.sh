#!/bin/bash

source dataops.sh
echo "1. Insert"
echo "2. Delete"
echo "3. Display"
echo "Enter choice: "
menu(){
select op in Insert Delete Display Exit
do
case $op in
        1)
                insert;;

        2)
                echo "Enter id: "
                read -r delete_id
                delete $delete_id;;

        3)      
                echo "Enter id: "
                read -r id
                display $id;;

        "Exit")
                exit 0;;

        *)
                echo "Error";;
esac
done
}