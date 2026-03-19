const std = @import("std");

allocator: std.mem.Allocator,

const Env = @This();

pub fn init(allocator: std.mem.Allocator) Env {
    return .{
        .allocator = allocator,
    };
}

/// Get a string from an environment variable, with a default value if not found
/// Note: The returned string is a duplicate that must be freed by the caller
pub fn getString(self: *const Env, name: []const u8, default_value: []const u8) []const u8 {
    const env_value = std.process.getEnvVarOwned(self.allocator, name) catch {
        // If env variable doesn't exist, duplicate the default value
        return self.allocator.dupe(u8, default_value) catch default_value;
    };

    // env_value is already owned by caller, return it directly
    return env_value;
}
