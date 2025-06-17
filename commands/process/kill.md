# Kill processes

## open ports

```bash
lsof -i tcp:5001
# netstat -vanp tcp | grep 5001

kill -9 <PID>
```
