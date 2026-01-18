const std = @import("std");
const kucoin = @import("./kucoin.zig");
const relay = @import("marketdata_relay_pub");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer if (gpa.deinit() == .leak) {
        std.debug.panic("leaks detected", .{});
    };
    const allocator = gpa.allocator();

    var publisher = try relay.Self.init(allocator, .{});
    defer publisher.deinit();
    try publisher.connect();

    var kc = try kucoin.init(allocator, publisher);
    defer kc.deinit();

    try kc.getSocketConnectionDetails();
    try kc.connectWebSocket();

    const topics = [_][]const u8{
        "/spotMarket/level2Depth50:BTC-USDT",
        "/spotMarket/level2Depth50:ETH-USDT",
        "/spotMarket/level2Depth50:SOL-USDT",
        "/spotMarket/level2Depth50:XRP-USDT",
    };
    try kc.subscribe(topics[0..]);

    kc.consume() catch |err| {
        std.log.err("Consumer failed with error: {}", .{err});
        return err;
    };

    std.log.info("WebSocket connection closed", .{});
}
