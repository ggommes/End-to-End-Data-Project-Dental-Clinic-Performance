# Contexto

Fui coproprietário de uma clínica odontológica em Lajeado,Rio Grande do sul, que oferece atendimento odontológico abrangente há seis anos. O modelo de negócios da clínica é baseado em uma ampla gama de serviços, com a ortodontia (aparelhos) como um dos principais motores de receita, devido à renda mensal recorrente das consultas de pacientes. As reabilitações com implantes representam os procedimentos de maior valor, complementados por vários serviços de odontologia geral.

Este projeto foi criado para analisar dados e métricas de 2020 a 2025 e fornecer insights e recomendações aos sócios remanescentes. Com base nos dados extraídos e no contexto operacional da clínica, esta análise fornecerá informações e recomendações em quatro áreas críticas:

- **Tendências de Receita e Pacientes ao Longo do Tempo:** - Avaliação dos padrões históricos de receita e volume de pacientes, com foco no desempenho anual e mensal para procedimentos gerais e pacientes de ortodontia.
- **Análise de Desempenho de Vendas Mês a Mês** - Avaliação do crescimento financeiro de longo prazo da clínica, rastreando a receita acumulada para os principais segmentos de serviço.
- **Insights e Crescimento do Desempenho Cumulativo** - Análise detalhada das flutuações e consistência das vendas mensais, incluindo mudanças na receita geral e no desempenho especificamente para os serviços de ortodontia.
- **Contribuição de Receita por Produto e Especialidade** - Determinação da contribuição financeira de cada especialidade odontológica para a receita total da clínica. 

**As consultas SQL que abordam várias questões de negócio podem ser encontradas neste repositório.**

# Estrutura do Banco de Dados
A estrutura principal do banco de dados da empresa, apresentada a seguir, é composta por diversas tabelas interconectadas, totalizando 151.511 registros.

- **patients:**  Esta tabela contém informações demográficas e de cadastro de todos os pacientes registrados.
- **initial_consultations:** Registra a primeira consulta ou visita de avaliação de um paciente à clínica.
- **patient_visits:** Contém detalhes sobre as visitas de pacientes durante um plano de tratamento ativo, servindo essencialmente como uma agenda.
- **procedures_appointments:** Detalha os procedimentos individuais agendados para pacientes em consultas.
- **executed_procedures:** Registra os procedimentos que foram de fato realizados.
- **orthodontic_installations:** Registra o início dos tratamentos ortodônticos, rastreando a instalação dos aparelhos.
- **orthodontic_appointments:** Registra as consultas específicas para acompanhamentos e manutenção ortodôntica.
- **orthodontic_payments:** Armazena os registros de pagamentos para serviços ortodônticos.
- **payments:** Contém os registros de pagamentos gerais para todos os serviços.
- **direct_payments**: Esta tabela registra pagamentos diretos e únicos que não estão associados a um plano de parcelamento específico.
  
