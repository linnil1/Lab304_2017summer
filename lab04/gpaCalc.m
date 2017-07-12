function mydat = gpaCalc(infn, outfn)
    dat = load(infn);
    dat = dat.StudentGrades;

    grades = cat(1, dat(:).grades);
    cs = cat(2, grades{:,2});
    gs = cat(2, grades{:,3});
    mydat = rmfield(dat, 'grades');

    gpas = (sum(cs .* gs) ./ sum(cs));
    mydat = concatenateStruct( mydat,'CGPA',gpas );
    struct2csv(mydat, outfn);
    disp(struct2table(mydat));
end
% matlab don't have combine struct
function st = concatenateStruct(a, name, b)
    st = a;
    for i = 1:length(a)
        st(i).(name) = b(i);
    end
end

% matlab don't have struct to csv
function struct2csv(dat, fn)
    writetable(struct2table(dat), fn);
end
        