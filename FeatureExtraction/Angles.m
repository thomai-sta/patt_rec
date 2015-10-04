function angles = Angles(s)

diff_x = diff(s(1,:));
diff_y = diff(s(2,:));

angles = diff_y ./ diff_x;

end

