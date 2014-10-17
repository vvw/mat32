clear all; close all; clc

x=load('ex2x.dat');
y=load('ex2y.dat');

figure % open a new figure window
plot(x, y, 'o');
ylabel('Height in meters')
xlabel('Age in years')
m = length(y); % store the number of training examples
X = [ones(m, 1), x]; % Add a column of ones to x
% 增加了这一列以后，要特别注意，现在年龄这一变量已经移动到了第二列上。

fprintf('Running Gradient Descent ...\n')

theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
num_iters = 1500;
alpha = 0.07;

% run gradient descent
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    temp0 = 0;
    temp1 = 0;
    
    for i = 1:m
        temp0 = temp0 + (theta' * X(i,:)' - y(i));
        temp1 = temp1 + (theta' * X(i,:)' - y(i)) * X(i,2);
    end
    
    theta(1) = theta(1) - (alpha/m) * temp0;
    theta(2) = theta(2) - (alpha/m) * temp1;

    % ============================================================

    % Save the cost J in every iteration    
    %J_history(iter) = computeCost(X, y, theta);

end

% print theta to screen
fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure




