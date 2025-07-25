# Para cargar iqtree:
source /u/local/Modules/default/init/modules.sh -module load iqtree/2.2.2.6

# Para cargar muscle: 
module load muscle3.8.31_i86linux64

# Obtener genes mitocondriales para una clase:
/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "cytb [GENE] AND Phyllodactylus[ORGN]" | efetch -format fasta

# Alinear secuencias: 
for gene in \*.fasta do ./muscle3.8.31_i86linux64 -in $gene -out muscle_$gene -maxiters 1 -diags done

# Editar con ATOM:
awk '/^>/ {print ">Gene_" ++count "_" substr($0, 2); next} {print}' muscle_cytb_Phyllodactylus.fasta > muscle_cytb_PhyllodactylusATOM_unid.fasta

# Realizar una filogenia:
for muscle in muscle\_\* do iqtree2 -s \${muscle} done
