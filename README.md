Sharing-Repository-For-GlnR-of-PD630

*本仓库用于红球菌 PD630 项目 GlnR 的序列鉴定、结构域确认、系统发育与结合位点预测，以及与实验的对接材料管理。目标是保证可复现、可协作、可追踪。*

    repo-root/
	├─ data/                     # 数据区 只放数据 不放代码  
	│  ├─ raw/                   # 原始数据 只增不改  
	│  ├─ ref/                   # 参考数据 公共基准 供多次分析复用  
	│  └─ results/               # 重要中间与终稿结果 以日期与版本做快照  
	└─ analysis/                 # 分析与文档区 代码 笔记 图表 文档  
  		├─ docs/                  # 文档 方法 周报 图注 计划 说明  
	   	├─ notebooks/             # 可复现的 Notebook  
   		├─ scripts/               # 脚本 管线  
  		└─ .gitignore             # 只忽略 analysis 侧的临时与缓存  
   
	Details✅
    *data/raw*  
    用途:外部来源的原始数据 未经任何处理 是所有分析的证据来源(只增不减)  
        典型内容  
            从 NCBI 或 UniProt 下载的原始 FASTA GBFF GFF BAM FASTQ 等  
            合作者或仪器导出的原始文件 CSV 等  
            原始样本信息表 metadata  
        命名建议  
            来源_对象_版本_日期.扩展名 like-->NCBI_PD630_proteome_RefSeq_GCF_xxxxxxx_20250922.faa.gz  
			
	*data/ref*
    用途:团队共用的稳定参考集 作为分析基线
        典型内容
            PD630 基因组 蛋白组 FASTA 与 GFF 注释
	        Pfam HMM 文件 PF00072 PF00486 等
	        功能验证过的 GlnR 种子序列集
	        物种列表 与序列映射表
			
    *data/results*
    用途:重要中间结果与终稿快照 用日期与版本号管理
        典型内容
            BLAST 与 HMMER 输出 candidates.tsv pf00072.tbl pf00486.tbl
            InterPro 或 Pfam 扫描汇总 domain_report.tsv
            多序列比对与系统树 all_rr.aln all_rr.trim.aln glnr_tree.nwk
            motif 与全基因组扫描 meme_motifs.meme motif_logo.png fimo.tsv
            regulon 候选清单 regulon_seed_list.tsv
    *analysis/docs*
    用途:文书与说明书 帮助新成员理解与复现
        建议文件
            METHODS.md 软件版本 参数 命令模板
	        DATA_LOG.md 数据获取与校验和记录
	        FIGURE_CAPTIONS.md 图注与表注
	        PLANS 计划与排期
        ⚠️注意⚠️
	        只放文字与小图 大图与大表应存放 data/results 对应版本目录
    *analysis/scripts*
    用途:可复现的脚本与自动化管线
        建议子结构
        analysis/scripts/
        ├─ env/          # 环境与依赖 environment.yml requirements.txt Dockerfile
        ├─ bin/          # 可执行脚本 bash py R
        ├─ config/       # 参数文件 YAML JSON
        ├─ pipeline/     # Snakemake Makefile Nextflow
        └─ utils/        # 公共函数与模块
