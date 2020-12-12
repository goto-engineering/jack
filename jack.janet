#!/usr/bin/env janet 

(import json)

(defn format [input]
  (-> input
       json/decode
       (json/encode "  ")))

(defn main [& args]
  (-> (file/read stdin :all)
      format
      print))
