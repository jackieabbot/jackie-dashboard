# Jackie's Call Dashboard

**Public URL:** https://jackieabbot.github.io/jackie-call-dashboard/
**Password:** (Ask Annie)

This is a static dashboard that shows:
- Recent calls (inbound/outbound)
- System stats (CPU, memory, temp)
- Gateway status
- Logs

## Architecture

1. **Local generation** - Scripts on Pi generate static JSON every few minutes
2. **Push to GitHub** - Static files pushed to repo
3. **GitHub Pages** - Serves the static site
4. **Staticrypt** - Encrypts the HTML so it needs a password

## Files

- `public/` - The static site (what's deployed)
- `scripts/generate-dashboard-data.sh` - Generates JSON files

## Update Data

```bash
/home/jackie/jackie/scripts/generate-dashboard-data.sh
```

## Password

The site is protected with Staticrypt. Ask Annie for the password.

## Private Development

Private repo with full sensitive data: (separate)

Public version is sanitized and password-protected.
