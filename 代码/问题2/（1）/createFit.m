function [fitresult, gof] = createFit(tmp1, tmp2)
%CREATEFIT(TMP1,TMP2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : tmp1
%      Y Output: tmp2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 17-Sep-2022 12:51:04 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( tmp1, tmp2 );

% Set up fittype and options.
ft = fittype( 'a*sin(2.2143*x+b)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.8002804688888 0.141886338627215];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', '相对速度' );
h = plot( fitresult, xData, yData );
legend( h, 'tmp2 vs. tmp1', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 't', 'Interpreter', 'none' );
ylabel( '相对速度', 'Interpreter', 'none' );
grid on


