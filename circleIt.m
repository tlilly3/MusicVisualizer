function [ circleMat ] = circleIt( freq, db )
j = mean(db(freq<100));
i = mean(db(freq>=100 & freq<200));
h = mean(db(freq>=200 & freq<300));
g = mean(db(freq>=300 & freq<500));
f = mean(db(freq>=500 & freq<700));
e = mean(db(freq>=700 & freq<900));
d = mean(db(freq>=900 & freq<1100));
c = mean(db(freq>=1100 & freq<1300));
b = mean(db(freq>=1300 & freq<1500));
a = mean(db(freq>1500));

circleMat = [a a a a a a a a a a a a a a a a a a a;...
             a b b b b b b b b b b b b b b b b b a;...
             a b c c c c c c c c c c c c c c c b a;... 
             a b c d d d d d d d d d d d d d c b a;... 
             a b c d e e e e e e e e e e e d c b a;... 
             a b c d e f f f f f f f f f e d c b a;... 
             a b c d e f g g g g g g g f e d c b a;... 
             a b c d e f g h h h h h g f e d c b a;... 
             a b c d e f g h i i i h g f e d c b a;... 
             a b c d e f g h i j i h g f e d c b a;... 
             a b c d e f g h i i i h g f e d c b a;... 
             a b c d e f g h h h h h g f e d c b a;... 
             a b c d e f g g g g g g g f e d c b a;... 
             a b c d e f f f f f f f f f e d c b a;... 
             a b c d e e e e e e e e e e e d c b a;... 
             a b c d d d d d d d d d d d d d c b a;... 
             a b c c c c c c c c c c c c c c c b a;... 
             a b b b b b b b b b b b b b b b b b a;... 
             a a a a a a a a a a a a a a a a a a a];
end
% [
%   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
%   0 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 0 
%   0 0 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 0 0 
%   0 0 0 4 4 4 4 4 4 4 4 4 4 4 4 4 0 0 0 
%   0 0 0 0 5 5 5 5 5 5 5 5 5 5 5 0 0 0 0 
%   0 0 0 0 0 6 6 6 6 6 6 6 6 6 0 0 0 0 0 
%   0 0 0 0 0 7 7 7 7 7 7 7 0 0 0 0 0 0 
%   0 0 0 0 0 0 0 8 8 8 8 8 0 0 0 0 0 0 0 
%   0 0 0 0 0 0 0 0 9 9 9 0 0 0 0 0 0 0 0 
%   0 0 0 0 0 0 0 0 0 100 0 0 0 0 0 0 0 0 
%   0 0 0 0 0 0 0 0 9 0 9 0 0 0 0 0 0 0 0 
%   0 0 0 0 0 0 0 8 0 0 0 8 0 0 0 0 0 0 0 
%   0 0 0 0 0 0 7 0 0 0 0 0 7 0 0 0 0 0 0 
%   0 0 0 0 0 6 0 0 0 0 0 0 0 6 0 0 0 0 0 
%   0 0 0 0 5 0 0 0 0 0 0 0 0 0 5 0 0 0 0 
%   0 0 0 4 0 0 0 0 0 0 0 0 0 0 0 4 0 0 0 
%   0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 
%   0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 
%   1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
%                                         ]