#/bin/bash
echo                    ░█▀▀░█░█░█▀█░█▀▀░█░█░█▀▄░█▀▀░█▀▀░█▀█░█▀█
echo                    ░█░░░░▀█░█░█░█░█░░▀█░█▀▄░█▀▀░█░░░█░█░█░█
echo                    ░▀▀▀░░░▀░▀░▀░▀▀▀░░░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀
echo
echo
echo

echo Vamos criar uma pasta para salvar os arquivos enumerados!
echo "Digite o nome: "
read  pasta
echo
echo

mkdir $pasta

cd $pasta

echo "Digite a url: "
read url


gau $url | grep "\.js" > salvarjs.txt

cat salvarjs.txt  | httpx -mc 200 -silent  | tee saida.txt

xargs -a saida.txt -n2 -I{} bash -c "echo -e '\n[URL]: {}\n'; python3 /linkfinder.py -i {} -o cli" | tee analisejs.txt

cat analisejs.txt   | python3 /collector.py output
