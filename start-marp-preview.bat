@echo off
rem ---------------------------------------------------------------
rem start-marp-preview - live preview a deck with the nju theme.
rem
rem Usage:
rem   start-marp-preview.bat "C:\path\to\deck.md"
rem   start-marp-preview.bat .\decks\some-deck.md
rem
rem How it works:
rem   * Theme is always <this-script-dir>\themes\nju.css, so the markdown
rem     file can live anywhere.
rem   * Uses marp SERVER mode (-s), not preview mode (-p).
rem     -p ALWAYS writes an .html file (next to the input, or wherever -o
rem     points), so there is always a file left to clean up.
rem     -s serves the deck from memory and writes NOTHING to disk.
rem   * -s does not open a browser by itself, so we open it here after
rem     giving the server a moment to start.
rem   * Hot reload is on: edit the .md and the browser refreshes itself.
rem   * To stop the preview, just close the "Marp Preview" window.
rem ---------------------------------------------------------------

if "%~1"=="" (
  echo Usage: %~nx0 ^<markdown-file^>
  echo Example: %~nx0 "decks\my-deck.md"
  exit /b 1
)

if not exist "%~1" (
  echo File not found: %~1
  exit /b 1
)

rem serve from the folder that contains the markdown (so local images work)
cd /d "%~dp1"

rem Pin the port so the URL below is predictable (marp server mode reads PORT).
set "PORT=8080"

start "Marp Preview" marp -s -w . --theme "%~dp0themes\nju.css"

rem wait for the server to come up (~2s), then open the deck itself
rem instead of the folder index at http://localhost:8080/
ping -n 3 127.0.0.1 >nul

start "" "http://localhost:8080/%~nx1"
