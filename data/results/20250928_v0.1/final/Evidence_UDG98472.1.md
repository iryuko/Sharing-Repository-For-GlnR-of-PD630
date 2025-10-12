# PD630 GlnR 候选证据摘要（UDG98472.1）

**结论（TL;DR）**  
UDG98472.1 显示典型的**放线菌型 GlnR 双域结构**：**N 端 GlnR_N（PF21695）** + **C 端 Trans_reg_C（PF00486）**，域顺序正确（N→C）。BLASTP 对多物种 GlnR 种子共识最强。PF00072（经典 REC）在本条上弱命中，符合放线菌 GlnR 的**非典型/发散 N 端**特征。→ **列为 Tier‑1 首选 GlnR**。

---

## 基本信息
- **protein_id**：UDG98472.1  
- **locus_tag**：K2Z90_001307  
- **基因组定位（GFF）**：CP080954.1: **1393996–1394751**（**+** 链）  
- **蛋白长度**：**251 aa**

---

## 1) HMMER 结构域证据（单序列复核）

| 模型 | 含义 | iE | bits | 命中区间 (aa) | 判定 |
|---|---|---:|---:|---:|---|
| **PF21695** | GlnR_N（放线菌型 N 端） | **2.7e-49** | **152.0** | **1–110** | ✅ 强 |
| **PF00486** | Trans_reg_C（OmpR/PhoB HTH） | **7.3e-33** | **98.8** | **144–217** | ✅ 强 |
| **PF00072** | REC（经典 receiver） | 0.057 | −0.1 | 32–75 | ❌ 弱（未达阈值） |

> 结构域**顺序正确**：N 端（1–110）→ C 端（144–217）。

---

## 2) 跨库佐证（RPS‑BLAST）
- **CDD**：`cd00383, trans_reg_C（HTH）`，E = **4.92e-38**，bits = **126**（✅ 强）  
- **SMART**：`smart00862, Trans_reg_C（HTH）`，E ≈ **1e-33**，bits ≈ **110**（✅ 强）  
- **Receiver/REC**：本轮 **未检出**（与 PF00072 弱命中一致）

---

## 3) N 端延长再扫 PF00072（起始偏短检验）
对 UDG98472.1 在基因组 **5' 上游各取 +20/+30/+40 aa × 3 相位** 共 9 个延长版，逐一 `hmmsearch PF00072`：

- **最优 iE 范围**：**0.062–0.073**（均未达阈值，bits 为负）  
- **命中区间**：随前缀长度**整体右移**（20 aa：~51–95；40 aa：~71–115）  
**结论**：延长**未能“救分”**，提示本支系的 N 端更像 **GlnR_N（PF21695）** 而非典型 REC。

---

## 4) BLASTP 对种子共识（seeds → PD630）
- **总种子数**：11；**有命中的 seed 数**：**11/11**  
- **UDG98472.1 得票**：**9 票**（Top1），**sum_bits**：**2952**（Top1）  
- 代表性 Top1 命中（节选）：多属 GlnR（*Rhodococcus/Actinoplanes/Streptomyces* 等）对 PD630 候选给出高分全长命中。

---

## 5) 判定与分级
- **Tier‑1 首选**：**UDG98472.1**  
  - 证据链：**PF21695(N) + PF00486(C)** 强命中且顺序正确 + BLAST 共识最强。  
  - 备注：**PF00072（REC）弱**，与放线菌 **GlnR_N 非典型 N 端**一致（采用 **(PF21695 或 PF00072) + PF00486** 的规则）。  
- **并行备选（Tier‑1b/2）**：保留“**硬双域通过**”且 sum_bits 高的若干条（如 UDG95705.1 等）进入系统树/位点分析。

---

## 6) 可复现信息（文件与命令概览）

**文件（相对仓库路径建议）**
```
data/results/20250928_v0.1/final/glnr_PD630_Tier1.faa
data/results/20250928_v0.1/blast/check_UDG98472/pf21695_vs_seq.domtbl
data/results/20250928_v0.1/blast/check_UDG98472/pf00486_vs_seq.domtbl
data/results/20250928_v0.1/blast/check_UDG98472/pf00072_vs_seq.domtbl
data/results/20250928_v0.1/blast/check_UDG98472/UDG98472.1_extend_*aa_f*.pf00072.domtbl
data/results/20250928_v0.1/blast/seed_to_pd630.tsv
```

**核心命令（摘要）**
```bash
# 单序列域复核
hmmsearch --domE 1e2 --max --domtblout pf21695_vs_seq.domtbl PF21695.hmm UDG98472.1.faa
hmmsearch --domE 1e2 --max --domtblout pf00486_vs_seq.domtbl PF00486.hmm UDG98472.1.faa
hmmsearch --domE 1e2 --max --domtblout pf00072_vs_seq.domtbl PF00072.hmm UDG98472.1.faa

# CDD/SMART（RPS-BLAST）
rpsblast -query UDG98472.1.faa -db Cdd_NCBI -outfmt "6 qseqid sseqid evalue bitscore stitle" > cdd_rps.tsv
rpsblast -query UDG98472.1.faa -db Smart    -outfmt "6 qseqid sseqid evalue bitscore stitle" > smart_rps.tsv

# N 端延长（+20/30/40aa × 3相位），再扫 PF00072 —— 详见 check_UDG98472 目录脚本与日志
```

**软件版本（请补录）**
```
hmmsearch (HMMER) 3.x
blast+ 2.15.x
rpsblast 2.15.x
```
