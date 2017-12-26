# Axoloti-Patches
Believotron Axoloti Patches

These are the objects and patches used to interface Believotron hardware to Axoloti hardware.

The first hardware supported is the Believotron Wanderlust.

This project is in an open beta. The codebase is currently hot spaghetti and in active refactoring.

Sign up for newsletters at http://believotron.com/sign-up

Ask questions, raise issues, and find answers in the http://community.believotron.com

# Task list:
## Short term
- Continue removing old/dependency code/objects
- Build unit tests
- Finalize file locations
- Install on new system and write Getting Started documentation
- Verify install on Beta user

## Mid term
- Add midi controllers on request

## Technical Debt
- Rename /logic/trigger_if_const to /logic/bufferOnChannelSel and update all upstream references
- /math/Spread8 seems backwards. Flip logic and add a switch to count up/down. Update all upstream references

## Completed:
- Refactored and created tests for /logic
- Refactored and created tests for /math
