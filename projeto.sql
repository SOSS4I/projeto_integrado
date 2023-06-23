
CREATE TABLE public.cordenador_da_instituicao (
                cordenador_id NUMERIC(20) NOT NULL,
                nome_cordenador VARCHAR(255) NOT NULL,
                email VARCHAR(100) NOT NULL,
                senha VARCHAR(100) NOT NULL,
                telefone VARCHAR(30) NOT NULL,
                CONSTRAINT cordenador_id PRIMARY KEY (cordenador_id)
);


CREATE TABLE public.aluno_da_instituicao (
                matricualu NUMERIC(9) NOT NULL,
                curso VARCHAR(100) NOT NULL,
                nome_aluno VARCHAR(255) NOT NULL,
                email VARCHAR(100) NOT NULL,
                senha VARCHAR(100) NOT NULL,
                telefone VARCHAR(30) NOT NULL,
                cordenador_id NUMERIC(20) NOT NULL,
                CONSTRAINT matricula PRIMARY KEY (matricualu)
);


CREATE TABLE public.certificado (
                certificado_id NUMERIC(20) NOT NULL,
                cordenador_id NUMERIC(20) NOT NULL,
                matricula NUMERIC(9) NOT NULL,
                nome_atividade VARCHAR(255) NOT NULL,
                pontuacao NUMERIC NOT NULL,
                data_de_emissao DATE NOT NULL,
                pdf BYTEA NOT NULL,
                CONSTRAINT certificado_id PRIMARY KEY (certificado_id, cordenador_id, matricula)
);


ALTER TABLE public.certificado ADD CONSTRAINT cordenador_da_instituicao_certificado_fk
FOREIGN KEY (cordenador_id)
REFERENCES public.cordenador_da_instituicao (cordenador_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.certificado ADD CONSTRAINT aluno_da_instituicao_certificado_fk
FOREIGN KEY (matricula)
REFERENCES public.aluno_da_instituicao (matricualu)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;