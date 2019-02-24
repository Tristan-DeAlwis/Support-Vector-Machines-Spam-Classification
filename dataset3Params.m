function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns the optimal (C, sigma) learning parameters to use
%for SVM with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma.

% Find best values for:
C = [.01; .03; 0.1; 0.3; 1; 3; 10; 30];
sigma = [.01; .03; 0.1; 0.3; 1; 3; 10; 30];

i = 1;
j = 1;
k = 1;
mat = [];
while i < 65
    
    while j < 9
        
        while k < 9
            model = svmTrain(X, y, C(j), @(x1, x2) gaussianKernel(x1, x2, sigma(k)));
    
            %Calculate error of CV test set
            predictions = svmPredict(model, Xval);
            error = mean(double(predictions ~= yval));
        
            % Matrix with values of C, sigma and their corresponding error
            mat(i,1) = C(j);
            mat(i,2) = sigma(k);
            mat(i,3) = error;
            k = k + 1;
            i = i + 1;
        end
        
        k = 1;
        j = j + 1;
    end
    
    j = 1;
end

%Chooses best C and sigma combo with lowest error
[error, ind] = min(mat(:,3));

C = mat(ind, 1);
sigma = mat(ind, 2);
    
end
