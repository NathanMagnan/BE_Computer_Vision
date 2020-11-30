%% creating the 2 typical rows
row_1 = linspace(0, 255, 255);
row_2 = 100 .* ones(1, 255);

%% creating the top, middle and bottom matrices
top_matrix = [row_1];
for i = 1:9
    top_matrix  = [top_matrix; row_1];
end

middle_matrix = [row_2];
for i = 1:9
    middle_matrix = [middle_matrix; row_2];
end

bottom_matrix = top_matrix;

%% concatenating the 3 matrices into a single matrix / image
image_q2 = [top_matrix; middle_matrix; bottom_matrix];

%% displaying this image
figure(1)
imshow(int8(image_q2));