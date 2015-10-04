function ret_s = ScaleCharacter(s)
% makes all the character with the same size (scale by height)
% making the height of all characters 1.0

min_y = min(s(2,:));
max_y = max(s(2,:));
height = max_y - min_y;

ret_s = s;
ret_s(1,:) = ret_s(1,:) / height;
ret_s(2,:) = ret_s(2,:) / height;


end

