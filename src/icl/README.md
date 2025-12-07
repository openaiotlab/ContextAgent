# ICL Setting
This folder provides scripts for evaluating different LLMs under In-Context Learning (ICL) settings.  It supports multiple base models (e.g., GPT-4o, Qwen, LLaMA, and DeepSeek series) and two execution modes: **`live`** and **`sandbox`**.

### 🔑 API Keys
Choose ONE to configure environment variables:

#### Source a shell script (recommended)
```bash
$EDITOR scripts/env/export_env.sh   # fill your keys
source scripts/env/export_env.sh
```

#### Or export inline
```bash
export AZURE_OPENAI_API_KEY=<YOUR_AZURE_OPENAI_API_KEY>
export AZURE_OPENAI_ENDPOINT=<YOUR_AZURE_OPENAI_ENDPOINT>
export AZURE_OPENAI_API_VERSION=<YOUR_AZURE_OPENAI_API_VERSION>

export GOOGLE_MAP_API_KEY=<YOUR_GOOGLE_MAP_API_KEY>
export AMAP_API_KEY=<YOUR_AMAP_API_KEY>
export LOCATIONIQ_API_KEY=<YOUR_LOCATIONIQ_API_KEY>
export SERPAPI_KEY=<YOUR_SERPAPI_KEY>
export GOOGLE_CALENDAR_ACCOUNT=<GOOGLE_CALENDAR_ACCOUNT>
```
### ️ ▶️ Usage
- **Open-source models.** Test open-source LLMs (e.g., Llama-3.1-8B-Instruct and Qwen2.5-7BInstruct).

  - ##### Python (direct)
    ```
    python src/icl/inference.py --model <MODEL_NAME> --mode sandbox
    ```

  - ##### Shell script
    ```
    bash scripts/icl/run_infer_local.sh
    ```

- **Proprietary LLMs.** Use API inference for proprietary LLMs (e.g., GPT-4o).

  - ##### Python (direct)
    ```
    python src/icl/inference_api.py --model <MODEL_NAME> --mode sandbox
    ```

  - ##### Shell script
    ```
    bash scripts/icl/run_infer_api.sh
    ```

| Argument  | Type   | Description                                                                 |
|-----------|--------|-----------------------------------------------------------------------------|
| `--model` | string | Base model to evaluate (e.g., `qwen2.5:latest`, `llama3.1:8b`, `deepseek-r1`) 
| `--mode`  | string | • **`live`** – the agent actually executes external tools and APIs <br>• **`sandbox`** – the agent uses predefined sandboxed results without making real API calls |

### ️ 📊 Scoring
After inference finishes, compute metrics per model:
```
python src/calculate_scores.py --methods icl --model_base_icl <MODEL_NAME>
```
