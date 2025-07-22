-- #############################################################################
--                 SQL Script: Raw Data Cleaning and Renaming 
--  #############################################################################


-- This script performs the initial cleaning and renaming of tables and columns
-- from a raw transactional database, preparing the data for subsequent analysis.
-- The raw data for this analysis was extracted from a physical server, then cleaned, transformed, 
-- and organized into a structured format suitable for the analytical requirements of this project.

### Operations include:

-- 1. Renaming tables to more descriptive and standardized names.
-- 2. Dropping irrelevant or sensitive columns for analytical purposes.
-- 3. Basic handling of inconsistent/null values in key columns.

-- Context:
-- The original tables contain abbreviated names and numerous columns related to
-- internal control or auxiliary systems (e.g., AXON, audit fields, duplicate contact details)
-- that are not essential for the business analysis objectives of the dental clinic.


-- #############################################################################
-- Section 1: Cleaning and Renaming of Appointment and Procedure Tables
-- #############################################################################

-- Table: agenda (General Appointments)
-- New Table: appointments
-- Removes audit columns, observations, duplicate contact data, and fields
-- related to appointment confirmation or deletion that are not relevant for analyzing appointment trends.

SELECT* 
	FROM agenda; 
RENAME TABLE agenda TO appointments;
ALTER TABLE appointments DROP COLUMN OBS;
ALTER TABLE appointments DROP COLUMN MODIFICADO;
ALTER TABLE appointments DROP COLUMN USUARIO;
ALTER TABLE appointments DROP COLUMN AVISO;
ALTER TABLE appointments DROP COLUMN DATA_EXC;
ALTER TABLE appointments DROP COLUMN USUARIO_EXC;
ALTER TABLE appointments DROP COLUMN ENCAIXE;
ALTER TABLE appointments DROP COLUMN FONE_1;
ALTER TABLE appointments DROP COLUMN FONE_2;
ALTER TABLE appointments DROP COLUMN CODIGO_ESPECIALIDADE;
ALTER TABLE appointments DROP COLUMN CONFIRMACAO_DATA_HORA;
ALTER TABLE appointments DROP COLUMN CONFIRMACAO_USUARIO;
ALTER TABLE appointments DROP COLUMN CONFIRMACAO_OBSERVACAO;
ALTER TABLE appointments DROP COLUMN DT_AXON;
ALTER TABLE appointments DROP COLUMN AXON_ID;

-- Table: agconf (Temporary or Obsolete Confirmation Table)
-- Apparently a support table or confirmation log that is not needed for the main analysis.

DROP TABLE agconf;

-- Table: atd222 (Scheduled Procedures per Attendance)
-- New Table: procedures_appointments
-- Removal of internal control columns, terminal and user
-- information that do not contribute to the analysis of scheduled procedures.

SELECT* 
	FROM 
	atd222; -- View the original table before changes
RENAME TABLE 
	atd222 TO procedures_appointments;
ALTER TABLE procedures_appointments DROP COLUMN NUMERO;
ALTER TABLE procedures_appointments DROP COLUMN CONTROLE;
ALTER TABLE procedures_appointments DROP COLUMN FORMA_MEDIDA;
ALTER TABLE procedures_appointments DROP COLUMN CBARRA;
ALTER TABLE procedures_appointments DROP COLUMN TERMINAL;
ALTER TABLE procedures_appointments DROP COLUMN USUARIO;
ALTER TABLE procedures_appointments DROP COLUMN QTDE_SESSAO;
ALTER TABLE procedures_appointments DROP COLUMN QTDE_SESSAO_ORIG;
ALTER TABLE procedures_appointments DROP COLUMN MODIFICADO;
ALTER TABLE procedures_appointments DROP COLUMN DATA_CANCELADO;
ALTER TABLE procedures_appointments DROP COLUMN USUARIO_CANCELADO;
ALTER TABLE procedures_appointments DROP COLUMN DATA_INCLUIDO;
ALTER TABLE procedures_appointments DROP COLUMN USUARIO_INCLUIDO;
ALTER TABLE procedures_appointments DROP COLUMN QTDE_MEDIDA;
ALTER TABLE procedures_appointments DROP COLUMN DT_AXON;

-- Table: atd333 
-- New Table: executed_procedures
-- Renamed from 'atd333' to 'executed_procedures'.
-- Removal of return columns, launch numbers, and shipping details that are not directly related to the executed procedure itself.
SELECT*
	FROM atd333; 
RENAME TABLE atd333 TO executed_procedures;                                             
ALTER TABLE executed_procedures DROP COLUMN RETORNO;
ALTER TABLE executed_procedures DROP COLUMN NUMERO;
ALTER TABLE executed_procedures DROP COLUMN LANCTO_ATD444;
ALTER TABLE executed_procedures DROP COLUMN DATA_LANC;
ALTER TABLE executed_procedures DROP COLUMN NUM_SESSAO_T;
ALTER TABLE executed_procedures DROP COLUMN NOME_FASE_PT;
ALTER TABLE executed_procedures DROP COLUMN DATA_ENVIO_PT;
ALTER TABLE executed_procedures DROP COLUMN DATA_PAGO_PT;
ALTER TABLE executed_procedures DROP COLUMN USUARIO_ENVIO_PT;
ALTER TABLE executed_procedures DROP COLUMN DATA_RETORNO_PT;
ALTER TABLE executed_procedures DROP COLUMN USUARIO_RETORNO_PT;
ALTER TABLE executed_procedures DROP COLUMN USUARIO_PAGO_PT;

