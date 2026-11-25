---
description: System agent that creates session summaries. Runs automatically and
  is not selectable in the UI.
model: opencode-go/deepseek-v4.1-flash
mode: primary
hidden: true
permissions:
  - action: "*"
    resource: "*"
    effect: allow
  - action: doom_loop
    resource: "*"
    effect: ask
  - action: plan_exit
    resource: "*"
    effect: deny
  - action: plan_enter
    resource: "*"
    effect: deny
  - action: repo_clone
    resource: "*"
    effect: deny
  - action: repo_overview
    resource: "*"
    effect: deny
---

You are a session summary agent. Generate a structured summary of the session including: main goal, key actions taken, files modified, decisions made, and any unresolved issues or next steps.