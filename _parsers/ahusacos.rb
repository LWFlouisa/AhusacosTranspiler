## Unfinished
require "parslet"
require "naive_bayes"

module Ahusacos
  class AhusacosParser < Parslet::Parser
    root(:phrase_index)

    ## Punctuation
    rule(:space) { str(" ") }

    ### Further punctuation rules.
    rule(:punctuation)   { question_mark | full_stop }
    rule(:question_mark) { str("?") }
    rule(:full_stop)     { str(".") }

    ## Language Tokens
    rule(:gender)      { fr_gender | jp_gender }

    ### French Gender Rules
    rule(:fr_gender) { le  | la  |
                       lez | un  |
                       une | dez   }

    ### Japanese Gender Rules
    rule(:fr_gender) { anu  | ana |
                       anos | tu  |
                       ta   | tos   }

    #### Specific French gender rules.
    rule(:le)  {  str("le") }
    rule(:la)  {  str("la") }
    rule(:lez) { str("lez") }
    rule(:un)  {  str("un") }
    rule(:une) { str("une") }
    rule(:dez) { str("dez") }

    ### Specific Japanese gender rules.
    rule(:anu)  {  str("anu") }
    rule(:ana)  {  str{"ana") }
    rule(:anos) { str("anos") }
    rule(:tu)   {   str("tu") }
    rule(:ta)   {   str("ta") }
    rule(:tos)  {  str("tos") }

    ## Nouns
    rule(:noun)        { fr_person | fr_place | fr_thing |
                         jp_person | jp_place | jp_thing   }

    rule(:fr_thing)    { fr_aesthetic |    fr_clear |     fr_cold | fr_complex | fr_cottage |
                         fr_farm      |    fr_heavy | fr_homemade | fr_hot     |  fr_liquid |
                         fr_loud      | fr_material |   fr_matter | fr_metal   | fr_natural |
                         fr_physical  |    fr_quiet |    fr_round | fr_rural   |   fr_shiny |
                         fr_square    |    fr_tools 
                       }

    rule(:preposition) {}
    rule(:verb)        {}
    rule(:adverb)      {}
  end

  class AhusacosTransform < Parslet::Transform
  end

  class AhusacosBaysian
    def self.track_tokens
    end
  end
end
