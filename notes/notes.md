iHaskell

Tensorflow

Stanford CoreNLP

## Image Description:

I need a convenient Docker image that would contain both installation of latest iHaskell, Haskell bindings to TensorFlow, and SyntaxNet.

I may rehire consultant when they will both need update.

References:
* SyntaxNet:
https://github.com/tensorflow/models/tree/master/syntaxnet
Relevant Docker image: tensorflow/syntaxnet
* iHaskell:
https://github.com/gibiansky/IHaskell
Relevant Docker image: gibiansky/ihaskell
* Haskell bindings for TensorFlow:
https://github.com/tensorflow/haskell
https://github.com/TaktInc/tensorflow-haskell

To be published as open source.

### Milestones
Tensorflow working in iHaskell image over 8888
Install Stanford CoreNLP as a web service in the image
Testing all haskell-tensorflow packages
CI integration and documentation



For now, it is forming where we are going to end up with the advanced image. So it is seen: or to make the separate branch for it, but probably better including all products in the same master branch is a beautiful idea. It is convenient for work/contributions, and they intertwine beautifully. The security artifacts implementation of the advanced image is the main topic, we can do it in such a way that it can be safe to publish building instructions on GitHub. While keeping keys secret. Or if you want to hide even the addresses of repositories (but that is advertising for IT people). While enabling IT community to contribute pulls, report issues, or suggest improvements even for build of proprietary part.
