# functions/myip.fish — show public IP
function myip --description "Print your public IP address"
    curl -s https://ifconfig.me
    echo
end
