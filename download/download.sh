export CTN=TCGA-G3-A25S_2002-09-15_42

export N1=ISPY1_1198_38
export N2=TCGA-OL-A5D8_49
export N3=UCSF-BR-63_16

export L0=/Users/feiyin/Downloads/exp/ct_to_ctc
export L1=/Users/feiyin/Downloads/exp/dce1_to_dce2
export L2=/Users/feiyin/Downloads/exp/dce1_to_dce23
export L3=/Users/feiyin/Downloads/exp/dce13_to_dce2

# export R11=/fsx/feiyin/yf_project/DiT-SR_baseline/experiments/results/ditsr_dce1_dce2
# export R12=/fsx/feiyin/yf_project/DiT-SR_baseline/experiments/results/ditsr_dce1_to_dce23
# export R13=/fsx/feiyin/yf_project/DiT-SR_baseline/experiments/results/ditsr_dce13_to_dce2
# export R1N=ditsr

# export R21=/fsx/feiyin/yf_project/MambaIR_baseline/experiments/output/dce1_to_dce2
# export R22=/fsx/feiyin/yf_project/MambaIR_baseline/experiments/output/dce1_to_dce23
# export R23=/fsx/feiyin/yf_project/MambaIR_baseline/experiments/output/dce13_to_dce2
# export R2N=mambair

# export R31=/fsx/feiyin/yf_project/rwkv-based-medical-image-translation/experiments/test_result/dce1_dce2
# export R32=/fsx/feiyin/yf_project/rwkv-based-medical-image-translation/experiments/test_result/dce1_to_dce23
# export R33=/fsx/feiyin/yf_project/rwkv-based-medical-image-translation/experiments/test_result/dce13_to_dce2
# export R3N=rwkv

# export R41=/fsx/feiyin/yf_project/patch-based-diff-for-medical-image-translation/test_results/dce1_dce2/dce1_dce2_channel3_31w
# export R42=/fsx/feiyin/yf_project/patch-based-diff-for-medical-image-translation/test_results/dce1_to_dce23
# export R43=/fsx/feiyin/yf_project/patch-based-diff-for-medical-image-translation/test_results/dce13_to_dce2
# export R4N=patchdiff

# export R52=/fsx/feiyin/yf_project/ResViT_baseline/ckpt/dce1TO23_jpg/test/latest_net
# export R5N=resvit

export R60=/fsx/feiyin/yf_project/SelfRDB_baseline/logs/ct_to_ctc/version_8/test/
export R61=/fsx/feiyin/yf_project/SelfRDB_baseline/logs/dce1_to_dce2/version_1/test
export R62=/fsx/feiyin/yf_project/SelfRDB_baseline/logs/dce1_to_dce23/version_4/test
export R63=/fsx/feiyin/yf_project/SelfRDB_baseline/logs/dce13_to_dce2/version_3/test
export R6N=SelfRDB

export R70=/fsx/feiyin/yf_project/Palette_baseline/experiments/ct_to_ctc
export R71=/fsx/feiyin/yf_project/Palette_baseline/experiments/dce1_to_dce2
export R72=/fsx/feiyin/yf_project/Palette_baseline/experiments/dce1_to_dce23
export R73=/fsx/feiyin/yf_project/Palette_baseline/experiments/dce13_to_dce2
export R7N=Palette

export R80=/fsx/feiyin/yf_project/HiNet_baseline/test_results/ct_to_ctc
export R81=/fsx/feiyin/yf_project/HiNet_baseline/test_results/dce1_to_dce2
export R82=/fsx/feiyin/yf_project/HiNet_baseline/test_results/dce1_to_dce23
export R83=/fsx/feiyin/yf_project/HiNet_baseline/test_results/dce13_to_dce2
export R8N=HiNet

"""
scp feiyin@rl-research-shared-1:${R11}/${N1}.png ${L1}/${N1}/${R1N}_${N1}_dce2.png
scp feiyin@rl-research-shared-1:${R12}/dce2/${N1}.png ${L2}/${N1}/${R1N}_${N1}_dce2.png
scp feiyin@rl-research-shared-1:${R12}/dce3/${N1}.png ${L2}/${N1}/${R1N}_${N1}_dce3.png
scp feiyin@rl-research-shared-1:${R13}/dce2/${N1}.png ${L3}/${N1}/${R1N}_${N1}_dce2.png
"""

for N in $N1 $N2 $N3; do
  for i in 6 7 8; do
    eval R1=\$R${i}1
    eval R2=\$R${i}2
    eval R3=\$R${i}3
    eval RN=\$R${i}N

    # dce1 -> dce2
    scp feiyin@rl-research-shared-1:${R1}/dce2/${N}.png ${L1}/${N}/${RN}_${N}_dce2.png

    # dce1 -> dce23 (dce2, dce3)
    scp feiyin@rl-research-shared-1:${R2}/dce2/${N}.png ${L2}/${N}/${RN}_${N}_dce2.png
    scp feiyin@rl-research-shared-1:${R2}/dce3/${N}.png ${L2}/${N}/${RN}_${N}_dce3.png

    # dce13 -> dce2
    scp feiyin@rl-research-shared-1:${R3}/dce2/${N}.png ${L3}/${N}/${RN}_${N}_dce2.png
  done
  # scp feiyin@rl-research-shared-1:${R52}/dce2/${N}.png ${L2}/${N}/${R5N}_${N}_dce2.png
  # scp feiyin@rl-research-shared-1:${R52}/dce3/${N}.png ${L2}/${N}/${R5N}_${N}_dce3.png
done

# ct -> ctc
mkdir ${L0}/${CTN}/
for i in 6 7 8; do
  eval R0=\$R${i}0
  eval RN=\$R${i}N
  scp feiyin@rl-research-shared-1:${R0}/ctc/${CTN}.png ${L0}/${CTN}/${RN}_${CTN}_ctc.png
done