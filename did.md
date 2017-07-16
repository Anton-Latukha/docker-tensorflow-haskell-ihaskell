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
* Probably move image to be based on Tensorflow base image
* Submit PR to IHaskell with real installation instructions
* Ask IHaskell: How it is that their Dockerfile got complettly different from README.md installation
* Submit bugreport with error in Tensorflow verification instructions
(https://stackoverflow.com/questions/40904979/the-print-of-string-constant-is-always-attached-with-b-intensorflow)
* For them, tensorflow/haskell, do their laziness "# TODO: move the setup step to the docker script." That enables possibility of Tensorflow-Haskell + IHaskell

Notes:
* Looked around DockerHub, most popular image is 3 years old, gibiansky/ihaskell last updated 1 year ago, and their Dockerfile is weird and uses 2015-08-15 packages. README.md setup despite being broken, are more up to date. 

Questions:
* Tensorflow: CPU or GPU?
* Tensorflow Haskell bindings installed. How to integrate Tensorflow in IHaskell, or it is must already work? (Investigating tomorrow)
* Jupyter Notebook. Tensor has it's own, IHaskell has it's own. What is the aim. (Investigating tomorrow)
* Probably use Tensorflow image as a base image. Then install Tensorflow Haskell bindings. Then install IHaskell. Then and further...
