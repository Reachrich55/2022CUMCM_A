function [Max,Min] = findA(x,Max,Min)

count1=1;
count2=1;
for i=2:size(x)-1
    
    if x(i)>x(i-1) && x(i)>x(i+1)
        Max(end,count1)=x(i);
        count1=count1+1;
    end
    if x(i)<x(i-1) && x(i)<x(i+1)
        Min(end,count2)=x(i);
        count2=count2+1;
    end
end
% A=mean(Max);
