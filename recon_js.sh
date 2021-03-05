#/bin/bash
echo                    ░█▀▀░█░█░█▀█░█▀▀░█░█░█▀▄░█▀▀░█▀▀░█▀█░█▀█
echo                    ░█░░░░▀█░█░█░█░█░░▀█░█▀▄░█▀▀░█░░░█░█░█░█
echo                    ░▀▀▀░░░▀░▀░▀░▀▀▀░░░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀
echo
echo
echo


echo "digite o nome do site (não a url)"
read  pasta
echo
echo

mkdir $pasta

cd $pasta

echo "Digite a url: "
read url
echo
echo

gau $url | grep "\.js" > salvarjs.txt

cat salvarjs.txt  | httpx -mc 200 -silent  | tee saida.txt

xargs -a saida.txt -n2 -I{} bash -c "echo -e '\n[URL]: {}\n'; python3 /linkfinder.>
cat analisejs.txt   | python3 /collector.py output
