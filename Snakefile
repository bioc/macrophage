DATASETS = ["SAMEA103884898", "SAMEA103884919", "SAMEA103884949", "SAMEA103884967",
            "SAMEA103885004", "SAMEA103885021", "SAMEA103885043", "SAMEA103885059",
            "SAMEA103885102", "SAMEA103885111", "SAMEA103885136", "SAMEA103885157",
            "SAMEA103885182", "SAMEA103885218", "SAMEA103885228", "SAMEA103885262",
            "SAMEA103885276", "SAMEA103885284", "SAMEA103885308", "SAMEA103885319",
            "SAMEA103885347", "SAMEA103885368", "SAMEA103885392", "SAMEA103885413"]

SALMON = "/proj/milovelab/bin/salmon-0.12.0_linux_x86_64/bin/salmon"

rule all:
  input: expand("quants/{dataset}/quant.sf", dataset=DATASETS)

rule salmon_quant:
    input:
        r1 = "reads/{sample}_1.fastq",
        r2 = "reads/{sample}_2.fastq",
        index = "/proj/milovelab/anno/gencode.v29_salmon_0.12.0"
    output:
        "quants/{sample}/quant.sf"
    params:
        dir = "quants/{sample}"
    shell:
        "{SALMON} quant -i {input.index} -l A -p 6 --gcBias --numGibbsSamples 20 -o {params.dir} -1 {input.r1} -2 {input.r2}"
