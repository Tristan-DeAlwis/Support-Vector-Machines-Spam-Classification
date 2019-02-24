function sim = gaussianKernel(x1, x2, sigma)
%RBFKERNEL returns a radial basis function kernel between x1 and x2
%   sim = gaussianKernel(x1, x2) returns a gaussian kernel between x1 and x2
%   and returns the value in sim

% Ensuring that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

sim = 0;

%Computing the Gaussian Kernel
numerator = sum((x1 - x2).^2);
denominator = 2 * (sigma^2);
K_gaussian = exp( -1 * ( numerator / denominator ) );

sim = K_gaussian;

end
