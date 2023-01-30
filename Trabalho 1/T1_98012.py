## Importar as packages necessárias

import networkx as nX
import matplotlib.pyplot as plt
from math import floor
import random
from itertools import combinations
import time
#import numpy as np


# Função que gera o grafo com a seed do Nmec
def generate_graph(s,p):
    graph = nX.fast_gnp_random_graph(s,p,seed = 98012, directed = False)

    return graph

# Função para gerar as coordenadas de cada vértices
def coordinates(s):

    coord = [[0 for x in range(2)] for x in range(s)]

    for i in range(s):
        coord[i][0] = random.randint(0,20)
        coord[i][1] = random.randint(0,20)


    return coord


# Algortimo Heuristico
def heuristc(s,k,G,Vert_Init):
    global op_heuristic    
    global N_conf_H
    N_conf_H = 0                                                            # Variavel para contar o nº de Configurações
    op_heuristic = 0                                                        # Variavel para contar o nº de operações

    vert = [x for x in range(s)]                                            # list com todos os nº de vertices possiveis -> [0,1,2,3,...,s]
    

    Length = floor(s*k)                                                     # Tamanho do set que se quer

    list_combinations = []                                                  # Vamos ver todas as combinações possíveis
    for n in range(len(vert) + 1):                                          # Pondo tudo dentro deste for torna-se mais rapidos pois não se guarda todas as combinações possiveis, o que para grafos grandes tornava-se bastante dispendioso
        for comb in combinations(vert, n):
            if Vert_Init in comb:                                           # Opção Heuristica - Apenas ver sets que contenham o vértice Vert_Init, na solução proposta este valor é 0 
                if len(comb) == Length:                                     # Apenas queremos as combinações com o tamanho pretendido
                    list_combinations.append(comb)


        n_comb = len(list_combinations)

        for a in range(n_comb):
            N_conf_H = N_conf_H + 1
            S = list(list_combinations[a])                                  # Vai iterando e vendo a combinação
            result =  [0 for x in range(s)]
            for c in range(len(vert)):
                op_heuristic = op_heuristic + 1                             # Para contar o número de operações -> dentro do for mais interior
                check = vert[c]                                             # Vai iterando e vendo o vertice
                K = list(G.neighbors(check))
                if check not in S:                                          # Definição de set dominante -> Todo o vertice não em S
                    if any(i in K for i in S):                              # É adjacente a pelo menos 1 vertice em S
                        result[c] = 1
                    else:
                        result[c] = -1                                      # Para invalidar os sets

            if -1 not in result:                                            # Se o set é válido pode retornar e parar a execução
                return S


    return []                                                               # Se chegar ao fim e não encontrar retorna o conjunto vazio


# Algoritmo Exaustivo
def exaustive(s,k,G):
    global op_exaustive
    global N_conf_E
    N_conf_E = 0                                                            # Variavel para contar o nº de Configurações
    op_exaustive = 0                                                        # Variavel para contar o nº de operações

    vert = [x for x in range(s)]                                            # list com todos os nº de vertices possiveis -> [0,1,2,3,...,s]

    Length = floor(s*k)

    list_combinations = []                                                  # Vamos ver todas as combinações possíveis
    for n in range(len(vert) + 1):                                          # Pondo tudo dentro deste for torna-se mais rapidos pois não se guarda todas as combinações possiveis, o que para grafos grandes tornava-se bastante dispendioso
        for comb in combinations(vert, n):
            if len(comb) == Length:                                         # Apenas queremos as combinações com o tamanho pretendido
                list_combinations.append(comb)

        n_comb = len(list_combinations)

        for a in range(n_comb):
            N_conf_E = N_conf_E + 1
            S = list(list_combinations[a])                                  # Vai iterando e vendo a combinação
            result =  [0 for x in range(s)]
            for c in range(len(vert)):
                check = vert[c]                                             # Vai iterando e vendo o vertice
                K = list(G.neighbors(check))
                op_exaustive = op_exaustive + 1                             # Para contar o número de operações -> dentro do for mais interior
                if check not in S:                                          # Definição de set dominante -> Todo o vertice não em S
                    if any(i in K for i in S):                              # É adjacente a pelo menos 1 vertice em S
                        result[c] = 1
                    else:
                        result[c] = -1                                      # Para invalidar os sets

            if -1 not in result:                                            # Se o set é válido pode retornar e parar a execução
                return S

    return []                                                               # Se chegar ao fim e não encontrar retorna o conjunto vazio

