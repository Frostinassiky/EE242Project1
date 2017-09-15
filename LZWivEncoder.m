%% Input: UncompressedText.txt
%% Output: CompressedText.txt && Compression Ratio
clear
fileID1 = fopen('UncompressedText.txt','r');
fileID2 = fopen('CompressedText.txt','w');
UNCO = fread(fileID1,'ubit8');
unco = char(UNCO);
%% ROUTINE LZW_COMP
stri = unco(1);
cw = stri;
unco(1) = [];

out = [];
%% init the default list
s_table = num2cell(0:255);
while length(unco)
	char = unco(1);  unco(1)=[];
	comb = [stri, char];
    idx = find(strcmp(comb, s_table));
	if length(idx)
		stri = comb;
        cw = idx-1; % start from 0
    else        
		out(end+1) = cw;
		s_table{end+1} = comb;
		stri = char;
        cw = char;
	end
end
out(end+1) = cw;
%% save
comp = out;
bits = ceil(log(max(comp))/log(2));
comp_r = (length(comp)*bits+8)/(length(UNCO)*8);
fwrite(fileID2,bits);
fwrite(fileID2,comp,['ubit',num2str(bits)]);
disp(['Compression Ratio is: ', num2str(comp_r)]);
