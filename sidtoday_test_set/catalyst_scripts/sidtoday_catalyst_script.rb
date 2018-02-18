require 'curb'
require 'base64'
require 'pry'
require 'json'

index_name = "nsadocs"
default_dataspec = "SnowdenDoc"
annotators_to_run = [ {
                       annotator_name: "NamedEntityAnnotator",
                       input_params: {
                         fields_to_check: ["doc_text", "description"],
                         type: "organization"},
                       output_param_names:{
                         catalyst_organizations: "agency"
                       }},
                     {
                       annotator_name: "TermlistAnnotator",
                       input_params: {
                         term_list: File.read("country_names.json"),
                         fields_to_check: ["doc_text", "title"],
                         case_sensitive: false},
                       output_param_names:{
                         catalyst_termcategory: "catalyst_termcategory",
                         catalyst_termlist: "countries_mentioned"
                       }
                     }
                     ]

docs_to_process = {
  run_over: "all"
}


   c = Curl::Easy.http_post("http://localhost:9004/annotate",
                            Curl::PostField.content('default_dataspec', default_dataspec),
                            Curl::PostField.content('index', index_name),
                            Curl::PostField.content('docs_to_process', JSON.generate(docs_to_process)),
                            Curl::PostField.content('input-params', JSON.generate(annotators_to_run)))

