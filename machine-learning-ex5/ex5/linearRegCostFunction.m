function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%



h =  X * theta;
thetaNoBias = theta(2:1:end);
xNoBias = X(:,2:end);
err = h - y;
J = sumsq( err ) + lambda .* sumsq( thetaNoBias );

J = 1/(2*m) * J;

grad(1) = 1 / m * sum( err ) ;
i = 0;

for j = 2:length(theta),
grad(j) = 1/m * X(:,j)' * (h - y) + lambda/(m) * theta(j) ;
j = j + 1;
end;




% =========================================================================

grad = grad(:);

end
