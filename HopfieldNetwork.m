function [energy, finalState] = HopfieldNetwork(J, state)

% Runs a Hopfield network until reaching stability
%input: J- weights matrix, state- initial state on network
%output: energy function per step, final state of simulation

% Allocations
N  = size(J, 1);  % neurons number
isChanged = 1;    % indicates whether we should stop the run
step = 0;         % step counter

% Run Network - asynchronically iteration Dynamic- one neuron each time
while isChanged
    isChanged = 0;
    for i = 1 : N
        step = step + 1;
        % Compute new neuron value
        energy(step) = -1/2 * state' * J * state;
        newState = sign(J(i, :) * state);
        if state(i) ~= newState
            state(i) = newState;
            isChanged = 1;      % run until reaches stability
        end
        if state(i) == 0
            state(i) = 1;    % update exact zero value to 1
        end
    end
end
finalState = state; % Return the final state
