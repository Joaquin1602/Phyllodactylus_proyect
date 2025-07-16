# Especies de Phyllodactylus en Ecuador

## Autores: Joaquín Ordóñez

## Propósito

-   Proporcionaremos informacion util para el conocimiento de las especies del género de gecos nocturnos Phyllodactylus en Ecuador. Podremos obtener filogenias precisas e informacion molecular ordenada, que nos ayude a tener una mejor representación de las especies ecuatorianas. Esto podria solventar muchos problemas y podria ser de mucha ayuda para investigaciones futuras que esten relacionadas a este genero de gecos nocturnos.
  
![*Phyllodactylus*](https://www.reptilesofecuador.com/thumbnails/phyllodactylus_baurii_adult1_s.jpg)

## Gen a utilizar: 
* Cytocromo B (cytb)
## Instalar

-   necesitaremos programas afines a la elaboracion de una filogenia.

-   Programas como: IQTREE (para realizar filogenias), MUSCLE/Blast (para alinear las secuencias), NCBI (sitio web para conseguir secuencias genéticas), GIT-BASH (terminal), ATOM (editar las secuencias obtenidas)

## Como usar (Comandos)

-   (***IMPORTANTE*)*** Para realizar la actividad de mejor manera asegurarse que las secuencias esten en formato FASTA

-   Para cargar Iqtree:
```
 source /u/local/Modules/default/init/modules.sh -module load iqtree/2.2.2.6
```
-   Para cargar muscle:
```
module load muscle3.8.31_i86linux64
```
-   Obtener genes mitocondriales para una clase:
```
/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "cytb [GENE] AND Phyllodactylus[ORGN]" | efetch -format fasta
```
-   Alinear secuencias:
```
for gene in \*.fasta do ./muscle3.8.31_i86linux64 -in $gene -out muscle_$gene -maxiters 1 -diags done
```
-   Editar con ATOM:
```
awk '/^>/ {print ">Gene_" ++count "_" substr($0, 2); next} {print}' muscle_cytb_Phyllodactylus.fasta > muscle_cytb_PhyllodactylusATOM_unid.fasta
```
-   Realizar una filogenia:
```
for muscle in muscle\_\* do iqtree2 -s \${muscle} done
```
-   Para poder visualizar el arbol necesitamos el uso de Figtree v1.4.5
-   [**Filogenia Phyllodactylus gen cytb**](https://github.com/Joaquin1602/Phyllodactylus_proyect/blob/main/Filogenia%20Phyllodactylus.pdf)
-  [**SCRIPT**](https://github.com/Joaquin1602/Phyllodactylus_proyect/blob/main/SCRIPT.sh)
