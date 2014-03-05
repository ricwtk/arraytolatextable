function arraytolatextable(data)
    fid = fopen('latextable.txt', 'w');
    fprintf(fid, '%%\\usepackage[table]{xcolor}\n');
    fprintf(fid, '%%\\newcommand{\\hc}{\\cellcolor{red!50}}\n');
    fprintf(fid, '%%\\newcommand{\\oc}{\\cellcolor{blue!50}}\n');
    fprintf(fid, '\\begin{tabular}{');
    for n = 1:size(data,2)
        if n~=size(data,2)
            fprintf(fid, '|c');
        else
            fprintf(fid, '|c|}\n');
        end
    end 
    fprintf(fid, '\\hline\n');
    maxdata = max(max(data));
    hcdata = maxdata/3;
    for i = 1:size(data,1)
        for j = 1:size(data,2)
            if data(i,j) > hcdata
                fprintf(fid, '\\hc ');
%             elseif data(i,j) > 0
%                 fprintf(fid, '\\oc ');
            else
            end
            if j~=size(data,2)
                fprintf(fid, '%d &', data(i,j));
            else
                fprintf(fid, '%d \\\\\n\\hline\n', data(i,j));
            end
        end
    end
    fprintf(fid, '\\end{tabular}');
end