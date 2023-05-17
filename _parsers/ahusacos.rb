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
    rule(:noun)        { fr_person | fr_place | fr_thing | fr_idea |
                         jp_person | jp_place | jp_thing | jp_idea   }

    ### French Nouns
    rule(:fr_person) { homme | femme | garcon | fille | animale }
    rule(:fr_place)  { fr_exterior | fr_interior }

    rule(:fr_thing)  { fr_aesthetic |    fr_clear |     fr_cold | fr_complex | fr_cottage |
                       fr_farm      |    fr_heavy | fr_homemade | fr_hot     |  fr_liquid |
                       fr_loud      | fr_material |   fr_matter | fr_metal   | fr_natural |
                       fr_physical  |    fr_quiet |    fr_round | fr_rural   |   fr_shiny |
                       fr_square    |    fr_tools 
                     }

    rule(:fr_idea)

    ### Japanese Nouns
    rule(:jp_person)
    rule(:jp_place)
    rule(:jp_thing)
    rule(:jp_idea)

    ## Adjectives
    rule(:adjective)   { fr_look | fr_smell | fr_feel | fr_taste | fr_sound |
                         jp_look | jp_smell | jp_feel | jp_taste | jp_sound   }

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
