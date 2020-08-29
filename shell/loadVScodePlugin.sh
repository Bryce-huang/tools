# windows
@echo off
@echo 安装*.vsix

for %%1 in (*.vsix) do code --install-extension %%1


#linux 

echo 安装*.vsix

for filename in $(ls *.vsix) 
do 
    code --install-extension $filename
done