![Untitled Diagram (3)](https://github.com/user-attachments/assets/75ec0e43-c64b-4b90-bcaf-c547b82fbeb5)

 **As Querys utilizadas para inspecionar e limpar os dados brutos para esta análise podem ser encontradas neste repositório.**

# Sumário Executivo

A clínica enfrenta uma preocupante tendência de queda na receita e no volume de pacientes de procedimentos gerais desde seu pico em 2022, apesar do crescimento cumulativo positivo. Essa instabilidade financeira é agravada por uma significativa volatilidade de receita mês a mês, sugerindo desafios na previsibilidade do fluxo de caixa. Além disso, um número alarmante de atrasos em consultas destaca uma ineficiência operacional crítica que afeta a satisfação do paciente e, potencialmente, a capacidade geral de serviço.

![revenue_and_patients_trends](https://github.com/user-attachments/assets/bca432d0-4440-4816-ab69-044e8277066e)


# Análise Detalhada dos Insights
### Trajetória de Crescimento: De um Lançamento Resiliente a Desafios Pós-2022.
- **Com as operações iniciadas em fevereiro de 2020, a clínica começou com uma receita promissora, demonstrando seu potencial.** No entanto, o gráfico "Receita por Mês" ilustra claramente uma queda imediata na receita nos meses seguintes a fevereiro de 2020 (março a maio), um reflexo direto do impacto inicial da pandemia de COVID-19 e das medidas de lockdown. Apesar desse início desafiador, a clínica demonstrou uma resiliência notável, alcançando forte tração e crescimento contínuo tanto em receita quanto em volume de pacientes a partir de meados de 2020, culminando em um pico de desempenho notável em 2022. Nesse ano, a receita de procedimentos gerais alcançou R$ 141.021,00 em janeiro.

- **Em contraste com esse sucesso inicial, a partir do início de 2023, os dados revelam uma clara desaceleração e subsequente tendência contínua de queda na receita e no volume de pacientes de procedimentos gerais.** Embora a drástica redução em 2024, com a receita de procedimentos gerais caindo para R$ 1.046,00 — representando uma redução de 99,26% em relação ao pico de 2022 — tenha sido significativamente impactada pelo fechamento da clínica em abril e maio para reformas estruturais, é importante notar que uma forte tendência de queda na receita já vinha sendo observada nos meses anteriores a este fechamento temporário.

- **A subsequente queda pós-2022, exacerbada pelo fechamento temporário para reformas, sugere que as estratégias de crescimento que funcionaram durante a fase de tração podem não ser mais eficazes para sustentar o volume.** Isso indica um esgotamento da demanda ou uma falha em renovar continuamente a base de pacientes para procedimentos gerais, exigindo uma reavaliação das abordagens de mercado e operacionais.


<img width="1448" height="799" alt="revenue_ _growth_over_time" src="https://github.com/user-attachments/assets/73a6b288-6e4a-49fe-95b2-8ac1393c59e3" />


### Crescimento Consistente da Base de Ortodontia Contrarrestando a Instabilidade Geral.
- **Em contraste com o desempenho geral dos procedimentos,** o número de novos tratamentos ortodônticos tem mostrado uma trajetória de crescimento mais estável e positiva, contribuindo consistentemente para a receita recorrente da clínica. O número de novas instalações cresceu de 483 em 2020 para 1148 em 2022, chegando a 1578 em 2024. Pacientes de ortodontia visitam a clínica mensalmente para consultas de acompanhamento, gerando um fluxo consistente e previsível de pagamentos mensais recorrentes. A receita gerada especificamente a partir dos acompanhamentos de tratamentos ortodônticos tem se mantido resiliente, representando uma parcela crescente da receita mensal total.
- **Este segmento parece menos suscetível às flutuações que afetam os procedimentos gerais**,devido ao compromisso de longo prazo e à estrutura de pagamento em parcelas inerente ao tratamento ortodôntico.
- **A ortodontia atua como um pilar de estabilidade financeira e previsibilidade do fluxo de caixa,**, validando sua importância estratégica para o modelo de negócios devido à sua natureza recorrente.

 <img width="1417" height="370" alt="orthodontic_treatments_revenue" src="https://github.com/user-attachments/assets/7879bf60-3011-42e2-af86-7bd32cb189ed" />

### Variação de Receita Mensal Revela Sazonalidade e Desafios de Previsibilidade
- **A análise mês a mês revela alta volatilidade na receita total**, com variações significativas ao longo dos anos. Por exemplo, a receita total em novembro de 2022 foi de R$ 112.256,00, mas caiu para R$ 65.438,00 em dezembro — uma diminuição de 41,7%.
- **Padrões sazonais são evidentes,** com meses como agosto e novembro consistentemente mostrando receitas mais altas, enquanto fevereiro e abril se destacam como os meses de menor desempenho.
- **Essas flutuações tornam o fluxo de caixa menos previsível,**, o que pode desafiar o planejamento financeiro e limitar a capacidade de investir com confiança.

![revenue seasonality](https://github.com/user-attachments/assets/68222f58-2862-4b75-9ad0-8a794f15619e)

### Procedimentos Gerais: Volume de Novos Pacientes em Queda
- **O volume de novas consultas ou avaliações iniciais para procedimentos gerais (excluindo instalações ortodônticas) tem diminuído consistentemente**. Em maio de 2021, 156 novas consultas gerais foram registradas, caindo para 16 em junho de 2025, uma redução de 89,7%.

- **Essa queda é um forte indicativo** de que as estratégias atuais de aquisição de pacientes para procedimentos não ortodônticos estão perdendo eficácia ou que há um gargalo na conversão.

- **Além disso, um número alarmante de atrasos em consultas, conforme destacado no Sumário Executivo, é uma ineficiência operacional crítica que afeta a satisfação do paciente** Este problema pode estar contribuindo para a queda no volume de novos pacientes, à medida que a percepção da comunidade se espalha.

![22222](https://github.com/user-attachments/assets/7cb48815-b24f-4c1b-9d31-f70a3fad9919)

# Recomendações
Com base nos insights e descobertas acima, recomenda-se aos sócios remanescentes considerar o seguinte:

* Com a significativa desaceleração e a tendência contínua de queda na receita e no volume de pacientes de procedimentos gerais desde o início de 2023, é crucial desenvolver e implementar campanhas de marketing direcionadas para reengajar pacientes antigos e atrair novos, especificamente para a odontologia geral, com forte ênfase em procedimentos de alto valor como implantes dentários.
* Dada a recorrencia inerente aos tratamentos ortodônticos, é estrategicamente imperativo não apenas manter, mas expandir essa base de pacientes para garantir um fluxo de caixa previsível e estável. Isso envolve aumentar o investimento em marketing digital e esforços de geração de leads, além de explorar parcerias estratégicas (com escolas, por exemplo) especificamente para tratamentos ortodônticos, enfatizando seus benefícios de longo prazo e estruturas de pagamento previsíveis.
* A fim de mitigar a alta volatilidade da receita mensal, caracterizada por picos e quedas significativas ao longo do ano, é recomendado implementar campanhas promocionais estratégicas durante os meses historicamente de menor receita e otimizar a agenda para maximizar a utilização da capacidade da clínica durante os períodos de pico. Adicionalmente, considere programas de fidelidade para incentivar um fluxo consistente de pacientes. Além disso, é crucial estabelecer uma estratégia de precificação clara e padronizada, visando especificamente a redução da variação de receita mês a mês.
* Um grande número de atrasos em consultas representa uma ineficiência operacional crítica. Dado que um fator contribuinte significativo é o alto volume de pacientes atendidos diariamente por dentistas em um tempo de consulta limitado, é essencial reavaliar as durações das consultas e as agendas dos dentistas para garantir uma alocação de tempo realista para cada procedimento. Embora o atraso dos pacientes contribua, a otimização da agenda interna é fundamental para melhorar o fluxo de pacientes e a eficiência geral.
  
# Limitações
Estes são fatores que não foram (ou não puderam ser) totalmente considerados, ou limitações inerentes aos dados/análises que podem influenciar as conclusões:

* A análise é puramente interna à clínica. Ela não incorpora dinâmicas de mercado externas, como a concorrência local (novas clínicas abertas, estratégias de preços de concorrentes em Lajeado), mudanças econômicas mais amplas que afetam os gastos do consumidor com serviços odontológicos ou tendências específicas da indústria além do que é refletido nos próprios dados da clínica. Esses fatores poderiam influenciar significativamente as tendências de receita e pacientes observadas.
* Embora tendências quantitativas (queda de consultas, taxas de conversão, atrasos em consultas) tenham sido identificadas, a análise não incorpora dados qualitativos de pesquisas com pacientes, feedback ou entrevistas detalhadas com a equipe. Isso limita uma compreensão mais profunda do "porquê" por trás da evasão de pacientes, baixas taxas de conversão ou razões específicas para atrasos (satisfação do paciente com a consulta inicial, pontos problemáticos no processo de agendamento).


