Data1 = load("handwriting_training_set.txt");
Data2 = load("handwriting_training_set_labels.txt");
Data3 = load("handwriting_test_set.txt");
Data4 = load("handwriting_test_set_labels.txt");

A0 = zeros(400,400);
A1 = zeros(400,400);
A2 = zeros(400,400);
A3 = zeros(400,400);
A4 = zeros(400,400);
A5 = zeros(400,400);
A6 = zeros(400,400);
A7 = zeros(400,400);
A8 = zeros(400,400);
A9 = zeros(400,400);   

for i=1:4000
    for j=1:400
        if i < 401
            A0(i,j) = Data1(i, j);
        elseif i < 801 
            A1(i-400,j) = Data1(i, j);
        elseif i < 1201 
            A2(i-800,j) = Data1(i, j);
        elseif i < 1601 
            A3(i-1200,j) = Data1(i, j);
        elseif i < 2001 
            A4(i-1600,j) = Data1(i, j);
        elseif i < 2401 
            A5(i-2000,j) = Data1(i, j);
        elseif i < 2801 
            A6(i-2400,j) = Data1(i, j); 
        elseif i < 3201 
            A7(i-2800,j) = Data1(i, j);
        elseif i < 3601 
            A8(i-3200,j) = Data1(i, j); 
        else
            A9(i-3600,j) = Data1(i, j);
        end    
    end    
end

[U0,~,~] = svd(A0');
[U1,~,~] = svd(A1');
[U2,~,~] = svd(A2');
[U3,~,~] = svd(A3');
[U4,~,~] = svd(A4');
[U5,~,~] = svd(A5');
[U6,~,~] = svd(A6');
[U7,~,~] = svd(A7');
[U8,~,~] = svd(A8');
[U9,~,~] = svd(A9');


U05  = U0(:,1:5);
U010 = U0(:,1:10);
U015 = U0(:,1:15);
U020 = U0(:,1:20);

U15  = U1(:,1:5);
U110 = U1(:,1:10);
U115 = U1(:,1:15);
U120 = U1(:,1:20);

U25  = U2(:,1:5);
U210 = U2(:,1:10);
U215 = U2(:,1:15);
U220 = U2(:,1:20);

U35  = U3(:,1:5);
U310 = U3(:,1:10);
U315 = U3(:,1:15);
U320 = U3(:,1:20);

U45  = U4(:,1:5);
U410 = U4(:,1:5);
U415 = U4(:,1:5);
U420 = U4(:,1:5);

U55  = U5(:,1:5);
U510 = U5(:,1:10);
U515 = U5(:,1:15);
U520 = U5(:,1:20);

U65  = U6(:,1:5);
U610 = U6(:,1:10);
U615 = U6(:,1:15);
U620 = U6(:,1:20);

U75  = U7(:,1:5);
U710 = U7(:,1:10);
U715 = U7(:,1:15);
U720 = U7(:,1:20);

U85  = U8(:,1:5);
U810 = U8(:,1:10);
U815 = U8(:,1:15);
U820 = U8(:,1:20);

U95  = U9(:,1:5);
U910 = U9(:,1:10);
U915 = U9(:,1:15);
U920 = U9(:,1:20);

  
Y = Data3(1,:)';
%projU05ontoY = (dot(U05,Y)/dot(Y,Y))*Y;
%Ynorm = norm(Y);



disp('done')






%row = Data3(rowIterator,:);
%rowIterator = 1;
%while rowIterator ~= 4001
%    rowIterator = rowIterator + 1;
%end  

%for iterator = 1:4000
%    row = Data1(rowIterator,:);
%end