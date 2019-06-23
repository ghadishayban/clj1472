if [ -d classes ]; then
  rm -rf classes
fi
mkdir classes

javac \
  -d classes \
  -cp $(clojure -Spath -A:compile) \
  src/damngraal/ClojureInit.java

mkdir -p META-INF/native-image

clojure -J-agentlib:native-image-agent=config-output-dir=META-INF/native-image -A:compile - <<EOF
  (compile 'clojure.spec.alpha)
  (compile 'clojure.spec.gen.alpha)
  (compile 'clj10-graal-repro.core)
EOF