-- Table: atd444 
-- New Table: patient_visits
-- Removal of password columns, attendance responsibles, observations, and external system IDs.
SELECT*
	FROM atd444; 
RENAME TABLE atd444 TO patient_visits;
ALTER TABLE patient_visits DROP COLUMN TERMINAL;
ALTER TABLE patient_visits DROP COLUMN USUARIO;
ALTER TABLE patient_visits DROP COLUMN SENHA_ATEND;
ALTER TABLE patient_visits DROP COLUMN RESP_ATEND;
ALTER TABLE patient_visits DROP COLUMN NOME_RESP_ATEND;
ALTER TABLE patient_visits DROP COLUMN HORA_FINAL;
ALTER TABLE patient_visits DROP COLUMN UNIDADE;
ALTER TABLE patient_visits DROP COLUMN DT_AXON;
ALTER TABLE patient_visits DROP COLUMN OBS;
ALTER TABLE patient_visits DROP COLUMN AXON_ID;
ALTER TABLE patient_visits DROP COLUMN EM_ATENDIMENTO;


-- #############################################################################
-- Section 2: Cleaning and Renaming of Financial Tables
-- #############################################################################

-- Table: bxd111 (Payment Records)
-- New Table: payments
-- A large number of columns related to bank details, document types, audit, and external system IDs have been removed, 
-- focusing on essential payment information.
SELECT*
FROM 
	bxd111; 
RENAME TABLE bxd111 TO payments;
ALTER TABLE payments DROP COLUMN CONTA_CORRENTE;
ALTER TABLE payments DROP COLUMN ID_BAIXAPLANOS;
ALTER TABLE payments DROP COLUMN CAMPOX;
ALTER TABLE payments DROP COLUMN TIPO_DOC;
ALTER TABLE payments DROP COLUMN TRANSMISSAO;
ALTER TABLE payments DROP COLUMN OBS;
ALTER TABLE payments DROP COLUMN CONTA_DOCUMENTO;
ALTER TABLE payments DROP COLUMN LOJA;
ALTER TABLE payments DROP COLUMN MOTIVO;
ALTER TABLE payments DROP COLUMN TERMINAL;
ALTER TABLE payments DROP COLUMN VR_CALCULADO;
ALTER TABLE payments DROP COLUMN GRUPO;
ALTER TABLE payments DROP COLUMN NOME_GRUPO;
ALTER TABLE payments DROP COLUMN NUM_BANCO;
ALTER TABLE payments DROP COLUMN MODIFICADO;
ALTER TABLE payments DROP COLUMN COD_CAIXA;
ALTER TABLE payments DROP COLUMN DATA_REMESSA;
ALTER TABLE payments DROP COLUMN AGUARDANDO_VINCULO;
ALTER TABLE payments DROP COLUMN DT_AXON;
ALTER TABLE payments DROP COLUMN AXON_ID;

-- Table: ced001 (Product/Service Master Data)
-- New Table: products
-- This table contains a vast number of columns related to stock control, taxes, suppliers, marketing, and redundant information that are not crucial
-- for analyzing revenue and product/service contribution within the project's scope.
SELECT*
FROM
	ced001;
