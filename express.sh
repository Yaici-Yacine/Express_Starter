#!/bin/bash
packagem=$1
script=$2
name=$3
install=$4
parametre=$5

ouvrir(){
    mkdir Router Models Controllers
    echo "PORT=3000">.env
    if [[ $script == "-t" ]]; then
        sed -i '7s/.*/\t"start":"nodemon app.ts"/' package.json
        $1 i @types/express @types/node typescript 
        npx tsc --init
        echo "">app.ts
    else
        echo "">app.js
        sed -i '7s/.*/\t"start":"nodemon app.js"/' package.json
    fi
    $1 i express cors bcrypt jsonwebtoken 
    $1 i -D nodemon dotenv
}
cree(){ 
    mkdir $name
    cd $name
}
case "$packagem" in
    "-h"|"--help") 
    echo -e "\033[32mexpress\033[0m [option] [option 2] name [option 3] "packages"
   option:
   -h --help  how it works
     package manager:
   -b         with bun
   -n         with npm
   -p         with pnpm
   -y         with yarn
   option 2:
   \033[33m-j\033[0m         with JavaScript
   \033[34m-t\033[0m         with TypeScript
   option 3:
   \033[37m-i\033[0m         install packages"
    ;;
    -b)
    cree
    bun init 
    ouvrir bun
    ;;
    -n)
    cree
    npm init -y
    ouvrir npm
    ;;
    -p)
    cree
    pnpm init 
    ouvrir pnpm
    ;;
    -y)
    cree
    yarn init 
    ouvrir yarn
    ;;
esac