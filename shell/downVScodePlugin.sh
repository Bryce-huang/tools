
# 先创建一个tmp临时目录，安装包都会下到里面
# tr '\n' ' ' 多行转一行
# | sh 将输出进行执行
# 
mkdir tmp;
code --list-extensions --show-versions | sed -r 's/(.*?)\.(.*?)@(.*)/https:\/\/marketplace.visualstudio.com\/_apis\/public\/gallery\/publishers\/\1\/vsextensions\/\2\/\3\/vspackage -o tmp\/\1.\2-\3.vsix/' | tr '\n' ' ' | sed -r 's/(.*)/curl \1/' | sh

# 若出现无法安装插件问题，需要7z处理一下
for filename in $(ls *.vsix) 
do 
      mv $filename ${filename%.*}.zip
    /d/dailyTools/7-Zip/7z.exe x ${filename%.*}.zip -o${filename%.*}
    mv ${filename%.*}/${filename%.*} $filename
done

e