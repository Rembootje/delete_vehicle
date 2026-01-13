config = {
    cmd = "dv", -- Command to delete the vehicle
    NotDriver = "^1Error: You must be the driver of the vehicle.", -- Error message if player is not the driver
    NoVehicle = "^1Error: You must be in a vehicle.", -- Error message if player is not in a vehicle
    ToFast = "^1Error: The vehicle is going too fast to delete.", -- Error message if vehicle speed is too high
    AllowedSpeed = 10.0, -- Maximum speedto allow vehicle deletion
    Measurement = 'KPH' -- KPH or MPH
}