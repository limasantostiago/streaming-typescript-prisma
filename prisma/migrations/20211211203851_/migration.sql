-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "nascimento" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "confirmacaoSenha" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Filme" (
    "id" TEXT NOT NULL,
    "nomeFilme" TEXT NOT NULL,
    "generoFilme" TEXT NOT NULL,
    "lancamento" TEXT NOT NULL,
    "linkImagem" TEXT NOT NULL,
    "assistido" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Filme_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FilmeToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Filme_nomeFilme_key" ON "Filme"("nomeFilme");

-- CreateIndex
CREATE UNIQUE INDEX "_FilmeToUser_AB_unique" ON "_FilmeToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_FilmeToUser_B_index" ON "_FilmeToUser"("B");

-- AddForeignKey
ALTER TABLE "_FilmeToUser" ADD FOREIGN KEY ("A") REFERENCES "Filme"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilmeToUser" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