RENAME TABLE ced001 TO products;
ALTER TABLE products DROP COLUMN UNIDADE;
ALTER TABLE products DROP COLUMN VRCUSTO;
ALTER TABLE products DROP COLUMN VRMEDIO;
ALTER TABLE products DROP COLUMN QTMAX;
ALTER TABLE products DROP COLUMN QTMIN;
ALTER TABLE products DROP COLUMN OBS;
ALTER TABLE products DROP COLUMN OBS2;
ALTER TABLE products DROP COLUMN OBS3;
ALTER TABLE products DROP COLUMN ICMS_FORA;
ALTER TABLE products DROP COLUMN IDENTIFICACAO; 
ALTER TABLE products DROP COLUMN LOJA; 
ALTER TABLE products DROP COLUMN MODIFICADO;
ALTER TABLE products DROP COLUMN DT_CADASTRO; 
ALTER TABLE products DROP COLUMN ACRESCIMO;
ALTER TABLE products DROP COLUMN A_VISTA; 
ALTER TABLE products DROP COLUMN COR;
ALTER TABLE products DROP COLUMN MODELO;
ALTER TABLE products DROP COLUMN ORCAMENTO;
ALTER TABLE products DROP COLUMN DESCONTO_VISTA;
ALTER TABLE products DROP COLUMN SIMBOLO;
ALTER TABLE products DROP COLUMN TIPO_SIMBOLO; 
ALTER TABLE products DROP COLUMN CONVENIO; 
ALTER TABLE products DROP COLUMN CST;
ALTER TABLE products DROP COLUMN FAMILIA;
ALTER TABLE products DROP COLUMN TRANSMISSAO;
ALTER TABLE products DROP COLUMN FORNEC1;
ALTER TABLE products DROP COLUMN FORNEC2;
ALTER TABLE products DROP COLUMN FORNEC3;
ALTER TABLE products DROP COLUMN DESCONTO;
ALTER TABLE products DROP COLUMN TABELA;
ALTER TABLE products DROP COLUMN LOTE;
ALTER TABLE products DROP COLUMN VALIDADE;
ALTER TABLE products DROP COLUMN PERC_FRETE;
ALTER TABLE products DROP COLUMN PERC_IPI;
ALTER TABLE products DROP COLUMN COMISSAO;
ALTER TABLE products DROP COLUMN ISENTO;
ALTER TABLE products DROP COLUMN VR_ATACADO;
ALTER TABLE products DROP COLUMN ICMS_DENTRO;
ALTER TABLE products DROP COLUMN VR_ESPECIAL;
ALTER TABLE products DROP COLUMN COD_ISENTO;
ALTER TABLE products DROP COLUMN CFOP;
ALTER TABLE products DROP COLUMN NCM;
ALTER TABLE products DROP COLUMN ATIVO;
ALTER TABLE products DROP COLUMN PARTICULAR;
ALTER TABLE products DROP COLUMN UNIPLAN;
ALTER TABLE products DROP COLUMN CSOSN;
ALTER TABLE products DROP COLUMN PIS;
ALTER TABLE products DROP COLUMN COFINS;
ALTER TABLE products DROP COLUMN PARTMED;
ALTER TABLE products DROP COLUMN ESTOQUE;
ALTER TABLE products DROP COLUMN VALOR_ANTERIOR;
ALTER TABLE products DROP COLUMN PROD_MEDICINA;
ALTER TABLE products DROP COLUMN TIPO_ATEND;
ALTER TABLE products DROP COLUMN SESSOES;
ALTER TABLE products DROP COLUMN VENDA_VISTA;
ALTER TABLE products DROP COLUMN CONSULTA_PARTMED;
ALTER TABLE products DROP COLUMN CODIGO_PROTETICO;
ALTER TABLE products DROP COLUMN VALIDADE_DIAS;
ALTER TABLE products DROP COLUMN VALIDADE_SUGESTAO;
ALTER TABLE products DROP COLUMN FORMA_MEDIDA;
ALTER TABLE products DROP COLUMN CODIGO_TUSS;
ALTER TABLE products DROP COLUMN DT_AXON;
ALTER TABLE products DROP COLUMN AXON_ID;
ALTER TABLE products DROP COLUMN PLANO_SAUDE;
ALTER TABLE products DROP COLUMN USUARIO;
ALTER TABLE products DROP COLUMN GRUPO;


-- Table: ced003 (Direct Payments / One-time Receipts)
-- New Table: direct_payments
--  Many columns related to taxes, shipping, insurance, audit, and specific invoice details that are not necessary for simple cash flow analysis.
SELECT* 
FROM
	ced003; 
RENAME TABLE ced003 TO direct_payments;
ALTER TABLE direct_payments DROP COLUMN EOUS;
ALTER TABLE direct_payments DROP COLUMN DIGITOU;
ALTER TABLE direct_payments DROP COLUMN RESPONSAVEL;
ALTER TABLE direct_payments DROP COLUMN ACRESCIMOS;
ALTER TABLE direct_payments DROP COLUMN FRETES;
ALTER TABLE direct_payments DROP COLUMN SEGUROS;
ALTER TABLE direct_payments DROP COLUMN OUTRAS;
ALTER TABLE direct_payments DROP COLUMN ISENTAS;
ALTER TABLE direct_payments DROP COLUMN BASEICMS;
ALTER TABLE direct_payments DROP COLUMN PERC_ICMS;
ALTER TABLE direct_payments DROP COLUMN VRICMS;
ALTER TABLE direct_payments DROP COLUMN ICMS_ANT;
ALTER TABLE direct_payments DROP COLUMN BASEIPI;
ALTER TABLE direct_payments DROP COLUMN PERC_IPI;
ALTER TABLE direct_payments DROP COLUMN VRIPI;
ALTER TABLE direct_payments DROP COLUMN PERC_COMISSAO;
ALTER TABLE direct_payments DROP COLUMN CODFISCAL;
ALTER TABLE direct_payments DROP COLUMN UF;
ALTER TABLE direct_payments DROP COLUMN OBS;
ALTER TABLE direct_payments DROP COLUMN CAMPOX;
ALTER TABLE direct_payments DROP COLUMN DOC_FINAL;
ALTER TABLE direct_payments DROP COLUMN CRED_ICMS;
ALTER TABLE direct_payments DROP COLUMN CRED_IPI;
ALTER TABLE direct_payments DROP COLUMN PERIODO;
ALTER TABLE direct_payments DROP COLUMN VENCTO;
ALTER TABLE direct_payments DROP COLUMN BAIXA;
ALTER TABLE direct_payments DROP COLUMN PERIODO_BAIXA;
ALTER TABLE direct_payments DROP COLUMN TRANSMISSAO;
ALTER TABLE direct_payments DROP COLUMN DESCARGA;
ALTER TABLE direct_payments DROP COLUMN FILIAL;
ALTER TABLE direct_payments DROP COLUMN TEM_PIS_COFINS;
ALTER TABLE direct_payments DROP COLUMN PIS;
ALTER TABLE direct_payments DROP COLUMN COFINS;
ALTER TABLE direct_payments DROP COLUMN ICMS_PROPRIO;
ALTER TABLE direct_payments DROP COLUMN ICMS_SUBST;
ALTER TABLE direct_payments DROP COLUMN OBS2;
ALTER TABLE direct_payments DROP COLUMN TRANSPORTADOR;
ALTER TABLE direct_payments DROP COLUMN OBS3;
ALTER TABLE direct_payments DROP COLUMN OBS4;
ALTER TABLE direct_payments DROP COLUMN RESPONSAVEL2;
ALTER TABLE direct_payments DROP COLUMN QTDE_PESO1;
ALTER TABLE direct_payments DROP COLUMN QTDE_PESO2;
ALTER TABLE direct_payments DROP COLUMN QTDE_PESO3;
ALTER TABLE direct_payments DROP COLUMN QTDE_PESO4;
ALTER TABLE direct_payments DROP COLUMN QTDE_PESO5;
ALTER TABLE direct_payments DROP COLUMN TABELA;
ALTER TABLE direct_payments DROP COLUMN LOJA;
ALTER TABLE direct_payments DROP COLUMN USUARIO;
ALTER TABLE direct_payments DROP COLUMN MODIFICADO;
ALTER TABLE direct_payments DROP COLUMN TERMINAL;
ALTER TABLE direct_payments DROP COLUMN FORMA_PGTO;
ALTER TABLE direct_payments DROP COLUMN TIPO_DOC;
ALTER TABLE direct_payments DROP COLUMN CFOP;
ALTER TABLE direct_payments DROP COLUMN CST;
ALTER TABLE direct_payments DROP COLUMN OBS_CONT;
ALTER TABLE direct_payments DROP COLUMN NUM_NFE;
ALTER TABLE direct_payments DROP COLUMN PROTOCOLO_USO_NFE;
ALTER TABLE direct_payments DROP COLUMN CHAVE_ACESSO_NFE;
ALTER TABLE direct_payments DROP COLUMN RESP_ODONTOGRAMA;
ALTER TABLE direct_payments DROP COLUMN PROD_MEDICINA;
ALTER TABLE direct_payments DROP COLUMN ID_DOCUMENTO;
ALTER TABLE direct_payments DROP COLUMN CUPOM_CRESCEVENDAS;
ALTER TABLE direct_payments DROP COLUMN DATA_ENVIO_VENDA;
ALTER TABLE direct_payments DROP COLUMN VALOR_DESCONTO_VENDA;
ALTER TABLE direct_payments DROP COLUMN VR_APROVADO_DRCASH;

-- Table: ced004 (Obsolete or Temporary Table)
-- Table identified for removal, with no apparent use in the analysis context.

DROP TABLE ced004;

-- Table: crd1111 (Payment Plans / Accounts Receivable)
-- New Table: payment_plans
-- Removal of various columns related to bank details, audit, transmission status, and detailed financial
-- information not crucial for a macro view of payment plans.
SELECT* 
FROM 
	crd1111; 
RENAME TABLE crd1111 TO payment_plans;
ALTER TABLE payment_plans DROP COLUMN CONTA;
ALTER TABLE payment_plans DROP COLUMN BANCO;
ALTER TABLE payment_plans DROP COLUMN AGENCIA;
ALTER TABLE payment_plans DROP COLUMN PERIODO;
ALTER TABLE payment_plans DROP COLUMN FILIAL;
ALTER TABLE payment_plans DROP COLUMN OBS;
ALTER TABLE payment_plans DROP COLUMN CAMPOX;
ALTER TABLE payment_plans DROP COLUMN BANDA1;
ALTER TABLE payment_plans DROP COLUMN BANDA2;
ALTER TABLE payment_plans DROP COLUMN BANDA3;
ALTER TABLE payment_plans DROP COLUMN TRANSMISSAO;
ALTER TABLE payment_plans DROP COLUMN SITUACAO;
ALTER TABLE payment_plans DROP COLUMN GEROU_TRANSMISSAO;
ALTER TABLE payment_plans DROP COLUMN RECEBEU_TRANSMISSAO;
ALTER TABLE payment_plans DROP COLUMN ALINEA;
ALTER TABLE payment_plans DROP COLUMN DEVOLUCAO;
ALTER TABLE payment_plans DROP COLUMN REAPRESENTOU;
ALTER TABLE payment_plans DROP COLUMN SEQ_ALINEA11;
ALTER TABLE payment_plans DROP COLUMN LOTE;
ALTER TABLE payment_plans DROP COLUMN BAIXA;
ALTER TABLE payment_plans DROP COLUMN CHEQUE_BAIXA;
ALTER TABLE payment_plans DROP COLUMN DESCONTOS;
ALTER TABLE payment_plans DROP COLUMN JUROS;
ALTER TABLE payment_plans DROP COLUMN NOSSONUMERO;
ALTER TABLE payment_plans DROP COLUMN MULTA;
ALTER TABLE payment_plans DROP COLUMN DUPLICATA;
ALTER TABLE payment_plans DROP COLUMN ENCARGOS;
ALTER TABLE payment_plans DROP COLUMN LOJA;
ALTER TABLE payment_plans DROP COLUMN USUARIO;
ALTER TABLE payment_plans DROP COLUMN MODIFICADO;
ALTER TABLE payment_plans DROP COLUMN DATA_ENV_CART;
ALTER TABLE payment_plans DROP COLUMN DATA_ENV_SCPC;
ALTER TABLE payment_plans DROP COLUMN DATA_RET_SCPC;
ALTER TABLE payment_plans DROP COLUMN TERMINAL;
ALTER TABLE payment_plans DROP COLUMN VENCTO_ORIG;
ALTER TABLE payment_plans DROP COLUMN CHEQUE;
ALTER TABLE payment_plans DROP COLUMN TITULO;
ALTER TABLE payment_plans DROP COLUMN GRUPO;
ALTER TABLE payment_plans DROP COLUMN MOTIVO;
ALTER TABLE payment_plans DROP COLUMN REMESSA;
ALTER TABLE payment_plans DROP COLUMN NUM_BANCO;
ALTER TABLE payment_plans DROP COLUMN TIPO_COBRANCA;
ALTER TABLE payment_plans DROP COLUMN ORDEM;
ALTER TABLE payment_plans DROP COLUMN LOCAL;
ALTER TABLE payment_plans DROP COLUMN NOME_LOCAL;
ALTER TABLE payment_plans DROP COLUMN CALC_JUROS;
ALTER TABLE payment_plans DROP COLUMN COBRADORA;
ALTER TABLE payment_plans DROP COLUMN COBRANCA;
ALTER TABLE payment_plans DROP COLUMN DATA_REMESSA;
ALTER TABLE payment_plans DROP COLUMN SITUACAO_REMESSA;
ALTER TABLE payment_plans DROP COLUMN NSU_TRANSACAO;
ALTER TABLE payment_plans DROP COLUMN CONTROLE_CARTAO;
ALTER TABLE payment_plans DROP COLUMN DESCONTO_BOLETO;
ALTER TABLE payment_plans DROP COLUMN ID_PIX;
ALTER TABLE payment_plans DROP COLUMN DT_AXON;
ALTER TABLE payment_plans DROP COLUMN CODIGO_TUSS;
ALTER TABLE payment_plans DROP COLUMN ID_PAGO_LIVRE;
ALTER TABLE payment_plans DROP COLUMN AXON_ID;

