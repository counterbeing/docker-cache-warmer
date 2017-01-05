# Docker Cache Warmer

This is a small and simple docker image that runs a cron job to fetch assets from a server that implements caching. It accepts two arguments in the form of environment variables:

- `ASSET_PATH_MANIFEST_URL`: A place that is readable publicly, and lists one asset per line without the domain.
- `HOSTS_COMMAND`: A command that returns a list of newline separated hosts. If you want to hard code it you could use something like `echo "http://cach1.domain.com\nhttp://cache2.domain.com"`. For more complex scenarios you could use something like `nslookup` to find multiple hosts for a dns record, as in the example below.
- `CRON_SCHEDULE`: This is your basic cron syntax that will state how often to run the command. For example, to run hourly, you'd use this `0 * * * *`. Here's a [handy calculator](https://crontab.guru/#0_*_*_*_*) if it's helpful. You can also set this to "now" if you just want it to run once and exit.
- DEBUG: If set it will tell you what addresses it's trying to hit in STDOUT

## Example
Here's a cache warmer as configured by docker compose:

```yaml
  cache-warmer:
    image: corylogan/cache-warmer
    environment:
      - ASSET_PATH_MANIFEST_URL="http://mysite/manifest.txt"
      - HOSTS_COMMAND="nslookup docker.com | tail -n +3 | grep ^Address | cut -d ' ' -f 2"
      - CRON_SCHEDULE="0 * * * *"
```

## Notes

I've decided to not use ssl as in my case, and in the case of others, you're operating on a private network that's using public certs.

Feel free to make a pull request if you see a place to make an improvement.
