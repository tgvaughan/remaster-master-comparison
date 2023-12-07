#!/bin/bash

echo -e "lambda\tt_master\tt_remaster" > times.txt

master_done=""

for lambda in 1 1.5 2 2.5 3 4 5 10 15 20; do
    echo -e -n "$lambda" >> times.txt

    for script in master.xml remaster.xml; do
        cat /dev/null > time.txt
        
        if [ "$script" = "master.xml" ] && [ "$master_done" = "yes" ]; then
            echo -e "Skipping $script with lambda=$lambda..."
        else
            echo -e "Running $script with lambda=$lambda..."
            timeout 1m /usr/bin/time -p -o time.txt \
                    beast -overwrite -D lambda=$lambda $script >/dev/null
        fi

        if ! grep user time.txt > /dev/null ; then
            echo -e -n "\tNA" >> times.txt

            if [ "$script" = "master.xml" ]; then
                master_done="yes"
            fi
            continue
        fi

        seconds=`tail -n+2 time.txt | head -n1 | cut -d' ' -f2`
        echo -e -n "\t$seconds" >> times.txt
    done
    echo >> times.txt
   
done

rm -f time.txt