-- Table: cxd555 (General Financial Transactions)
-- New Table: financial_transactions
-- Removal of internal control columns, terminal, user logs, and external system IDs.
SELECT*
FROM 
	cxd555; 
RENAME TABLE cxd555 TO financial_transactions;
ALTER TABLE financial_transactions DROP COLUMN PERIODO;
ALTER TABLE financial_transactions DROP COLUMN DT_DEPOSITO;
ALTER TABLE financial_transactions DROP COLUMN LOTE;
ALTER TABLE financial_transactions DROP COLUMN VALOR_RECEBER;
ALTER TABLE financial_transactions DROP COLUMN BANCO;
ALTER TABLE financial_transactions DROP COLUMN AGENCIA;
ALTER TABLE financial_transactions DROP COLUMN CONTA;
ALTER TABLE financial_transactions DROP COLUMN RESPONSAVEL;
ALTER TABLE financial_transactions DROP COLUMN TERMINAL;
ALTER TABLE financial_transactions DROP COLUMN OBS1;
ALTER TABLE financial_transactions DROP COLUMN OBS2;
ALTER TABLE financial_transactions DROP COLUMN OBS3;
ALTER TABLE financial_transactions DROP COLUMN LOJA;
ALTER TABLE financial_transactions DROP COLUMN USUARIO;
ALTER TABLE financial_transactions DROP COLUMN FECHAR_DIRETO;
ALTER TABLE financial_transactions DROP COLUMN CNPJ_CPF;
ALTER TABLE financial_transactions DROP COLUMN NUM_CONVENIO;
ALTER TABLE financial_transactions DROP COLUMN CONTROLE_ROYALTIES;
ALTER TABLE financial_transactions DROP COLUMN ROY_ODO;
ALTER TABLE financial_transactions DROP COLUMN PRO_MED;
ALTER TABLE financial_transactions DROP COLUMN FICHA_FINANCEIRO;
ALTER TABLE financial_transactions DROP COLUMN DT_AXON;
ALTER TABLE financial_transactions DROP COLUMN AXON_ID;
ALTER TABLE financial_transactions DROP COLUMN ID_PAGO_LIVRE;


-- #############################################################################
-- Section 3: Cleaning and Renaming of Client and Auxiliary Master Data Tables
-- #############################################################################

-- Table: emd101 (Client/Patient Information)
-- New Table: clients
-- This is one of the most complex tables,containing a vast number of columns.
-- Many of these columns were irrelevant or completely empty, making them unsuitable for analysis identification and categorization.
SELECT*
FROM 
	emd101; 
