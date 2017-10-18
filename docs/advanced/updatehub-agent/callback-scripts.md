**updatehub** Agent enables you to execute callback scripts in certain circumstances.

## Before State Transition

This callback is executed **before** every state changes with following arguments:

```enter <state>```

**Path**: ```/usr/share/updatehub/state-change-callback```

!!! info
    The output of callback script are parsed to determine transition state flow.
    To cancel the current state transition, the callback must write to stdout: ```cancel```

## After State Tranistion

This callback is executed **after** every state changes with following arguments:

```after <state>```

**Path**: ```/usr/share/updatehub/state-change-callback```

!!! info
    The output of callback script are parsed to determine transition state flow.
    To cancel the current state transition, the callback must write to stdout: ```cancel```

## Error

This callback is executed whenever an error occurs.

**Path**: ```/usr/share/updatehub/error-callback```

!!! info
    It's output is ignored.

## Validate

This callback is executed whenever a new installation is booted.

**Path**: ```/usr/share/updatehub/validate-callback```

!!! warning
    If this callback succeeds the installation is validated and proceeds as normal.
    If it fails, the agent forces a reboot into the previous installation.

## Rollback

This callback is executed whenever an installation validation fails.
After the failure, the agent reboots into the previous installation and before
entering it's normal execution, it executes the rollback callback.

**Path**: /usr/share/updatehub/rollback-callback