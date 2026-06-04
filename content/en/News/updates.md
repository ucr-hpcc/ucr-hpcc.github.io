---
title: Cluster Updates
linkTitle: Updates
type: docs
weight: 3
---

Smaller updates and notices about the HPCC cluster. For outages and downtime events, see [Alerts](/news/alerts). For major announcements, see [Announcements](/news/announce).

__[3 Jun 2026] Apptainer Module No Longer Sets APPTAINER_BINDPATH__

The `apptainer` module (`module load apptainer`) no longer automatically sets the `APPTAINER_BINDPATH` environment variable. If your Apptainer containers rely on this variable to bind host paths (e.g. `/rhome`, `/bigdata`), they may fail to find expected files.

To fix this, explicitly pass bind paths using the `--bind` flag when running your container:

```bash
apptainer exec --bind /rhome,/bigdata my_container.sif my_command
```

Alternatively, you can set `APPTAINER_BINDPATH` yourself before running Apptainer:

```bash
export APPTAINER_BINDPATH=/rhome,/bigdata
apptainer exec my_container.sif my_command
```

If you continue to experience issues, please contact us at support@hpcc.ucr.edu or via [Slack](https://ucr-hpcc.slack.com).

