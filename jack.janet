#!/usr/bin/env janet 

(import json)

(def spacer (string/repeat " " 2))

(defn- pad [i]
  (string/repeat spacer i))

(var format nil)

(defn- format-struct [struct depth]
  (if (empty? struct)
    "{}"
    (string/join
      ["{"
       (string/join
         (map
           (fn [(k v)] (string (pad (inc depth)) `"` k `": ` (format v (inc depth))))
           (pairs struct)) ",\n")
       (string (pad depth) "}")]
      "\n" )))

(defn- format-array [array depth]
  (if (empty? array)
    "[]"
    (string/join
      ["["
       (string/join
         (map
           (fn [item] (string
                        (pad (inc depth))
                        (format item (inc depth))))
           array)
         ",\n")
       (string (pad depth) "]")]
      "\n")))

(varfn format [input &opt depth]
  (default depth 0)
  (case (type input)
    :string (string `"` input `"`)
    :table (format-struct input depth)
    :array (format-array input depth)
    input))

(defn main [& args]
  (-> (file/read stdin :all)
      (json/decode)
      format
      print))
