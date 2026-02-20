# Call Dashboard - Development Notes

**Started:** 2026-02-19
**Status:** IN PROGRESS

## Private Repo (Development)
- **Location:** https://github.com/jackieabbot/jackie-call-dashboard
- **Access:** Private - Annie (afdon) has admin access ✓

## Vision
A web dashboard to monitor:
1. **Calls** - Inbound/outbound logs, status
2. **Gateway** - Activity, errors, health
3. **System** - CPU, memory, temperature
4. **Tokens** - API usage tracking

## Architecture

### Private Side (Sensitive)
- API endpoints that collect real data
- Stores actual phone numbers, IPs, logs
- Runs locally on the Pi

### Public Side (Sanitized)
- Static site with no sensitive data
- Password protected via Staticrypt
- Shows anonymized summaries

## Features

### Tab 1: Calls
- Recent inbound calls
- Recent outbound calls
- Call status (answered, missed, voicemail)
- Duration
- Timestamp

### Tab 2: Gateway
- Gateway status (running, errors)
- Recent log entries
- Plugin status
- Session activity

### Tab 3: System
- CPU usage
- Memory usage
- Temperature
- Disk usage
- Uptime

### Tab 4: Tokens
- LLM API usage (per call)
- Token counts
- Estimated cost

## Tech Stack
- **Frontend:** HTML/CSS/JS (lightweight, no framework)
- **Backend:** Simple API endpoints (bash scripts + JSON)
- **Auth:** Staticrypt for password protection

## TODO
- [ ] Create API endpoints for data collection
- [ ] Build dashboard UI
- [ ] Add Staticrypt
- [ ] Deploy public version
