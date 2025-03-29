# bcc-media-platform-remote-control

A macro that remotly controls the bcc-media website on a Chrome Webbrowser via AutoHotKey

This will be used to simultaniously start two on-demand videos with different languages, 
so the audio from the second video can go to a language distribution system 

## Installation

```shell
#download dependencies
git submodule update --init --recursive
```

## Usage

Open a Chrome instance with the parameter `--remote-debugging-port=9222`

Open the bcc-media webpage, it is important that the Tab starts with the title `"BCC Media"`

Then start the Script, it will programatically click the `Play` button on the first two BCC-Media Webpages it finds

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

## License

[Apache-2.0](http://www.apache.org/licenses/LICENSE-2.0)