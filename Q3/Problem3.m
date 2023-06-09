

train_data = load("handwriting_training_set.txt");
train_labels = load("handwriting_training_set_labels.txt");
test_data = load("handwriting_test_set.txt");
test_labels = load("handwriting_test_set_labels.txt");

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

numOfZerosInTestSet = 0;
numOfOnesInTestSet = 0;
numOfTwosInTestSet = 0;
numOfThreesInTestSet = 0;
numOfFoursInTestSet = 0;
numOfFivesInTestSet = 0;
numOfSixsInTestSet = 0;
numOfSevensInTestSet = 0;
numOfEightsInTestSet = 0;
numOfNinesInTestSet = 0;

for p=1:1000
    if test_labels(p) == 10
        numOfZerosInTestSet = numOfZerosInTestSet + 1;
    elseif test_labels(p) == 1
        numOfOnesInTestSet = numOfOnesInTestSet + 1;
    elseif test_labels(p) == 2
        numOfTwosInTestSet = numOfTwosInTestSet + 1; 
    elseif test_labels(p) == 3
        numOfThreesInTestSet = numOfThreesInTestSet + 1;
    elseif test_labels(p) == 4
        numOfFoursInTestSet = numOfFoursInTestSet + 1;
    elseif test_labels(p) == 5
        numOfFivesInTestSet = numOfFivesInTestSet + 1;
    elseif test_labels(p) == 6
        numOfSixsInTestSet = numOfSixsInTestSet + 1;
    elseif test_labels(p) == 7
        numOfSevensInTestSet = numOfSevensInTestSet + 1;
    elseif test_labels(p) == 8
        numOfEightsInTestSet = numOfEightsInTestSet + 1;
    else
        numOfNinesInTestSet = numOfNinesInTestSet + 1;
    end
end

for i=1:4000
    for j=1:400
        if i < 401
            A0(i,j) = train_data(i, j);
        elseif i < 801 
            A1(i-400,j) = train_data(i, j);
        elseif i < 1201 
            A2(i-800,j) = train_data(i, j);
        elseif i < 1601 
            A3(i-1200,j) = train_data(i, j);
        elseif i < 2001 
            A4(i-1600,j) = train_data(i, j);
        elseif i < 2401 
            A5(i-2000,j) = train_data(i, j);
        elseif i < 2801 
            A6(i-2400,j) = train_data(i, j); 
        elseif i < 3201 
            A7(i-2800,j) = train_data(i, j);
        elseif i < 3601 
            A8(i-3200,j) = train_data(i, j); 
        else
            A9(i-3600,j) = train_data(i, j);
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

correct = false(1000,4);
minZ = 100;
Z = zeros(10,1);
result_digit = 0;
output_digits = zeros(1000,4);

for k=1:1000
    Y = test_data(k,:)';

    YHat0 = projection(Y, U05);
    YHat1 = projection(Y, U15);
    YHat2 = projection(Y, U25);
    YHat3 = projection(Y, U35);
    YHat4 = projection(Y, U45);
    YHat5 = projection(Y, U55);
    YHat6 = projection(Y, U65);
    YHat7 = projection(Y, U75);
    YHat8 = projection(Y, U85);
    YHat9 = projection(Y, U95);

    Z(10) = norm(Y - YHat0);
    Z(1) = norm(Y - YHat1);
    Z(2) = norm(Y - YHat2);
    Z(3) = norm(Y - YHat3);
    Z(4) = norm(Y - YHat4);
    Z(5) = norm(Y - YHat5);
    Z(6) = norm(Y - YHat6);
    Z(7) = norm(Y - YHat7);
    Z(8) = norm(Y - YHat8);
    Z(9) = norm(Y - YHat9);

    for t=1:10
        if Z(t) < minZ
            minZ = Z(t);
            result_digit = t;
        end
    end

    output_digits(k,1) = result_digit;

    if test_labels(k,1) == result_digit
        correct(k,1) = true;
    end

    minZ = 100;
    result_digit = 50;
end

