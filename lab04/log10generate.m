function tbl = log10generate(outfn)
    [y, x] = meshgrid(linspace(0, 0.9, 10), linspace(1, 10, 10));
    % surf(x, y, log10(x + y));
    names = strrep(sprintf('%.1f ', linspace(0.0, 0.9, 10)'), '0.', 'x');
    names = strsplit(names);
    tbl = array2table(log10(x + y),...
        'RowNames', cellstr(num2str(linspace(1, 10, 10)')),...
        'VariableNames', names(1:10));
    disp(tbl);
    writetable(tbl, outfn, 'WriteRowNames', true); %,'WriteVariableNames',false)

    % rewrite file bcz variable_names
    fid = fopen(outfn, 'r');
    newstr = fscanf(fid, '%c');
    fclose(fid);
    fid = fopen(outfn, 'w');
    fprintf(fid, strrep(newstr, 'x', '.'));
    fclose(fid);
end

