function [labelimg, nowlabel] = label_component(oriimage)
    labelimg = zeros(size(oriimage));
    labelarr = 1:numel(oriimage + 1);
    nowlabel = 0;

    % walk through every pixel and labeled
    for i = 1:size(oriimage, 1)
        for j = 1:size(oriimage, 2)
            if oriimage(i, j) == 0 
                l = 0;
                if i ~= 1 && labelimg(i - 1, j) > 0 
                    l = labelimg(i - 1, j);
                end
                if j ~= 1 && labelimg(i, j - 1) > 0
                    if l > 0 && l ~= labelimg(i, j - 1)
                        labelimg(labelimg == l) = labelimg(i, j - 1);
                        labelarr(l) = 0; 
                    end
                    l  =  labelimg(i, j - 1);
                end
                if l == 0
                    nowlabel = nowlabel + 1;
                    l = nowlabel;
                end
                labelimg(i, j) = l;
            end
        end
        % disp(labelimg);
    end

    % remove empty label
    for labels = 1:nowlabel
        if labelarr(labels) == 0
            labelimg(labelimg == nowlabel) = labels;
            nowlabel = nowlabel - 1;
            while isempty(labelimg == nowlabel)
                nowlabel = nowlabel - 1;
            end
        end
        if nowlabel == labels
            break
        end   
    end
end