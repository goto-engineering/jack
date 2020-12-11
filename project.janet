(declare-project
 :name "jack"
 :description "Pretty prints JSON from stdin on stdout"
 :dependencies ["https://github.com/janet-lang/json.git"])

(declare-source
 :source ["jack.janet"])