RENAME TABLE emd101 TO clients;
ALTER TABLE clients DROP COLUMN F_OU_J;
ALTER TABLE clients DROP COLUMN CLIENTE;
ALTER TABLE clients DROP COLUMN FORNECEDOR;
ALTER TABLE clients DROP COLUMN PRESTADOR;
ALTER TABLE clients DROP COLUMN VR_LIMITE;
ALTER TABLE clients DROP COLUMN OBS1;
ALTER TABLE clients DROP COLUMN BANCO;
ALTER TABLE clients DROP COLUMN AGENCIA;
ALTER TABLE clients DROP COLUMN CONTA;
ALTER TABLE clients DROP COLUMN FAX;
ALTER TABLE clients DROP COLUMN CELULAR;
ALTER TABLE clients DROP COLUMN AGENCIA2;
ALTER TABLE clients DROP COLUMN CONTA2;
ALTER TABLE clients DROP COLUMN ONDE_TRABALHA;
ALTER TABLE clients DROP COLUMN ADMISSAO;
ALTER TABLE clients DROP COLUMN RENDA_MES;
ALTER TABLE clients DROP COLUMN CAIXA_POSTAL;
ALTER TABLE clients DROP COLUMN CLASSE;
ALTER TABLE clients DROP COLUMN PAI;
ALTER TABLE clients DROP COLUMN MAE;
ALTER TABLE clients DROP COLUMN CONJUGE;
ALTER TABLE clients DROP COLUMN QTDE_DEPENDENTES;
ALTER TABLE clients DROP COLUMN END_TRAB;
ALTER TABLE clients DROP COLUMN FONE_TRAB;
ALTER TABLE clients DROP COLUMN NOME_REF_1;
ALTER TABLE clients DROP COLUMN NOME_REF_2;
ALTER TABLE clients DROP COLUMN FONE_REF_2;
ALTER TABLE clients DROP COLUMN NOME_FIA;
ALTER TABLE clients DROP COLUMN PARENTESCO_FIA;
ALTER TABLE clients DROP COLUMN CPF_FIA;
ALTER TABLE clients DROP COLUMN RG_FIA;
ALTER TABLE clients DROP COLUMN FONE_FIA;
ALTER TABLE clients DROP COLUMN ENDERECO_FIA;
ALTER TABLE clients DROP COLUMN BAIRRO_FIA;
ALTER TABLE clients DROP COLUMN CIDADE_FIA;
ALTER TABLE clients DROP COLUMN CEP_FIA;
ALTER TABLE clients DROP COLUMN ESTADO_FIA;
ALTER TABLE clients DROP COLUMN PROFISSAO_FIA;
ALTER TABLE clients DROP COLUMN RENDA_FIA;
ALTER TABLE clients DROP COLUMN USUARIO;
ALTER TABLE clients DROP COLUMN DEPENDENTE;
ALTER TABLE clients DROP COLUMN TITULAR;
ALTER TABLE clients DROP COLUMN NUM_CONVENIO;
ALTER TABLE clients DROP COLUMN NAO_AUTORIZADO;
ALTER TABLE clients DROP COLUMN DT_NASC_FIA;
ALTER TABLE clients DROP COLUMN NUM_BLOQUEIO;
ALTER TABLE clients DROP COLUMN DATA_BLOQUEIO;
ALTER TABLE clients DROP COLUMN USU_BLOQUEIO;
ALTER TABLE clients DROP COLUMN NUM_ENDERECO;
ALTER TABLE clients DROP COLUMN HIST_BLOQUEIO;
ALTER TABLE clients DROP COLUMN COD_MUNICIPIO;
ALTER TABLE clients DROP COLUMN COD_UF;
ALTER TABLE clients DROP COLUMN COD_VENDEDOR;
ALTER TABLE clients DROP COLUMN CLIENTE_PRAMELHOR;
ALTER TABLE clients DROP COLUMN USU_CADASTRO;
ALTER TABLE clients DROP COLUMN COD_PRAMELHOR;
ALTER TABLE clients DROP COLUMN CNPJ_CPF_VALIDO;
ALTER TABLE clients DROP COLUMN INDICACAO;
ALTER TABLE clients DROP COLUMN PROFISSAO;
ALTER TABLE clients DROP COLUMN SEXO_M_F;
ALTER TABLE clients DROP COLUMN CODIGO_CLIENTE;
ALTER TABLE clients DROP COLUMN DATA_DEP_EXCLUIDO;
ALTER TABLE clients DROP COLUMN TITULAR_DEP_EXCLUIDO;
ALTER TABLE clients DROP COLUMN DT_NASCIMENTO_DEP;
ALTER TABLE clients DROP COLUMN CODIGO_VALIDADE;
ALTER TABLE clients DROP COLUMN NOME_VALIDADE;
ALTER TABLE clients DROP COLUMN DATA_VALIDADE;
ALTER TABLE clients DROP COLUMN USUARIO_VALIDADE;
ALTER TABLE clients DROP COLUMN OBS_VALIDADE;
ALTER TABLE clients DROP COLUMN CODIGO_INDICACAO;
ALTER TABLE clients DROP COLUMN CPF_INDICACAO;
ALTER TABLE clients DROP COLUMN CATEGORIA;
ALTER TABLE clients DROP COLUMN COMPLEMENTO;
ALTER TABLE clients DROP COLUMN INSTITUTO_ODC;
ALTER TABLE clients DROP COLUMN LGPD_CPF;
ALTER TABLE clients DROP COLUMN LGPD_TELEFONE;
ALTER TABLE clients DROP COLUMN LGPD_MENSAGEM;
ALTER TABLE clients DROP COLUMN LGPD_IMAGEM;
ALTER TABLE clients DROP COLUMN PROTETICO;
ALTER TABLE clients DROP COLUMN PROTETICO_ATIVO;
ALTER TABLE clients DROP COLUMN DT_AXON;
ALTER TABLE clients DROP COLUMN AXON_ID;
ALTER TABLE clients DROP COLUMN ID_DRCASH;
ALTER TABLE clients DROP COLUMN DATA_APROVACAO_DRCASH;
ALTER TABLE clients DROP COLUMN VALOR_MAXIMO_DRCASH;
ALTER TABLE clients DROP COLUMN ID_PAGO_LIVRE;
ALTER TABLE clients DROP COLUMN LGPD_USUARIO;
ALTER TABLE clients DROP COLUMN LGPD_DATA_HORA;
ALTER TABLE clients DROP COLUMN FONE_REF_1;
ALTER TABLE clients DROP COLUMN BANCO2;

