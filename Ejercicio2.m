
%% Funciones auxiliares
function [raiz, iter] = newton_raphson(f, df, x0, max_iter)
    for iter = 3:max_iter
        x1 = x0 - f(x0) / df(x0);
        x0 = x1;
    end
    raiz = x0;
end

function [raiz, iter] = secante(f, x0, x1, max_iter)
    for iter = 3:max_iter
        x2 = x1 - (f(x1) * (x1 - x0)) / (f(x1) - f(x0));
        x0 = x1;
        x1 = x2;
    end
    raiz = x1;
end

%% Ejercicio 2
f2 = @(x) x.^3 - 2*x - 5;
df2 = @(x) 3*x.^2 - 2;

x0 = 2; % Punto inicial para Newton-Raphson
[newton_raiz, iteraciones_n] = newton_raphson(f2, df2, x0, 3);
fprintf('Raíz aproximada con Newton-Raphson: %f en %d iteraciones\n', newton_raiz, iteraciones_n);

x0 = 1; x1 = 2; % Puntos iniciales para el método de la secante
[secante_raiz, iteraciones_s] = secante(f2, x0, x1, 3);
fprintf('Raíz aproximada con Secante: %f en %d iteraciones\n', secante_raiz, iteraciones_s);