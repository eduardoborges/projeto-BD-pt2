DROP SCHEMA IF EXISTS cinema CASCADE;

CREATE SCHEMA cinema;

SET search_path = cinema;

CREATE TABLE clientes (
    cpf character varying(11) NOT NULL,
    telefone_residencial character varying(45) NOT NULL,
    telefone_celular character varying(45) NOT NULL,
    id_endereco integer NOT NULL,
    nome character varying(45) NOT NULL
);

CREATE SEQUENCE "clientes_vip_id_cliente_VIP_sequence"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



CREATE TABLE clientes_vip (
    "id_cliente_VIP" integer DEFAULT nextval('"clientes_vip_id_cliente_VIP_sequence"'::regclass) NOT NULL,
    status character(1) NOT NULL,
    "data_ultimoPagamento" date NOT NULL,
    cpf_cliente character varying(11) NOT NULL
);


CREATE SEQUENCE enderecos_id_endereco_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE enderecos (
    id_endereco integer DEFAULT nextval('enderecos_id_endereco_sequence'::regclass) NOT NULL,
    rua character varying(45),
    numero character varying(10),
    bairro character varying(45),
    cidade character varying(45) NOT NULL,
    estado character varying(45) NOT NULL,
    cep character varying(45),
    complemento character varying(45),
    referencia character varying(45)
);


CREATE SEQUENCE filmes_id_filme_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE filmes (
    id_filme integer DEFAULT nextval('filmes_id_filme_sequence'::regclass) NOT NULL,
    nome character varying(45) NOT NULL,
    duracao integer NOT NULL,
    diretor character varying(45) NOT NULL,
    classificacao integer NOT NULL
);


CREATE TABLE filmes_possui_generos (
    id_filme integer NOT NULL,
    id_genero integer NOT NULL
);


CREATE TABLE funcionarios (
    cpf character varying(11) NOT NULL,
    nome character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    data_admissao date NOT NULL,
    salario_base double precision NOT NULL,
    telefone_residencial character varying(45),
    telefone_celular character varying(45),
    id_endereco integer NOT NULL
);

CREATE TABLE funcionarios_gerente (
    id_funcionario_gerente integer NOT NULL,
    setor character varying(45) NOT NULL,
    adicional double precision NOT NULL,
    cpf_funcionario character varying(11) NOT NULL
);


CREATE TABLE funcionarios_vendedor (
    id_funcionario_vendedor integer NOT NULL,
    comissao integer NOT NULL,
    cpf_funcionario character varying(11) NOT NULL
);

CREATE SEQUENCE generos_id_genero_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE generos (
    id_genero integer DEFAULT nextval('generos_id_genero_sequence'::regclass) NOT NULL,
    nome character varying(45) NOT NULL
);


CREATE SEQUENCE horarios_id_horario_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE horarios (
    id_horario integer DEFAULT nextval('horarios_id_horario_sequence'::regclass) NOT NULL,
    data_hora timestamp without time zone NOT NULL
);

CREATE SEQUENCE ingressos_id_ingresso_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE ingressos (
    id_ingresso integer DEFAULT nextval('ingressos_id_ingresso_sequence'::regclass) NOT NULL,
    id_sessao integer NOT NULL,
    id_venda integer NOT NULL,
    preco double precision NOT NULL
);

CREATE SEQUENCE poltronas_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE SEQUENCE salas_id_sala_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE salas (
    id_sala integer DEFAULT nextval('salas_id_sala_sequence'::regclass) NOT NULL,
    capacidade integer NOT NULL,
    numero integer NOT NULL
);

CREATE SEQUENCE sessoes_id_sessao_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE sessoes (
    id_sessao integer DEFAULT nextval('sessoes_id_sessao_sequence'::regclass) NOT NULL,
    id_filme integer NOT NULL,
    id_horario integer NOT NULL,
    id_sala integer NOT NULL
);


CREATE SEQUENCE vendas_id_venda_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE vendas (
    id_venda integer DEFAULT nextval('vendas_id_venda_sequence'::regclass) NOT NULL,
    data timestamp without time zone,
    cpf_cliente character varying(11) NOT NULL,
    cpf_funcionario character varying(11) NOT NULL
);


INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('06275412836', '1124442563', '941643443', 203, 'Dr. Allison Rico');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('99121470731', '2623104902', '966134115', 204, 'Sra. Isabella Vale Jr.');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('56745892677', '7624377021', '943382591', 205, 'Emília Clara Barreto');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('30147135206', '5832408061', '919892780', 206, 'Sra. Elizabeth Faro Neto');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('72692475364', '2934131158', '994351601', 207, 'Ziraldo Santiago Marin');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('29391344992', '3421585769', '979483784', 208, 'Laura Rafaela Ortega Sobrinho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('98637421121', '9234255314', '951455364', 209, 'Dr. Demian Faro Sobrinho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('42858651655', '7735804554', '948565950', 210, 'David Franco Maldonado Neto');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('46677008231', '6226011350', '912218539', 211, 'Sophie Alessandra Zaragoça Jr.');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('56606368960', '3434563795', '963523233', 212, 'Emanuel Thiago Beltrão Neto');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('99919222968', '9620822426', '971184709', 213, 'Dr. Henrique das Neves Sobrinho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('04694194232', '3122393344', '953951413', 214, 'Srta. Alexa Ariadna Aragão Jr.');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('71755146469', '4930139332', '905377935', 215, 'Sr. Josué Bittencourt Torres');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('41804971073', '5923529734', '947388778', 216, 'Santiago Santana Saraiva');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('34812822815', '5527813305', '971079981', 217, 'Giovane Queirós Serra Sobrinho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('00781753139', '6122876332', '981080994', 218, 'Dr. Rafael Ortiz Filho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('43251170830', '3626339874', '995728660', 219, 'Sr. Luciano Daniel das Dores Jr.');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('28920149135', '9221352649', '940641177', 220, 'Luciano Franco Maia');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('89671476198', '3127817375', '992819393', 221, 'Sr. Cristóvão Leonardo da Cruz');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('49834931409', '4738363716', '972387451', 222, 'Valentina Paulina Paes');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('54908402000', '7224976292', '991109185', 223, 'Dr. Luis Campos Dias Neto');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('60346699363', '7821755732', '928012717', 224, 'Srta. Taís Pâmela Neves Filho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('40832391662', '7334867545', '939245195', 225, 'Nádia Pedrosa Padilha Jr.');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('72646758235', '2538937011', '989719667', 226, 'Sra. Carla Verdugo Fonseca');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('45060520307', '5727843437', '906958621', 227, 'Dr. Ivan Benjamin Caldeira');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('07328820446', '4138411860', '927685185', 228, 'Joana Jasmin Paes Neto');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('63607679452', '7128577164', '979120549', 229, 'Dr. Inácio Vega');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('47692812420', '1821923204', '969922374', 230, 'Isabella Rivera Franco');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('48900884239', '6424079257', '942307877', 231, 'Noelí Toledo Sobrinho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('77844517093', '6828243419', '976518119', 232, 'Dr. Isabel Balestero');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('41168565332', '1832732131', '939254179', 233, 'Melissa Matias');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('08415586809', '9627379208', '925289899', 234, 'Dr. Fernando Beltrão Filho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('48362684860', '1924988302', '923069570', 235, 'Abril Josefina Padrão Jr.');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('33471127330', '6221455459', '978654542', 236, 'Sr. Horácio Joaquin Delatorre Jr.');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('51432476750', '4929357075', '993171909', 237, 'Sofia Espinoza Sandoval Filho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('91873381735', '1321839375', '985760902', 238, 'Rafaela Martines');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('99015904855', '6138170018', '929070838', 239, 'Martinho Campos Soto Jr.');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('05632430154', '3335710496', '992189066', 240, 'Manuel Soares Solano Jr.');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('71603568964', '4735791476', '991359421', 241, 'Antonieta Joana Rivera Sobrinho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('52361625059', '3533122515', '994389160', 242, 'Julieta Tábata Carrara');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('32010193059', '3422680974', '946671345', 243, 'Rebeca Michele Verdara');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('17895280627', '6628371496', '966913402', 244, 'Agostinho Aragão Montenegro Filho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('36741287647', '5329018615', '949124889', 245, 'José Agostinho Carmona Sobrinho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('93113604060', '7934401989', '998619860', 246, 'Dr. Carolina Tessália Grego Filho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('24782227604', '1822608788', '997754618', 247, 'Sra. Luciana Domingues Gomes Sobrinho');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('37760256388', '7336065399', '941445281', 248, 'Dr. Ricardo Leonardo Mendonça Jr.');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('76152110939', '8230613955', '915580511', 249, 'Máximo Correia Jr.');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('47374304552', '4233271601', '999462568', 250, 'Gabriela Jasmin Marques');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('20627060498', '6736038404', '959126972', 251, 'Sr. Evandro Demian Velasques');
INSERT INTO clientes (cpf, telefone_residencial, telefone_celular, id_endereco, nome) VALUES ('38976824865', '8738069407', '909495828', 252, 'Sr. Rafael Inácio Leon');


INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (51, '1', '1981-11-16', '06275412836');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (52, '2', '1989-10-28', '56745892677');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (53, '5', '1974-10-26', '72692475364');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (54, '1', '1972-11-25', '98637421121');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (55, '4', '2006-11-15', '46677008231');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (56, '4', '1998-02-08', '99919222968');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (57, '2', '2016-02-09', '71755146469');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (58, '4', '1981-04-15', '34812822815');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (59, '2', '1998-07-17', '43251170830');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (60, '5', '2016-10-15', '89671476198');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (61, '5', '2002-05-06', '54908402000');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (62, '2', '2013-12-21', '40832391662');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (63, '4', '1998-07-21', '45060520307');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (64, '3', '1987-10-11', '63607679452');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (65, '5', '2000-10-08', '48900884239');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (66, '2', '1989-02-14', '41168565332');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (67, '5', '1980-06-06', '48362684860');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (68, '2', '1996-10-12', '51432476750');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (69, '1', '1987-03-16', '99015904855');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (70, '5', '1990-11-19', '71603568964');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (71, '3', '1989-02-10', '32010193059');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (72, '3', '1978-12-22', '36741287647');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (73, '2', '1986-11-02', '24782227604');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (74, '5', '1975-06-12', '76152110939');
INSERT INTO clientes_vip ("id_cliente_VIP", status, "data_ultimoPagamento", cpf_cliente) VALUES (75, '3', '1989-06-24', '20627060498');




INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (203, 'de Oliveira Street', '67', 'Santa', 'LuanaVille', 'Rio Grande do Norte', '82914', '1º Andar', '1º Andar');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (204, 'Sales Street', '56', 'Santa', 'MelVille', 'Minas Gerais', '16147', 'F', 'Bc. 4 Ap. 97');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (205, 'Maia Street', '76', 'Santa', 'IvanVille', 'Paraná', '88506', 'Anexo', '6º Andar');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (206, 'Furtado Street', '68', 'Vila', 'TeobaldoVille', 'Acre', '97897', 'Bc. 48 Ap. 80', 'Bloco A');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (207, 'Fernandes Street', '32', 'São', 'PedroVille', 'Mato Grosso do Sul', '47183', 'Bc. 6 Ap. 41', 'Apto 8');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (208, 'Gomes Street', '35', 'Porto', 'BiancaVille', 'Amapá', '03735', 'Bc. 66 Ap. 71', 'Apto 6');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (209, 'Santiago Street', '77', 'Vila', 'EvertonVille', 'Pernambuco', '60016', 'Bc. 1 Ap. 90', 'Bloco B');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (210, 'Delatorre Street', '80', 'Vila', 'EmílioVille', 'Distrito Federal', '71383', '688º Andar', 'F');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (211, 'Mendes Street', '71', 'Santa', 'MáximoVille', 'Pará', '47160', 'Bloco C', 'Bloco C');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (212, 'Mendes Street', '54', 'São', 'RenataVille', 'Minas Gerais', '79945', 'Apto 88', 'F');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (213, 'Gonçalves Street', '39', 'Porto', 'FernandoVille', 'Pernambuco', '93488', 'Bc. 3 Ap. 38', 'Apto 898');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (214, 'Velasques Street', '42', 'Vila', 'AlexaVille', 'Bahia', '55677', 'Bc. 8 Ap. 47', 'Apto 725');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (215, 'Sepúlveda Street', '28', 'Santa', 'RebecaVille', 'Pernambuco', '18561', 'Apto 7', '337º Andar');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (216, 'Rosa Street', '46', 'Porto', 'CarolinaVille', 'Goiás', '73255', 'Bc. 22 Ap. 36', 'Bloco B');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (217, 'Ferraz Street', '29', 'Santa', 'MaitêVille', 'Acre', '43423', 'Bloco B', 'Apto 2');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (218, 'Gonçalves Street', '12', 'São', 'ChristianVille', 'Roraima', '67509', 'F', 'Apto 9904');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (219, 'de Oliveira Street', '30', 'Porto', 'SimonVille', 'Goiás', '23419', 'Bloco A', 'Bc. 5 Ap. 89');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (220, 'Sales Street', '99', 'Porto', 'MiguelVille', 'Alagoas', '42020', 'Apto 87', 'Bc. 74 Ap. 14');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (221, 'Lozano Street', '74', 'São', 'BiancaVille', 'Bahia', '42485', '386º Andar', 'Apto 930');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (222, 'Romero Street', '71', 'Vila', 'AlonsoVille', 'Bahia', '72117', 'Bc. 1 Ap. 46', 'Bloco A');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (223, 'Faria Street', '16', 'Santa', 'MadalenaVille', 'Pernambuco', '80772', 'Apto 6608', 'Fundos');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (224, 'Guerra Street', '89', 'Santa', 'NoelíVille', 'São Paulo', '55152', '776º Andar', 'Bloco C');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (225, 'Santana Street', '79', 'Santa', 'JoséVille', 'Distrito Federal', '43440', '449º Andar', 'F');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (226, 'Fidalgo Street', '71', 'Vila', 'EmílioVille', 'Mato Grosso do Sul', '43205', 'Apto 76', 'Fundos');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (227, 'Oliveira Street', '37', 'Porto', 'ThalissaVille', 'Acre', '50255', 'F', 'Apto 93');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (228, 'Matias Street', '97', 'Porto', 'JulianaVille', 'Rio Grande do Norte', '38280', 'Bc. 5 Ap. 83', 'Bloco A');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (229, 'Santana Street', '97', 'Porto', 'HortênciaVille', 'Mato Grosso', '02907', 'Bc. 6 Ap. 86', 'Bloco B');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (230, 'Serrano Street', '60', 'São', 'AlessandraVille', 'Ceará', '94919', 'Bc. 4 Ap. 55', 'Apto 6');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (231, 'Teles Street', '13', 'Santa', 'MiaVille', 'Rio de Janeiro', '52982', '6º Andar', 'Apto 59');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (232, 'Prado Street', '71', 'Vila', 'RicardoVille', 'Sergipe', '59355', 'Apto 4', '7º Andar');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (233, 'Leal Street', '36', 'Porto', 'AndresVille', 'São Paulo', '52506', 'Bc. 67 Ap. 49', '3º Andar');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (234, 'Fontes Street', '14', 'São', 'PauloVille', 'Goiás', '95804', 'Apto 43', 'Fundos');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (235, 'Beltrão Street', '67', 'Santa', 'InácioVille', 'Piauí', '68029', 'Bloco B', 'Bloco A');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (236, 'Fonseca Street', '41', 'Santa', 'SofiaVille', 'Pernambuco', '41646', 'Bloco B', '9º Andar');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (237, 'Medina Street', '53', 'Vila', 'ValériaVille', 'Tocantins', '98070', 'F', '060º Andar');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (238, 'Medina Street', '82', 'Porto', 'BiancaVille', 'Sergipe', '01554', 'Bc. 95 Ap. 22', 'Fundos');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (239, 'Soto Street', '14', 'Santa', 'VitóriaVille', 'Ceará', '78246', 'Bloco A', 'Bc. 1 Ap. 44');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (240, 'Duarte Street', '76', 'Santa', 'JerônimoVille', 'Minas Gerais', '35253', 'Apto 2', 'Apto 8575');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (241, 'Guerra Street', '30', 'Porto', 'DemianVille', 'Minas Gerais', '68407', 'Apto 1', 'Bloco A');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (242, 'Prado Street', '10', 'São', 'MalenaVille', 'Pará', '57689', 'Apto 753', 'F');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (243, 'Marinho Street', '51', 'Santa', 'JoãoVille', 'Amazonas', '51363', 'Bc. 59 Ap. 62', '968º Andar');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (244, 'Vale Street', '13', 'Santa', 'IanVille', 'Rio Grande do Sul', '97978', '40º Andar', 'Bloco C');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (245, 'Montenegro Street', '70', 'São', 'AlmaVille', 'Goiás', '38790', 'F', 'Fundos');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (246, 'Verdugo Street', '21', 'Porto', 'AriadnaVille', 'Goiás', '32443', 'Bloco B', 'F');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (247, 'Delvalle Street', '37', 'São', 'FátimaVille', 'Amazonas', '29329', 'Bloco A', 'Bc. 04 Ap. 57');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (248, 'Roque Street', '62', 'Porto', 'MarianaVille', 'Alagoas', '06433', 'Apto 2', 'Bloco A');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (249, 'Batista Street', '33', 'Santa', 'SofiaVille', 'Rio Grande do Norte', '18548', 'Bloco B', 'Bc. 55 Ap. 99');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (250, 'Carrara Street', '68', 'São', 'RicardoVille', 'Pará', '96149', 'Bloco C', '577º Andar');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (251, 'Velasques Street', '45', 'Vila', 'IreneVille', 'Rondônia', '80038', 'Apto 50', 'F');
INSERT INTO enderecos (id_endereco, rua, numero, bairro, cidade, estado, cep, complemento, referencia) VALUES (252, 'Marés Street', '88', 'Porto', 'FernandoVille', 'Pará', '37107', '193º Andar', '9º Andar');


INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (1, 'Ut quibusdam aut.', 98, 'Dr. Luciano Alan Duarte', 18);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (2, 'Non quaerat dignissimos voluptatem qui.', 69, 'Giovana Ornela Marés', 13);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (3, 'Possimus qui sint nisi.', 72, 'Dr. Bruno Emiliano Reis', 16);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (4, 'Consectetur quia dolorem iste ullam in.', 154, 'Simão Kevin Verdara', 13);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (5, 'Voluptatem provident fugiat in.', 126, 'Rodrigo Escobar de Aguiar', 10);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (6, 'Omnis et totam voluptatibus sapiente ea.', 74, 'Dr. Agustina Espinoza Bezerra Neto', 10);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (7, 'Maxime alias velit sed.', 235, 'Fábio Sales de Souza', 16);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (8, 'Deserunt corrupti similique adipisci.', 71, 'Dr. Ivan Guerra Serra Jr.', 0);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (11, 'Rerum possimus aut.', 31, 'Sra. Joana Taís Duarte Filho', 13);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (12, 'Ducimus accusantium saepe.', 236, 'Dr. Guilherme Serra Filho', 21);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (13, 'Voluptatem magni omnis.', 115, 'Diego Jimenes Jimenes Neto', 0);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (14, 'Omnis adipisci labore nobis.', 174, 'Luis Burgos Sobrinho', 10);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (15, 'Ipsum et veritatis.', 200, 'Agustina Jasmin Padrão Filho', 16);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (16, 'Ut tempore repudiandae consequatur adipisci.', 135, 'Dr. Giovana Regina Godói', 16);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (17, 'Atque delectus vel.', 203, 'Norma Valéria Grego Filho', 21);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (18, 'Voluptatibus labore quia nihil.', 185, 'Srta. Sophie Chaves Escobar Neto', 0);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (19, 'Reprehenderit aperiam quia est aut sed.', 189, 'Ziraldo das Neves Carrara Neto', 16);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (20, 'Occaecati eius voluptate blanditiis.', 129, 'Olívia Ferreira', 18);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (21, 'Tenetur nisi itaque et.', 193, 'Sebastião Paz Neto', 16);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (22, 'Et omnis eos sed et.', 179, 'Beatriz Silvana Assunção Sobrinho', 21);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (23, 'Voluptatem rerum labore sit.', 34, 'Srta. Mia Serra Filho', 0);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (25, 'Laudantium repudiandae iusto ut.', 68, 'Sr. Antônio Marques', 16);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (26, 'Incidunt quos rerum harum.', 68, 'Vitória Santana Fernandes', 18);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (27, 'Ad ea deleniti non qui.', 84, 'Rebeca D''ávila Sandoval', 21);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (28, 'Optio sequi voluptas voluptatum et.', 192, 'Leandro Barreto Jr.', 18);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (29, 'Voluptas qui sit dignissimos illum.', 235, 'Aaron Prado Saraiva Neto', 10);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (30, 'Quidem aliquam repellendus at.', 160, 'Everton Paulo Beltrão Neto', 21);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (31, 'Beatae et dolores voluptates.', 208, 'João Delgado Jr.', 0);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (32, 'Illum est qui quis blanditiis.', 240, 'Fabiana Feliciano', 10);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (33, 'Qui iusto nam perferendis esse.', 78, 'Sra. Alma Abreu Padrão', 0);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (34, 'Vel illum ipsam.', 50, 'Eduardo Campos Delvalle', 18);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (35, 'Quaerat qui quae.', 85, 'Isadora Meireles Sobrinho', 0);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (36, 'Impedit repellat dolor.', 137, 'Emílio Emiliano Sepúlveda Jr.', 0);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (37, 'Aut et consequatur est.', 99, 'Ariadna Branco', 18);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (38, 'Laudantium praesentium alias.', 125, 'Sofia Sara Ferreira', 10);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (39, 'Maiores dolores corporis labore voluptate.', 222, 'Sra. Noelí Perez Filho', 0);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (40, 'Delectus est dolores quis optio.', 166, 'Srta. Abril Lira', 13);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (41, 'Alias hic et iste quia.', 151, 'Valéria Michele Mendonça Sobrinho', 16);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (42, 'Placeat vel nihil.', 185, 'Sr. Andres Sales Faria Filho', 21);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (43, 'Corrupti quam sed et possimus earum.', 84, 'Dr. Fernando Kevin Dias Sobrinho', 0);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (44, 'Aut vitae eius praesentium.', 124, 'Fátima Padrão Lutero Sobrinho', 18);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (45, 'Molestiae alias minus possimus officia.', 219, 'Srta. Beatriz Emília Ortega', 16);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (46, 'Minus sit repellat laboriosam.', 157, 'Allison das Neves', 16);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (47, 'Optio dolorum rerum sit.', 147, 'Pedro Pereira Lozano Jr.', 21);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (48, 'Laborum occaecati consectetur.', 143, 'Dr. Malena Manuela Santiago Jr.', 13);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (49, 'Et sequi qui impedit.', 173, 'Santiago Lovato Tamoio', 18);
INSERT INTO filmes (id_filme, nome, duracao, diretor, classificacao) VALUES (50, 'Aut sit rerum laborum.', 221, 'Dr. Violeta Marinho', 18);



INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (1, 11);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (2, 18);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (3, 18);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (4, 14);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (5, 28);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (6, 34);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (7, 34);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (8, 4);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (11, 2);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (12, 37);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (13, 6);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (14, 4);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (15, 30);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (16, 46);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (17, 2);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (18, 9);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (19, 12);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (20, 35);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (21, 28);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (22, 40);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (23, 39);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (25, 37);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (26, 22);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (27, 10);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (28, 43);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (29, 49);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (30, 41);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (31, 24);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (32, 26);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (33, 39);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (34, 30);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (35, 36);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (36, 6);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (37, 48);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (38, 50);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (39, 34);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (40, 32);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (41, 34);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (42, 37);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (43, 33);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (44, 20);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (45, 42);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (46, 36);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (47, 50);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (48, 38);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (49, 38);
INSERT INTO filmes_possui_generos (id_filme, id_genero) VALUES (50, 9);


INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('86452762915', 'Sra. Paulina Uchoa das Neves Sobrinho', 'rassuncao@bittencourt.com', '1974-05-19', 3095.7800000000002, '5326892401', '984595457', 203);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('53967805689', 'Sr. Jácomo Fábio Ferminiano Filho', 'lzaragoca@gmail.com', '1981-05-16', 3015.75, '8339378376', '947357598', 204);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('06036290756', 'Noelí Chaves Filho', 'pena.kevin@yahoo.com', '1986-02-03', 2399.63000000000011, '5434463439', '935661903', 205);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('19439094230', 'Dr. Carlos Daniel Zamana', 'valdez.agostinho@yahoo.com', '1980-12-11', 3902.44999999999982, '1832517591', '901305712', 206);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('11281614947', 'Sr. Mateus Guilherme Valdez Sobrinho', 'giovane76@yahoo.com', '1976-06-08', 4756.1899999999996, '4130101499', '969508106', 207);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('22795363747', 'Camila Bezerra Jr.', 'agostinho.rodrigues@gmail.com', '1987-10-22', 2191.90999999999985, '1137721333', '989539883', 208);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('99742270031', 'Sr. Manuel David Oliveira Neto', 'mdias@hotmail.com', '1992-04-28', 2665.19999999999982, '5321503058', '918998785', 209);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('54913567276', 'Agostinho Zaragoça Maia Jr.', 'christopher00@hotmail.com', '1987-01-18', 2550.30000000000018, '1234085236', '992190438', 210);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('10237157918', 'Sra. Manuela Sara D''ávila', 'martinho95@hotmail.com', '2007-12-29', 4776.64000000000033, '1738028365', '957847042', 211);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('68395045573', 'Sr. Bruno Anderson Roque Neto', 'isabel.vieira@yahoo.com', '1980-09-21', 3954.11000000000013, '9824126759', '999143918', 212);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('97864565808', 'Estêvão Delvalle Jr.', 'mdominato@maldonado.com', '1979-03-07', 2598.40000000000009, '4929973061', '970436679', 213);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('92022316487', 'Sr. Lucas Grego da Silva', 'pacheco.malena@estrada.org', '1971-04-21', 986.840000000000032, '1725736114', '997400263', 214);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('29752709419', 'Renata Gusmão', 'duarte.santiago@gmail.com', '2013-05-23', 1450.78999999999996, '3239501415', '941066027', 215);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('17776757233', 'Júlia Ávila da Rosa Neto', 'dias.jacomo@yahoo.com', '2008-04-01', 4491.42000000000007, '1639376875', '927052693', 216);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('79846400764', 'Miranda Espinoza Pontes', 'yesteves@velasques.com', '1992-03-09', 1375.6400000000001, '5335572228', '989515499', 217);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('09334603925', 'Sr. Luciano Aragão Sobrinho', 'rcarmona@oliveira.com', '2007-09-30', 1231.1400000000001, '3435183236', '933351464', 218);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('18681877720', 'Leandro Saraiva Pena Sobrinho', 'vila.mateus@dasilva.com', '1980-12-07', 3744.51000000000022, '8726065228', '903852049', 219);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('20691789606', 'Giovana Salgado Estrada', 'pereira.olivia@gmail.com', '2016-04-27', 1386.09999999999991, '3533006000', '951552762', 220);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('63023835799', 'Abgail Aragão', 'camila.fonseca@ortiz.biz', '1973-06-11', 4403.72999999999956, '7637361056', '944830380', 221);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('91139341472', 'Alma Olívia Lozano', 'rbarros@hotmail.com', '2003-09-19', 1500.3900000000001, '5229347155', '966136573', 222);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('83743448815', 'Paulina Padilha Casanova', 'amanda18@gmail.com', '2011-01-06', 1953.75, '3838950246', '992373283', 223);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('52514190584', 'Dr. Pedro Luis Urias', 'luciano48@colaco.com', '1976-05-09', 2834.88000000000011, '1825681084', '980390024', 224);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('41087033594', 'Laura Ramos Soto', 'sramos@caldeira.com', '1991-01-19', 4174.71000000000004, '1333932632', '941682307', 225);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('65113335070', 'Sra. Carolina Suzana Martines Jr.', 'sepulveda.jacomo@yahoo.com', '1985-12-14', 3779.09000000000015, '6425186704', '960417438', 226);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('93341972501', 'Eduardo da Silva', 'tferminiano@ferreira.com', '1980-05-09', 4153.03999999999996, '2120516695', '921151919', 227);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('51664963880', 'Norma Barros Neto', 'violeta.valentin@yahoo.com', '1981-11-18', 3877.44999999999982, '2435362967', '982780052', 228);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('89329632408', 'Dr. Amanda Santana', 'cazevedo@ferreira.com', '1973-05-23', 4151.94999999999982, '2827009833', '913120605', 229);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('75484666848', 'Srta. Amélia Solano', 'xfeliciano@jimenes.org', '2015-04-19', 2569.9699999999998, '9322012680', '971124734', 230);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('09590464297', 'Srta. Abril Velasques Jr.', 'lfurtado@yahoo.com', '1994-11-22', 2849.15999999999985, '8532807099', '941115023', 231);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('60054995728', 'Dr. Hortência da Cruz', 'madalena99@yahoo.com', '1983-08-01', 1823.43000000000006, '9125031109', '914308122', 232);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('13895884081', 'Dr. Sebastião Beltrão Mendonça', 'btorres@gmail.com', '2015-07-23', 1894.72000000000003, '4520587896', '964581978', 233);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('82704888442', 'Sra. Suzana Jasmin Gomes Sobrinho', 'ibeltrao@campos.info', '2011-10-21', 3432.67000000000007, '2933713835', '981028211', 234);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('40615805582', 'Sra. Ana Norma Sepúlveda', 'sergio11@yahoo.com', '1981-06-17', 1906.96000000000004, '7138149376', '935317576', 235);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('94308904170', 'Isaac Esteves Aranda Sobrinho', 'eescobar@abreu.org', '1971-04-18', 3443.36000000000013, '1436472259', '964935170', 236);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('00757838278', 'Sr. Vicente Elias Leon Neto', 'agostinho.teles@yahoo.com', '2013-10-06', 4029.30000000000018, '9339617331', '970589680', 237);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('89475852387', 'Sr. Evandro Lovato Salgado', 'mendonca.rebeca@gmail.com', '1992-04-05', 1579.98000000000002, '4630614755', '922856655', 238);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('22814212443', 'Luana Manuela Chaves Filho', 'dferminiano@branco.com', '1978-07-08', 3429.98000000000002, '9621527677', '917467905', 239);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('85635978681', 'Alonso Zaragoça Campos Sobrinho', 'antonieta30@hotmail.com', '1991-03-20', 1559.00999999999999, '4435233474', '973459873', 240);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('96184744968', 'Dr. Laura Melissa Ramos Sobrinho', 'miguel82@sales.com', '1995-03-25', 1673.73000000000002, '2628284291', '968925881', 241);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('56269831040', 'Kevin Toledo', 'horacio43@yahoo.com', '2017-02-01', 1521.8599999999999, '4231464602', '944627782', 242);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('72668212405', 'Sr. Luciano Cruz Uchoa', 'wfaria@gmail.com', '2017-07-13', 983.289999999999964, '7633762665', '933457833', 243);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('03305768282', 'Dr. Samuel Branco Jr.', 'sophie60@gmail.com', '1995-09-23', 4574.78999999999996, '2222643683', '925977873', 244);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('02155734557', 'Sr. Alan Toledo', 'amanda14@hotmail.com', '1972-09-15', 2737.59000000000015, '7423260770', '970718209', 245);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('90083305122', 'Sr. Dante Santana', 'kbalestero@gmail.com', '1995-09-19', 2214.69000000000005, '7437615158', '991085383', 246);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('01974517136', 'Dr. Hernani Galvão Filho', 'zamana.sofia@ferraz.org', '1997-02-20', 2796.67000000000007, '8335137351', '973970174', 247);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('41133267033', 'Dr. Paulina Nádia Rocha', 'fabiana.jimenes@leal.com', '2010-01-24', 1346.78999999999996, '8629919830', '902258274', 248);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('63229715810', 'Sra. Alma Ferreira', 'alexandre.maldonado@hotmail.com', '1982-11-02', 3393.0300000000002, '4329817671', '945823794', 249);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('53756605205', 'Carla Ramos', 'ketlin09@yahoo.com', '1992-05-25', 2454.32999999999993, '5325176680', '901159633', 250);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('49449323755', 'Clara Faria Santana', 'tfurtado@gmail.com', '1980-03-03', 2396.38999999999987, '7438570719', '944999599', 251);
INSERT INTO funcionarios (cpf, nome, email, data_admissao, salario_base, telefone_residencial, telefone_celular, id_endereco) VALUES ('48190568248', 'Sr. Alonso Abreu Sobrinho', 'luciano56@yahoo.com', '2009-07-01', 4845.5600000000004, '3739186019', '915248288', 252);


INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (1, 'RH', 931.340000000000032, '29752709419');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (2, 'Gerência', 936.580000000000041, '53756605205');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (3, 'Venda', 1104.5, '60054995728');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (4, 'Gerência', 1072.33999999999992, '96184744968');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (5, 'RH', 499.629999999999995, '96184744968');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (6, 'Venda', 329.920000000000016, '10237157918');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (7, 'Venda', 638.379999999999995, '97864565808');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (8, 'Gerência', 1221.40000000000009, '60054995728');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (9, 'RH', 503.740000000000009, '18681877720');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (10, 'Venda', 376.730000000000018, '41133267033');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (11, 'Gerência', 396.720000000000027, '97864565808');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (12, 'Venda', 1485.90000000000009, '40615805582');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (13, 'Venda', 1296.77999999999997, '00757838278');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (14, 'Gerência', 1493.09999999999991, '89329632408');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (15, 'RH', 406.920000000000016, '00757838278');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (16, 'Gerência', 1272.25999999999999, '93341972501');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (17, 'Gerência', 1091.43000000000006, '79846400764');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (18, 'RH', 1240.04999999999995, '03305768282');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (19, 'Gerência', 1178.56999999999994, '03305768282');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (20, 'Gerência', 371.04000000000002, '41087033594');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (21, 'Venda', 427.610000000000014, '53967805689');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (22, 'Venda', 995.409999999999968, '92022316487');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (23, 'RH', 388.649999999999977, '41087033594');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (24, 'RH', 345.550000000000011, '48190568248');
INSERT INTO funcionarios_gerente (id_funcionario_gerente, setor, adicional, cpf_funcionario) VALUES (25, 'RH', 1400.40000000000009, '53967805689');


INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (1, 5, '86452762915');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (2, 1, '06036290756');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (3, 10, '19439094230');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (4, 10, '11281614947');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (5, 10, '22795363747');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (6, 5, '99742270031');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (7, 1, '54913567276');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (8, 5, '68395045573');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (9, 10, '17776757233');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (10, 1, '09334603925');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (11, 10, '20691789606');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (12, 1, '63023835799');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (13, 10, '91139341472');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (14, 5, '83743448815');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (15, 5, '52514190584');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (16, 10, '65113335070');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (17, 10, '51664963880');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (18, 1, '75484666848');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (19, 10, '09590464297');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (20, 5, '13895884081');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (21, 5, '82704888442');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (22, 10, '94308904170');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (23, 5, '89475852387');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (24, 5, '22814212443');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (25, 1, '85635978681');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (26, 5, '56269831040');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (27, 5, '72668212405');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (28, 5, '02155734557');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (29, 5, '90083305122');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (30, 5, '01974517136');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (31, 10, '63229715810');
INSERT INTO funcionarios_vendedor (id_funcionario_vendedor, comissao, cpf_funcionario) VALUES (32, 1, '49449323755');


INSERT INTO generos (id_genero, nome) VALUES (1, 'Ferreira');
INSERT INTO generos (id_genero, nome) VALUES (2, 'Colaço');
INSERT INTO generos (id_genero, nome) VALUES (3, 'Uchoa');
INSERT INTO generos (id_genero, nome) VALUES (4, 'Martines');
INSERT INTO generos (id_genero, nome) VALUES (5, 'Carmona');
INSERT INTO generos (id_genero, nome) VALUES (6, 'Ortega');
INSERT INTO generos (id_genero, nome) VALUES (7, 'Carmona');
INSERT INTO generos (id_genero, nome) VALUES (8, 'Galvão');
INSERT INTO generos (id_genero, nome) VALUES (9, 'Chaves');
INSERT INTO generos (id_genero, nome) VALUES (10, 'Barreto');
INSERT INTO generos (id_genero, nome) VALUES (11, 'Sales');
INSERT INTO generos (id_genero, nome) VALUES (12, 'Valentin');
INSERT INTO generos (id_genero, nome) VALUES (13, 'Ramos');
INSERT INTO generos (id_genero, nome) VALUES (14, 'Leal');
INSERT INTO generos (id_genero, nome) VALUES (15, 'Vieira');
INSERT INTO generos (id_genero, nome) VALUES (16, 'Rocha');
INSERT INTO generos (id_genero, nome) VALUES (17, 'Galvão');
INSERT INTO generos (id_genero, nome) VALUES (18, 'Serrano');
INSERT INTO generos (id_genero, nome) VALUES (19, 'Vasques');
INSERT INTO generos (id_genero, nome) VALUES (20, 'Quintana');
INSERT INTO generos (id_genero, nome) VALUES (21, 'Mascarenhas');
INSERT INTO generos (id_genero, nome) VALUES (22, 'das Neves');
INSERT INTO generos (id_genero, nome) VALUES (23, 'Matos');
INSERT INTO generos (id_genero, nome) VALUES (24, 'Chaves');
INSERT INTO generos (id_genero, nome) VALUES (25, 'Dias');
INSERT INTO generos (id_genero, nome) VALUES (26, 'Santiago');
INSERT INTO generos (id_genero, nome) VALUES (27, 'Aguiar');
INSERT INTO generos (id_genero, nome) VALUES (28, 'Delgado');
INSERT INTO generos (id_genero, nome) VALUES (29, 'Vega');
INSERT INTO generos (id_genero, nome) VALUES (30, 'Dias');
INSERT INTO generos (id_genero, nome) VALUES (31, 'Pereira');
INSERT INTO generos (id_genero, nome) VALUES (32, 'Sales');
INSERT INTO generos (id_genero, nome) VALUES (33, 'Guerra');
INSERT INTO generos (id_genero, nome) VALUES (34, 'Gomes');
INSERT INTO generos (id_genero, nome) VALUES (35, 'Lira');
INSERT INTO generos (id_genero, nome) VALUES (36, 'Rodrigues');
INSERT INTO generos (id_genero, nome) VALUES (37, 'Rangel');
INSERT INTO generos (id_genero, nome) VALUES (38, 'Estrada');
INSERT INTO generos (id_genero, nome) VALUES (39, 'Flores');
INSERT INTO generos (id_genero, nome) VALUES (40, 'Sanches');
INSERT INTO generos (id_genero, nome) VALUES (41, 'Ferreira');
INSERT INTO generos (id_genero, nome) VALUES (42, 'Reis');
INSERT INTO generos (id_genero, nome) VALUES (43, 'Rocha');
INSERT INTO generos (id_genero, nome) VALUES (44, 'Padrão');
INSERT INTO generos (id_genero, nome) VALUES (45, 'Godói');
INSERT INTO generos (id_genero, nome) VALUES (46, 'Serrano');
INSERT INTO generos (id_genero, nome) VALUES (47, 'Correia');
INSERT INTO generos (id_genero, nome) VALUES (48, 'Delgado');
INSERT INTO generos (id_genero, nome) VALUES (49, 'Romero');
INSERT INTO generos (id_genero, nome) VALUES (50, 'Vieira');



INSERT INTO horarios (id_horario, data_hora) VALUES (1, '2006-06-20 07:54:58');
INSERT INTO horarios (id_horario, data_hora) VALUES (2, '1978-02-06 15:32:03');
INSERT INTO horarios (id_horario, data_hora) VALUES (3, '2005-05-06 06:44:15');
INSERT INTO horarios (id_horario, data_hora) VALUES (4, '1970-07-06 00:46:37');
INSERT INTO horarios (id_horario, data_hora) VALUES (5, '1994-06-15 20:50:18');
INSERT INTO horarios (id_horario, data_hora) VALUES (6, '1993-04-03 01:46:06');
INSERT INTO horarios (id_horario, data_hora) VALUES (7, '2007-11-20 16:56:22');
INSERT INTO horarios (id_horario, data_hora) VALUES (8, '2004-06-23 13:13:39');
INSERT INTO horarios (id_horario, data_hora) VALUES (9, '2008-04-29 17:50:42');
INSERT INTO horarios (id_horario, data_hora) VALUES (10, '2005-05-06 02:25:55');
INSERT INTO horarios (id_horario, data_hora) VALUES (11, '1983-06-26 20:55:43');
INSERT INTO horarios (id_horario, data_hora) VALUES (12, '2004-10-16 03:48:16');
INSERT INTO horarios (id_horario, data_hora) VALUES (13, '2012-03-30 08:47:32');
INSERT INTO horarios (id_horario, data_hora) VALUES (14, '1995-03-04 04:25:46');
INSERT INTO horarios (id_horario, data_hora) VALUES (15, '1972-09-13 00:45:09');
INSERT INTO horarios (id_horario, data_hora) VALUES (16, '1976-04-19 09:20:47');
INSERT INTO horarios (id_horario, data_hora) VALUES (17, '2010-04-10 07:11:45');
INSERT INTO horarios (id_horario, data_hora) VALUES (18, '1974-12-02 16:17:38');
INSERT INTO horarios (id_horario, data_hora) VALUES (19, '2001-11-18 13:18:31');
INSERT INTO horarios (id_horario, data_hora) VALUES (20, '1977-02-25 17:23:42');
INSERT INTO horarios (id_horario, data_hora) VALUES (21, '2001-09-18 16:24:53');
INSERT INTO horarios (id_horario, data_hora) VALUES (22, '2012-07-28 03:53:43');
INSERT INTO horarios (id_horario, data_hora) VALUES (23, '1979-07-07 19:05:34');
INSERT INTO horarios (id_horario, data_hora) VALUES (24, '2015-04-29 21:42:32');
INSERT INTO horarios (id_horario, data_hora) VALUES (25, '2002-12-04 13:27:05');
INSERT INTO horarios (id_horario, data_hora) VALUES (26, '1973-06-06 09:12:55');
INSERT INTO horarios (id_horario, data_hora) VALUES (27, '1983-03-17 02:20:31');
INSERT INTO horarios (id_horario, data_hora) VALUES (28, '1975-12-04 12:48:34');
INSERT INTO horarios (id_horario, data_hora) VALUES (29, '2016-09-02 03:08:31');
INSERT INTO horarios (id_horario, data_hora) VALUES (30, '2000-05-27 17:26:54');
INSERT INTO horarios (id_horario, data_hora) VALUES (31, '1971-03-07 13:11:30');
INSERT INTO horarios (id_horario, data_hora) VALUES (32, '1992-10-11 20:02:52');
INSERT INTO horarios (id_horario, data_hora) VALUES (33, '2016-06-09 07:55:47');
INSERT INTO horarios (id_horario, data_hora) VALUES (34, '1989-08-25 02:21:18');
INSERT INTO horarios (id_horario, data_hora) VALUES (35, '1984-06-30 23:15:57');
INSERT INTO horarios (id_horario, data_hora) VALUES (36, '2007-10-16 01:17:25');
INSERT INTO horarios (id_horario, data_hora) VALUES (37, '2008-04-12 00:19:46');
INSERT INTO horarios (id_horario, data_hora) VALUES (38, '2010-08-04 07:58:02');
INSERT INTO horarios (id_horario, data_hora) VALUES (39, '1970-06-15 16:17:40');
INSERT INTO horarios (id_horario, data_hora) VALUES (40, '1976-02-11 16:30:57');
INSERT INTO horarios (id_horario, data_hora) VALUES (41, '1979-02-03 05:49:51');
INSERT INTO horarios (id_horario, data_hora) VALUES (42, '1989-09-30 15:46:22');
INSERT INTO horarios (id_horario, data_hora) VALUES (43, '1983-12-21 13:18:14');
INSERT INTO horarios (id_horario, data_hora) VALUES (44, '1990-09-26 22:35:29');
INSERT INTO horarios (id_horario, data_hora) VALUES (45, '1997-01-26 05:37:09');
INSERT INTO horarios (id_horario, data_hora) VALUES (46, '2010-04-02 05:23:38');
INSERT INTO horarios (id_horario, data_hora) VALUES (47, '2003-10-22 04:16:48');
INSERT INTO horarios (id_horario, data_hora) VALUES (48, '2004-09-22 01:01:20');
INSERT INTO horarios (id_horario, data_hora) VALUES (49, '1971-12-19 15:16:21');
INSERT INTO horarios (id_horario, data_hora) VALUES (50, '1979-01-28 15:29:23');




INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1201, 21, 599, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1202, 13, 533, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1203, 37, 551, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1204, 2, 560, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1205, 37, 558, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1206, 18, 536, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1207, 26, 528, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1208, 8, 620, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1209, 2, 620, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1210, 30, 539, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1211, 12, 613, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1212, 28, 555, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1213, 38, 547, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1214, 19, 536, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1215, 20, 610, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1216, 19, 602, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1217, 8, 612, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1218, 40, 512, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1219, 37, 561, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1220, 31, 641, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1221, 9, 534, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1222, 31, 605, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1223, 20, 649, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1224, 6, 624, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1225, 28, 555, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1226, 38, 591, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1227, 12, 623, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1228, 5, 600, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1229, 40, 504, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1230, 29, 570, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1231, 3, 613, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1232, 38, 505, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1233, 2, 560, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1234, 12, 528, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1235, 23, 516, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1236, 19, 635, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1237, 8, 576, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1238, 24, 652, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1239, 17, 559, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1240, 34, 653, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1241, 2, 628, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1242, 17, 609, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1243, 26, 583, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1244, 41, 529, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1245, 9, 562, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1246, 29, 615, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1247, 19, 623, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1248, 5, 606, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1249, 34, 543, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1250, 28, 616, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1251, 12, 507, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1252, 41, 618, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1253, 23, 527, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1254, 36, 578, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1255, 38, 508, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1256, 33, 533, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1257, 40, 607, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1258, 12, 558, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1259, 18, 650, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1260, 20, 580, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1261, 30, 545, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1262, 29, 648, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1263, 22, 539, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1264, 38, 528, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1265, 16, 604, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1266, 39, 544, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1267, 15, 637, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1268, 5, 572, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1269, 38, 582, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1270, 33, 617, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1271, 24, 565, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1272, 5, 590, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1273, 24, 534, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1274, 9, 550, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1275, 9, 551, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1276, 3, 553, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1277, 36, 582, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1278, 39, 517, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1279, 41, 584, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1280, 24, 512, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1281, 38, 652, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1282, 23, 597, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1283, 22, 504, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1284, 4, 640, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1285, 41, 631, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1286, 19, 604, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1287, 37, 611, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1288, 39, 642, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1289, 2, 578, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1290, 20, 524, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1291, 20, 563, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1292, 30, 538, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1293, 17, 569, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1294, 33, 542, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1295, 24, 572, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1296, 16, 556, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1297, 9, 564, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1298, 40, 641, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1299, 5, 630, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1300, 16, 622, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1301, 14, 608, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1302, 20, 537, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1303, 34, 616, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1304, 15, 602, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1305, 22, 535, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1306, 30, 509, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1307, 16, 615, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1308, 17, 510, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1309, 24, 538, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1310, 30, 548, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1311, 22, 568, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1312, 24, 642, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1313, 38, 620, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1314, 17, 513, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1315, 27, 585, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1316, 22, 613, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1317, 13, 554, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1318, 17, 642, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1319, 9, 508, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1320, 33, 523, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1321, 13, 640, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1322, 29, 649, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1323, 5, 597, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1324, 5, 597, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1325, 8, 648, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1326, 24, 541, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1327, 28, 532, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1328, 17, 645, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1329, 17, 546, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1330, 28, 628, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1331, 12, 639, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1332, 39, 532, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1333, 24, 620, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1334, 15, 565, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1335, 23, 585, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1336, 23, 594, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1337, 32, 517, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1338, 12, 638, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1339, 12, 539, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1340, 6, 567, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1341, 8, 547, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1342, 41, 599, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1343, 15, 600, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1344, 18, 505, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1345, 22, 650, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1346, 7, 607, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1347, 4, 512, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1348, 24, 628, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1349, 34, 514, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1350, 41, 577, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1351, 24, 573, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1352, 13, 581, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1353, 4, 554, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1354, 18, 527, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1355, 3, 570, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1356, 29, 519, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1357, 9, 508, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1358, 29, 558, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1359, 27, 635, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1360, 12, 604, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1361, 20, 531, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1362, 4, 610, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1363, 30, 599, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1364, 30, 629, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1365, 29, 567, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1366, 17, 563, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1367, 12, 539, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1368, 20, 597, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1369, 22, 616, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1370, 24, 529, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1371, 20, 643, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1372, 40, 508, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1373, 20, 592, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1374, 5, 598, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1375, 24, 596, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1376, 39, 614, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1377, 12, 598, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1378, 12, 651, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1379, 29, 603, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1380, 38, 619, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1381, 23, 597, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1382, 40, 619, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1383, 12, 635, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1384, 37, 609, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1385, 8, 583, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1386, 40, 524, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1387, 3, 637, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1388, 2, 515, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1389, 38, 638, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1390, 36, 517, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1391, 9, 644, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1392, 23, 650, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1393, 23, 533, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1394, 39, 578, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1395, 21, 616, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1396, 8, 533, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1397, 34, 641, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1398, 28, 590, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1399, 14, 576, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1400, 7, 522, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1401, 3, 616, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1402, 38, 590, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1403, 12, 632, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1404, 15, 617, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1405, 40, 547, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1406, 21, 636, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1407, 33, 639, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1408, 36, 632, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1409, 21, 590, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1410, 5, 562, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1411, 2, 567, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1412, 30, 575, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1413, 24, 511, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1414, 28, 559, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1415, 27, 519, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1416, 28, 533, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1417, 26, 630, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1418, 32, 574, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1419, 24, 641, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1420, 21, 621, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1421, 31, 592, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1422, 4, 653, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1423, 31, 544, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1424, 22, 513, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1425, 3, 555, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1426, 13, 564, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1427, 36, 626, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1428, 34, 568, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1429, 30, 596, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1430, 2, 547, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1431, 6, 561, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1432, 16, 580, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1433, 31, 571, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1434, 41, 616, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1435, 31, 603, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1436, 32, 568, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1437, 14, 632, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1438, 26, 581, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1439, 31, 631, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1440, 16, 651, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1441, 36, 520, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1442, 6, 584, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1443, 3, 567, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1444, 14, 602, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1445, 36, 594, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1446, 32, 635, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1447, 35, 638, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1448, 24, 554, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1449, 41, 593, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1450, 21, 569, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1451, 22, 620, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1452, 40, 568, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1453, 34, 622, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1454, 38, 513, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1455, 27, 525, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1456, 12, 538, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1457, 14, 581, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1458, 12, 607, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1459, 13, 569, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1460, 16, 647, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1461, 27, 625, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1462, 14, 567, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1463, 9, 626, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1464, 20, 652, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1465, 27, 573, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1466, 31, 563, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1467, 38, 604, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1468, 17, 539, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1469, 2, 589, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1470, 23, 626, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1471, 13, 506, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1472, 39, 645, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1473, 41, 599, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1474, 7, 583, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1475, 9, 527, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1476, 13, 522, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1477, 5, 511, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1478, 26, 545, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1479, 31, 645, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1480, 18, 589, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1481, 30, 592, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1482, 13, 604, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1483, 36, 627, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1484, 13, 553, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1485, 17, 592, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1486, 17, 610, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1487, 15, 552, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1488, 34, 573, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1489, 40, 617, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1490, 13, 507, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1491, 3, 632, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1492, 30, 556, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1493, 26, 601, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1494, 24, 562, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1495, 31, 545, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1496, 26, 647, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1497, 12, 544, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1498, 39, 622, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1499, 19, 536, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1500, 24, 600, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1501, 18, 524, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1502, 13, 562, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1503, 15, 652, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1504, 38, 556, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1505, 12, 559, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1506, 4, 626, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1507, 7, 569, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1508, 29, 597, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1509, 16, 582, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1510, 2, 644, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1511, 23, 555, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1512, 26, 504, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1513, 40, 586, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1514, 22, 622, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1515, 37, 615, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1516, 27, 541, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1517, 2, 576, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1518, 8, 520, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1519, 19, 653, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1520, 24, 639, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1521, 26, 550, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1522, 3, 630, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1523, 39, 592, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1524, 30, 571, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1525, 39, 555, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1526, 35, 555, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1527, 4, 600, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1528, 14, 641, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1529, 34, 638, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1530, 40, 514, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1531, 40, 633, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1532, 24, 583, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1533, 22, 597, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1534, 8, 638, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1535, 38, 634, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1536, 41, 604, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1537, 7, 518, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1538, 24, 548, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1539, 16, 652, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1540, 8, 567, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1541, 6, 586, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1542, 24, 555, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1543, 15, 649, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1544, 28, 546, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1545, 30, 628, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1546, 13, 641, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1547, 19, 582, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1548, 15, 613, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1549, 17, 525, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1550, 8, 520, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1551, 28, 514, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1552, 31, 607, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1553, 29, 621, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1554, 41, 620, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1555, 15, 537, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1556, 14, 619, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1557, 8, 539, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1558, 8, 598, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1559, 27, 621, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1560, 40, 546, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1561, 8, 625, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1562, 28, 504, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1563, 37, 512, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1564, 14, 562, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1565, 5, 646, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1566, 17, 634, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1567, 14, 616, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1568, 21, 562, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1569, 28, 586, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1570, 28, 532, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1571, 13, 586, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1572, 19, 600, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1573, 38, 554, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1574, 8, 632, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1575, 40, 619, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1576, 6, 586, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1577, 14, 570, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1578, 22, 541, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1579, 17, 581, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1580, 3, 644, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1581, 8, 620, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1582, 38, 608, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1583, 34, 602, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1584, 8, 606, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1585, 13, 593, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1586, 2, 543, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1587, 37, 573, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1588, 33, 619, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1589, 23, 521, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1590, 39, 583, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1591, 6, 554, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1592, 36, 609, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1593, 16, 597, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1594, 23, 516, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1595, 38, 641, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1596, 26, 537, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1597, 41, 569, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1598, 39, 523, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1599, 28, 637, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1600, 33, 627, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1601, 31, 528, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1602, 32, 534, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1603, 34, 573, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1604, 17, 599, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1605, 8, 511, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1606, 26, 582, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1607, 26, 552, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1608, 12, 526, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1609, 31, 571, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1610, 31, 593, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1611, 32, 636, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1612, 17, 523, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1613, 7, 590, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1614, 19, 505, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1615, 21, 618, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1616, 19, 519, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1617, 39, 615, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1618, 39, 577, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1619, 41, 570, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1620, 19, 542, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1621, 27, 612, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1622, 22, 570, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1623, 36, 614, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1624, 40, 514, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1625, 38, 507, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1626, 24, 509, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1627, 23, 561, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1628, 32, 572, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1629, 7, 555, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1630, 18, 583, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1631, 22, 547, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1632, 13, 535, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1633, 26, 508, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1634, 32, 553, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1635, 5, 618, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1636, 39, 556, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1637, 37, 644, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1638, 22, 554, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1639, 6, 545, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1640, 29, 542, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1641, 37, 594, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1642, 31, 520, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1643, 2, 608, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1644, 36, 564, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1645, 39, 623, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1646, 34, 552, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1647, 12, 620, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1648, 39, 543, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1649, 12, 523, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1650, 15, 569, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1651, 32, 619, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1652, 24, 519, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1653, 14, 625, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1654, 33, 613, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1655, 34, 548, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1656, 36, 633, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1657, 29, 534, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1658, 36, 514, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1659, 16, 539, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1660, 29, 564, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1661, 8, 613, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1662, 9, 524, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1663, 2, 596, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1664, 38, 537, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1665, 22, 579, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1666, 9, 519, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1667, 26, 586, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1668, 21, 624, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1669, 27, 528, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1670, 17, 526, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1671, 36, 543, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1672, 15, 561, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1673, 8, 586, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1674, 17, 612, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1675, 3, 580, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1676, 32, 602, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1677, 19, 646, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1678, 30, 644, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1679, 33, 549, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1680, 41, 566, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1681, 19, 646, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1682, 19, 566, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1683, 3, 507, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1684, 18, 612, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1685, 29, 583, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1686, 20, 639, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1687, 19, 590, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1688, 21, 586, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1689, 29, 509, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1690, 30, 535, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1691, 38, 545, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1692, 21, 621, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1693, 20, 507, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1694, 34, 574, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1695, 26, 505, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1696, 17, 645, 11.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1697, 9, 629, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1698, 40, 604, 14.9900000000000002);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1699, 23, 513, 21.9899999999999984);
INSERT INTO ingressos (id_ingresso, id_sessao, id_venda, preco) VALUES (1700, 38, 648, 14.9900000000000002);



INSERT INTO salas (id_sala, capacidade, numero) VALUES (1, 1, 4);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (2, 1, 4);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (3, 4, 5);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (10, 10, 10);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (4, 16, 12);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (5, 16, 12);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (6, 16, 12);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (7, 16, 12);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (8, 44, 9);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (9, 31, 4);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (11, 72, 1);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (12, 53, 7);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (13, 13, 8);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (14, 29, 7);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (15, 90, 9);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (16, 92, 3);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (17, 89, 10);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (18, 88, 1);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (19, 67, 0);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (20, 24, 7);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (21, 56, 3);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (22, 100, 6);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (23, 13, 7);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (24, 58, 9);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (25, 49, 7);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (26, 29, 4);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (27, 34, 8);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (28, 28, 5);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (29, 45, 1);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (30, 96, 5);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (31, 41, 8);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (32, 83, 3);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (33, 11, 5);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (34, 14, 9);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (35, 15, 3);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (36, 86, 3);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (37, 73, 6);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (38, 43, 7);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (39, 10, 37);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (40, 4, 48);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (41, 86, 1);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (42, 96, 2);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (43, 83, 3);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (44, 52, 4);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (45, 35, 5);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (46, 60, 6);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (47, 59, 7);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (48, 47, 8);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (49, 49, 9);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (50, 63, 10);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (51, 41, 11);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (52, 50, 12);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (53, 59, 13);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (54, 67, 14);
INSERT INTO salas (id_sala, capacidade, numero) VALUES (55, 61, 15);



INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (2, 1, 1, 1);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (3, 2, 2, 2);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (4, 3, 3, 3);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (5, 4, 4, 4);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (6, 5, 5, 5);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (7, 6, 6, 6);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (8, 7, 7, 7);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (9, 8, 8, 8);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (12, 11, 11, 11);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (13, 12, 12, 12);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (14, 13, 13, 13);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (15, 14, 14, 14);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (16, 15, 15, 15);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (17, 16, 16, 16);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (18, 17, 17, 17);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (19, 18, 18, 18);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (20, 19, 19, 19);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (21, 20, 20, 20);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (22, 21, 21, 21);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (23, 22, 22, 22);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (24, 23, 23, 23);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (26, 25, 25, 25);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (27, 26, 26, 26);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (28, 27, 27, 27);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (29, 28, 28, 28);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (30, 29, 29, 29);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (31, 30, 30, 30);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (32, 31, 31, 31);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (33, 32, 32, 32);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (34, 33, 33, 33);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (35, 34, 34, 34);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (36, 35, 35, 35);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (37, 36, 36, 36);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (38, 37, 37, 37);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (39, 38, 38, 38);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (40, 39, 39, 39);
INSERT INTO sessoes (id_sessao, id_filme, id_horario, id_sala) VALUES (41, 40, 40, 40);


INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (504, '2012-02-17 20:15:27', '72692475364', '86452762915');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (505, '2006-02-11 11:33:12', '00781753139', '91139341472');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (506, '1978-12-09 05:33:08', '33471127330', '54913567276');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (507, '2014-05-14 06:14:10', '00781753139', '20691789606');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (508, '1992-02-12 16:13:38', '48362684860', '93341972501');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (509, '2006-04-29 15:16:44', '77844517093', '82704888442');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (510, '2013-09-06 15:26:28', '40832391662', '99742270031');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (511, '2013-07-04 01:56:40', '63607679452', '22814212443');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (512, '2002-08-23 04:36:59', '42858651655', '29752709419');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (513, '1992-06-19 05:52:34', '98637421121', '68395045573');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (514, '1976-06-30 09:25:24', '28920149135', '03305768282');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (515, '1981-11-29 19:01:26', '29391344992', '22814212443');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (516, '1976-09-22 10:21:57', '42858651655', '11281614947');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (517, '2017-07-17 10:18:50', '63607679452', '02155734557');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (518, '2004-07-31 10:20:34', '06275412836', '11281614947');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (519, '2013-03-08 15:59:17', '36741287647', '11281614947');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (520, '2005-01-31 21:58:59', '72692475364', '54913567276');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (521, '1971-01-30 18:04:32', '72646758235', '85635978681');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (522, '1999-05-10 07:33:53', '34812822815', '56269831040');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (523, '2010-09-30 04:19:07', '29391344992', '63229715810');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (524, '1971-04-09 11:10:12', '34812822815', '00757838278');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (525, '1980-10-22 08:48:00', '48900884239', '22814212443');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (526, '1980-08-13 15:32:07', '32010193059', '11281614947');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (527, '1970-06-23 18:20:58', '40832391662', '49449323755');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (528, '1983-01-06 07:02:08', '43251170830', '09590464297');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (529, '2017-04-16 03:24:37', '46677008231', '00757838278');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (530, '1973-12-20 06:48:21', '54908402000', '17776757233');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (531, '1984-02-14 13:52:10', '60346699363', '09590464297');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (532, '1977-06-28 15:06:19', '28920149135', '49449323755');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (533, '2004-09-10 13:05:31', '54908402000', '20691789606');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (534, '2005-03-04 13:27:42', '56745892677', '29752709419');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (535, '1981-12-16 05:34:02', '40832391662', '99742270031');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (536, '1978-08-02 22:00:48', '54908402000', '41133267033');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (537, '1973-03-19 23:56:27', '24782227604', '00757838278');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (538, '1979-01-28 17:48:07', '91873381735', '48190568248');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (539, '1998-12-17 13:33:28', '08415586809', '48190568248');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (540, '2017-03-13 19:36:05', '51432476750', '68395045573');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (541, '2009-07-05 01:15:37', '91873381735', '51664963880');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (542, '1995-06-27 22:29:40', '34812822815', '10237157918');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (543, '1991-10-20 17:59:53', '45060520307', '82704888442');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (544, '1993-08-16 17:56:45', '05632430154', '40615805582');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (545, '2013-04-20 17:47:19', '43251170830', '10237157918');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (546, '1992-08-02 05:00:17', '76152110939', '85635978681');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (547, '2009-07-01 15:23:17', '99015904855', '17776757233');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (548, '1990-04-14 14:01:14', '91873381735', '99742270031');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (549, '1988-08-09 05:24:09', '08415586809', '96184744968');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (550, '1973-07-04 21:19:05', '49834931409', '19439094230');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (551, '2014-01-06 10:37:24', '24782227604', '56269831040');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (552, '1989-08-17 16:48:53', '38976824865', '56269831040');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (553, '1974-08-26 22:16:31', '45060520307', '00757838278');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (554, '1993-08-16 09:44:05', '52361625059', '22795363747');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (555, '2003-08-06 23:10:00', '51432476750', '93341972501');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (556, '1988-06-01 03:59:27', '00781753139', '83743448815');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (557, '2006-01-06 10:43:58', '38976824865', '13895884081');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (558, '1990-02-14 23:16:58', '77844517093', '93341972501');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (559, '1984-03-23 16:41:29', '04694194232', '18681877720');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (560, '1982-07-19 07:36:18', '98637421121', '09590464297');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (561, '1983-07-14 05:21:41', '07328820446', '06036290756');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (562, '2008-06-07 15:26:31', '43251170830', '92022316487');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (563, '2016-07-24 03:43:34', '43251170830', '06036290756');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (564, '1989-12-06 06:02:29', '89671476198', '53756605205');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (565, '2006-05-22 19:36:31', '32010193059', '96184744968');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (566, '1997-05-07 04:25:02', '99121470731', '89475852387');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (567, '2009-07-05 11:48:07', '47692812420', '53967805689');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (568, '2006-09-02 22:38:10', '45060520307', '53967805689');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (569, '1985-08-05 06:56:17', '99015904855', '79846400764');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (570, '1981-08-18 16:19:07', '42858651655', '83743448815');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (571, '1972-04-16 12:25:41', '71603568964', '41087033594');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (572, '2016-11-04 11:09:13', '32010193059', '96184744968');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (573, '1970-05-27 20:25:24', '30147135206', '83743448815');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (574, '1980-01-10 12:55:26', '71755146469', '79846400764');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (575, '1977-08-03 10:56:11', '99015904855', '91139341472');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (576, '1979-01-15 22:00:51', '93113604060', '92022316487');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (577, '2004-01-27 15:27:26', '60346699363', '68395045573');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (578, '1999-04-26 21:08:27', '72646758235', '96184744968');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (579, '1975-01-01 13:16:51', '04694194232', '03305768282');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (580, '2004-06-09 23:33:53', '99015904855', '53967805689');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (581, '1982-08-22 23:37:07', '41168565332', '85635978681');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (582, '1973-04-21 14:24:43', '05632430154', '54913567276');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (583, '1981-08-28 14:31:55', '52361625059', '29752709419');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (584, '2003-11-10 23:48:45', '56606368960', '51664963880');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (585, '1993-03-30 20:51:15', '63607679452', '18681877720');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (586, '1997-05-29 10:41:12', '76152110939', '79846400764');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (587, '1977-09-05 17:36:31', '52361625059', '85635978681');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (588, '1988-01-23 01:23:35', '30147135206', '02155734557');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (589, '1986-10-04 22:41:42', '42858651655', '09334603925');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (590, '1988-11-27 07:26:40', '42858651655', '90083305122');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (591, '1989-05-08 12:37:16', '51432476750', '53967805689');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (592, '2010-03-08 05:45:22', '29391344992', '99742270031');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (593, '1985-02-10 15:54:18', '99919222968', '60054995728');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (594, '1971-12-07 15:11:02', '24782227604', '52514190584');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (595, '1987-12-28 13:07:57', '60346699363', '13895884081');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (596, '1971-10-25 21:06:03', '72646758235', '53967805689');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (597, '2017-04-15 02:24:47', '89671476198', '97864565808');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (598, '1976-09-27 20:21:00', '56606368960', '10237157918');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (599, '2000-08-03 19:26:23', '40832391662', '63023835799');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (600, '1992-11-23 11:21:16', '33471127330', '49449323755');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (601, '1990-06-23 03:05:23', '91873381735', '60054995728');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (602, '1972-01-12 08:22:53', '41804971073', '51664963880');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (603, '1979-06-19 15:25:49', '43251170830', '20691789606');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (604, '2003-12-03 06:49:02', '89671476198', '65113335070');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (605, '2015-01-14 00:40:04', '48362684860', '89329632408');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (606, '2012-04-12 02:29:22', '28920149135', '20691789606');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (607, '1996-10-10 19:52:56', '47692812420', '65113335070');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (608, '1982-03-13 06:09:10', '45060520307', '85635978681');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (609, '2008-07-13 23:05:53', '56745892677', '91139341472');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (610, '2010-04-26 02:22:12', '56606368960', '65113335070');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (611, '1974-08-24 06:57:57', '06275412836', '40615805582');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (612, '1992-06-10 14:11:36', '07328820446', '63023835799');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (613, '1994-09-18 07:00:41', '93113604060', '00757838278');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (614, '2008-02-08 14:37:07', '63607679452', '09334603925');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (615, '1985-10-29 07:36:58', '30147135206', '97864565808');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (616, '2006-12-27 21:01:48', '34812822815', '96184744968');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (617, '2008-02-15 13:22:13', '32010193059', '09590464297');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (618, '2013-01-11 01:16:24', '34812822815', '99742270031');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (619, '1988-04-30 20:52:45', '37760256388', '40615805582');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (620, '2000-09-07 09:10:02', '41168565332', '75484666848');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (621, '1992-12-08 18:01:48', '56606368960', '53756605205');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (622, '1990-10-06 00:53:50', '37760256388', '22814212443');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (623, '2002-02-28 05:31:28', '60346699363', '91139341472');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (624, '2009-05-08 02:44:54', '45060520307', '65113335070');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (625, '2015-05-11 19:46:31', '71603568964', '94308904170');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (626, '1980-08-30 19:48:26', '47374304552', '96184744968');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (627, '2009-07-01 09:36:57', '00781753139', '41087033594');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (628, '1980-12-28 11:25:10', '42858651655', '68395045573');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (629, '1993-07-30 21:10:14', '42858651655', '00757838278');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (630, '1997-05-22 20:40:26', '45060520307', '97864565808');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (631, '2007-01-26 15:50:35', '37760256388', '96184744968');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (632, '1994-12-05 21:21:03', '38976824865', '89475852387');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (633, '1982-07-14 14:17:08', '28920149135', '17776757233');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (634, '2005-07-07 22:50:28', '17895280627', '29752709419');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (635, '1987-02-05 17:24:03', '76152110939', '41087033594');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (636, '1973-08-24 16:15:54', '32010193059', '22795363747');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (637, '2010-08-12 05:38:24', '49834931409', '89475852387');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (638, '2007-07-02 22:48:53', '17895280627', '03305768282');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (639, '1984-10-14 21:09:44', '29391344992', '09334603925');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (640, '1997-03-29 10:22:10', '34812822815', '01974517136');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (641, '2012-02-03 13:22:46', '38976824865', '29752709419');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (642, '2013-01-22 22:48:03', '33471127330', '09334603925');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (643, '2009-05-06 19:46:27', '91873381735', '03305768282');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (644, '1991-10-20 19:13:52', '45060520307', '02155734557');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (645, '1976-01-08 04:17:47', '07328820446', '49449323755');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (646, '1995-06-18 12:13:58', '30147135206', '83743448815');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (647, '1974-06-01 16:23:40', '05632430154', '06036290756');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (648, '1987-09-13 12:20:55', '98637421121', '11281614947');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (649, '2005-01-08 18:46:27', '43251170830', '53756605205');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (650, '2003-11-17 07:44:33', '28920149135', '29752709419');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (651, '2007-02-13 02:24:46', '54908402000', '54913567276');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (652, '1991-06-21 16:56:47', '89671476198', '72668212405');
INSERT INTO vendas (id_venda, data, cpf_cliente, cpf_funcionario) VALUES (653, '1989-10-02 02:38:35', '93113604060', '68395045573');



ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cpf);


ALTER TABLE ONLY clientes_vip
    ADD CONSTRAINT clientes_vip_pkey PRIMARY KEY ("id_cliente_VIP");


ALTER TABLE ONLY enderecos
    ADD CONSTRAINT enderecos_pkey PRIMARY KEY (id_endereco);


ALTER TABLE ONLY filmes
    ADD CONSTRAINT filmes_pkey PRIMARY KEY (id_filme);


ALTER TABLE ONLY filmes_possui_generos
    ADD CONSTRAINT filmes_possui_generos_pkey PRIMARY KEY (id_filme, id_genero);


ALTER TABLE ONLY funcionarios_gerente
    ADD CONSTRAINT funcionarios_gerente_pkey PRIMARY KEY (id_funcionario_gerente);


ALTER TABLE ONLY funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (cpf);


ALTER TABLE ONLY funcionarios_vendedor
    ADD CONSTRAINT funcionarios_vendedor_pkey PRIMARY KEY (id_funcionario_vendedor);


ALTER TABLE ONLY generos
    ADD CONSTRAINT generos_pkey PRIMARY KEY (id_genero);


ALTER TABLE ONLY horarios
    ADD CONSTRAINT horarios_pkey PRIMARY KEY (id_horario);


ALTER TABLE ONLY ingressos
    ADD CONSTRAINT ingressos_pkey PRIMARY KEY (id_ingresso);


ALTER TABLE ONLY salas
    ADD CONSTRAINT salas_pkey PRIMARY KEY (id_sala);


ALTER TABLE ONLY sessoes
    ADD CONSTRAINT sessoes_pkey PRIMARY KEY (id_sessao);


ALTER TABLE ONLY vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id_venda);

ALTER TABLE ONLY clientes
    ADD CONSTRAINT fk_cliente_enderecos1 FOREIGN KEY (id_endereco) REFERENCES enderecos(id_endereco);


ALTER TABLE ONLY clientes_vip
    ADD CONSTRAINT fk_clientes_vip_cliente1 FOREIGN KEY (cpf_cliente) REFERENCES clientes(cpf);


ALTER TABLE ONLY filmes_possui_generos
    ADD CONSTRAINT fk_filmes_has_generos_filmes1 FOREIGN KEY (id_filme) REFERENCES filmes(id_filme);


ALTER TABLE ONLY filmes_possui_generos
    ADD CONSTRAINT fk_filmes_has_generos_generos1 FOREIGN KEY (id_genero) REFERENCES generos(id_genero);


ALTER TABLE ONLY funcionarios
    ADD CONSTRAINT fk_funcionario_enderecos1 FOREIGN KEY (id_endereco) REFERENCES enderecos(id_endereco);


ALTER TABLE ONLY funcionarios_gerente
    ADD CONSTRAINT fk_funcionarios_gerente_funcionarios1 FOREIGN KEY (cpf_funcionario) REFERENCES funcionarios(cpf);


ALTER TABLE ONLY funcionarios_vendedor
    ADD CONSTRAINT fk_funcionarios_vendedor_funcionarios1 FOREIGN KEY (cpf_funcionario) REFERENCES funcionarios(cpf);


ALTER TABLE ONLY ingressos
    ADD CONSTRAINT fk_ingressos_sessoes1 FOREIGN KEY (id_sessao) REFERENCES sessoes(id_sessao);


ALTER TABLE ONLY ingressos
    ADD CONSTRAINT fk_ingressos_vendas1 FOREIGN KEY (id_venda) REFERENCES vendas(id_venda);


ALTER TABLE ONLY sessoes
    ADD CONSTRAINT fk_sessoes_filmes FOREIGN KEY (id_filme) REFERENCES filmes(id_filme);



ALTER TABLE ONLY sessoes
    ADD CONSTRAINT fk_sessoes_horarios1 FOREIGN KEY (id_horario) REFERENCES horarios(id_horario);



ALTER TABLE ONLY sessoes
    ADD CONSTRAINT fk_sessoes_salas1 FOREIGN KEY (id_sala) REFERENCES salas(id_sala);



ALTER TABLE ONLY vendas
    ADD CONSTRAINT fk_venda_cliente1 FOREIGN KEY (cpf_cliente) REFERENCES clientes(cpf);



ALTER TABLE ONLY vendas
    ADD CONSTRAINT fk_venda_funcionario1 FOREIGN KEY (cpf_funcionario) REFERENCES funcionarios(cpf);


