@echo off
rem ---------------------------------------------------------------
rem start-marp-preview - live preview a deck with the nju theme.
rem
rem Usage:
rem   start-marp-preview.bat "C:\path\to\deck.md"
rem   start-marp-preview.bat .\decks\some-deck.md
rem
rem What it does:
rem   * Always uses THIS script's folder theme: <script-dir>\themes\nju.css
rem     (the old version used a relative "themes\nju.css" after cd-ing to
rem      the markdown folder, so the theme was silently not found whenever
rem      the .md lived somewhere else.)
rem   * marp's preview mode always writes an HTML file next to the input.
rem     We redirect it into %TEMP% so your markdown folder stays clean.
rem   * Hot reload is on: edit the .md and the browser refreshes itself.
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

start "Marp Preview - %~nx1" marp -p -w "%~nx1" --theme "%~dp0themes\nju.css" -o "%TEMP%\marp-preview\%~n1.html"