for l=1:1000

    Y = test_data(l,:)';

    YHat0 = projection(Y, U010);
    YHat1 = projection(Y, U110);
    YHat2 = projection(Y, U210);
    YHat3 = projection(Y, U310);
    YHat4 = projection(Y, U410);
    YHat5 = projection(Y, U510);
    YHat6 = projection(Y, U610);
    YHat7 = projection(Y, U710);
    YHat8 = projection(Y, U810);
    YHat9 = projection(Y, U910);

    Z(10) = norm(Y - YHat0);
    Z(1) = norm(Y - YHat1);
    Z(2) = norm(Y - YHat2);
    Z(3) = norm(Y - YHat3);
    Z(4) = norm(Y - YHat4);
    Z(5) = norm(Y - YHat5);
    Z(6) = norm(Y - YHat6);
    Z(7) = norm(Y - YHat7);
    Z(8) = norm(Y - YHat8);
    Z(9) = norm(Y - YHat9);

    for t=1:10
        if Z(t) < minZ
            minZ = Z(t);
            result_digit = t;
        end
    end

    output_digits(l,2) = result_digit;

    if test_labels(l,1) == result_digit
        correct(l,2) = true;
    end

    minZ = 100;
    result_digit = 50;
end

for m=1:1000

    Y = test_data(m,:)';

    YHat0 = projection(Y, U015);
    YHat1 = projection(Y, U115);
    YHat2 = projection(Y, U215);
    YHat3 = projection(Y, U315);
    YHat4 = projection(Y, U415);
    YHat5 = projection(Y, U515);
    YHat6 = projection(Y, U615);
    YHat7 = projection(Y, U715);
    YHat8 = projection(Y, U815);
    YHat9 = projection(Y, U915);

    Z(10) = norm(Y - YHat0);
    Z(1) = norm(Y - YHat1);
    Z(2) = norm(Y - YHat2);
    Z(3) = norm(Y - YHat3);
    Z(4) = norm(Y - YHat4);
    Z(5) = norm(Y - YHat5);
    Z(6) = norm(Y - YHat6);
    Z(7) = norm(Y - YHat7);
    Z(8) = norm(Y - YHat8);
    Z(9) = norm(Y - YHat9);

    for t=1:10
        if Z(t) < minZ
            minZ = Z(t);
            result_digit = t;
        end
    end

    output_digits(m,3) = result_digit;

    if test_labels(m,1) == result_digit
        correct(m,3) = true;
    end

    minZ = 100;
    result_digit = 50;
end

for n=1:1000

    Y = test_data(n,:)';

    YHat0 = projection(Y, U020);
    YHat1 = projection(Y, U120);
    YHat2 = projection(Y, U220);
    YHat3 = projection(Y, U320);
    YHat4 = projection(Y, U420);
    YHat5 = projection(Y, U520);
    YHat6 = projection(Y, U620);
    YHat7 = projection(Y, U720);
    YHat8 = projection(Y, U820);
    YHat9 = projection(Y, U920);

    Z(10) = norm(Y - YHat0);
    Z(1) = norm(Y - YHat1);
    Z(2) = norm(Y - YHat2);
    Z(3) = norm(Y - YHat3);
    Z(4) = norm(Y - YHat4);
    Z(5) = norm(Y - YHat5);
    Z(6) = norm(Y - YHat6);
    Z(7) = norm(Y - YHat7);
    Z(8) = norm(Y - YHat8);
    Z(9) = norm(Y - YHat9);

    for t=1:10
        if Z(t) < minZ
            minZ = Z(t);
            result_digit = t;
        end
    end

    output_digits(n,4) = result_digit;

    if test_labels(n,1) == result_digit
        correct(n,4) = true;
    end

    minZ = 100;
    result_digit = 50;
end

num_correct = [0,0,0,0];

for q=1:4
    for d=1:1000
        if correct(d,q) == 1
            num_correct(q) = num_correct(q) + 1;
        end
    end
    num_correct(q) = (num_correct(q)/1000)*100; 
end

x = 5:5:20;
SpecificTask1(x,num_correct);

difficulty_to_classify = zeros(1000,1);
my_counter = 0;
for a=1:1000
    for b=1:4
        if correct(a,b) == 0
            my_counter = my_counter + 1;
        end
    end
    difficulty_to_classify(a) = my_counter;
    my_counter = 0;
end

SpecificTask2 = [1 0;2 0;3 0;4 0;5 0;6 0;7 0;8 0;9 0;10 0];
for o=1:1000
    if difficulty_to_classify(o) > 0
        SpecificTask2(test_labels(o),2) = SpecificTask2(test_labels(o),2) + 1;
    end
