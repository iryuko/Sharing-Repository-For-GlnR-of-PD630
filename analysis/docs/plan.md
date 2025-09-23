#分工. 
##**角色1**(核心分析A). 
-BLAST HMMER → candidates.tsv；Pfam InterPro → domain_report.tsv；整合候选清单初稿

##**角色2**(核心分析). 
-系统树构建 MAFFT trimAl IQ-TREE → glnr_tree.nwk；motif 分析 MEME FIMO → motif_logo.png fimo.tsv；生成 oligo_design.tsv

##**角色3**(支撑+分析).  
-功能标注候选基因 氮代谢相关性；整合生成*regulon_seed_list.tsv*；文献综述与方法记录 *METHODS.md*图注说明 *FIGURE_CAPTIONS.md*

#Timeline (new). 
##**第0阶段**
    -角色2 准备参考数据 proteome genome GFF Pfam seeds. 
    -角色3 建文档骨架 METHODS.md DATA_LOG.md. 

##**第1阶段**
    -角色1 BLAST HMMER → candidates.tsv
    -角色3 候选基因初步功能注释
    -角色2 初步多序列比对

##**第2阶段**
    -角色1 Pfam InterPro → domain_report.tsv
	-角色2 正式构树 → glnr_tree.nwk
	-角色3 整合候选与域注释
##**第3阶段**
	-角色2 MEME FIMO → motif_logo.png fimo.tsv
	-角色3 生成 regulon_seed_list.tsv
	-角色1 检查 motif 与树结果一致性
##**第4阶段**
	-角色2 提炼实验片段 → oligo_design.tsv
	-角色3 更新方法文档和图注
	-角色1 总检查 落盘到 data/results/YYYYMMDD_v0.1/. 
#✅ 四个阶段完成后意味着什么
候选基因鉴定（BLAST HMMER Pfam）. 
结构域确认. 
系统发育树. 
motif 位点预测靶基因清单与实验片段设计. 
**如果把这四步做完，就等于=完成了生信部分的主线任务**
但是生信部分只能预测，验证需要在实验部分进行，两部分的结果要呼应