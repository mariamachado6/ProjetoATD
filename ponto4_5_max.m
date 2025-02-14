function [vetor_picosMax_W, vetor_picosMax_WU, vetor_picosMax_WD] = ponto4_5_max(nome, data, fig, matriz_atividade)
    
    %=========PICO MAXIMO=========
    vetor_picosMax_W = [];
    vetor_picosMax_WU = [];
    vetor_picosMax_WD = [];
    
    %===============================
    
    t=0:7/(numel(data)-1):7;
    
    anterior=t(1,1);
    minimo = min(data);
    maximo = max(data);
   
%========================================================================
        
    %Analise
    
    for i=1:length(matriz_atividade)
        atividade = matriz_atividade(i,1);   %SABER A ATIVIDADE ASSOCIADA E POR COMO LEGENDA
        tipo=typeLabels(atividade);
        inicio=matriz_atividade(i,2);        %SABER O INICIO DA ATIVIDADE
        fim=matriz_atividade(i,3);           %SABER O FIM DA ATIVIDADE
        if inicio~=anterior+1                %COLOCAR OS INTERVALOS NAO DEFINIDOS NO SINAL NO PLOT A PRETO
            atividade_acc=data(anterior+1:(inicio-1),:);
            t_atividade=t(1,anterior+1:(inicio-1));   
        end
        atividade_acc=data(inicio:fim,:);
        
% =============================== Ponto4 ===============================
        discrete_fourier_transform = dFT(atividade_acc);
       

% ============================== Ponto4.3 ==============================
        [picoMaximo, primeiroPico, ultimoPico] = calcPicos(discrete_fourier_transform);
        %Atividade Dinamica
        if (strcmp(nome,'acc-exp01-user01.txt ACC-X')==1)
             if (tipo == "W")
                 vetor_picosMax_W = [vetor_picosMax_W picoMaximo];
             elseif (tipo == "W-U")
                 vetor_picosMax_WU = [vetor_picosMax_WU picoMaximo];
             elseif (tipo == "W-D")
                 vetor_picosMax_WD = [vetor_picosMax_WD picoMaximo];
             end
            
        elseif (strcmp(nome,'acc-exp01-user01.txt ACC-Y')==1)
            if (tipo == "W")
                 vetor_picosMax_W = [vetor_picosMax_W picoMaximo];
             elseif (tipo == "W-U")
                 vetor_picosMax_WU = [vetor_picosMax_WU picoMaximo];
             elseif (tipo == "W-D")
                 vetor_picosMax_WD = [vetor_picosMax_WD picoMaximo];
             end
            
        elseif (strcmp(nome,'acc-exp01-user01.txt ACC-Z')==1)
            if (tipo == "W")
                 vetor_picosMax_W = [vetor_picosMax_W picoMaximo];
             elseif (tipo == "W-U")
                 vetor_picosMax_WU = [vetor_picosMax_WU picoMaximo];
             elseif (tipo == "W-D")
                 vetor_picosMax_WD = [vetor_picosMax_WD picoMaximo];
             end
            
        end       
             
%     % ======================================================================

         anterior=fim;
         
    end
    
    hold off
    

