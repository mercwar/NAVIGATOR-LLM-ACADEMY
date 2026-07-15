:: ============================================================
:: FILENAME: rename_by_page_prefix.bat
:: AVIS-COMPONENT: FILE-RENAME-BY-PAGE-PREFIX
:: ARTIFACT-ID: AV-BATCH-2026-PAGE-PREFIX
:: STATE-MATRIX-REF: Version 1/STATE/global.state
:: SAVE-DIRECTORY: /Navigator-Cyborg-Live/
:: ============================================================

:: AIFVS-ARTIFACT
:: AVIS: Batch script to prefix filenames with PG-## based on <h2>Page # – ... inside HTML

@echo off
setlocal enabledelayedexpansion

:: Loop through all HTML files in current folder
for %%f in (*.html) do (
    set "pagenum="
    for /f "tokens=2 delims= " %%a in ('findstr /i "<h2>Page" "%%f"') do (
        set "pagenum=%%a"
    )
    if defined pagenum (
        :: Pad with leading zero if needed
        if !pagenum! lss 10 (
            set "pagenum=0!pagenum!"
        )
        echo Renaming %%f to PG-!pagenum!-%%f
        ren "%%f" "PG-!pagenum!-%%f"
    )
)

echo Done.
pause
