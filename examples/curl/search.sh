#!/usr/bin/env bash
# AutoScout24 Search API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./search.sh
set -euo pipefail

curl -sS -G "https://api.piloterr.com/v2/autoscout24/search" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode 'query=https://www.autoscout24.fr/lst/volkswagen/golf?atype=C'
