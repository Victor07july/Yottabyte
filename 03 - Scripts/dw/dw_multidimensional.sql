CREATE SEQUENCE public.dim_produto_sk_produto_seq;

CREATE TABLE public.dim_produto (
                sk_produto INTEGER NOT NULL DEFAULT nextval('public.dim_produto_sk_produto_seq'),
                nk_produto INTEGER NOT NULL,
                nm_produto VARCHAR(100) NOT NULL,
                marca VARCHAR(30) NOT NULL,
				valor INT NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_produto PRIMARY KEY (sk_produto)
);


ALTER SEQUENCE public.dim_produto_sk_produto_seq OWNED BY public.dim_produto.sk_produto;

CREATE SEQUENCE public.dim_cliente_sk_cliente_seq;

CREATE TABLE public.dim_cliente (
                sk_cliente INTEGER NOT NULL DEFAULT nextval('public.dim_cliente_sk_cliente_seq'),
                nk_cliente INTEGER NOT NULL,
                nm_cliente VARCHAR(50) NOT NULL,
                preferencia_produto VARCHAR(30) NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
);

ALTER SEQUENCE public.dim_cliente_sk_cliente_seq OWNED BY public.dim_cliente.sk_cliente;

CREATE TABLE public.dim_avaliacao (
                sk_avaliacao INTEGER NOT NULL DEFAULT nextval('public.dim_cliente_sk_cliente_seq'),
                nk_avaliacao INTEGER NOT NULL,
				nota VARCHAR(8) NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_avaliacao PRIMARY KEY (sk_avaliacao)
);

CREATE TABLE public.ft_venda (
                sk_produto INTEGER NOT NULL,
                sk_cliente INTEGER NOT NULL,
				sk_avaliacao INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
				dd_idvenda INT NOT NULL,
				dd_horapedido VARCHAR(50) NOT NULL,
				md_qtd INT NOT NULL,
				md_valor_total DECIMAL(7,2)
);


ALTER TABLE public.ft_venda ADD CONSTRAINT dim_data_ft_venda_fk
FOREIGN KEY (sk_data)
REFERENCES public.dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_venda ADD CONSTRAINT dim_produto_ft_venda_fk
FOREIGN KEY (sk_produto)
REFERENCES public.dim_produto (sk_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_venda ADD CONSTRAINT dim_cliente_ft_venda_fk
FOREIGN KEY (sk_cliente)
REFERENCES public.dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_venda ADD CONSTRAINT dim_avaliacao_ft_venda_fk
FOREIGN KEY (sk_avaliacao)
REFERENCES public.dim_avaliacao(sk_avaliacao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;