def main():
    global op_exaustive                                                     # Contador do número de operação básicas para o Algortimo Exaustivo
    global op_heuristic                                                     # Contador do número de operação básicas para o Algortimo Hueristico
    global N_conf_H                                                         # Contador do número de conjuntos analisados para o Algortimo Exaustivo
    global N_conf_E                                                         # Contador do número de conjuntos analisados para o Algortimo Hueristico

    P_list = [0.125,0.25,0.5,0.75]                                          # Dado duas arestas P corresponde a probabilidade de ela existir, serve para tornar os grafos mais/menos densos
    K = [0.125,0.25,0.5,0.75]                                               # K, do problema
    S = [x for x in range(4,31)]                                            # Tamanho do grafo

    Vert_Init_Heuristic = 0                                                 # Opção do Utilizador para o algoritmo Heurisitco, na solução proposta este valor é 0


    for z in range(len(P_list)):
        P = P_list[z]

        for r in range(len(K)):
            k = K[r]

            h_time = [0 for x in range(len(S))]                             # Tempo Heuristica
            e_time = [0 for x in range(len(S))]                             # Tempo Exaustiva 
            h_op = [0 for x in range(len(S))]                               # Operações Heuristica
            e_op = [0 for x in range(len(S))]                               # Operações Exaustiva 
            n_solutions_E = [0 for x in range(len(S))]                      # Nº Soluções Exaustiva
            n_solutions_H = [0 for x in range(len(S))]                      # Nº Soluções Heuristica
            n_config_E = [0 for x in range(len(S))]                         # Nº Configurações Exaustiva
            n_config_H = [0 for x in range(len(S))]                         # Nº Configurações Heuristica

            for w in range(len(S)):
                s = S[w]
                
                
                #coord = coordinates(s)                                      # Gerar coordenadas dos vértices

                print("\nN vertice:",s, "\nk = ", k,"\nP =",P)
                print("Comprimento do dominating set tem que ser:", floor(s*k))

                G = generate_graph(s,P)
                print("Dominating set:")
                print(nX.dominating_set(G))

                tic = time.perf_counter()
                
                S_H = heuristc(s,k,G,Vert_Init_Heuristic)
                print("\nHeuristic Result:",set(S_H))

                toc = time.perf_counter()
                h_time[w] = toc-tic
                h_op[w] = op_heuristic
                n_config_H[w] = N_conf_H
                print(f"Time: {toc - tic:0.4f} seconds")


                tic = time.perf_counter()


                S_E = exaustive(s,k,G)
                print("\nExaustive Result:",set(S_E))
                toc = time.perf_counter()
                e_time[w] = toc-tic
                e_op[w] = op_exaustive
                n_config_E[w] = N_conf_E
                print(f"Time: {toc - tic:0.4f} seconds")


                if len(S_H) != 0:                                                   
                    print("\nHueristica Set is Dominating? -> ",nX.is_dominating_set(G, set(S_H)))
                    n_solutions_H[w] = 1

                if len(S_E) != 0:
                    print("\nExaustiva Set is Dominating?-> ",nX.is_dominating_set(G, set(S_E)))
                    n_solutions_E[w] = 1             

            

            print("\nTimes Heuristic:",h_time)
            print("Times Exaustive:", e_time)

            print("\nOperações Heuristic:",h_op)
            print("Operações Exaustive:", e_op)

            print("\nConfigurações Heuristic:",n_config_H)
            print("Configurações Exaustive:", n_config_E)


            with open("C:/Users/OMEN/Desktop/Output_98012.txt","a") as f:
                f.write("\n"+"Size ="+str(S)+"; %K ="+str(k)+"; %P ="+str(P)+";")
                f.write("\n"+"Op_Exaustive ="+ str(e_op)+";"+"\n"+"Op_Heuristic ="+ str(h_op)+";")
                f.write("\n"+"Times_Exaustive ="+ str(e_time)+";"+"\n"+"Times_Heuristic ="+ str(h_time)+";")
                f.write("\n"+"N_Solutions_Exaustive ="+ str(n_solutions_E)+";"+"\n"+"N_Solutions_Heuristic ="+ str(n_solutions_H)+";")
                f.write("\n"+"N_Configurations_Exaustive ="+ str(n_config_E)+";"+"\n"+"N_Configurations_Heuristic ="+ str(n_config_H)+";")
                f.write("\n")

        #f.close()
    



if __name__ == "__main__":
   main()


