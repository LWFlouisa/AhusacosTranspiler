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
    rule(:noun)        { fr_person | fr_place | fr_thing | jp_person | jp_place | jp_thing }

    ### French Nouns
    rule(:fr_person) { fr_man | fr_woman | fr_boy | fr_girl | fr_animal }

    #### Specific French Persons
    rule(:fr_man)    {   str("homme") }
    rule(:fr_woman)  {   str("femme") }
    rule(:fr_boy)    {  str("garcon") }
    rule(:fr_girl)   {   str("fille") }
    rule(:fr_animal) { str("animale") }

    #### Specific French Places
    rule(:fr_place)  { fr_exterior | fr_interior }

    rule(:fr_exterior) {  }
    rule(:fr_interior) {  }

    #### Specific French Things
    rule(:fr_thing)  { fr_aesthetic |    fr_clear |     fr_cold | fr_complex | fr_cottage |
                       fr_farm      |    fr_heavy | fr_homemade | fr_hot     |  fr_liquid |
                       fr_loud      | fr_material |   fr_matter | fr_metal   | fr_natural |
                       fr_physical  |    fr_quiet |    fr_round | fr_rural   |   fr_shiny |
                       fr_square    |    fr_tools 
                     }

    #rule(:fr_idea) { fr_abstraction | fr_intuition  | fr_serendipity | fr_emotion |
    #                 fr_imagination | fr_creativity | fr_stories}

    ### Japanese Nouns
    rule(:jp_person) { jp_man | jp_woman | jp_boy | jp_girl | jp_animal }

    rule(:jp_place)  { jp_exterior | jp_interior }

    rule(:jp_thing)  { jp_aesthetic |    jp_clear |     jp_cold | jp_complex | jp_cottage |
                       jp_farm      |    jp_heavy | jp_homemade | jp_hot     |  jp_liquid |
                       jp_loud      | jp_material |   jp_matter | jp_metal   | jp_natural |
                       jp_physical  |    jp_quiet |    jp_round | jp_rural   |   jp_shiny |
                       jp_square    |    jp_tools 
                     }

    # otoko | josei | otokonoko | onnanoko
    #rule(:jp_idea)

    # French Adjectives
    rule(:fr_adjective) { fr_look | fr_smell | fr_feel | fr_taste | fr_sound }

    # Japanese Adjectives
    rule(:jp_adjective) { jp_look | jp_smell | jp_feel | jp_taste | jp_sound }

    # French Preposition 
    rule(:fr_preposition) { fr_time    |  fr_place |   fr_movement |
                            fr_manner  |  fr_agent | fr_instrument | 
                            fr_measure | fr_source |  fr_posession   }

    # Japanese Preposition
    rule(:jp_preposition) { jp_time    |  jp_place |   jp_movement |
                            jp_manner  |  jp_agent | jp_instrument |
                            jp_measure | jp_source |  jp_posession   }

    # French Verbs
    rule(:fr_verb) {}

    # Japanese Verbs
    rule(:jp_verb) {}

    rule(:fr_adverb) {}

    rule(:jp_adverb) ()
  end

  class AhusacosTransform < Parslet::Transform
  end

  class AhusacosXML
    def self.convert_to_xml
    end
  end
end
