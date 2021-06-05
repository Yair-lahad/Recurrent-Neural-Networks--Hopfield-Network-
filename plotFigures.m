function plotFigures(q,finalOverlap,energy)

% input overlap mean vector, energy vector and q

% Plot Overlap as function of q
figure
plot(q, finalOverlap, 'linewidth', 2)
title('Mean overlap as function of q')
xlabel('q value')
ylabel('Overlap')
legend({'Chosen Memory', 'Memory #2', 'Memory #3'}...
    ,'Location', 'northwest')

% Plot energy
figure
plot(1 : length(energy), energy, 'linewidth', 2)
title('Energy As Function Of Steps')
xlabel('Step Number')
ylabel('Energy')
end