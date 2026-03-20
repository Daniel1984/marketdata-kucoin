const std = @import("std");

pub const symbol_map = std.StaticStringMap([]const u8).initComptime(.{
    // BTC
    .{ "/spotMarket/level2Depth5:BTC-USDT", "BTC:USDT" },
    .{ "/spotMarket/level2Depth5:BTC-USDC", "BTC:USDC" },
    .{ "/spotMarket/level2Depth5:BTC-EUR", "BTC:EUR" },

    // ETH
    .{ "/spotMarket/level2Depth5:ETH-USDT", "ETH:USDT" },
    .{ "/spotMarket/level2Depth5:ETH-USDC", "ETH:USDC" },
    .{ "/spotMarket/level2Depth5:ETH-BTC", "ETH:BTC" },
    .{ "/spotMarket/level2Depth5:ETH-EUR", "ETH:EUR" },

    // SOL
    .{ "/spotMarket/level2Depth5:SOL-USDT", "SOL:USDT" },
    .{ "/spotMarket/level2Depth5:SOL-USDC", "SOL:USDC" },

    // XMR
    .{ "/spotMarket/level2Depth5:XMR-USDT", "XMR:USDT" },
    .{ "/spotMarket/level2Depth5:XMR-USDC", "XMR:USDC" },
    .{ "/spotMarket/level2Depth5:XMR-BTC", "XMR:BTC" },
    .{ "/spotMarket/level2Depth5:XMR-ETH", "XMR:ETH" },

    // LTC
    .{ "/spotMarket/level2Depth5:LTC-USDT", "LTC:USDT" },
    .{ "/spotMarket/level2Depth5:LTC-USDC", "LTC:USDC" },
    .{ "/spotMarket/level2Depth5:LTC-BTC", "LTC:BTC" },
    .{ "/spotMarket/level2Depth5:LTC-ETH", "LTC:ETH" },

    // XLM
    .{ "/spotMarket/level2Depth5:XLM-USDT", "XLM:USDT" },
    .{ "/spotMarket/level2Depth5:XLM-USDC", "XLM:USDC" },
    .{ "/spotMarket/level2Depth5:XLM-BTC", "XLM:BTC" },
    .{ "/spotMarket/level2Depth5:XLM-ETH", "XLM:ETH" },

    // TRX
    .{ "/spotMarket/level2Depth5:TRX-USDT", "TRX:USDT" },
    .{ "/spotMarket/level2Depth5:TRX-USDC", "TRX:USDC" },
    .{ "/spotMarket/level2Depth5:TRX-BTC", "TRX:BTC" },
    .{ "/spotMarket/level2Depth5:TRX-ETH", "TRX:ETH" },

    // ZEC
    .{ "/spotMarket/level2Depth5:ZEC-USDT", "ZEC:USDT" },
    .{ "/spotMarket/level2Depth5:ZEC-BTC", "ZEC:BTC" },

    // SUI
    .{ "/spotMarket/level2Depth5:SUI-USDT", "SUI:USDT" },
    .{ "/spotMarket/level2Depth5:SUI-USDC", "SUI:USDC" },

    // DOGE
    .{ "/spotMarket/level2Depth5:DOGE-USDT", "DOGE:USDT" },
    .{ "/spotMarket/level2Depth5:DOGE-USDC", "DOGE:USDC" },
    .{ "/spotMarket/level2Depth5:DOGE-BTC", "DOGE:BTC" },

    // AVAX
    .{ "/spotMarket/level2Depth5:AVAX-USDT", "AVAX:USDT" },
    .{ "/spotMarket/level2Depth5:AVAX-USDC", "AVAX:USDC" },
    .{ "/spotMarket/level2Depth5:AVAX-BTC", "AVAX:BTC" },

    // DOT
    .{ "/spotMarket/level2Depth5:DOT-USDT", "DOT:USDT" },
    .{ "/spotMarket/level2Depth5:DOT-USDC", "DOT:USDC" },
    .{ "/spotMarket/level2Depth5:DOT-BTC", "DOT:BTC" },

    // ADA
    .{ "/spotMarket/level2Depth5:ADA-USDT", "ADA:USDT" },
    .{ "/spotMarket/level2Depth5:ADA-USDC", "ADA:USDC" },
    .{ "/spotMarket/level2Depth5:ADA-BTC", "ADA:BTC" },

    // ATOM
    .{ "/spotMarket/level2Depth5:ATOM-USDT", "ATOM:USDT" },
    .{ "/spotMarket/level2Depth5:ATOM-USDC", "ATOM:USDC" },
    .{ "/spotMarket/level2Depth5:ATOM-BTC", "ATOM:BTC" },
    .{ "/spotMarket/level2Depth5:ATOM-ETH", "ATOM:ETH" },

    // TON
    .{ "/spotMarket/level2Depth5:TON-USDT", "TON:USDT" },
    .{ "/spotMarket/level2Depth5:TON-USDC", "TON:USDC" },

    // XRP
    .{ "/spotMarket/level2Depth5:XRP-USDT", "XRP:USDT" },
    .{ "/spotMarket/level2Depth5:XRP-USDC", "XRP:USDC" },
    .{ "/spotMarket/level2Depth5:XRP-BTC", "XRP:BTC" },
    .{ "/spotMarket/level2Depth5:XRP-ETH", "XRP:ETH" },

    // LINK
    .{ "/spotMarket/level2Depth5:LINK-USDT", "LINK:USDT" },
    .{ "/spotMarket/level2Depth5:LINK-USDC", "LINK:USDC" },
    .{ "/spotMarket/level2Depth5:LINK-BTC", "LINK:BTC" },

    // Gold
    .{ "/spotMarket/level2Depth5:XAUT-USDT", "XAUT:USDT" },

    // Volatile / arb-heavy
    .{ "/spotMarket/level2Depth5:SHIB-USDT", "SHIB:USDT" },
    .{ "/spotMarket/level2Depth5:SHIB-USDC", "SHIB:USDC" },
    .{ "/spotMarket/level2Depth5:PEPE-USDT", "PEPE:USDT" },
    .{ "/spotMarket/level2Depth5:PEPE-USDC", "PEPE:USDC" },
});
