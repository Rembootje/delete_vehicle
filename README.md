# Delete Vehicle Script

A simple FiveM script to delete your vehicle using the the specified command.

## Features

- Delete your vehicle with a command
- Only the driver can delete the vehicle
- Vehicle must be below a speed limit to delete (default 10 KPH)
- Configurable error messages

## Installation

1. Put the `delete_vehicle` folder in your `resources` directory
2. Add `ensure delete_vehicle` to your `server.cfg`

## Configuration

For configuration you can edit `config.lua`:

## Usage

1. Get in a vehicle as the driver
2. Make sure the vehicle is not moving too fast
3. Type the specified command to delete it

## Error Messages

- You must be the driver
- You must be in a vehicle  
- The vehicle is going too fast
