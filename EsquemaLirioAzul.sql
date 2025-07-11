CREATE TABLE IF NOT EXISTS "SaborTrufa" (
	"id_sabor_trufa" INTEGER NOT NULL UNIQUE,
	"sabor" VARCHAR NOT NULL,
	PRIMARY KEY("id_sabor_trufa")
);

CREATE TABLE IF NOT EXISTS "Cliente" (
	"id_cliente" INTEGER NOT NULL,
	"nome" VARCHAR NOT NULL,
	"cpf" INTEGER NOT NULL,
	"data_nascimento" DATE NOT NULL,
	"genero" VARCHAR,
	PRIMARY KEY("id_cliente"),
	FOREIGN KEY ("id_cliente") REFERENCES "EnderecoCliente"("id_cliente")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "Trufa" (
	"id_trufa" INTEGER NOT NULL,
	"id_tipo_trufa" INTEGER NOT NULL,
	"id_sabor_trufa" INTEGER NOT NULL,
	"preco" REAL NOT NULL CHECK("preco" > 0),
	"estoque" INTEGER NOT NULL CHECK("estoque" >= 0),
	PRIMARY KEY("id_trufa"),
	FOREIGN KEY ("id_sabor_trufa") REFERENCES "SaborTrufa"("id_sabor_trufa")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY ("id_tipo_trufa") REFERENCES "TipoTrufa"("id_tipo_trufa")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "Pedido" (
	"id_pedido" INTEGER NOT NULL,
	"id_cliente" INTEGER NOT NULL,
	"data_pedido" DATETIME NOT NULL,
	PRIMARY KEY("id_pedido"),
	FOREIGN KEY ("id_cliente") REFERENCES "Cliente"("id_cliente")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "ItemPedido" (
	"id_item_pedido" INTEGER NOT NULL,
	"id_pedido" INTEGER NOT NULL,
	"id_trufa" INTEGER NOT NULL,
	"quantidade" INTEGER NOT NULL CHECK("quantidade" > 0),
	"total_pedido" REAL NOT NULL,
	PRIMARY KEY("id_item_pedido"),
	FOREIGN KEY ("id_pedido") REFERENCES "Pedido"("id_pedido")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY ("id_trufa") REFERENCES "Trufa"("id_trufa")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "TelefoneCliente" (
	"id_telefone_cliente" INTEGER NOT NULL UNIQUE,
	"id_cliente" INTEGER NOT NULL,
	"codigo_pais" INTEGER NOT NULL,
	"ddd" INTEGER NOT NULL,
	"telefone" INTEGER NOT NULL,
	PRIMARY KEY("id_telefone_cliente"),
	FOREIGN KEY ("id_cliente") REFERENCES "Cliente"("id_cliente")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS "EnderecoCliente" (
	"id_endereco_cliente" INTEGER NOT NULL UNIQUE,
	"id_cliente" INTEGER NOT NULL,
	"logradouro" VARCHAR NOT NULL,
	"id_cidade" INTEGER NOT NULL,
	"id_estado" INTEGER NOT NULL,
	"id_pais" INTEGER NOT NULL,
	PRIMARY KEY("id_endereco_cliente")
);

CREATE TABLE IF NOT EXISTS "TipoTrufa" (
	"id_tipo_trufa" INTEGER NOT NULL UNIQUE,
	"tipo_trufa" VARCHAR NOT NULL,
	PRIMARY KEY("id_tipo_trufa")
);
