#!/bin/bash

function fractalp  {
    N=$1

    if [[ $N == 1 ]]; then
        B=0
    else
        B=$2
    fi

    ##if [[ $N -gt 1 ]]; then
    ##    echo $N $B
    ##    fractal $(($N-1)) $B
    ##fi


    YUKSEKLIK=$((32/2**$N));

    if [[ $1 == 1 ]]; then
        EKLE=33
    elif [[ $1 == 2 ]]; then
        EKLE=25
    elif [[ $1 == 3 ]]; then
        EKLE=21
    elif [[ $1 == 4 ]]; then
        EKLE=19
    elif [[ $1 == 5 ]]; then
        EKLE=18
    fi

    ARA=$((2**(6-$N)-1))
    TEKRAR=$((2**($N-1)))

    ##echo "TEKRAR:" $TEKRAR "ARA:" $ARA "YUKS:" $YUKSEKLIK "B:" $B

    ## Y'nin sapi basiliyor
    for YYY in $(seq 1 $YUKSEKLIK); do
        ## satir sayisi kadar tekrarla

        for EEE in $(seq 1 $EKLE); do
            ## bastaki sabit pattern'i ekle
            echo -ne "_"
        done


        for TTT in $(seq 1 $TEKRAR); do
            ## tekrarlanan pattern'i bas
            F=$((2**(5-N)))    ## tekrarlanan pattern ile 
                               ## Y'nin sapi arasindaki fark
            for FFF in $(seq 1 $F); do
                echo -ne "_"
            done

            echo -ne "1"

            for FFF in $(seq 1 $F); do
                ## tekrarlanan pattern'le sap arasi fark 2. kere
                echo -ne "_"
            done

            if [[ $TTT != $TEKRAR ]]; then
                ## eger son pattern basildiysa o zaman 
                ## en sonda tekrarlar arasindaki farki basma.
                for AAA in $(seq 1 $ARA); do
                    ## iki pattern arasi aralarda __'lari bas
                    echo -ne "_"
                done
            fi
        done

        for EEE in $(seq 1 $(($EKLE+1))); do
            ## en bastaki sabit pattern'in bir eksigini sona da ekle
            echo -ne "_"
        done

        echo
    done
    B=$(($B+$YUKSEKLIK))
    ##  Y'nin sapi bitti. 


    ## Y'nin kollari basiliyor:
    for YYY in $(seq 1 $YUKSEKLIK); do
        ## satir sayisi kadar

        ## bastaki alt cizgileri bas
        for EEE in $(seq 1 $EKLE); do
            echo -ne "_"
        done

        for TTT in $(seq 1 $TEKRAR); do
            ## tekrarlanan pattern'i bas
            F=$(((2**(5-N))-$YYY)) ## tekrarlanan pattern ile
                                   ## Y'nin kollari arasindaki fark
                                   ## bu YYY'nin degerine gore azaliyor
            for FFF in $(seq 1 $F); do
                echo -ne "_"
            done

            echo -ne "1"

            for YYYY in $(seq 1 $(($YYY*2-1))); do 
                ## iki kol arasindaki alani bas
                echo -ne "_"
            done

            echo -ne "1"

            for FFF in $(seq 1 $F); do
                echo -ne "_"
            done

            if [[ $TTT != $TEKRAR ]]; then
                ## eger son pattern basildiysa o zaman
                ## en sonda tekrarlar arasindaki farki basma.
                for AAA in $(seq 1 $ARA); do
                    ## iki pattern arasi aralarda __'lari bas
                    echo -ne "_"
                done
            fi
        done

        for EEE in $(seq 1 $(($EKLE+1))); do
            echo -ne "_"
        done


        echo 
    done
    B=$(($B+$YUKSEKLIK))

}

function fractal {

    for PART in $(seq 1 $1); do
        fractalp $PART  $B 
    done

    #echo $B
    for LLL in $(seq 1 $((63-$B))); do
        for MMM in $(seq 1 100); do
            echo -ne "_"
        done
        echo
    done

}

fractal $1 | tac
