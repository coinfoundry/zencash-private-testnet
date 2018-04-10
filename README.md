## ZCash three-node private network in regtest mode

- Node Pool
  - RPC Port 16001, Username: user, Password: pass
- Node Bob
  - RPC Port 16002, Username: user, Password: pass
- Node Alice
  - RPC Port 16003, Username: user, Password: pass

### Addresses

- Pool:  ztq1ruXAyB5sfF6ckyePR3Rt5ZSesZWafKx - ztS4LBBnksrv7zgNjC2Z7pVhCACfLfedCUFFR1YHuTiAC8r31WyvWajESGJgxsSwsBLm6xhxmkcqwfz3iNtShx3uN7uSuRy
- Bob:   ztYHAtiUGjsCvKWaH63McK8ez2vNnF6BJW6 - ztYA3xXmvmcGDyVELSNSsXrAF9cJWVZsTSvYDhnStMNgQ1pNvoWchVEXvDVDYcM362pBdLGHM7YfRaGMsEB2DvvmtsDNGgu
- Alice: ztp9Yvg4MtLxwXDsAnjWzxy5uLMmaDTY4dF - ztTQRcQkKeQFcTYG3qDhCqMM3gdydCWe6J2KqUYp1KncgdoKZxr8fAnCh9DRJpea2kjxrrpj7mRn95zaNesKqXwRW2Xyyyw

### To run this image with internal ports exposed at host:

```bash
docker run -it -d -p 16001:16001 -p 16002:16002 -p 16003:16003 coinfoundry/zcash-private-testnet
```

### Generating blocks:

```bash
docker exec -i -t <container_id> /usr/bin/dash-cli -datadir=/data/node-pool generate 1
```

### Example RPC against Node-Pool:

```bash
curl --user user:pass --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getinfo", "params": [] }' -H 'content-type: application/json;' http://127.0.0.1:16001/
```