-- Data Correction: clients (DT_NASCIMENTO and ORIGEM_PACIENTE)
-- Handling of invalid values (old/future dates) in the birth date column
-- and correction of special characters in 'ORIGEM_PACIENTE'(acquisition channel).
SET SQL_SAFE_UPDATES = 0;
UPDATE patients 
SET DT_NASCIMENTO =
    CASE
        WHEN DT_NASC = '0001-01-01' THEN '1993-08-05' -- Example birth date for invalid/missing values
        WHEN DT_NASC = '1000-01-01' THEN '1993-08-05'
        WHEN DT_NASC = '1008-02-01' THEN '1993-08-05'
        WHEN DT_NASC = '1073-12-20' THEN '1993-08-05'
        WHEN DT_NASC = '1085-10-02' THEN '1993-08-05'
        WHEN DT_NASC = '1111-01-01' THEN '1993-08-05'
        WHEN DT_NASC = '1595-06-21' THEN '1993-08-05'
        WHEN DT_NASC = '1900-01-01' THEN '1993-08-05'
        WHEN DT_NASC = '2088-05-21' THEN '1993-08-05'
        ELSE DT_NASC
    END;

UPDATE patients
SET ORIGEM_PACIENTE =
    CASE
        WHEN ORIGEM_PACIENTE = 'Rï¿½DIO' THEN 'RADIO'
        WHEN ORIGEM_PACIENTE ='INDICAï¿½ï¿½O' THEN 'INDICACAO'
        ELSE ORIGEM_PACIENTE
    END;
SET SQL_SAFE_UPDATES = 1; -- Re-enable safe update mode

-- Table: especialidades (Specialties Master Data)
-- New Table: specialties
SELECT*
FROM 
	especialidades;
RENAME TABLE especialidades TO specialties;
ALTER TABLE specialties DROP COLUMN USUARIO;
ALTER TABLE specialties DROP COLUMN ATIVO;
ALTER TABLE specialties DROP COLUMN MODIFICADO;

-- Table: excage
-- Table identified for removal, with no apparent use in the analysis context.
DROP TABLE excage; 

-- Table: formas_de_pagamento (Payment Methods Master Data)
-- New Table: payment_methods. Only renaming for standardization.
SELECT * FROM formas_de_pagamento; -- View the original table before changes
RENAME TABLE formas_de_pagamento TO payment_methods;


-- #############################################################################
-- Section 4: Cleaning and Renaming of Orthodontic Tables
-- #############################################################################

-- Table: man001 (Orthodontic Installations)
-- New Table: orthodontic_installations
-- Removal of control columns, observations, status, and diagnostic/prognostic information not central to the analysis of installations.
SELECT*
FROM 
	man001; 
RENAME TABLE man001 TO orthodontic_installations;
ALTER TABLE orthodontic_installations DROP COLUMN QTDE_MANUT;
ALTER TABLE orthodontic_installations DROP COLUMN OBS;
ALTER TABLE orthodontic_installations DROP COLUMN FINAL_MANUT;
ALTER TABLE orthodontic_installations DROP COLUMN USU_ATIVO;
ALTER TABLE orthodontic_installations DROP COLUMN DIAGNOSTICO;
ALTER TABLE orthodontic_installations DROP COLUMN PROGNOSTICO;
ALTER TABLE orthodontic_installations DROP COLUMN CLASSE;
ALTER TABLE orthodontic_installations DROP COLUMN DATA_ALTERACAO;
ALTER TABLE orthodontic_installations DROP COLUMN HORA_ALTERACAO;
ALTER TABLE orthodontic_installations DROP COLUMN USUARIO_ALTERACAO;
ALTER TABLE orthodontic_installations DROP COLUMN DT_AXON;
ALTER TABLE orthodontic_installations DROP COLUMN AXON_ID;

-- Table: man002 (Orthodontic Treatment Prices)
-- New Table: orthodontic_treatment_prices
-- Removal of order, control, and due date limit columns.
SELECT* 
FROM 
	man002;
RENAME TABLE man002 TO orthodontic_treatment_prices;
ALTER TABLE orthodontic_treatment_prices DROP COLUMN ORDEM;
ALTER TABLE orthodontic_treatment_prices DROP COLUMN CONTROLE;
ALTER TABLE orthodontic_treatment_prices DROP COLUMN MULTA;
ALTER TABLE orthodontic_treatment_prices DROP COLUMN MAX_VENCTO;
ALTER TABLE orthodontic_treatment_prices DROP COLUMN COD_VENDA_ODC;
ALTER TABLE orthodontic_treatment_prices DROP COLUMN INTERVALO;
ALTER TABLE orthodontic_treatment_prices DROP COLUMN DT_AXON;
ALTER TABLE orthodontic_treatment_prices DROP COLUMN AXON_ID;
ALTER TABLE orthodontic_treatment_prices DROP COLUMN PLANO_SAUDE;


