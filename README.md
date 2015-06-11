#annotation-pipeline

This pipeline annotates a txt input file containing min 5 columns (`Chr\tStart\tEnd\tRef\tAlt`) with the following annotations.

[ANNOVAR]
[ANNOVAR]: http://annovar.openbioinformatics.org/en/latest/
- Func.refGene:	Tells whether the variant hit exons or hit intergenic regions, or hit introns, or hit a non-coding RNA genes.
- Gene.refGene:	If the variant is exonic/intronic/ncRNA, this column gives the gene name (if multiple genes are hit, comma will be added between gene names); if not, the column will give the two neighboring genes and the distance to these neighboring genes.
- GeneDetail.refGene: 
- ExonicFunc.refGene:	Tells the functional consequences of the variant (possible values in this fields include: nonsynonymous SNV, synonymous SNV, frameshift insertion, frameshift deletion, nonframeshift insertion, nonframeshift deletion, frameshift block substitution, nonframshift block substitution)
- AAChange.refGene:	Gene name, the transcript identifier and the sequence change in the corresponding transcript. 
- cytoBand: Cytogenic band.
- snp138:	dbsnp138 annotation. if present then rs id will be present else -1

[Frequencies from 1000 genome new release]
[Frequencies from 1000 genome new release]: http://www.1000genomes.org/category/frequently-asked-questions/population
- 1000g2014oct_all: All Individuals from the October 2014 release
- 1000g2014oct_eur: European Individuals from the October 2014 release
- 1000g2014oct_afr: African Individuals from the October 2014 release
- 1000g2014oct_amr: Ad Mixed American Individuals from the October 2014 release
- 1000g2014oct_eas: East Asian Individuals from the October 2014 release
- 1000g2014oct_sas: South Asian Individuals from the October 2014 release

[NHLBI]
[NHLBI]: http://evs.gs.washington.edu/EVS/
- esp6500_all:	All 6503 Individuals
- esp6500_ea:	European American
- esp6500_aa:	African American

- [cg69]: Frequency in 69 samples sequenced at Complete Genomics
[cg69]: http://www.completegenomics.com/public-data/69-genomes/	

- [nci60]: Frequency in 60 Cell lines sequenced at NCI
[nci60]: http://discover.nci.nih.gov/cellminer/home.do

[ExAC] Exome Aggregation Consortium Data.
[ExAC]: http://exac.broadinstitute.org/
- ExAC_ALL: All Individuals
- ExAC_AFR: African 
- ExAC_AMR: American
- ExAC_EAS: Eastern Asian
- ExAC_FIN: Finnish
- ExAC_NFE: Non-Finnish Europian
- ExAC_OTH: Other
- ExAC_SAS: South Asian
