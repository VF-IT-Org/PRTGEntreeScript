# PRTGEntreeScript

PowerShell script for checking the age of a report endpoint and returning a PRTG-friendly status message.

## Requirements

- PowerShell 5.1 or later
- Network access to the report server
- Integrated authentication to the target report URL

## Usage

Run the script and optionally override the report URL:

```powershell
powershell -ExecutionPolicy Bypass -File .\script.ps1 -ReportUrl "http://server/report.csv"
```

## Current behavior

The script:

1. Downloads the report with default credentials.
2. Reads a timestamp from the returned content.
3. Calculates how many minutes old the report is.
4. Writes a simple status line that PRTG can consume.

## Maintenance notes

- The default report URL should be treated as environment-specific.
- The timestamp parsing currently assumes a fixed content format and offset.
- A future hardening pass should add explicit parsing validation and clearer non-zero exits on failures.
