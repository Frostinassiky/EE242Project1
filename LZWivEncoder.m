%% Input: UncompressedText.txt
%% Output: CompressedText.txt && Compression Ratio
fileID1 = fopen('UncompressedText.txt','r');
fileID2 = fopen('CompressedText.txt','w');
comp_r = 1
unco = fread(fileID1);
comp = unco;
fwrite(fileID2,comp);
disp('Compression Ratio is: '+ num2str(comp_r));
%% ROUTINE LZW_COMP

if 0
%% LZW Compression code
% in: input charactor
% out: codeword
stri = in.pop()
out = []
while ~isEmpty(string)
	char = im.pop()
	comb = stri+char
	if comb is in s_table
		stri = comb
	else
		out.push(cw(stri))
		s_table << comb
		stri = char
	end
end
out.push(cw(stri))
end
