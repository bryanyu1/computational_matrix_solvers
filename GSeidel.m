function [x_new,iter] = GSeidel(A,b)
    it = 1; 
    y = 0; 
    z = 0; 
    N = size(A,1);
    x_new = zeros(N,1); 
    x_old = zeros(N,1);
    tol = 1;
    while (it <= 1000) && (tol >= 10.^(-6))
        x_old = x_new;
        for j = 1:N 
            for i = 1:(j - 1)
                y = y + A(j,i) * x_new(i);
            end
            for s = (j + 1):N
                z = z + A(j,s) * x_old(s);
            end
            x_new(j) = (1 / A(j,j)) * (b(j) - y - z);
            y = 0;
            z = 0;
        end
        it = it + 1; 
        tol = norm(x_new - x_old,2);
    end
    iter = it - 1
end
