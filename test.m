%https://en.wikipedia.org/wiki/Test_functions_for_optimization
%made with https://www.mathworks.com/help/gads/minimize-rastrigins-problem-based.html
%https://www.mathworks.com/help/gads/ga.html



sphere = @(x,y) x.^2;

ras = @(x, y) 20 + x.^2 + y.^2 - 10*(cos(2*pi*x) + cos(2*pi*y)); % making a varible for Rastrigin's function https://en.wikipedia.org/wiki/Rastrigin_function

beale = @(x,y) (1.5-x+x*y)^2 + (2.25 - x +x*y^2)^2 + (2.625 - x + x*y^3)^2;

booth = @(x,y) (x+2*y-7)^2+(2*x+y-5)^2;


%equations = {sphere;ras};

%for eq = equations

newScale = @(x,y) sphere(x/5, y,5);
fsurf(newScale,[-50,50],"ShowContours","on")
title("Function")
xlabel("x")

x = optimvar("x","LowerBound",-100,"UpperBound",100);
y = optimvar("y","LowerBound",-100,"UpperBound",100);

prob = optimproblem("Objective",sphere(x,y));

options = optimoptions("ga","PlotFcn",@gaplotbestf,"MaxGenerations",100,"FunctionTolerance",10e-10,"PopulationSize",50);

rng default

[sol, fval] = solve(prob,"Solver","ga","Options",options);

%end