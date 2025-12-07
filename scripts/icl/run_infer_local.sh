#!/bin/bash

models=("qwen2.5:latest" "llama3.1:8b" "deepseek-r1")
combinations=(
    "false w_t w_p"   
)

for model in "${models[@]}"; do
    for combination in "${combinations[@]}"; do
        read -r zs think persona <<< "$combination"
        
        echo "Running experiment for model: $model, zs: $zs, think: $think, persona: $persona"
        echo "Using GPUs: ${CUDA_VISIBLE_DEVICES:-all available}"
        
        # icl inference
        CUDA_VISIBLE_DEVICES=0 python src/icl/inference.py --mode sandbox --dataset cab --model_base $model --zs $zs --think $think --personas $persona

        # score calculation
        python src/calculate_scores.py --dataset cab --methods icl --model_base_icl $model --zs $zs --think $think --personas $persona
    done
done