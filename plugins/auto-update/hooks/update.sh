#!/bin/bash
# Auto-update the tenzir marketplace on session start

claude plugin marketplace update tenzir 2>/dev/null || true
