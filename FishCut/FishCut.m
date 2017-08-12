img = imread('test.jpg');

img_size = size(img);
global allpos;
allpos = ones(round(img_size(2:-1:1)/10)); % xy coordinate

% head tail
imshow(img);
head_size = 450;
head_pos = pointGet(head_size, img_size);
% pointSave(head_pos, head_size, img);
tail_size = 600;
tail_pos = pointGet(tail_size, img_size);

% body
body_size = [600 700 500];
body_pos = [linspace(head_pos(1), tail_pos(1), 5)
            linspace(head_pos(2), tail_pos(2), 5)]';
body_pos = body_pos(2:4, :);

for i = 1:3
    pos = pointModify(body_pos(i,:), body_size(i), img_size);
    pointDraw(pos, body_size(i));
end

% color patlle
color_size = 600;
color_pos = pointGet(color_size, img_size);

q = zeros(size(allpos)); %test

% function
% background
[all_x, all_y] = find(allpos);
three_label = kmeans([all_x all_y], 3);
q(find(allpos)) = three_label; %test

back_pos = [];
back_size = 400;
for i = 1:3
    back_pos(i, :) = [mean(all_x(three_label == i)) mean(all_y(three_label == i))] * 10;
    pos = pointModify(back_pos(i, :), back_size, img_size);
    pointDraw(pos, back_size);

end
figure;
imshow((q+1)/4);


function pos = pointGet(s, img_size)
    pos = ginput(1);
    pos = pointModify(pos, s, img_size);
    pointDraw(pos, s);
end

function pos = pointModify(pos, s, imgsize)
    pos = round(pos);
    pos(pos < s+1) = s+1;
    if pos(1) > imgsize(2) - s
        pos(1) = imgsize(2) - s;
    end
    if pos(2) > imgsize(1) - s
        pos(2) = imgsize(1) - s;
    end
    % remove it from allpos
    global allpos;
    allpos(round((pos(1)-s:pos(1)+s)/10)+1, round((pos(2)-s:pos(2)+s)/10)+1) = 0;
end

function pointDraw(pos, size)
    hold on;
    rectangle('Position', [pos(1)-size pos(2)-size 2*size 2*size], ...
              'EdgeColor','r');
    plot(pos(1), pos(2), 'ro', 'MarkerSize', 20);
    hold off;
end

function pointSave(pos, size, img)
    imwrite(img(pos(2)-size:pos(2)+size, pos(1)-size:pos(1)+size), 'hi.jpg');
end