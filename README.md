# Especies de Phyllodactylus en Ecuador

## Autores: Joaquín Ordóñez

## Propósito

-   Proporcionaremos informacion util para el conocimiento de las especies del género de gecos nocturnos Phyllodactylus en Ecuador. Podremos obtener filogenias precisas e informacion molecular ordenada, que nos ayude a tener una mejor representación de las especies ecuatorianas. Esto podria solventar muchos problemas y podria ser de mucha ayuda para investigaciones futuras que esten relacionadas a este genero de gecos nocturnos.

## Instalar

-   necesitaremos programas afines a la elaboracion de una filogenia.

-   Programas como: IQTREE (para realizar filogenias), MUSCLE/Blast (para alinear las secuencias), NCBI (sitio web para conseguir secuencias genéticas), GIT-BASH (terminal)

## Como usar

-   ***(*****IMPORTANTE*)*** Para realizar la actividad de mejor manera asegurarse que las secuencias esten en formato FASTA

-   Para cargar Iqtree: - source /u/local/Modules/default/init/modules.sh -module load iqtree/2.2.2.6

-   Para cargar muscle: -module load muscle3.8.31_i86linux64

-   Obtener genes para una familia: ./datasets download gene symbol BRCA1 --ortholog Aotidae --filename braca1_Aotidae.zip

-   Obtener todos los genes para un orden: ./datasets download gene symbol BRCA1 --ortholog primates --filename braca1_primates.zip

-   Obtener genes para una clase: ./datasets download gene symbol BRCA1 --ortholog mammals --filename braca1_mammlas.zip

-   Obtener todos los genes disponibles para una especie en particular: ./datasets summary gene taxon "Cebus imitator" --as-json-lines \| ./dataformat tsv gene --fields tax-name,gene-id,symbol

-   Obtener genes mitocondriales: /u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "cytb [GENE] AND Xylocopa[ORGN]" \| efetch -format fasta

-   Alinear secuencias: for gene in \*.fasta do ./muscle3.8.31_i86linux64 -in $gene -out muscle_$gene -maxiters 1 -diags done

-   Realizar una filogenia: for muscle in muscle\_\* do iqtree2 -s \${muscle} done

![*Phyllodactylus*](https://www.reptilesofecuador.com/thumbnails/phyllodactylus_baurii_adult1_s.jpg)
