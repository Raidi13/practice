#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m" #reset color 
        USERID=$(id -u)   # Check if the user is root
        
        CHECK_ROOT(){ 
            #to check the user is having root access are not  #    echo "user ID is:$USERID"
        
        if [ $USERID -ne 0 ]
then 
        echo "please run the script with root user"
        exit 1

    fi
}
    VALIDATE(){
    if [ $1 -ne 0 ]
then 
        echo -e "$2 is...$R FAILED $N"
        exit 1 
else 
        echo -e "$2 is...$G SUCCESS $N"
    fi
} 
    # Run the root check function
    CHECK_ROOT

# Loop through the provided arguments (packages)
    for package in $@ # $@ is all arguments pass to it
    do #sudo sh 14-loopspackages.sh git mysql postfix nginx
       
       dnf list installed $package  
       if [ $? -ne 0 ]
then
       echo "$package is not installed going to install it .."
       dnf install $package -y
       VALIDATE $? "installing $package"
else
       echo "$package is already installed .. noting to do"
        fi
done



