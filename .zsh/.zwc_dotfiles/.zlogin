# Get rid of this if java 1.8 is needed
#path=("/usr/local/opt/openjdk/bin" $path)
path=("/Applications/Racket v7.6/bin" $path)
path=("/usr/local/Cellar/imagemagick@6/6.9.11-12/bin" $path)
path=("/usr/local/Cellar/llvm/10.0.0_3/bin" $path)
path=("/Users/philthy/Documents/Software/latexindent" $path)
path=("/Library/Frameworks/Python.framework/Versions/3.8/bin" $path)
path=("$HOME/.cargo/bin" $path)
path=("$HOME/.bin" $path)
path=("$HOME/.local/bin" $path)  # pipx install executables here
path=("$HOME/Nextcloud/CSUS/Fall_2020/CSC_165/javagaming8/javagaming/jinput/lib" $path)
path=("." $path)

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home

CLASSPATH=".:$HOME/Nextcloud/CSUS/Fall_2020/CSC_165/javagaming8/javagaming/jogl/jogl-all.jar:$HOME/Nextcloud/CSUS/Fall_2020/CSC_165/javagaming8/javagaming/jogl/gluegen-rt.jar:$HOME/Nextcloud/CSUS/Fall_2020/CSC_165/javagaming8/javagaming/rage165/ray.jar:$HOME/Nextcloud/CSUS/Fall_2020/CSC_165/javagaming8/javagaming/joml/joml-jdk8-1.9.25.jar:$HOME/Nextcloud/CSUS/Fall_2020/CSC_165/javagaming8/javagaming/jinput/jinput.jar:$HOME/Nextcloud/CSUS/Fall_2020/CSC_165/javagaming8/javagaming/jogl/joal.jar:$HOME/Nextcloud/CSUS/Fall_2020/CSC_165/javagaming8/javagaming/vecmath/vecmath.jar:$HOME/Nextcloud/CSUS/Fall_2020/CSC_165/javagaming8/javagaming/jbullet/jbullet.jar:$HOME/Nextcloud/CSUS/Fall_2020/CSC_165/javagaming8/javagaming/graphicslib3D/graphicslib3D.jar"
export CLASSPATH
