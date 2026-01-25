const std = @import("std");
const kucoin = @import("./kucoin.zig");
const relay = @import("marketdata_relay_pub");

const symbol_map = std.StaticStringMap([]const u8).initComptime(.{
    .{ "/spotMarket/level2Depth5:BTC-USDT", "BTC:USDT" },
    .{ "/spotMarket/level2Depth5:ETH-USDT", "ETH:USDT" },
    .{ "/spotMarket/level2Depth5:SOL-USDT", "SOL:USDT" },
    .{ "/spotMarket/level2Depth5:XRP-USDT", "XRP:USDT" },
    .{ "/spotMarket/level2Depth5:LTC-USDT", "LTC:USDT" },
    .{ "/spotMarket/level2Depth5:SUI-USDT", "SUI:USDT" },
    .{ "/spotMarket/level2Depth5:TRX-USDT", "TRX:USDT" },
    .{ "/spotMarket/level2Depth5:DOGE-USDT", "DOGE:USDT" },
    .{ "/spotMarket/level2Depth5:XLM-USDT", "XLM:USDT" },
    .{ "/spotMarket/level2Depth5:AVAX-USDT", "AVAX:USDT" },
    .{ "/spotMarket/level2Depth5:DOT-USDT", "DOT:USDT" },
    .{ "/spotMarket/level2Depth5:ADA-USDT", "ADA:USDT" },
    .{ "/spotMarket/level2Depth5:ATOM-USDT", "ATOM:USDT" },
    .{ "/spotMarket/level2Depth5:XTZ-USDT", "XTZ:USDT" },
    .{ "/spotMarket/level2Depth5:ZEC-USDT", "ZEC:USDT" },
});

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

    try kc.subscribe(symbol_map);
    try kc.consume();

    std.log.info("consumer stopped...", .{});
    std.process.exit(0);
}
