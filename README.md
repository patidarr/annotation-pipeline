#annotation-pipeline

This pipeline annotates a txt input file containing min 5 columns (`"Chr\tStart\tEnd\tRef\tAlt"`) with the following annotations.

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

[ClinSeq]: http://www.genome.gov/20519355
- Clinseqc_genotypes:	The number of genotypes with MPG score >=10.
- Clinseqc_homref:	Number of genotypes where all alleles seen are the reference allele (I.e., if haploid, one reference allele, and if diploid, two reference alleles).
- Clinseqc_het:	Number of diploid genotypes for which one allele is the reference allele, and the other is the variant allele .
- Clinseqc_homvar:	Number of genotypes where all alleles seen are the variant allele (I.e., if haploid, one copy of the variant allele, and if diploid, two copies of the variant allele).
- Clinseqc_hetnonref:	Number of diploid genotypes for which one allele is the variant allele, and the other is a third allele that is not the reference and not the variant allele.
- Clinseqc_other:	Any genotype that cannot be categorized into one of the above categories, including haploid third alleles (which are non-reference and not the variant allele), diploid homozygous third alleles and diploid heterozygous genotypes which do not contain the variant allele.
- Clinseqc_refallele:	Number of reference alleles observed in genotypes with MPG score >=10. Haploid homref and diploid het genotypes will contribute one copy, while diploid homref genotypes will contribute two to this count.
- Clinseqc_varallele:	Number of variant alleles observed in genotypes with MPG score >=10. Haploid homnonref and diploid het and hetnonref genotypes will contribute one copy, while diploid homnonref genotypes contribute two to this count.
- Clinseqfreq_homref:	Frequency of homozygous reference genotypes.
- Clinseqfreq_het:	Frequency of heterozygous genotypes where the reference is one of the alleles.
- Clinseqfreq_homvar:       Frequency of homozygous non-reference genotypes.
- Clinseqfreq_hetnonref:    Frequency of heterozygous genotypes where the reference is not one of the alleles.
- Clinseqfreq_refallele:    Frequency of the reference allele.
- Clinseqfreq_varallele:    Frequency of the variant allele.
- Clinseqref_is_minor:      Flag 1 if the reference is the minor allele.
- Clinseqc_major:	The number of major alleles, which can be either the reference or the variant allele.
- Clinseqc_minor:	The number of minor alleles, which can be either the reference or the variant allele.
- Clinseqmaf:	The frequency of the minor allele compared to the sum of all alleles.
- Clinseqchisquare:	The chi-square value (NOT p-value) calculated using the genotypes AA, Aa, aa where A is the major allele and a is the minor allele (major and minor can only be reference or variant)
