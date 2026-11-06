conda create -n binchicken -c bioconda -c conda-forge binchicken
conda activate binchicken

# already has prefetch and fastq-dump installed

cd /usr1/mrahmanh/binchicken_demo

prefetch SRR14271365 SRR14271372 ERR2281802 ERR2281803
fastq-dump prefetch SRR14271365 SRR14271372 ERR2281802 ERR2281803

# using mash for sketching and distance calculation
mash sketch -r -k 21 -s 10000 -o ERR2281802.fastq.msh.sketch ERR2281802.fastq
mash sketch -r -k 21 -s 10000 -o ERR2281803.fastq.msh.sketch ERR2281803.fastq
mash sketch -r -k 21 -s 10000 -o SRR14271365.fastq.msh.sketch SRR14271365.fastq
mash sketch -r -k 21 -s 10000 -o SRR14271372.fastq.msh.sketch SRR14271372.fastq

# compare using mash dist
mash dist ERR2281802.fastq.msh.sketch.msh ERR2281803.fastq.msh.sketch.msh
mash dist ERR2281802.fastq.msh.sketch.msh SRR14271365.fastq.msh.sketch.msh
mash dist ERR2281802.fastq.msh.sketch.msh SRR14271372.fastq.msh.sketch.msh
mash dist ERR2281803.fastq.msh.sketch.msh SRR14271365.fastq.msh.sketch.msh
mash dist ERR2281803.fastq.msh.sketch.msh SRR14271372.fastq.msh.sketch.msh
mash dist SRR14271365.fastq.msh.sketch.msh SRR14271372.fastq.msh.sketch.msh

# results:
#ERR2281802.fastq        ERR2281803.fastq        0.0612751       0       1602/10000
#ERR2281802.fastq        SRR14271365.fastq       0.233808        3.61753e-39     37/10000
#ERR2281802.fastq        SRR14271372.fastq       0.240698        1.90646e-32     32/10000
#ERR2281803.fastq        SRR14271365.fastq       0.22668 4.68021e-48     43/10000
#ERR2281803.fastq        SRR14271372.fastq       0.233808        1.39097e-39     37/10000
#SRR14271365.fastq       SRR14271372.fastq       0.0577405       0       1747/10000

# so, this shows that 
# a. ERR2281802 and ERR2281803 are more similar to each other
# b. SRR14271365 and SRR14271372 are more similar to each other
# bin chicken also reports the same