clc;  // limpa a janela de comando
clear;  // limpa a memória


//1. Implemente um neurônio Perceptron com valores de pesos inicialmente aleatórios
//para revolver o problema do AND com duas variáveis. O programa deverá plotar os
//pontos da tabela-verdade e a reta de separação obtida.

// entradas
X1 = [0 0 1 1];
X2 = [0 1 0 1];

// tamanho do vetor de entradas
N = length(X1);
// saída
d = [0 0 0 1];
// pesos inicialmente aleatórios
w = rand(1,3);

// quantidade de épocas
epoca = 7;

// taxa de aprendizado
aprendizado = 0.05;

//Selecionar vetor de entrada x(t)
x = [-1*ones(1,N);X1;X2];

i = 1   
for ciclo = 1:epoca
    if( i <= 3) then 
        i = i + 1
    else
        i = 1
    end
    j = 1;
    while j==1
        //funcao ativacao u(t)
        u = w*x(:,i);
        printf('%d época \n\',ciclo);
        printf('valor do u %d\n',u);
        // calcular a função degrau saída y(t)
        if (u > 0) then // no caso quando u(t) for maior que 0 atribui o valor de 1 para y
            y = 1;
        else // no caso quando u(t) for igual 0 atribui o valor de 0 para y
            y = 0;
        end
        //c alculo do erro e(t) = d(t) - y(t)
        printf('valor do y = %d\n',y);
        e = d(i) - y;
        printf('valor do e = %d \n\n',e);
        if e==0 then
           w = w
           j = 0;
        else
           // algoritmo de aprendizado ajustar pesos via regra de aprendizagem
           w = w + (aprendizado * e * x(:,i))';
           printf('valor do u = %d , ocorreu aprendizado',w);
           erro=1;
        end
         printf('\n\n\n');
    end
end

//---- marcação de área de classificação
for i=1:4
    if d(i)==1
        plot(X1(i),X2(i),'ko:');
     else
        plot(X1(i),X2(i),'r+:');
     end
end
mtlb_axis([-0.5 1.5 -0.5 1.5])

//---- plotando a reta de classificação
k=0;
for i=-5:0.01:5
    k=k+1;
     XX(k)=i;
     YY(k)=-((w(2)*i)/w(3))-((w(1)*-1)/w(3));
end
plot(XX,YY);
mtlb_axis([-0.5 1.5 -0.5 1.5])







