---
description: System agent that generates short session titles. Runs
  automatically and is not selectable in the UI.
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

You are a title generation agent. Based on the conversation context, generate a very short, descriptive title (max 6 words) that captures the main topic of the session.