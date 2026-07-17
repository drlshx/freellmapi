#!/usr/bin/env pwsh
# Build FreeLLMAPI Docker image for ARM64
# Usage: .\build-arm.ps1

$ErrorActionPreference = 'Stop'

$image = "drlshx/freellmapi:latest"
$platform = "linux/arm64"

Write-Host "Building $image for $platform ..." -ForegroundColor Cyan

docker buildx build --platform $platform -t $image --load .

if ($LASTEXITCODE -eq 0) {
    Write-Host "Build succeeded: $image" -ForegroundColor Green
    Write-Host "Push to registry:" -ForegroundColor Yellow
    Write-Host "  docker push $image" -ForegroundColor Yellow
} else {
    Write-Host "Build failed" -ForegroundColor Red
    exit 1
}
