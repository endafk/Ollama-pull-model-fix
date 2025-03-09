

# Ollama Model Downloader

This repository contains a Bash script designed to fix the problem that most people go through while pulling models from Ollama. When pulling models from ollama sometimes the download starts going backwards and retrying. This fixes that.

Edit the script depending on your operating system and put the model(s) you want to pull.

# Windows

You might need to adjust your execution policy to run scripts.
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

* Run the script 
```powershell
.\download_models.ps1
```
# Linux
**Make the script executable:**
```bash
chmod +x download_models.sh
```
3. **Run the script:**
```bash
./download_models.sh
```


Leave the script running and it will sequentially download each model. The retry mechanism ensures that if a download is interrupted or takes too long, it will automatically attempt again