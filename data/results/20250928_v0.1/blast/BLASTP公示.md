# BLASTP 公示（GlnR seeds → PD630 proteome）

- 过滤条件：qcovs ≥ 70，pident ≥ 30，evalue ≤ 1e-10
- 多数投票与分数求和见：
  - `votes.txt`（sseqid, votes）
  - `sum_bits.tsv`（sseqid, n_hits, sum_bits）
- 汇总榜单：`glnr_ranking.tsv`（含 votes/hits/sum_bits/最佳指标）
- 最佳候选序列：`glnr_pd630_top.faa`（从 proteome 提取）

> 解释：同一个 sseqid 若在 `votes.txt` 拿到多数票，并在 `sum_bits.tsv/glnr_ranking.tsv` 中居前，即被认为是 PD630 的 GlnR 首选候选。