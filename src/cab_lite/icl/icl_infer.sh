models=("qwen2.5:latest")

combinations=(
    "false w_t w_p"   # 
)

for model in "${models[@]}"; do
    for combination in "${combinations[@]}"; do
        read -r zs think persona <<< "$combination"
        
        echo "Running experiment for model: $model, zs: $zs, think: $think, persona: $persona"
        
        # icl inference
        CUDA_VISIBLE_DEVICES=CUDA_DEVICES=0 python src/icl/inference.py --dataset cab_lite --model_base $model --zs $zs --think $think --personas $persona
        
        # score calculation
        python src/calculate_scores.py --dataset cab_lite --methods icl --model_base_icl $model --zs $zs --think $think --personas $persona
    done
done