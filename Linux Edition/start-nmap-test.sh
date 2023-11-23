#!/bin/bash

# Run the first command
ip="192.168.1.1/24"

echo "\n"
command1="nmap -sn -PA $ip -oN arp-scan-results.txt"
echo "Running first command...$command1 \n" 
nmap -sn -PA $ip -oN arp-scan-results.txt

# Check if the first command was successful
if [ $? -eq 0 ]; then
    echo "First command successful. Running second command..."
    command2="nmap -sn -PU $ip -oN UDP-scan-results.txt"
    echo $command2
    nmap -sn -PU $ip -oN UDP-scan-results.txt
    if [ $? -eq 0 ]; then
        echo "Second 2 successful. Running 3 command..."
        command3="nmap -sn -PE $ip -oN ECHO-scan-results.txt"
        echo $command3
        nmap -sn -PE $ip -oN ECHO-scan-results.txt
        if [ $? -eq 0 ]; then
            echo "3 command successful. Running 4 command..."
            command4="nmap -sn -PP $ip -oN ICMP-Timestamp-scan-results.txt"
            echo $command4
            nmap -sn -PP $ip -oN ICMP-Timestamp-scan-results.txt
            if [ $? -eq 0 ]; then
                echo "4 command successful. Running 5 command..."
                command4="nmap -sn -PM $ip -oN ICMP-Mask-scan-results.txt"
                echo $command4
                nmap -sn -PM $ip -oN ICMP-Mask-scan-results.txt
                if [ $? -eq 0 ]; then
                    echo "5 command successful. Running 6 command..."
                    command5="nmap -sn -PS $ip -oN TCP-SYN-scan-results.txt"
                    echo $command5
                    nmap -sn -PS $ip -oN TCP-SYN-scan-results.txt
                    if [ $? -eq 0 ]; then
                        echo "6 command successful. Running 7 command..."
                        command6="nmap -sn -PA $ip -oN TCP-ACK-scan-results.txt"
                        echo $command6
                        nmap -sn -PA $ip -oN TCP-ACK-scan-results.txt
                        if [ $? -eq 0 ]; then
                            echo "7 command successful..."
                            command7="nmap -sn -PO $ip -oN TCP-ACK-scan-results.txt"
                            echo $command7
                            nmap -sn -PO $ip -oN TCP-ACK-scan-results.txt
                        else
                            echo "7 command failed. Exiting."
                            exit 1
                        fi 
                    else
                        echo "6 command failed. Exiting."
                        exit 1
                    fi 
                else
                    echo "5 command failed. Exiting."
                    exit 1
                fi 
            else
                echo "4 command failed. Exiting."
                exit 1
            fi
        else
            echo "3 command failed. Exiting."
            exit 1
        fi
    else
        echo "2 command failed. Exiting."
        exit 1
    fi
    
else
    echo "1 command failed. Exiting."
    exit 1
fi

echo "Successfuly scanned the env"

