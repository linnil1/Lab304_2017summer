% load and make it to binary
img = imread('10Fingerprint.tif');
bwimg = ~imbinarize(img);
% er = imerode(bwimg, strel('disk', 1));
% di = imdilate(di, strel('line', 4,45));
% avgimg = imfilter(avgimg, fspecial('average'))

% remove small connect dot on each line
nobimg = ~bwimg;
for i = 1:2
    nobimg = bwareaopen(nobimg, 15, 4);
end
nobimg = ~nobimg;

% erosion and remove H-bridge to remove pixel between each line
eroimg = imerode(nobimg, strel('disk', 1));
eroimg = bwareaopen(eroimg, 10, 4);
eroimg = imdilate(eroimg, strel('disk', 1));

% get skeletion and remove skeleton edge
skelimg = bwmorph(eroimg,'skel', Inf);
cutskelimg = skelimg;
cutskelimg = bwmorph(skelimg, 'diag');
cutskelimg = bwmorph(cutskelimg, 'spur', 10);
cutskelimg = bwmorph(cutskelimg, 'skel', Inf);
% two below line will cause the image no good
cutskelimg = bwmorph(cutskelimg, 'spur', 3);
cutskelimg = bwmorph(cutskelimg, 'skel', Inf);

% remove L shape that will confuse other branch function
interval = [-1  1  0
             1  1 -1
             0 -1 -1];
noLimg = cutskelimg;
for ang = 0:90:270
    noLimg = noLimg - bwhitmiss(noLimg, imrotate(interval,  ang));
end

nobgimg = noLimg;
nobgimg = cutBridge(nobgimg);
nobgimg = cutBridge(nobgimg);
% remove L shape again
noLbgimg = nobgimg;
for ang = 0:90:270
    noLbgimg = noLbgimg - bwhitmiss(noLbgimg, imrotate(interval,  ang));
end

imshow(img);
ends = bwmorph(noLbgimg, 'endpoints');
branchs = bwmorph(noLbgimg, 'branchpoints');
hold on
[y, x] = find(branchs);
plot(x, y, 'ro', 'MarkerSize', 15);
[y, x] = find(ends);
plot(x, y, 'bo', 'MarkerSize', 15);
hold off
% showImage(bwimg, noLbgimg);

function showImage(oriimg, nowimg)
    all = double(oriimg);
    all = cat(3, all, all, all);
    want = cat(3, double(nowimg), zeros(size(oriimg)), zeros(size(oriimg)));
    imshow(imlincomb(0.5, all, 0.5, want));
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
        if nnz(tmplbimg == mid) < 20
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
        near = find(dis > 16 & dis < 100);
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