#!/usr/bin/awk -f
# 输入：--domtblout（hmmscan 或 hmmsearch 都可）
# 输出：protein_id 级别的候选汇总（含 REC/HTH 两域最佳分数与坐标、顺序与宽松通过标记）

$1 ~ /^#/ { next }

{
  # 自动判别：开头像 PFxxxxx 是 hmmscan，否则 hmmsearch
  if ($1 ~ /^PF[0-9]/) {                    # hmmscan: target=HMM, query=sequence
    hmm_name=$1; hmm_acc=$2; seq_id=$4; seq_len=$6; iE=$13+0; dsc=$14+0; sfrom=$18+0; sto=$19+0;
  } else {                                  # hmmsearch: target=sequence, query=HMM
    seq_id=$1; seq_len=$3; hmm_name=$4; hmm_acc=$5; iE=$13+0; dsc=$14+0; sfrom=$18+0; sto=$19+0;
  }

  isREC = (hmm_acc ~ /^PF00072/ || hmm_name == "Response_reg");
  isHTH = (hmm_acc ~ /^PF00486/ || hmm_name == "Trans_reg_C");

  if (isREC) {
    if (!(seq_id in rec_sc) || dsc > rec_sc[seq_id]) {
      rec_sc[seq_id]=dsc; rec_iE[seq_id]=iE; rec_s[seq_id]=sfrom; rec_e[seq_id]=sto; len[seq_id]=seq_len;
    }
  }
  if (isHTH) {
    if (!(seq_id in hth_sc) || dsc > hth_sc[seq_id]) {
      hth_sc[seq_id]=dsc; hth_iE[seq_id]=iE; hth_s[seq_id]=sfrom; hth_e[seq_id]=sto; len[seq_id]=seq_len;
    }
  }
}

END{
  print "protein_id\tprot_len\trec_sc\trec_iE\trec_start\trec_end\thth_sc\thth_iE\thth_start\thth_end\torder_ok\tlen_ok\tiEval_ok\tpass";
  for (id in len){
    hasREC=(id in rec_sc); hasHTH=(id in hth_sc);
    if (!hasREC && !hasHTH) continue;
    ord  = (hasREC && hasHTH && rec_s[id] < hth_s[id]) ? "Y" : "N";
    lOK  = (len[id] >= 150 && len[id] <= 350) ? "Y" : "N";
    iOK  = (hasREC && hasHTH && rec_iE[id] <= 1e-2 && hth_iE[id] <= 1e-2) ? "Y" : "N";
    pass = (ord=="Y" && lOK=="Y" && iOK=="Y") ? "Y" : "N";
    printf "%s\t%d\t%.2f\t%.2g\t%d\t%d\t%.2f\t%.2g\t%d\t%d\t%s\t%s\t%s\t%s\n",
           id, len[id], rec_sc[id]+0, rec_iE[id]+0, rec_s[id]+0, rec_e[id]+0,
           hth_sc[id]+0, hth_iE[id]+0, hth_s[id]+0, hth_e[id]+0, ord, lOK, iOK, pass;
  }
}