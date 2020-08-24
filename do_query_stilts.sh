#!/bin/bash
version=jplus-dr1   #minijpas-pdr201912
url=https://archive.cefca.es/catalogues/vo/tap/$version
user="$1"

outfile="$2"

shift
query=$(cat ./ADQL_J-PLUS)

unset pass
function getpass {
if [ -z "${pass+x}" ];
then
read -s -p Password: pass
fi
}

getpass

stilts\
        -Dstar.basicauth.user=${user}  -Dstar.basicauth.password=${pass} \
tapquery\
        omode=out tapurl=${url} adql="${query}" ofmt=csv out=$outfile


