%% Exercise 6- Associative memory Hopfield network

% Yair Lahad
clear; close all; clc;
% This code creates numerical simulation of attractors in a netwrok of neurons
% Using an Hopfield network with Asynchronous dynamic


%% Parameters and initialization
N=200;        % neurons number
P=3;          % Memory patterns
nSteps = 50;  % steps number
%probabilities vector (given)
q = [0, 0.1, 0.2, 0.3, 0.35, 0.36, 0.37, 0.38, 0.39, 0.4, 0.45, 0.5];
finalOverlap = zeros(length(q), P);  %  final overlap vector

% HopeField Network Allocations
J = zeros(N);  % weights matrix
memoryPatterns = randi([0, 1], N, P); % Creating random sampels
memoryPatterns(memoryPatterns == 0) = -1;   % update inactive neurons
randPatt = randi(P); % Pick random pattern
initState = memoryPatterns(:, randPatt); % initial state


%% Simulation and Computations

% Computing weights matrix
for i = 1 : length(J)
    for j = 1 : length(J)
        J(i, j) = sum(memoryPatterns(i, :) .* memoryPatterns(j, :));
    end
end
J = J - diag(diag(J));   % reset diagonal values to zero

% Run over all the q values choosen
for curr_q = 1 : length(q)
    overlap = zeros(nSteps, P); % current overlap vector
    for step = 1 : nSteps
        state = initState;  % initial state
        % Invert the choosen pattern
        randVals=rand(N, 1);
        state(randVals<q(curr_q))=state(randVals<q(curr_q))*-1;
        
        % Run Hopfield simulation
        [energy, finalState] = HopfieldNetwork(J, state);
        
        % Compute overlap of the final state for each memory pattern
        overlap(step, :) = 1/N .* memoryPatterns(:, :)' * finalState;
    end
    % Mean overlap over Simulations
    finalOverlap(curr_q, :) = mean(overlap);
end

% plotting
plotFigures(q,finalOverlap,energy);

