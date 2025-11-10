# Simulação do Movimento de uma Partícula Carregada em um Campo Magnético Uniforme 🧲 

**Trabalho Científico N1 — Físico-Eletromagnetismo | Capítulo 28 (Resnick, Halliday & Walker, 10ª Edição)**  
Tema: *Força Magnética sobre Cargas em Movimento*

---

## Objetivo

Desenvolver uma **simulação computacional interativa** que demonstre o movimento circular uniforme de uma partícula carregada ao entrar em um campo magnético uniforme.  
O projeto ilustra como o **raio da trajetória** depende da **massa**, **velocidade**, **intensidade do campo magnético** e **módulo da carga elétrica**.

---

## 🧩 Fundamentação Teórica

A força magnética que atua sobre uma partícula carregada é dada por:

\[
\vec{F} = q (\vec{v} \times \vec{B})
\]

Quando a velocidade é perpendicular ao campo magnético, o módulo da força é:

\[
F = q v B
\]

Essa força atua como **força centrípeta**, causando um **movimento circular uniforme**, com raio determinado por:

\[
r = \frac{m v}{|q| B}
\]

---

## Simulação

A aplicação permite alterar interativamente os seguintes parâmetros:

| Parâmetro | Descrição | Unidade |
|------------|------------|----------|
| `m` | Massa da partícula | kg |
| `v` | Velocidade | m/s |
| `B` | Campo magnético | T |

O programa calcula automaticamente o **raio da trajetória (r)** e exibe a **trajetória circular** correspondente.

---

## Resultados e Interpretação

- Aumentar **massa (m)** → aumenta o raio  
- Aumentar **velocidade (v)** → aumenta o raio  
- Aumentar **campo magnético (B)** → diminui o raio  
- Aumentar **carga (|q|)** → diminui o raio  

Exemplo:

\[
m = 1,67\times10^{-27} \text{ kg}, \quad v = 10^7 \text{ m/s}, \quad B = 0,096 \text{ T}, \quad |q| = 1,62\times10^{-19} \text{ C}
\]

\[
r \approx 1,07 \text{ m}
\]

---

## 👥 Equipe

| **Cauan Galdino** 
| **Izadora Montenegro** 
| **Davi Carvalho** 
| **Kelvin Rodrigues** 
| **João Marcelo Cavalcante** 
| **Marcelo Antônio** 
