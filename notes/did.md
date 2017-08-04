9.
TODO:
* Document images.
* Document usage of images.
* Document building HOWTO.
* Finish securing advanced image, and decide how to integrate its part to repository.
* Dynamic inventory for Ansible AWS playbook
* Make further AWS integration (maybe migrate whole process to AWS)
(possibility * Split to two versions, OSS and ADV)
(moved forward in * Make a process to produce same platform&optimization binaries, without exposing access to private repos or code in them)
* Make  further possible optimizations of execution
* Submit PR to IHaskell with real installation instructions
* Ask IHaskell: How it is that their Dockerfile got completely different from README.md installation
* Submit bug report with error in Tensorflow verification instructions
(https://stackoverflow.com/questions/40904979/the-print-of-string-constant-is-always-attached-with-b-intensorflow)
* For them, tensorflow/haskell, do their laziness "# TODO: move the setup step to the docker script." That enables possibility of Tensorflow-Haskell + IHaskell
* Push/ask tensorflow/haskell devs to make new release of bindings and publish it on Hackage/Stackage


8.
Dids:
* Added Dockerfile-cpu-adv image to the tree
* Added Dockerfile-gpu-adv image to the tree
* Moved Dockerfile -> Dockerfile-cpu, because probably to do GPU-version default one is sane.
* CPU `latest` now should move to `latest-cpu` and `latest-gpu` alias as `latest`.
* Build of all images: cpu, gpu, cpu-adv, gpu-adv.
* Testing an rebuilding several times.
* Measuring instance optimal configuration for the building task. (~4 cores, ~16GB RAM, ~30GB HDD, ~3Hour)
* Pushing of all images: cpu, gpu, cpu-adv, gpu-adv.
* Tagging images as V7 also. And `latest-gpu` -> `latest`.
* Committing all tags to Docker Hub
* Removed Automatic builds from Docker Hub.
* Communicated with Michal.

7.
Dids:
* Overcame bug https://github.com/ansible/ansible/issues/17147 in a proper way.
* Overcame bug https://github.com/Homebrew/homebrew-core/issues/9229
* Made clean Ansible setup on clean system to do work.
* Detected the root cause: EC2 Script PEP 394 non-compliant https://www.python.org/dev/peps/pep-0394/
* Done reshaping inventory and variables to use Dynamic Inventory
* EC2 dynamic inventory does not have any EC2 Containers Service or Register functionality or targeting, so all that is manually driven, so relaying on EC2 instance hosting and other stuff need to be written manually..
* Wrote a letter, describing progress and thoughts, asking for more information on vision of AWS/Ansible setup. And shared a view that we must focus on current tasks and milestone, and what need to be done on my part.

6.
Dids:
* Made a hand build. Receiving and compiling private code into binary packages. And taking that process written.
* Solved SSH host acceptance (git@ uses SSH, while github.com is unknown host that can be approved only interactively)
* Made private packages process clean all tracks. Removing keys and sources, so only compiled versions present, and any possible shell history are cleaned by Docker itself. (but in default push - COPY keys layer going to be preserved. I have handfull of variants how to tweak that, including internal AWS secrets also)
* Tested build
* Tested -O2 build
* Made Ansible playbook to deploy to AWS
* Done many different additional research&testing on both host and GCE

5.
Dids:
* Created the GPU version
* Pushed GPU Docker image to Docker Hub (latukha/tensorflow-haskell-ihaskell:latest-gpu)
* Compiled and pushed an -O2 version in latukha/tensorflow-haskell-ihaskell:latest, that prove that -O2 latukha/tensorflow-haskell-ihaskell:latest-gpu is easily achieved now also.
* Decided not to create branches fro CPU/GPU, as versions have a minor diff, just do 'Dockerfile' for CPU and 'Dockerfile-gpu' for GPU
* Found a way to workaround Git usage of main key (account key) to receive code from deploy keys. Useful.

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

Notes:
* Looked around DockerHub, most popular image is 3 years old, gibiansky/ihaskell last updated 1 year ago, and their Dockerfile is weird and uses 2015-08-15 packages. README.md setup despite being broken, are more up to date. 

Questions:
* Tensorflow: CPU or GPU?
* Tensorflow Haskell bindings installed. How to integrate Tensorflow in IHaskell, or it is must already work? (Investigating tomorrow)
* Jupyter Notebook. Tensor has it's own, IHaskell has it's own. What is the aim. (Investigating tomorrow)
* Probably use Tensorflow image as a base image. Then install Tensorflow Haskell bindings. Then install IHaskell. Then and further...
