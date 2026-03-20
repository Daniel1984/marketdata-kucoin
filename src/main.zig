const std = @import("std");
const kucoin = @import("./kucoin.zig");
const Env = @import("./env.zig");
const symbol_map = @import("./symbols.zig").symbol_map;
const relay = @import("marketdata_relay_pub");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer if (gpa.deinit() == .leak) {
        std.debug.panic("leaks detected", .{});
    };
    const allocator = gpa.allocator();

    var env = Env.init(allocator);
    const zmq_pub_url = env.getString("ZMQ_PUB_URL", "tcp://127.0.0.1:5555");
    defer allocator.free(zmq_pub_url);

    var publisher = try relay.Self.init(allocator, .{ .stream_url = zmq_pub_url });
    defer publisher.deinit();
    try publisher.connect();

    var kc = try kucoin.init(allocator, publisher);
    defer kc.deinit();

    try kc.getSocketConnectionDetails();
    try kc.connectWebSocket();

    try kc.subscribe(symbol_map);
    try kc.consume();

    std.log.info("consumer stopped...", .{});
    std.process.exit(0);
}