end


SpecificTask3 = [1 0 0 0 0;2 0 0 0 0;3 0 0 0 0;4 0 0 0 0;5 0 0 0 0;6 0 0 0 0;
    7 0 0 0 0;8 0 0 0 0;9 0 0 0 0;10 0 0 0 0];
for r=1:4
    for s=1:1000
        if correct(s,r) == 0
            SpecificTask3(test_labels(s),r+1) = SpecificTask3(test_labels(s),r+1) + 1;
        end
    end
end

PartB_correct = false(1000,2);
PartB_minZ = 100;
PartB_result_digit = 50;
PartB_output_digits = zeros(1000,2);
PartB_num_correct = 0;
Z = zeros(10,1);

U01  = U0(:,1);
U11  = U1(:,1);
U21  = U2(:,1);
U31  = U3(:,1);
U41  = U4(:,1);
U51  = U5(:,1);
U61  = U6(:,1);
U71  = U7(:,1);
U81  = U8(:,1);
U91  = U9(:,1);

for v=1:1000
    Y = test_data(v,:)';

    YHat0 = projection(Y, U01);
    YHat1 = projection(Y, U11);
    YHat2 = projection(Y, U21);
    YHat3 = projection(Y, U31);
    YHat4 = projection(Y, U41);
    YHat5 = projection(Y, U51);
    YHat6 = projection(Y, U61);
    YHat7 = projection(Y, U71);
    YHat8 = projection(Y, U81);
    YHat9 = projection(Y, U91);

    Z(10) = norm(Y - YHat0);
    Z(1) = norm(Y - YHat1);
    Z(2) = norm(Y - YHat2);
    Z(3) = norm(Y - YHat3);
    Z(4) = norm(Y - YHat4);
    Z(5) = norm(Y - YHat5);
    Z(6) = norm(Y - YHat6);
    Z(7) = norm(Y - YHat7);
    Z(8) = norm(Y - YHat8);
    Z(9) = norm(Y - YHat9);

    for t=1:10
        if Z(t) < PartB_minZ
            PartB_minZ = Z(t);
            PartB_result_digit = t;
        end
    end

    PartB_output_digits(v,1) = PartB_result_digit;

    if test_labels(v,1) == PartB_result_digit
        PartB_correct(v,1) = true;
        PartB_num_correct = PartB_num_correct + 1;
    end

    if PartB_correct(v,1) == 1
        PartB_correct(v,2) = true;
    end

    if PartB_correct(v,2) == 0
        if test_labels(v,1) == 10
            YHat0 = projection(Y, U010);
            Z(10) = norm(Y - YHat0);
        elseif test_labels(v,1) == 1
            YHat1 = projection(Y, U110);
            Z(1) = norm(Y - YHat1);
        elseif test_labels(v,1) == 2
            YHat2 = projection(Y, U220);
            Z(2) = norm(Y - YHat2);
        elseif test_labels(v,1) == 3
            YHat3 = projection(Y, U315);
            Z(3) = norm(Y - YHat3);
        elseif test_labels(v,1) == 4
            YHat4 = projection(Y, U45);
            Z(4) = norm(Y - YHat4);
        elseif test_labels(v,1) == 5
            YHat5 = projection(Y, U520);
            Z(5) = norm(Y - YHat5);
        elseif test_labels(v,1) == 6
            YHat6 = projection(Y, U620);
            Z(6) = norm(Y - YHat6);
        elseif test_labels(v,1) == 7
            YHat7 = projection(Y, U715);
            Z(7) = norm(Y - YHat7);
        elseif test_labels(v,1) == 8
            YHat8 = projection(Y, U820);
            Z(8) = norm(Y - YHat8);
        elseif test_labels(v,1) == 9
            YHat9 = projection(Y, U920);
            Z(9) = norm(Y - YHat9);
        end

        for t=1:10
            if Z(t) < PartB_minZ
                PartB_minZ = Z(t);
                PartB_result_digit = t;
            end
        end

        PartB_output_digits(v,2) = PartB_result_digit;

        if test_labels(v,1) == PartB_output_digits(v,2)
            PartB_correct(v,2) = true;
            PartB_num_correct = PartB_num_correct + 1;
        end

        
    end


    PartB_minZ = 100;
    PartB_result_digit = 50;
end

disp('done')
