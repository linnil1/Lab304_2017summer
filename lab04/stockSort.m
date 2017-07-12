function tb = stockSort(infn, outfn)
	tb = readtable(infn);
    tb = sortrows(tb, 3);
    writetable(tb, outfn);
end