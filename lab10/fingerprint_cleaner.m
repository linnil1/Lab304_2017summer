function fingerprint_cleaner(fig)
    % load and make it to binary
    img = imread(fig);
    bwimg = ~imbinarize(img);

    % remove small dot on each line
    nobimg = ~bwimg;
    for i = 1:2
        nobimg = bwareaopen(nobimg, 15, 4);
    end
    nobimg = ~nobimg;

    % get skeletion and remove skeleton edge
    skelimg = bwmorph(nobimg, 'skel', Inf);

    % remove T shape that will confuse other branch function
    interval = [ 0  1  0
                 1  1  0
                 0  1  0];
    cutskelimg = skelimg;
    for ang = 0:90:270
        cutskelimg = cutskelimg - bwhitmiss(cutskelimg, imrotate(interval,  ang));
    end

    % remove branch
    nobrimg = cutskelimg;
    nobrimg = cutBranch(nobrimg);
    nobrimg = cutBranch(nobrimg);
    % closing back the remove some crook point
    nobrskelimg = bwmorph(nobrimg, 'skel', Inf);
    nobrskelimg = bwmorph(bwmorph(nobrskelimg, 'diag'), 'skel', Inf);

    % remove bridge
    nobgimg = nobrskelimg;
    nobgimg = cutBridge(nobgimg);
    % after remove bridge, remove branch again
    nobgbrimg = cutBranch(nobgimg);
    nobgbrimg = cutBranch(nobgbrimg);
    nobgskelimg = bwmorph(nobgbrimg, 'skel', Inf);
    nobgskelimg = bwmorph(bwmorph(nobgskelimg, 'diag'), 'skel', Inf);

    % connect
    conimg = bwmorph(nobgskelimg, 'bridge');
    conimg = bwmorph(conimg, 'skel', Inf);
    conimg = bwmorph(bwmorph(conimg, 'diag'), 'skel', Inf);

    % show image
    imshow(img);
    % imshow(conimg);
    hold on
    [y, x] = find(bwmorph(conimg, 'branchpoints'));
    plot(x, y, 'ro', 'MarkerSize', 10);
    [y, x] = find(bwmorph(conimg, 'endpoints'));
    plot(x, y, 'bo', 'MarkerSize', 10);
    hold off
    % showImage(nobrskelimg, nobgskelimg);
end

function showImage(oriimg, nowimg)
    all = double(oriimg);
    all = cat(3, all, all, all);
    want = cat(3, double(nowimg), zeros(size(oriimg)), zeros(size(oriimg)));
    imshow(imlincomb(0.5, all, 0.5, want));
end

function nobrimg = cutBranch(nobrimg)
    branchs = bwmorph(nobrimg, 'branchpoints');
    ends    = bwmorph(nobrimg, 'endpoints');
    [by, bx] = find(branchs);
    [ey, ex] = find(ends);
    tmpbgimg = nobrimg;
    % remove branch point
    for b = 1:length(bx)
        tmpbgimg(by(b)-1:by(b)+1, bx(b)-1:bx(b)+1) = 0;
    end
    tmplbimg = bwlabel(tmpbgimg);

    % remove small branch
    brimg = zeros(size(nobrimg), 'logical');
    for e = 1:length(ex)
        if tmplbimg(ey(e), ex(e)) && ...
           nnz(tmplbimg == tmplbimg(ey(e), ex(e))) > 3
            continue
        end
        if tmplbimg(ey(e), ex(e))
            brimg = brimg | (tmplbimg == tmplbimg(ey(e), ex(e)));
        else
            brimg(ey(e), ex(e)) = 1;
        end
    end
    
    % dilate and remove it
    brimg = nobrimg & imdilate(brimg, strel('disk', 1));
    nobrimg = nobrimg - brimg;
end

function nobgimg = cutBridge(nobgimg)
    pair = getBridgepair(nobgimg);
    branchs = bwmorph(nobgimg, 'branchpoints');
    [y, x] = find(branchs);
    tmpbgimg = nobgimg;
    % remove brnach
    for p = 1:size(pair, 1)
        tmpbgimg(y(pair(p,1))-1:y(pair(p,1))+1, x(pair(p,1))-1:x(pair(p,1))+1) = 0;
        tmpbgimg(y(pair(p,2))-1:y(pair(p,2))+1, x(pair(p,2))-1:x(pair(p,2))+1) = 0;
    end
    tmplbimg = bwlabel(tmpbgimg);
    bgimg = zeros(size(nobgimg), 'logical');
    for p = 1:size(pair, 1)
        % find bridge label
        midx = round(mean(x(pair(p,:))));
        midy = round(mean(y(pair(p,:))));
        mid  = tmplbimg(midy-1:midy+1, midx-1:midx+1);
        mid  = mode(mid(mid>0));
        % disp(mid);
        if isnan(mid)
            bgimg(midy, midx) = 1;
        elseif nnz(tmplbimg == mid) < 7
            bgimg = bgimg + (tmplbimg == mid);
        end
    end
    % remove it from image
    bgimg = nobgimg & imdilate(bgimg, strel('disk', 1));
    nobgimg = nobgimg - bgimg;
end

function pair = getBridgepair(bdimg)
    branchs = bwmorph(bdimg, 'branchpoints');
    [y, x] = find(branchs);
    % count how many bridge connect to each bridge
    counts = cell(1, length(x));
    for i = 1:length(x)
        dis = (y - y(i)) .^ 2 + (x - x(i)) .^ 2;
        near = find(dis > 3 & dis < 100);
        if ~isempty(near)
            for n = 1:length(near)
                counts{near(n)}(end + 1) = i;
            end
        end
    end
    % get pair that not conflict together
    l = cellfun(@length, counts) == 1;
    pair = [find(l)' cell2mat(counts(l))'];
end