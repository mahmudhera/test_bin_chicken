conda create -n binchicken -c bioconda -c conda-forge binchicken
conda activate binchicken

# already has prefetch and fastq-dump installed

cd /usr1/mrahmanh/binchicken_demo

prefetch SRR14271365 SRR14271372 ERR2281802 ERR2281803
fastq-dump prefetch SRR14271365 SRR14271372 ERR2281802 ERR2281803