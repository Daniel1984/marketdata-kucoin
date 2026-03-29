## Consumer Kucoin

Allows connection to kucoin websocket to consume data

### Build

```sh
zig build --release=fast
```

## Get all trading pairs

```sh
curl https://api.kucoin.com/api/v2/symbols >> symbols.json
```
