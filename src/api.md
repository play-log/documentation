# API

Playlog has a Scrobbling API (see below).
But you aslo can use Last.fm
[Submissions](https://www.last.fm/api/submissions) or
[Scrobbling](https://www.last.fm/api/scrobbling) API via
[proxy](https://github.com/play-log/lastfm-proxy).

## Playlog Scrobbling API

### Creating a signature

```
>>> import hashlib
>>> import hmac
>>> secret = b'76c2d25916334abc81de67fd740f9fb7'
>>> signature = hmac.new(
...     secret,
...     b'example.com+POST+/api/log+[{"artist": "artist", "album": "album", "title": "track title", "timestamp": 1530716383}]',
...     hashlib.sha256
... )
>>> print(signature.hexdigest())
7c63809421f8f8373e1fb953835ddfaf940161c7f2bf87f2b47c96cbcdc32f9f
```

`secret` - a secret key stored in server config.

### Now-playing

#### Request

```
POST /api/nowplay HTTP/1.1
X-Signature: 1cf9fe230d88a1bb7b96bf0f7048a43d4436e86ce4dd7938d1b7b822c2007479
Content-Type: application/json

{"artist": "artist", "album": "album", "title": "track title", "length": 300}
```

- `artist` - The artist name.
- `album` - The album name.
- `title` - The track title.
- `length` - The track length in seconds.

#### Success response

```
{
    "success": true,
    "data": {
        "artist": "artist",
        "album": "album",
        "title": "track title",
        "length": 300
    }
}
```

#### Error response

```
{
    "success": false,
    "reason": "An error has occurred"
}
```

### Logging

#### Request

```
POST /api/log HTTP/1.1
X-Signature: 7c63809421f8f8373e1fb953835ddfaf940161c7f2bf87f2b47c96cbcdc32f9f
Content-Type: application/json

[{"artist": "artist", "album": "album", "title": "track title", "timestamp": 1530716383}]
```

- `artist` - The artist name.
- `album` - The album name.
- `title` - The track title.
- `timestamp` - The time the track started playing (in UNIX timestamp format, UTC).

You can send up to 50 tracks per request.

#### Success response

```
{
    "success": true,
    "data": [
        {
            "artist": "artist",
            "album": "album",
            "title": "track title",
            "timestamp": 1530716383
        }
    ]
}
```

#### Error response

```
{
    "success": false,
    "reason": "An error has occurred"
}
```
