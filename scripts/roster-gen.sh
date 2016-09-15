#! /bin/bash

usage() {
    printf "Usage: %s [-d delimiter] [-m mask-file] [-n names-file] [-s start-date] [-r] [-h]\n\n" "$*"
    printf "    -c  Print initial and final column of delimiters. (Useful for making markdown tables.)\n"
    printf "    -d  Delimiter to separate output fields. (Default: ,)\n"
    printf "    -h  Print this usage information then quit.\n"
    printf "    -m  File of names to exclude from roster. (Default: data/names-mask.csv)\n"
    printf "    -n  File of all current ResCom and Platoon Lead names. (Default: data/names.csv)\n"
    printf "    -r  Raw output, that is do not print the header.\n"
    printf "    -s  Date to start roster. (Default: Thursday, given as an argument to the date command.)\n"
    printf "\nInvalid options will act like '-h' but the script will exit with a non-zero error code.\n"
}

cflag=
dflag=
delimiter=,
mflag=
mask_file=data/names-mask.csv
nflag=
name_file=data/names.csv
rflag=
sflag=
startdate="thursday"
while getopts cd:m:n:s:hr opt; do
    case $opt in
        c)  cflag=1;;
        d)  dflag=1
            delimiter="$OPTARG";;
        h)  usage $0
            exit 0;;
        m)  mflag=1
            mask_file="$OPTARG";;
        n)  nflag=1
            name_file="$OPTARG";;
        r)  rflag=1;;
        s)  sflag=1
            startdate="$OPTARG";;
        ?)  >&2 usage $0
            exit 1;;
    esac
done

mask_names() {
    # Filter out names of people who cannot currently attend.
    comm -3 "$name_file" "$mask_file"
}

offset_amount() {
    # If there are n people on the list, and two people are rostered per week,
    # everyone should take a turn approximately every n/2 weeks.
    printf "%ld\n" $(( $(mask_names | wc -l)/2 ))
}

offset_list() {
    # Cycles the list of names.
    offset=$(offset_amount)
    mask_names | tail --lines=+$(( offset + 1 ))
    mask_names | head -$(( offset ))
}

date_list() {
    nweeks=$(mask_names | wc -l)
    for w in $(seq 0 $(( nweeks - 1))); do
        date -I --date="$startdate +$w weeks"
    done
}

header() {
    if [[ $cflag ]]; then
        printf "${delimiter}Date${delimiter}Host${delimiter}Host${delimiter}\n"
        printf "${delimiter}----${delimiter}----${delimiter}----${delimiter}\n"
    else
        printf "Date${delimiter}Host${delimiter}Host\n"
    fi
}

delim_column() {
    nrows=$(mask_names | wc -l)
    yes "" | head -n$(( nrows ))
}

if [[ ! $rflag ]]; then
    header
fi
if [[ $cflag ]]; then
    paste -d "$delimiter" \
        <(delim_column) \
        <(date_list) <(mask_names) <(offset_list) \
        <(delim_column)
else
    paste -d "$delimiter" \
        <(date_list) <(mask_names) <(offset_list)
fi
