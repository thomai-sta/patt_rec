function ret_s = MoveCharacter(s)
% moves character so that the leftmost pixel touches left border
% and that bottom pixel touches bottom border

min_x = min(s(1,:));
min_y = min(s(2,:));

ret_s = zeros(size(s));
for i = 1:length(s)
    ret_s(1,i) = s(1,i) - min_x;
    ret_s(2,i) = s(2,i) - min_y;
%     ret_s(3,i) = s(3,i);
end

end
