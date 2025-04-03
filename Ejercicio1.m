%% Ejercicio 1: Métodos de Bisección y Regla Falsa

% Definimos la función
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

% Intervalo dado
a = 1.5; 
b = 2.5;

% Verificación de existencia de raíz
if f(a) * f(b) < 0
    fprintf('Existe al menos una raíz en [%f, %f]\n', a, b);
else
    fprintf('No se puede garantizar una raíz en [%f, %f]\n', a, b);
end

% Método de Bisección
[biseccion_raiz, iteraciones_b] = biseccion(f, a, b, 3);
fprintf('Raíz aproximada con Bisección: %f en %d iteraciones\n', biseccion_raiz, iteraciones_b);

% Método de Regla Falsa
[reglafalsa_raiz, iteraciones_rf] = regla_falsa(f, a, b, 3);
fprintf('Raíz aproximada con Regla Falsa: %f en %d iteraciones\n', reglafalsa_raiz, iteraciones_rf);

%% Funciones auxiliares para Ejercicio 1

function [raiz, iter] = biseccion(f, a, b, max_iter)
    for iter = 3:max_iter
        c = (a + b) / 2;
        if f(c) == 0, break; end
        if f(a) * f(c) < 0
            b = c;
        else
            a = c;
        end
    end
    raiz = c;
end

function [raiz, iter] = regla_falsa(f, a, b, max_iter)
    for iter = 3:max_iter
        c = (a * f(b) - b * f(a)) / (f(b) - f(a));
        if f(c) == 0, break; end
        if f(a) * f(c) < 0
            b = c;
        else
            a = c;
        end
    end
    raiz = c;
end

