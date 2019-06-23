package damngraal;
   import clojure.java.api.Clojure;  
   import clojure.lang.IFn;  
public class ClojureInit {
  static {
    IFn REQ = Clojure.var("clojure.core", "require");
    IFn SYM = Clojure.var("clojure.core", "symbol");
    REQ.invoke(SYM.invoke("clojure.core.server"));
  }
}
