%Студент групи АВ-11(2) Черниш А.
clc; 
clear all;
close all; 

%The first method
    fname = 'Data.json'; 
    fid = fopen(fname); 
    raw = fread(fid,inf); 
    str = char(raw'); 
    fclose(fid); 
    main_massive = jsondecode(str);
    final_massive = jsondecode(str);
%end

%second method
    %run('Data.m');
    %main_massive = Labyrinth;
    %final_massive = Labyrinth;
%end

program_active = true;

n = 2;

j = 6;
i = 1;

data = zeros(2, 999);

data(1, 1) = j;
data(2, 1) = i;
fprintf("n = %d j = %d i = %d \n", 1, j, i);
main_massive(j, i) = 8;

while program_active == true
    if main_massive(j-1, i) == 0
        DeadEnd = false;
        j = j-1;
    elseif main_massive(j, i+1) == 0
        DeadEnd = false;
        i = i+1;
    elseif main_massive(j+1, i) == 0
        DeadEnd = false;
        j = j+1;
    elseif main_massive(j, i-1) == 0
        DeadEnd = false;
        i = i-1;
    else
        disp("Roll back");
        DeadEnd = true;
        n = n - 1;
        j = data(1, n-1);
        i = data(2, n-1);
        main_massive(j, i) = 8;
    end
    
    main_massive(j, i) = 8;
    data(1, n) = j;
    data(2, n) = i;
    fprintf("n = %d j = %d i = %d \n", n, j, i);
    
    if j == size(main_massive, 1) || i == size(main_massive, 2)
        program_active = false;
    end
    
    %Don`t touch this ;)
    %if n <= 0 program_active = false; end
    
    if DeadEnd ~= true && program_active == true
        n = n + 1;
    end
end

figure(1)
imagesc(main_massive);

for x = 1:n
    final_massive(data(1, x), data(2, x)) = 8;
end

figure(2)
imagesc(final_massive);