function month = OctoberGenerate()
    week = repmat({'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'}, 1, 6);
    days = 31;
    starts = 4;
    week = week(starts:starts+days-1);
    october = repmat({'October'}, 1, days);
    month = cat(1, october, num2cell([1:days]), week)';
end