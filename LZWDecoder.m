%% Input: CompressedText.txt
%% Output: DeCompressedText.txt
clear
fileID1 = fopen('CompressedText.txt','r');
fileID2 = fopen('xum_DeCompressedText.txt','w');
% comp = fread(fileID1,'ubit12');
bits = fread(fileID1,1);
comp = fread(fileID1,['ubit',num2str(bits)]);
%% ROUTINE LZW_DECOMP
newc = comp(1); comp(1)=[];
out = newc;
oldc = newc;
%% init the default list
k=0;
s_table = num2cell(0:255);
while length(comp)
    k = k+1
    if k==1677;
        a = 0;
    end
    newc = comp(1); comp(1)=[];
    stri = s_table{newc+1};
    out = [out, stri];
	char = stri(1);
    s_table{end+1} = [s_table{oldc+1},char];
	oldc = newc;
end
%% save
deco = out;
fwrite(fileID2,deco);