-- Table: man111 (Orthodontic Payments)
-- New Table: orthodontic_payments
-- Removal of numerous control, audit, transaction details, and payment status columns not relevant for analyzing orthodontics revenue.
SELECT*
FROM 
	man111; 
RENAME TABLE man111 TO orthodontic_payments;
ALTER TABLE orthodontic_payments DROP COLUMN CAMPOX;
ALTER TABLE orthodontic_payments DROP COLUMN RESPONSAVEL;
ALTER TABLE orthodontic_payments DROP COLUMN OBS;
ALTER TABLE orthodontic_payments DROP COLUMN RETORNO;
ALTER TABLE orthodontic_payments DROP COLUMN NOSSO_NUMERO;
ALTER TABLE orthodontic_payments DROP COLUMN TIPO_MAN;
ALTER TABLE orthodontic_payments DROP COLUMN VENCTO_ORIG;
ALTER TABLE orthodontic_payments DROP COLUMN MOTIVO_ALTERAR;
ALTER TABLE orthodontic_payments DROP COLUMN AUTORIZA_ALTERAR;
ALTER TABLE orthodontic_payments DROP COLUMN MOTIVO_INCLUIR;
ALTER TABLE orthodontic_payments DROP COLUMN AUTORIZA_INCLUIR;
ALTER TABLE orthodontic_payments DROP COLUMN AUTORIZA_RECEBER;
ALTER TABLE orthodontic_payments DROP COLUMN MOTIVO_RECEBER;
ALTER TABLE orthodontic_payments DROP COLUMN BANCO;
ALTER TABLE orthodontic_payments DROP COLUMN DATA_ALTERACAO;
ALTER TABLE orthodontic_payments DROP COLUMN OPERACAO;
ALTER TABLE orthodontic_payments DROP COLUMN TIPO_COBRANCA;
ALTER TABLE orthodontic_payments DROP COLUMN TERMINAL;
ALTER TABLE orthodontic_payments DROP COLUMN REMESSA;
ALTER TABLE orthodontic_payments DROP COLUMN SENHA_ATEND;
ALTER TABLE orthodontic_payments DROP COLUMN USUARIO;
ALTER TABLE orthodontic_payments DROP COLUMN EM_ATENDIMENTO;
ALTER TABLE orthodontic_payments DROP COLUMN CALC_JUROS;
ALTER TABLE orthodontic_payments DROP COLUMN USU_VENDA;
ALTER TABLE orthodontic_payments DROP COLUMN COBRADORA;
ALTER TABLE orthodontic_payments DROP COLUMN COBRANCA;
ALTER TABLE orthodontic_payments DROP COLUMN DATA_REMESSA;
ALTER TABLE orthodontic_payments DROP COLUMN SITUACAO_REMESSA;
ALTER TABLE orthodontic_payments DROP COLUMN CONTA;
ALTER TABLE orthodontic_payments DROP COLUMN NSU_TRANSACAO;
ALTER TABLE orthodontic_payments DROP COLUMN COBRANCA_ORTO;
ALTER TABLE orthodontic_payments DROP COLUMN DATA_REMESSA_CARTAO;
ALTER TABLE orthodontic_payments DROP COLUMN CONTROLE_CARTAO;
ALTER TABLE orthodontic_payments DROP COLUMN UNIDADE;
ALTER TABLE orthodontic_payments DROP COLUMN HORA_FINAL;
ALTER TABLE orthodontic_payments DROP COLUMN DESCONTO_BOLETO;
ALTER TABLE orthodontic_payments DROP COLUMN AGUARDANDO_VINCULO;
ALTER TABLE orthodontic_payments DROP COLUMN ID_PIX;
ALTER TABLE orthodontic_payments DROP COLUMN DT_AXON;
ALTER TABLE orthodontic_payments DROP COLUMN ID_PAGO_LIVRE;
ALTER TABLE orthodontic_payments DROP COLUMN AXON_ID;
ALTER TABLE orthodontic_payments DROP COLUMN MES_ANO;
ALTER TABLE orthodontic_payments DROP COLUMN DIA_MES_ANO;


-- #############################################################################
-- Section 5: Cleaning and Renaming of Other Auxiliary Tables
-- #############################################################################

-- Table: metavd (Sales Targets)
-- New Table: sales_targets. Removal of specific convenio/plan types and granular date parts.
SELECT*
FROM 
	metavd; 
RENAME TABLE metavd TO sales_targets;
ALTER TABLE sales_targets DROP COLUMN CONVENIO;
ALTER TABLE sales_targets DROP COLUMN UNIPLAN;
ALTER TABLE sales_targets DROP COLUMN PARTICULAR;
ALTER TABLE sales_targets DROP COLUMN ANO;
ALTER TABLE sales_targets DROP COLUMN MES;
ALTER TABLE sales_targets DROP COLUMN INICIO;
ALTER TABLE sales_targets DROP COLUMN FIM;

-- Table: odoant (Initial Consultations)
-- New Table: initial_consultations
-- Removal of terminal column.
SELECT*
FROM 
	odoant;
RENAME TABLE odoant TO initial_consultations;
ALTER TABLE initial_consultations DROP COLUMN TERMINAL;

-- Table: odoexc
-- Apparently a table  that is not needed for the main analysis.

DROP TABLE odoexc;

-- End of Cleaning and Renaming Script
