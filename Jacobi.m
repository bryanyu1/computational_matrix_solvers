function [x_new,iter] = Jacobi(A,b)
    it = 1; 
    y = 0;
    N = size(A,1);
    x_new = zeros(N,1); 
    x_old = zeros(N,1);
    tol = 1;
    while (it <= 1000) && (tol >= 10.^(-6)) 
        x_old = x_new; 
        for j = 1:N
            for i = 1:N 
                if j ~= i
                    y = y + A(j,i) * x_old(i);
                end
            end
            x_new(j) = (1 / A(j,j)) * (b(j) - y);
            y = 0;
        end 
        it = it + 1;
        tol = norm(x_new - x_old,2);
    end
    iter = it - 1
end
