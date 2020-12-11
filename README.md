# Jack

Jack is a JSON pretty-printer written in [Janet](https://janet-lang.org/).

## Installation

Install Janet per [instructions](https://janet-lang.org/docs/index.html).

Install dependencies using `jpm deps`.

Build an executable binary by running `jpm build`. You can place this in your path, e.g. `/usr/local/bin`. Alternatively, if your `$JANET_PATH` is set right (should be the default) you can run `jpm install` to install the binary into your Janet `bin` directory.

## Usage

Jack reads from `stdin` and outputs to `stdout`.

Example:
```
λ jack < test.json
{
  "rolodex": {},
  "address": {
    "state": "NY",
    "streetAddress": "212nd Street",
    "city": "New York",
    "postalCode": "10021-3100"
  },
  "children": [],
  "lastName": "Smith",
  "age": 27,
  "firstName": "John",
  "phoneNumbers": [
    {
      "number": "212555-1234",
      "type": "home"
    },
    {
      "number": "646555-4567",
      "type": "office"
    }
  ],
  "spouse": null,
  "isAlive": true
}
```

If you just run `jack` without any `stdin`, you will be prompted to enter valid JSON text. You can end your input with `Ctrl-D`. Press it 2x at the beginning of a line (you may press enter to get to the new line) or 3x in the middle of a line to end input.

## Usage from within vim

This is really what it's made for: prettify JSON you copied into `vim`.

Let's make use of vim's excellent shelling out feature. Visually select a block of JSON and then execute:
```
!jack
```

This will replace your selection with the prettified version.
