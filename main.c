#include <stdio.h>
#include <stdlib.h>
#include <string.h>


typedef struct
{
   char nome[40];
   char mail[50];
   char tel[20];
   char cel[20];
} Contatos;

Contatos Pessoa;

FILE *pFile;

/**************************************************************************
* FUNÇÕES E PROTÓTIPOS                                                    *
**************************************************************************/

void abre_arquivo(void);
void cadastrar(void);
void consultar(void);
void editar();
void excluir(void);
void excluir_contato(void);
void fecha_arquivo(void);
void limpar_buffer(void);
void limpar_tela(void);
void listar(void);
void mostrar(void);
int procurar(char[40]);

int main()
{
   int opMenu=0;

   abre_arquivo();

   do
   {
      limpar_tela();

      printf("\n\t\t\tAGENDA DE CONTATOS\n\n");
      printf("\n\t1-Cadastrar");
      printf("\n\t2-Consultar");
      printf("\n\t3-Editar");
      printf("\n\t4-Excluir");
      printf("\n\t5-Listar");
      printf("\n\t0-Sair\n");
      printf("\n\tOpcao.: ");
      scanf("%d", &opMenu);

      if(opMenu != 0)
      {
         switch(opMenu)
         {
            case 1:
               cadastrar();
               break;

            case 2:
                consultar();
               break;

            case 3:
               editar();
               break;

            case 4:
               excluir();
               break;

            case 5:
               listar();
               break;

            default:
               break;
         }
      }

   }while(opMenu != 0);

   fecha_arquivo();

   return(0);

}

void abre_arquivo(void)
{
   pFile = fopen("BancoDados.bin", "a+b");
}

void cadastrar(void)
{
   int opMenu=0;

   do
   {
      limpar_tela();

      printf("\n\t\t\tNOVO CADASTRO\n\n");
      printf("\n\tDigite o nome.....: ");
      limpar_buffer();
      fgets(Pessoa.nome, 40, stdin);
      printf("\n\tDigite o e-mail...: ");
      limpar_buffer();
      fgets(Pessoa.mail, 50, stdin);
      printf("\n\tDigite o telefone.: ");
      limpar_buffer();
      fgets(Pessoa.tel, 20, stdin);
      printf("\n\tDigite o celular..: ");
      limpar_buffer();
      fgets(Pessoa.cel, 20, stdin);

      fseek(pFile, 0, SEEK_END);

      fwrite(&Pessoa, sizeof(Contatos), 1, pFile);

      printf("\n\n\tDeseja efetuar outro cadastro? (1-Sim / 0-Nao).: ");
      scanf("%d", &opMenu);

   }while(opMenu == 1);

}

void consultar(void)
{
   int opMenu=0;
   char nome[40];

   do
   {
      limpar_tela();

      printf("\n\t\t\tCONSULTA DE CONTATOS\n\n");
      printf("\n\tDigite o nome.: ");
      limpar_buffer();
      fgets(nome, 40, stdin);
      printf("\n\t________________________________________________________________\n");
      procurar(nome);
      printf("\n\t________________________________________________________________\n");
      printf("\n\n\tConsultar outro contato? (1-Sim / 0-Nao).: ");
      scanf("%d", &opMenu);

   }while(opMenu == 1);
}

void editar(char nome[40])
{
   int opMenu=0;

   do
   {
      limpar_tela();

      printf("\n\t\t\tEDICAO DE CONTATOS\n\n");
      printf("\n\t1-Editar");
      printf("\n\t2-Voltar ao menu principal\n");
      printf("\n\tOpcao.: ");
      scanf("%d", &opMenu);

      switch(opMenu)
      {
         case 1:
            procurar(nome);
            break;

         case 2:
            break;

         default:
            opMenu = 1;
            break;
      }

   }while(opMenu == 1);

}

void excluir(void)
{
   int opMenu=0;

   do{
      limpar_tela();

      printf("\n\t\t\tEXCLUSAO DE CONTATOS\n\n");
      printf("\n\t1-Um por vez");
      printf("\n\t2-Todos");
      printf("\n\t0-Voltar ao menu principal\n");
      printf("\n\tOpcao.: ");
      scanf("%d", &opMenu);

      switch(opMenu)
      {
         case 1:
            excluir_contato();
            break;

         case 2:
            break;

         default:
            break;
      }

   }while(opMenu != 0);

}

void excluir_contato(void)
{
    char nome[40];

    printf("\n\tDigite o nome do contato.: ");
    limpar_buffer();
    fgets(nome, 40, stdin);
    if(procurar(nome) == 0)
    {
        FILE *pTemp;
        pTemp = fopen("Temp.bin", "a+b");

        rewind(pFile);

        while( feof(pFile) == 0 )
        {
            fread(&Pessoa, sizeof(Contatos), 1, pFile);

            if( strcmp(nome, Pessoa.nome)!= 0 )
            {
                fwrite(&Pessoa, sizeof(Contatos), 1, pTemp);
            }
        }

        rename("Temp.bin", "BancoDados.bin");
        fclose(pTemp);
    }

    else
    {
        limpar_buffer();
        getchar();
    }
}

void fecha_arquivo(void)
{
   fclose(pFile);
}

void limpar_buffer(void)
{
   #ifdef __WIN32__
      fflush(stdin);
   #endif

   #ifdef __linux__
      __fpurge(stdin);
   #endif
}

void limpar_tela(void)
{
   #ifdef __WIN32__
      system("cls");
   #endif

   #ifdef __linux__
      system("clear");
   #endif
}

void listar(void)
{
   rewind(pFile);

   limpar_tela();

   printf("\n\t\t\tRELATORIO DE CONTATOS\n\n");
   printf("\n\t________________________________________________________________\n");

   do
   {
      fread(&Pessoa, sizeof(Contatos), 1, pFile);

      if( feof(pFile)==0 )
      {
         mostrar();
      }

   }while( feof(pFile)==0 );

    printf("\n\t________________________________________________________________\n");
   printf("\n\tTecle enter para voltar ao menu principal");
   limpar_buffer();
   getchar();

}

void mostrar(void)
{
   printf("\n\tNome.....: %s", Pessoa.nome);
   printf("\n\tE-mail...: %s", Pessoa.mail);
   printf("\n\tTelefone.: %s", Pessoa.tel);
   printf("\n\tCelular..: %s\n", Pessoa.cel);

}

int procurar(char nome[40])
{
   rewind(pFile);

   do
   {
      fread(&Pessoa, sizeof(Contatos), 1, pFile);

      if( strcmp(nome, Pessoa.nome)==0 )
      {
         mostrar();
      }

   }while( feof(pFile)==0 && strcmp(nome, Pessoa.nome)!=0 );

   if( strcmp(nome, Pessoa.nome)!=0 )
   {
      printf("\n\tContato inexistente!");
      return(1);
   }

   else
   {
       return(0);
   }

}
