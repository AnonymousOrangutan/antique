#!/bin/bash

file="main.pdf"

if [ -f "$file" ] ; then
    rm "$file"
fi

# Compile document
pdflatex -interaction=nonstopmode -output-directory out main.tex

# Once done, move PDF to working directory
mv out/main.pdf main.pdf

# If compilation is successful, push changes to GitLab
if [ -f "$file" ] ; then
    git add *
    read -p "Enter a commit message: " commit_msg
    git commit -m "$commit_msg"
    git push
fi