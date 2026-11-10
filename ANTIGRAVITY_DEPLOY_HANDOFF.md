# HEPCO frontend deployment handoff

Deploy the current frontend changes after verifying the production preview.

## Scope

- Deploy `HEPCO_Frontend` only. No backend behavior or API changed in this task.
- Preserve all unrelated working-tree changes, especially the existing backend deletions and schema/documentation edits.
- Public site colors now use environmental green, white and black. Check the header hotline and home CTA in particular.
- Article detail thumbnails and rich-text images now preserve aspect ratio and stay centered/responsive.
- Public routes are lazy-loaded to reduce the initial JavaScript entry bundle.

## Checks already run

- `npm --prefix HEPCO_Backend_API test`: pass, 29/29.
- `npm --prefix HEPCO_Frontend run lint`: pass.
- `npm --prefix HEPCO_Frontend run build`: pass. Vite still reports the deferred migrated-data and PDF worker chunks above 500 kB.

## Before production deploy

1. Open the Vercel preview and check `/`, `/gioi-thieu`, `/dich-vu`, `/tin-tuc`, `/bai-viet/<id>`, and `/quan-he-co-dong` at 320, 375, 768, 1024 and 1440 px widths.
2. Verify hero/card images use intentional crops, while article body images preserve ratio, remain centered and do not overflow.
3. Verify the PDF reader toolbar remains legible and article/search/filter controls still work.
4. If those checks pass, deploy the frontend to production and report the deployment URL and commit/deployment identifier.

Manual viewport checks are still pending; do not report them as passed until performed.
