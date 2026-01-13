# Delete Vehicle Script

A simple FiveM script to delete vehicles using commands. Supports personal vehicle deletion and admin mass deletion.

## Features

- Delete your own vehicle with a command (`/dv`)
- Delete nearby vehicles when not inside a vehicle (police RP)
- Delete all vehicles on the server with countdown (`/dvall` - admin only)
- Only the driver can delete their own vehicle
- Vehicle must be below a speed limit to delete (default 10 KPH)
- Admin permission check for `/dvall` command
- NPCs and their vehicles are deleted with `/dvall`
- Players in vehicles are protected from `/dvall`
- Fully configurable messages

## Installation

1. Put the `delete_vehicle` folder in your `resources` directory
2. Add `ensure delete_vehicle` to your `server.cfg`

## Configuration

Edit `config.lua` to customize:
- Commands (`dv`, `dvall`)
- Speed limit for deletion
- Distance for nearby vehicle deletion (5m default)
- All error and countdown messages

## Usage

### Delete Own Vehicle
1. Get in a vehicle as the driver
2. Make sure it's going slower than the speed limit (default 10 KPH)
3. Type `/dv` to delete it

### Delete Nearby Vehicle (Police RP)
1. Stand near a vehicle
2. Type `/dv` to delete the nearest vehicle within 5 meters
3. Vehicle cannot have players inside

### Delete All Vehicles (Admin Only)
1. Type `/dvall` to start the countdown
2. Countdown will show: 15 seconds → 10 seconds → 5-1 seconds
3. All vehicles without players will be deleted
4. NPCs and their vehicles are deleted

## Permissions

- `/dv` - Available to all players
- `/dvall` - Requires admin permissions (txAdmin access)

## Note

The countdown timing for `/dvall` (15, 10, 5-1 seconds) is hardcoded. I would not recommend changing these values as it may cause desync or other issues.
