% plotCumulative.m
% Plots the cumulative probabilites of finishing the game in n moves or
% less 

function plotCumulative(handles,randplot, randtarplot, parplot, probplot, probtarplot)

% Five arrays one for each strategy
% Each array contains the number of turns it took to finish each simulated
% game in each placeholder
% Array for random call randplot
% Array for random with targeting call randtarplot
% Array for parity call parplot
% Array for probability call probplot
% Array for probability with targeting call probtarplot

[~,sizeArray] = size(randplot);

tblrand = tabulate(randplot);
tblrandtar = tabulate(randtarplot);
tblpar = tabulate(parplot);
tblprob = tabulate(probplot);
tblprobtar = tabulate(probtarplot);

x = linspace(1,100,100);


% Gets percentage of winning with number of turns or less
% for random
for ix = 1:100
    rand(ix) = sum(tblrand(1:ix,2));
    randper(ix) = 100 .* (rand(ix)./sizeArray);
end
% for random with targeting
for ix = 1:100
    randtar(ix) = sum(tblrandtar(1:ix,2));
    randtarper(ix) = 100 .* (randtar(ix)./sizeArray);
end
% for parity
for ix = 1:100
    par(ix) = sum(tblpar(1:ix,2));
    parper(ix) = 100 .* (par(ix)./sizeArray);
end
% for probability
for ix = 1:100
    prob(ix) = sum(tblprob(1:ix,2));
    probper(ix) = 100 .* (prob(ix)./sizeArray);
end
% for probability with targeting
for ix = 1:100
    probtar(ix) = sum(tblprobtar(1:ix,2));
    probtarper(ix) = 100 .* (probtar(ix)./sizeArray);
end

% Plot function
plot(handles.graphDisplay,x,randper,'r',x,randtarper,'b',x,parper,'g',...
    x,probper,'y',x,probtarper,'k')
grid on
xlabel(handles.graphDisplay,'Number of shots')
ylabel(handles.graphDisplay,'Cumulative percentage of games completed')
legend(handles.graphDisplay,'Random','Random with targeting','Parity with targeting',...
    'Probability','Probability with targeting','Location','northwest')
axis(handles.graphDisplay,[1,100,1,110])