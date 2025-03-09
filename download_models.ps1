# List of models to download

###########   Edit here with the models you want to download  ###########
$models = @("llama3.2:3b", "deepseek-r1:1.5b")

foreach ($MODEL in $models) {
    do {
        Write-Host "Starting download for model: $MODEL"
        # Start the download process and keep a reference to it.
        $process = Start-Process -FilePath "ollama" -ArgumentList "pull", $MODEL -PassThru

        # Wait for up to 180 seconds (180,000 milliseconds) for the process to exit.
        $completed = $process.WaitForExit(180000)
        
        if ($completed) {
            $exitCode = $process.ExitCode
            if ($exitCode -eq 0) {
                Write-Host "Download completed successfully for model: $MODEL."
                break  # Exit the retry loop and move on to the next model.
            }
            else {
                Write-Host "Download failed for model: $MODEL (Exit code: $exitCode). Retrying in 5 seconds..."
                Start-Sleep -Seconds 5
            }
        }
        else {
            Write-Host "Download did not complete within 3 minutes for model: $MODEL. Killing process and retrying in 5 seconds..."
            Stop-Process -Id $process.Id -Force
            Start-Sleep -Seconds 5
        }
    } while ($true)
}
