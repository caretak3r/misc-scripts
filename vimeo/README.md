## Vimeo downloader
### __author__: 'caretak3r'
### __project__: 'https://github.com/eMBee/vimeo-download'

This script is useful for cases where youtube-dl is unable to find the master url, for example on pages that require login or cookies. 

~@caretak3r's custom tweaked version ~

Installation 
=======

Install requirements with `pip install -r requirements.txt`

### Installing ffmpeg

Compilation instruction: https://trac.ffmpeg.org/wiki/CompilationGuide

**For ubuntu users:**

    sudo add-apt-repository ppa:mc3man/trusty-media && sudo apt-get update 
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8E51A6D660CD88D67D65221D90BD7EACED8E640A
    sudo apt-get install ffmpeg

(The instructions are taken from [here](http://help.ubuntu.ru/wiki/ffmpeg) - warning: Russian!)
    
**For MacOS users:**

    brew install ffmpeg


Usage
=====

First you need the `master.json` request which has an ~hmac~ for rented/ondemand videos.

####Basic Steps: 
Load vimeo URL --> Open personal inspector --> play the video --> look for this:

https://user-images.githubusercontent.com/50377477/80322700-bf54d800-87f4-11ea-83de-e8d6ca6c1b8f.png
https://user-images.githubusercontent.com/50377477/80322704-c1b73200-87f4-11ea-9338-77f6a06434e7.png

To get the master url:
   1. Open the network tab in the inspector
   2. Find the url of a request to the `master.json` file
   3. Run the script with the url as argument

Copy the full request and run the script, with some pre-setup steps:

   `pip3 install -r requirements.txt` (or use pipenv, idgaf)
    
   `python3 vimeo-download.py --url "http://...master.json?base64_init=1" --output <optional_name>`

You can download multiple files in parallel with GNU Parallel:

   `parallel -a master-files.txt python vimeo-download.py --url "{}"`

Where `master-files.txt` contains a list of master URLs.

If you then need to merge the video/audio tracks, navigate to where the file was saved and run:

   `ffmpeg -i v.mp4 -i a.mp3 -c copy merged.mp4`


Acknowledgements
=======

Code merges the following gists:
- https://github.com/eMBee/vimeo-download/issues/30
- https://gist.github.com/alexeygrigorev/a1bc540925054b71e1a7268e50ad55cd
- https://gist.github.com/tayiorbeii/d78c7e4b338b031ce8090b30b395a46f
- https://gist.github.com/paschoaletto/7f65b7e36b76ccde9fe52b74b62ab9df
