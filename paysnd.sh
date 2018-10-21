#!/bin/bash

fun_res () {
pay="$3"
exec 5<>/dev/tcp/$1/$2
echo "$pay" >&5
retorno=$(cat <&5|head -1)
echo $retorno
}
construct_fun () {
payload="$1"
sed -i 's/.crlf]/\\r\\n&/g' ${payload}
sed -i "s/.crlf]//g" ${payload}
sed -i 's/.cr]/\\r&/g' ${payload}
sed -i "s/.cr]//g" ${payload}
sed -i 's/.lf]/\\n&/g' ${payload}
sed -i "s/.lf]//g" ${payload}
sed -i "s/.auth]//g" ${payload}
sed -i 's/.delay_split]/\\r\\n&/g' ${payload}
sed -i "s/.delay_split]//g" ${payload}
sed -i 's/.instant_split]/\\r\\n&/g' ${payload}
sed -i "s/.instant_split]//g" ${payload}
sed -i 's/.split]/\\r\\n&/g' ${payload}
sed -i "s/.split]//g" ${payload}
sed -i "s;.host_port];${hostprox}:22;g" ${payload}
sed -i "s;.host];${proxy};g" ${payload}
sed -i "s;.port];:22;g" ${payload}
sed -i 's;.protocol];HTTP/1.0;g' ${payload}
sed -i 's;.ua];Dalvik/2.1.0;g' ${payload}
sed -i 's;.method];CONNECT;g' ${payload}
sed -i "s;.raw];CONNECT ${hostprox}:22 HTTP/1.0;g" ${payload}
sed -i "s;.netData];CONNECT ${hostprox}:22 HTTP/1.0;g" ${payload}
sed -i "s;.realData];CONNECT ${hostprox}:22 HTTP/1.0;g" ${payload}
}
bar="======================================================="
cor="\033[0m \033[1;31m \033[1;32m \033[1;33m \033[1;34m \033[1;33m"
cor=($cor)
esquelet="./payloads.txt"
gerar_arqpay () {
echo 'GET http://mhost/ HTTP/1.1[crlf][raw][crlf] [crlf][crlf]
CONNECT mhost@[host_port] HTTP/1.1[crlf][crlf]GET http://mhost/ [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]User-Agent: [ua][crlf][crlf]
CONNECT mhost@[host_port] HTTP/1.1[crlf][crlf]GET http://mhost/ [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]User-Agent: [ua][crlf] [crlf]
CONNECT [host_port]@mhost HTTP/1.1[crlf][crlf]GET http://mhost/ [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]User-Agent: [ua][crlf][crlf]
CONNECT [host_port]@mhost HTTP/1.1[crlf][crlf]GET http://mhost/ [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]User-Agent: [ua][crlf] [crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]User-Agent: [ua][crlf][crlf]CONNECT [host_port]@mhost [protocol][crlf][crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]User-Agent: [ua][crlf][crlf]CONNECT [host_port]@mhost [protocol][crlf] [crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]User-Agent: [ua][crlf][crlf]CONNECT mhost@[host_port] [protocol][crlf][crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]User-Agent: [ua][crlf][crlf]CONNECT mhost@[host_port] [protocol][crlf] [crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]User-Agent: [ua][crlf][crlf]CONNECT mhost@[host_port] [protocol][crlf][crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]User-Agent: [ua][crlf][crlf]CONNECT mhost@[host_port] [protocol][crlf] [crlf]
CONNECT mhost@[host_port] HTTP/1.1[crlf][crlf]GET http://mhost/ [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]User-Agent: [ua][crlf][crlf]
CONNECT mhost@[host_port] HTTP/1.1[crlf][crlf]GET http://mhost/ [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]User-Agent: [ua][crlf] [crlf]
CONNECT mhost@[host_port] HTTP/1.1[crlf][crlf]GET http://mhost/ [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]Referer: mhost[crlf][crlf]
CONNECT mhost@[host_port] HTTP/1.1[crlf][crlf]GET http://mhost/ [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]Referer: mhost[crlf] [crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf][crlf]CONNECT mhost@[host_port] [protocol][crlf][crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf][crlf]CONNECT mhost@[host_port] [protocol][crlf] [crlf]
GET mhost@[host_port] [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf][crlf]
GET mhost@[host_port] [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf] [crlf]
GET [host_port]@mhost [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf][crlf]
GET [host_port]@mhost [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf] [crlf]
CONNECT [host_port]@mhost [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]Connection: Keep-Alive[crlf][crlf]
CONNECT [host_port]@mhost [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]Connection: Keep-Alive[crlf] [crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]Connection: Keep-Alive[crlf][crlf][raw][crlf][crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]Connection: Keep-Alive[crlf][crlf][raw][crlf] [crlf]
CONNECT [host_port] HTTP/1.1[crlf][crlf]GET http://mhost/ [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf][crlf]
CONNECT [host_port] HTTP/1.1[crlf][crlf]GET http://mhost/ [protocol][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf] [crlf]
GET http://mhost/ HTTP/1.1[crlf]User-Agent: [ua][crlf][crlf][spli][raw][crlf][crlf]CONNECT mhost:443 HTTP/1.1[crlf][raw][crlf][crlf]GET http://mhost/ HTTP/1.0[crlf]Host: mhost[crlf]Proxy-Authorization: basic: mhost[crlf]User-Agent: [ua][crlf]Connection: close[crlf]Proxy-Connection: Keep-Alive [crlf]Host: [host][crlf][crlf][split][raw][crlf][crlf]GET http://mhost/ HTTP/1.0[crlf]Host: mhost/[crlf][crlf]CONNECT [host_port] HTTP/1.0[crlf][crlf][realData][crlf][crlf]
[method] mhost:443 HTTP/1.1[crlf][raw][crlf][crlf]GET http://mhost/ HTTP/1.1\nHost: mhost\nConnection: close\nConnection: close\nUser-Agent:[ua][crlf]Proxy-Connection: Keep-Alive[crlf]Host: [host][crlf][crlf][delay_split][raw][crlf][crlf][raw][crlf][realData][crlf][crlf]
GET http://mhost/ HTTP/1.1[crlf]User-Agent: KDDI[crlf]Host: [host][crlf][crlf][raw][raw][crlf][raw][crlf][raw][crlf][crlf]DELETE http://mhost/ HTTP/1.1[crlf]Host: m.opera.com[crlf]Proxy-Authorization: basic: *[crlf]User-Agent: KDDI[crlf]Connection: close[crlf]Proxy-Connection: Direct[crlf]Host: [host][crlf][crlf][raw][raw][crlf][crlf][raw][method] http://mhost[port] HTTP/1.1[crlf]Host: [host][crlf][crlf]CONNECT [host] [protocol][crlf][crlf][CONNECT [host] [protocol][crlf][crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf][crlf][netData][crlf][instant_split]MOVE http://mhost[delay_split][crlf][crlf][netData][crlf][instant_split]MOVE http://mhost[delay_split][crlf][crlf][netData][crlf][instant_split]MOVE http://mhost[delay_split][crlf][crlf]X-Online-Host: mhost[crlf]Packet Length: Authorization[crlf]Packet Content: Authorization[crlf]Transfer-Encoding: chunked[crlf]Referer: mhost[crlf][crlf]
[crlf][crlf]CONNECT [host_port]@mhost/ [protocol][crlf][delay_split]GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]User-Agent: [ua][crlf]CONNECT [host]@mhost/ [protocol][crlf][crlf]
[method] [host_port] [protocol] [delay_split]GET http://mhost/ HTTP/1.1[netData][crlf]GET mip:80[crlf]X-GreenArrow-MtaID: smtp1-1[crlf]CONNECT http://mhost/ HTTP/1.1[crlf]CONNECT http://mhost/ HTTP/1.0[crlf][split]CONNECT http://mhost/ HTTP/1.1[crlf]CONNECT http://mhost/ HTTP/1.1[crlf][crlf][method] [host_port] [protocol]?[split]GET http://mhost:8080/[crlf][crlf]GET [host_port] [protocol]?[split]OPTIONS http://mhost/[crlf]Connection: Keep-Alive[crlf]User-Agent: Mozilla/5.0 (Android; Mobile; rv:35.0) Gecko/35.0 Firefox/35.0[crlf]CONNECT [host_port] [protocol] [crlf]GET [host_port] [protocol]?[split]GET http://mhost/[crlf][crlf][method] mip:80[split]GET mhost/[crlf][crlf]: Cache-Control:no-store,no-cache,must-revalidate,post-check=0,pre-check=0[crlf]Connection:close[crlf]CONNECT [host_port] [protocol]?[split]GET http://mhost:/[crlf][crlf]POST [host_port] [protocol]?[split]GET[crlf]mhost:/[crlf]Content-Length: 999999999\r\n\r\n
GET [host_port] [protocol][crlf][delay_split]GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]Referer: mhost[crlf]X-Online-Host: mhost[crlf]X-Forward-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf][raw][crlf][crlf]
CONNECT [host_port] [protocol]GET http://mhost/ [protocol][crlf][split]GET mhost/ HTTP/1.1[crlf][crlf]
CONNECT [host_port] [protocol]GET http://mhost/ [protocol][crlf][split]GET http://mhost/ HTTP/1.1[crlf]Host: navegue.vivo.ddivulga.com/pacote[crlf][crlf]CONNECT [host_port] [protocol]GET http://mhost/ [protocol][crlf][split]GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf][crlf]CONNECT [host_port] [protocol]GET http://mhost/ [protocol][crlf][split]GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf][crlf]CONNECT [host_port] [protocol]GET http://mhost/ [protocol][crlf][split]GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf][crlf]CONNECT [host_port] [protocol]GET http://mhost/ [protocol][crlf][split]CONNECT [host_port]@mhost/ [protocol][crlf]Host: mhost/[crlf]GET mhost/ HTTP/1.1[crlf]HEAD mhost/ HTTP/1.1[crlf]TRACE mhost/ HTTP/1.1[crlf]OPTIONS mhost/ HTTP/1.1[crlf]PATCH mhost/ HTTP/1.1[crlf]PROPATCH mhost/ HTTP/1.1[crlf]DELETE mhost/ HTTP/1.1[crlf]PUT mhost/ HTTP/1.1[crlf]Host: mhost/[crlf]Host: mhost/[crlf]X-Forward-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]X-Forwarded-For: mhost[protocol][crlf][crlf]
[raw]split]GET http://mhost/ HTTP/1.1[crlf]Host: mhost/[crlf]X-Forward-Host: mhost/[crlf]Connection: Keep-Alive[crlf]Connection: Close[crlf]User-Agent: [ua][crlf][crlf]
[raw]split]GET mhost/ HTTP/1.1[crlf] [crlf]
CONNECT [host_port]@mhost/ [protocol][crlf][instant_split]GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf][crlf]
GET http://mhost/ HTTP/1.1[crlf]GET mhost/[crlf]Connection: close Keep-Alive[crlf]User-Agent: [ua][crlf][crlf][raw][crlf][crlf]
[raw]split]GET mhost/ HTTP/1.1[crlf][crlf]
GET [host_port] [protocol][instant_split]GET http://mhost/ HTTP/1.1[crlf]
GET [host_port] [protocol][crlf][delay_split]CONNECT http://mhost/ HTTP/1.1[crlf]
CONNECT [host_port] [protocol] [instant_split]GET http://mhost/ HTTP/1.1[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf][crlf][instant_split]GET http://mhost/ HTTP/1.1[crlf]User-Agent: [ua][crlf][crlf]
GET http://mhost/ HTTP/2.0[auth][crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]X-Forward-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]CONNECT [host_port] [protocol] [auth][crlf][crlf][delay_split][raw][crlf]JAZZ http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf]X-Online-Host: mhost[crlf]X-Forward-Host: mhost[crlf]X-Forwarded-For: mhost[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf][raw][crlf][crlf][delay_split]CONNECT [host_port] [protocol] [method][crlf] [crlf][crlf]
CONNECT [host_port] [protocol][crlf]GET http://mhost/ HTTP/1.1\rHost: mhost\r[crlf]X-Online-Host: mhost\r[crlf]X-Forward-Host: mhost\rUser-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-gb) AppleWebKit/534.35 (KHTML, like Gecko) Chrome/11.0.696.65 Safari/534.35 Puffin/2.9174AP[crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost/ [crlf]User-Agent: Yes[crlf]Connection: close[crlf]Proxy-Connection: Keep-Alive[crlf][crlf][raw][crlf][crlf]
GET [host_port] [protocol][crlf][split]GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf][raw][crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Connection: close[crlf]Proxy-connection: Keep-Alive[crlf]Proxy-Authorization: Basic[crlf]UseDNS: Yes[crlf]Cache-Control: no-cache[crlf][raw][crlf] [crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf] Access-Control-Allow-Credentials: true, true[crlf] Access-Control-Allow-Headers: X-Requested-With,Content-Type, X-Requested-With,Content-Type[crlf]  Access-Control-Allow-Methods: GET,PUT,OPTIONS,POST,DELETE, GET,PUT,OPTIONS,POST,DELETE[crlf]  Age: 8, 8[crlf] Cache-Control: max-age=86400[crlf] public[crlf] Connection: keep-alive[crlf] Content-Type: text/html; charset=UTF-8[crlf]Content-Length: 9999999999999[crlf]UseDNS: Yes[crlf]Vary: Accept-Encoding[crlf][raw][crlf] [crlf][crlf]
GET http://mhost/ HTTP/1.1[crlf]Host: mhost[crlf] Access-Control-Allow-Credentials: true, true[crlf] Access-Control-Allow-Headers: X-Requested-With,Content-Type, X-Requested-With,Content-Type[crlf]  Access-Control-Allow-Methods: GET,PUT,OPTIONS,POST,DELETE, GET,PUT,OPTIONS,POST,DELETE[crlf]  Age: 8, 8[c
