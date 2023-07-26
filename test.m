%Студент групи АВ-11(2) Черниш А.
clc; 
clear all;
close all; 

main_massive = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 0;
    0, ' ', ' ', ' ', ' ', 0, 0, 0, 0, 0;
    0, ' ', ' ', ' ', ' ', 0, ' ', 0, ' ', ' ';
    0, ' ', 0, 0, 0, 0, ' ', 0, ' ', 0;
    0, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 0;
    0, ' ', 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, ' ', ' ', ' ', ' ', ' ', ' ', 0
};
final_massive = main_massive;

program_active = true;

n = 2;

j = 7;
i = 2;

data = cell(2, 99);

data{1, 1} = j;
data{2, 1} = i;
fprintf("n = %d j = %d i = %d \n", 1, j, i);
main_massive{j, i} = '0';

while program_active == true
    if main_massive{j-1, i} == ' '
        pzdc = false;
        j = j-1;
    elseif main_massive{j, i+1} == ' '
        pzdc = false;
        i = i+1;
    elseif main_massive{j+1, i} == ' '
        pzdc = false;
        j = j+1;
    elseif main_massive{j, i-1} == ' '
        pzdc = false;
        i = i-1;
    else
        disp("HZ");
        pzdc = true;
        n = n - 1;
        j = data{1, n-1};
        i = data{2, n-1};
        main_massive{j, i} = '0';
    end
    
    main_massive{j, i} = '0';
    data{1, n} = j;
    data{2, n} = i;
    fprintf("n = %d j = %d i = %d \n", n, j, i);
    
    if j == size(main_massive, 1) || i == size(main_massive, 2)
        program_active = false;
    end
    
    %if n <= 0 program_active = false; end
    
    if pzdc ~= true && program_active == true
        n = n + 1;
    end
end

figure(1)
cellplot(main_massive);

for x = 1:n
    final_massive{data{1, x}, data{2, x}} = '0';
end

figure(2)
cellplot(final_massive);