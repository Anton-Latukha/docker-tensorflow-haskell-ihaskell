5.
Dids:
* Created the GPU version
* Pushed GPU Docker image to Docker Hub (latukha/tensorflow-haskell-ihaskell:latest-gpu)
* Compiled and pushed an -O2 version in latukha/tensorflow-haskell-ihaskell:latest, that prove that -O2 latukha/tensorflow-haskell-ihaskell:latest-gpu is easily achieved now also.

TODO:
* Find, choose and make best way to combine CPU/GPU development & usage
* Make possible optimizations of execution
* Stanford CoreNLP
* Submit PR to IHaskell with real installation instructions
* Ask IHaskell: How it is that their Dockerfile got completely different from README.md installation
* Submit bug report with error in Tensorflow verification instructions
(https://stackoverflow.com/questions/40904979/the-print-of-string-constant-is-always-attached-with-b-intensorflow)
* For them, tensorflow/haskell, do their laziness "# TODO: move the setup step to the docker script." That enables possibility of Tensorflow-Haskell + IHaskell
* Push/ask tensorflow/haskell devs to make new release of bindings and publish it on Hackage/Stackage

4.
Dids:
* Built complette image
* Tested image, networking and password access work.
* Pushed image to Docker Docker Hub
* Reviewed image layers
* Checked sideload process of IHaskell, doesn't it overwrite something
* Formed sideload version variables
* Tested version with variables working
* Rolled back to libtensorflow 1.0.0


3.
Dids:
* Hard switched image to be based on Tensorflow CPU base image.
* Made an automatic build (https://hub.docker.com/r/latukha/docker-tensorflow-haskell-ihaskell/builds/).
* Tested Jupyter work on port 8888 again.
* Got and studied full Jupyter configuration options list
* Created initial configuration of Jupyter Notebook
* Testing of port/network access. Of configuration
* Merged initial configuration of Jupyter Notebook with Tensorflow
* Environment descriptions in README.md
* 1-st milestone completed

2.
Dids:
* Studied how to use IHaskell
* Tested Tensorflow Haskell bindings with simple program (positive)
* Tested Tensorflow Haskell bindings in the IHaskell (negative, bindings not present)
* Studied how to port built by the official documentation Tensorflow Haskell bindings to IHaskell
* Read upon Stack from its documentation, to understand how to integrate two projects.
* Tried, studied _several_ of ways to integrate Tensorflow Haskell bindings with IHaskell with Stack
* Found that there are Tensorflow packages on Hackage that are straight from (https://github.com/tensorflow/haskell) and latest stable versions, so they must be trustworthy. Better to offload custom building in favour of them. (dev version broke reverse compatibility, but, nonetheless it is the best way, just need to wait for new release)
* Installed all that packages to IHaskell project using streamlined method - stack.
* Testing IHaskell, now Tensorflow works
* But also hitting their version breakage: https://github.com/tensorflow/haskell/issues/137, or 'Ambiguous occurrence's in the old version they suggest
* Error above is the runtime error. Upon restarting - stable version code has normal functioning
* Created GitHub repository to have remote source control
* Moved progress to Git.
* Condensed/Transferred everything made today to Dockerfile
* Continued investigation Tensorflow images.
* Live image committed to local Docker repository
* Build-testing image from Dockerfile
* 1-st milestone completed

TODO:
* Move image to be based on Tensorflow CPU base image

1.
Dids:
* Studied what IHaskell is
* Studied IHaskell image provided, and other available variants. Decided to do firstly dev by hand. to understand solution, and also see next step better.
* Started development try-setup by hand
* Completed IHaskell installation
* Solved Jupyter notebook startup problem
* Solved another Jupyter notebook startup problem
* Made Jupyter notebook with IHaskell working
* Translated to Dockerfile
* Installed Tensorflow
* Tested Tensorflow
* Installed Tensorflow Haskell bindings

Solved issues:
* IHaskell has completely broken description. Made working installation and instructions.
* Faced two Jupyter notebook startup problems, python exception, and second one.

TODO:
* Study and do basic IHaskell usage, to see if integration works and for testing.
* Complete 1-fs milestone. Move forward

Notes:
* Looked around DockerHub, most popular image is 3 years old, gibiansky/ihaskell last updated 1 year ago, and their Dockerfile is weird and uses 2015-08-15 packages. README.md setup despite being broken, are more up to date. 

Questions:
* Tensorflow: CPU or GPU?
* Tensorflow Haskell bindings installed. How to integrate Tensorflow in IHaskell, or it is must already work? (Investigating tomorrow)
* Jupyter Notebook. Tensor has it's own, IHaskell has it's own. What is the aim. (Investigating tomorrow)
* Probably use Tensorflow image as a base image. Then install Tensorflow Haskell bindings. Then install IHaskell. Then and further...
