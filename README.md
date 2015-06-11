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

[CADD]: http://cadd.gs.washington.edu/
- CADD:  Combined Annotation Dependent Depletion (CADD) Score
- CADD_Phred:  Combined Annotation Dependent Depletion (CADD) Score

[SIFT]: http://sift.jcvi.org/
- SIFT Prediction: Prediction from SIFT (DAMAGING, TOLERATED, Not scored, Damaging due to stop, N/A, DAMAGING *Warning! Low confidence.)
- SIFT Score: 0 = DAMAGING, 1 = TOLERATED, N/A = Damaging due to stop, Not scored, N/A

[PolyPhen-2]: http://genetics.bwh.harvard.edu/pph2/
- PPH2 Prediction:(benign, possibly damaging, probably damaging)
- PPH2 Class: (neutral, deleterious)
- PPH2 Probability: (neutral, deleterious)

- [clinvar_20150330]:
[clinvar_20150330]: http://www.ncbi.nlm.nih.gov/clinvar/

- [cosmic70]:
[cosmic70]: http://cancer.sanger.ac.uk/cancergenome/projects/cosmic/

[HGMD]: https://portal.biobase-international.com/hgmd/pro/global.php#other
NIH Users can create account and access the database [here]. Enter the code 1881-6975-97565225 in the license field during the account registration process.
[here]: https://portal.biobase-international.com/cgi-bin/portal/login.cgi
- hgmd2014.3_Acc-No: If HGMD member, accession number, gene name, defination, disease related to in HGMD, Category as defined by HGMD, and Reference Pubmed ID.
- hgmd2014.3.Gene: Gene Name
- hgmd2014.3_GeneName: Full Name
- hgmd2014.3_Disease: Associated Disease
- hgmd2014.3_Category: Category as defined by hgmd.
- hgmd2014.3_Reference_PMID: PubMed ID

[MATCH]: Trial 
[MATCH]: http://www.cancer.gov/about-cancer/treatment/clinical-trials/nci-supported/nci-match
- MATCH.v3 Gene: Gene Name
- MATCH.v3 Inclusion Mutation: Amino Acid Change
- MATCH.v3 Arm description 
- MATCH.v3 Level of Evidence 

[DoCM]: Database of Curated Mutations
[DoCM]: http://docm.genome.wustl.edu/
- DoCM Disease: Name of the cancer type
- DoCM PMID: PubMed ID

[My Cancer Genome]: If this particular mutation is present in MCG
[My Cancer Genome]: http://www.mycancergenome.org/
- MyCG_Gene: Name of the gene
- MyCG_Codon: Codon change in database
- MyCG_Diagnosis: Cancer Type
- MyCG_Targated Therapy: Targated therapy suggested
- MyCG_Other Implications: Other implications


- [Total_ICGC]: https://icgc.org/ 
- [Count_TCGA_ALL]: http://www.cbioportal.org/public-portal/index.do
- 2008.Parsons.Glio.Multiforme: 
- 2010Barretina.SoftTissueSarcoma
- 2011Heravi.DICER1
- 2011Rausch.Medulloblastoma
- 2011.Zhang Retinoblastoma
- 2012Cheung.NB
- 2012Gruber.AML
- 2012Harrison.PoorRiskLeukemia
- 2012.Jones Medulloblastoma
- 2012Kannar.LowerGradeGlioma
- 2012.Lee.Rhabdoid
- 2012Molenaar.NB
- 2012Roberts.HighRiskALL
- 2012Robinson.Medulloblastoma.Germline
- 2012Robinson.Medulloblastoma Somatic
- 2012Wu.Glioblastoma
- 2012Zhang.ALL
- 2013.Chen Rhabdo 
- 2013Holmfeldt.HyperdiploidALL
- 2013Loh.ALL
- 2013.Pugh.NB
- 2013Sausen
- 2013Zhang.Glioma
- 2014Chen.Osteo
- 2014.Huether.1000PediatricCancerGenomes
- 2014.Shern Rhabdo (44)
- 2014.Wu High Grade Glioma(116)
- 2014.Brohl.EWS
- 2013.Dorschner.Actionable
- 2013.Wei.DW
- 2014.Shern.RMSExpressed
- 2014Tirode.EWS
- 2014Crompton.EWS
- PCG_Total
- Grand_Total
- UVM #Centers
- UVM #Samples
- IF.Actionable-exomic-incidental-findings
- IF.Name
- IF.Condition(s)
- IF.Frequency
- IF.Clinical-significance (Last reviewed)
- IF.Review status
- Gene.refGene
- ACMG_Disease
- ACMG_Age-to-Report
- ACMG_Gene-Reviews-PubMedID
- ACMG_Inheritance
- ACMG_Known-vs-Expected
- ACMG_LSDB
