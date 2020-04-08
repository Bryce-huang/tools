set -x
root=$1
chain=$2
name=$3
key=$4
pem=$5
pass=$6
cat $chain $root > ./ca-bundle.crt


openssl pkcs12 -export -inkey $key -in $pem -chain -CAfile ca-bundle.crt -out $name.p12 -name $name -passout pass:$pass

keytool -importkeystore -v  -srckeystore $name.p12 -srcstoretype pkcs12 -srcstorepass $pass -destkeystore $name.jks -deststoretype jks -deststorepass $pass

keytool -v -importkeystore -srckeystore $name.p12 -srcstoretype PKCS12 -srcstorepass $pass  -destkeystore $name.keystore -deststoretype JKS -deststorepass $pass
