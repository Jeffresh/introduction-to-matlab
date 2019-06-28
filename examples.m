% Pr?ctica 1 RP - Introducci?n a matlab


%% Ejercicio 1 Dibujar la siguiente función definida por partes: 
%%x2 – x + 3, -2 <= x < 2 
%%2x + 1, 2 <= x < 4 
%%En la primera parte, x debe variar a intervalos de 0.05 y en la segunda parte, a 
%%intervalos de 0.01 


x1 = [-2:0.05:2];
x2 = [2:0.01:4];

f1 = x1.^2 - x1 + 3;
f2 = 2*x2 +1;


plot(x1,f1); hold on;
plot(x2,f2); hold off;
title('Funci?n a trozos ejercicio 1');
legend('x^2 - x + 3, -2<x<=2', '2*x + 1, 2<=x<4','Location','SouthEast');


%% Ejercicio 2
%%Dibujar en una sola ventana con dos subventanas las funciones 
%%y = x2 – 3x – 2 
%%y 
%%z  =  x3  –  2x+1  
%%con x variando entre -5 y 5 a intervalos de 0.02. La primera en
%%líneas verdes continuas, la segunda en líneas azules discontinuas. Marcar con ‘+’ 
%%rojo el punto (2, 1) en ambas gráficas. 

x = -5:0.02:5;
y = 2*x - 3*x -2 ;
z = 3*x - 2*x + 1 ;


subplot(2,1,1), plot(x,y,'g'), hold on, plot(2,2,'+r'), hold off;
subplot(2,1,2), plot(x,z,'--b'), hold on, plot(2,2,'+r'), hold off;

%% Ejercicio 3. 
%%Abre  la imagen  spine.tif,  añádele  ruido  del  tipo  sal  y  pimienta y aplícale los 
%%filtros aprendidos anteriormente. 

A = imread('spine.tif');
% B(:,:,4) =[];
S = imnoise(A,'salt & pepper',0.1);
h1 = fspecial('average');
h2 = fspecial('gaussian');
media = imfilter(S,h1);
gauss = imfilter(S,h2);
mediana = medfilt2(S);

subplot(1,5,1),imshow(A),title('Imagen original');
subplot(1,5,2),imshow(S),title('Imagen con ruido sal y pimienta');
subplot(1,5,3),imshow(media),title('Filtro de la media');
subplot(1,5,4),imshow(mediana),title('Filtro de la mediana ');
subplot(1,5,5),imshow(gauss),title('Filtro gaussiano');

%% Ejercicio 4. 
%%Abre  la  imagen  peppers.png,  añádele  ruido  gaussiano  y  aplícale 
%%los  filtros aprendidos  anteriormente. Observa  qué ocurre con sus histogramas. 

A = imread('spine.tif');
Sg = imnoise(A,'gaussian',0.1);

h1 = fspecial('average');
h2 = fspecial('gaussian');

media = imfilter(Sg,h1);
gauss = imfilter(Sg,h2);
mediana = medfilt2(Sg);

figure,
subplot(1,5,1), imshow(A),title('Imagen original');
subplot(1,5,2), imshow(Sg),title('Imagen con ruido gaussiano');
subplot(1,5,3), imshow(media),title('Filtro de la media');
subplot(1,5,4), imshow(mediana), title('Filtro de la mediana');
subplot(1,5,5), imshow(gauss), title('Filtro gaussiano');
figure,
subplot(1,5,1), histogram(A),title('Imagen original');
subplot(1,5,2), histogram(Sg),title('Imagen con ruido gaussiano');
subplot(1,5,3), histogram(media),title('Filtro de la media');
subplot(1,5,4), histogram(mediana), title('Filtro de la mediana');
subplot(1,5,5), histogram(gauss), title('Filtro gaussiano');