# functions/speedtest.fish — quick CLI speed test
function speedtest --description "Run a network speed test via speedtest-cli"
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
end
