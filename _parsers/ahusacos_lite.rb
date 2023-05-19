require "parslet"

module AhusacosLite
  class AhusacosParser < Parslet::Parser
    root(:grammar)

    rule(:grammar) { gender_marker    >> space >>
                     noun_marker      >> space >>
                     adjective_marker >> space >>
                     conju_marker     >> space >>
                     verb_marker      >> space >>
                     adverb_marker    >> punc_marker

    # Markers
    rule(:gender_marker) {   anu |   ana |  anos }

    rule(:anu)  {  str("Anu") }
    rule(:ana)  {  str("Ana") }
    rule(:anos) { str("Anos") }

    rule(:noun_marker)   {  hito | basho |  mono }

    rule(:hito)  { homme | josei | otokonoko | fille }
    
    rule(:homme)     {     str("homme") }
    rule(:josei)     {     str("josei") }
    rule(:otokonoko) { str("otokonoko") }
    rule(:fille)     {     str("fille") }

    rule(:basho) { america | france | japan }

    rule(:america) { str("Amerique") }
    rule(:france)  {   str("France") }
    rule(:japan)   {    str("Nipon") }

    rule(:mono)  {    maizon | cabine | demeure |  zigner |  autobus |
                       ecole |    buz |    cour | abrikos |    anker |
                       engel | spranz |   baume | kaschte | artischo |
                   sparichel
    }

    rule(:maizon)    {    str("maizon") }
    rule(:cabine)    {    str("cabine") }
    rule(:demeure)   {   str("demeure") }
    rule(:zigner)    {    str("zigner") }
    rule(:autobus)   {   str("autobus") }
    rule(:ecole)     {     str("ecole") }
    rule(:buz)       {       str("buz") }
    rule(:cour)      {      str("cour") }
    rule(:abrikos)   {   str("abrikos") }
    rule(:anker)     {     str("anker") }
    rule(:engel)     {     str("engel") }
    rule(:spranz)    {    str("spranz") }
    rule(:baume)     {     str("baume") }
    rule(:kaschte)   {   str("kaschte") }
    rule(:artischo)  {  str("artischo") }
    rule(:sparichel) { str("sparichel") }

    rule(:adjective_marker) { color | shape | size }

    rule(:color)    {     noir |  gris | blanc |  rouge |  vert |
                          bleu | mauve | jaune | orange | braun |
                      violette                                    }

    rule(:noir)     {     str("noir") }
    rule(:gris)     {     str("gris") }
    rule(:blanc)    {    str("blanc") }
    rule(:rouge)    {    str("rouge") }
    rule(:vert)     {     str("vert") }
    rule(:bleu)     {     str("bleu") }
    rule(:mauve)    {    str("mauve") }
    rule(:jaune)    {    str("jaune") }
    rule(:orange)   {   str("orange") }
    rule(:braun)    {    str("braun") }
    rule(:violette) { str("violette") }

    rule(:shape)    { carre | cercle | triangle | hexagone }

    rule(:carre)    {    str("carre") }
    rule(:cercle)   {   str("cercle") }
    rule(:triangle) { str("triangle") }
    rule(:hexagone) { str("hexagone") }

    rule(:size)     { minuscule | petit |  moyen |     gros | grande |   enorme }

    rule(:minuscule) { str("minuscule") }
    rule(:petit)     {     str("petit") }
    rule(:moyen)     {     str("moyen") }
    rule(:gros)      {      str("gros") }
    rule(:grande)    {    str("grande") }
    rule(:enorme)    {    str("enorme") }

    rule(:conju_marker)  {  mata | to |  itsu | sore }

    rule(:mata) { str("mata") }
    rule(:to)   {   str("to") }
    rule(:itsu) { str("itsu") }
    rule(:sore) { str("sore") }

    rule(:verb_marker)   { avoir |   lit | regle | bondoru }

    rule(:avoir)   {   str("avoir") }
    rule(:lit)     {     str("lit") }
    rule(:regle)   {   str("regle") }
    rule(:bondoru) { str("bondoru") }

    rule(:adverb_marker) {     vite | hente | mute | drole | pedecise |
                           vivemeje |  keta | dusa 
    }

    rule(:vite)     {       str("vite") }
    rule(:hente)    {      str("hente") }
    rule(:mute)     {       str("mute") }
    rule(:drole)    {      str("drole") }
    rule(:pedecise) {   str("pedecise") }
    rule(:vivemeje) {   str("vivemeje") }
    rule(:keta)     { str("ketasuzejo") }
    rule(:dusa)     {       str("dusa") }

    rule(:punc_marker)   { question | full_stop }

    rule(:question)  { str("?") }
    rule(:full_stop) { str(".") }
  end

  class AhusacosTransform < Parslet::Transform

    # Gender
    rule(:anu)  {  "Anu" }
    rule(:ana)  {  "Ana" }
    rule(:anos) { "Anos" }

    # Persons
    rule(:homme)     {     "homme" }
    rule(:josei)     {     "josei" }
    rule(:otokonoko) { "otokonoko" }
    rule(:fille)     {     "fille" }

    # Places
    rule(:america) { "Amerique Du Nord" }
    rule(:france)  {           "France" }
    rule(:japan)   {            "Nipon" }

    # Things
    rule(:maizon)    {    "maizon" }
    rule(:cabine)    {    "cabine" }
    rule(:demeure)   {   "demeure" }
    rule(:zigner)    {    "zigner" }
    rule(:autobus)   {   "autobus" }
    rule(:ecole)     {     "ecole" }
    rule(:buz)       {       "buz" }
    rule(:cour)      {      "cour" }
    rule(:abrikos)   {   "abrikos" }
    rule(:anker)     {     "anker" }
    rule(:engel)     {     "engel" }
    rule(:spranz)    {    "spranz" }
    rule(:baume)     {     "baume" }
    rule(:kaschte)   {   "kaschte" }
    rule(:artischo)  {  "artischo" }
    rule(:sparichel) { "sparichel" }

    # Adjectives
    rule(:noir)      {      "noir" }
    rule(:gris)      {      "gris" }
    rule(:blanc)     {     "blanc" }
    rule(:rouge)     {     "rouge" }
    rule(:vert)      {      "vert" }
    rule(:bleu)      {      "bleu" }
    rule(:mauve)     {     "mauve" }
    rule(:jaune)     {     "jaune" }
    rule(:orange)    {    "orange" }
    rule(:braun)     {     "braun" }
    rule(:violette)  {  "violette" }
    rule(:carre)     {     "carre" }
    rule(:cercle)    {    "cercle" }
    rule(:triangle)  {  "triangle" }
    rule(:hexagone)  {  "hexagone" }
    rule(:minuscule) { "minuscule" }
    rule(:petit)     {     "petit" }
    rule(:moyen)     {     "moyen" }
    rule(:gros)      {      "gros" }
    rule(:grande)    {    "grande" }
    rule(:enorme)    {    "enorme" }

    # Conjucation
    rule(:mata) { "mata" }
    rule(:to)   {   "to" }
    rule(:itsu) { "itsu" }
    rule(:sore) { "sore" }

    # Verbs
    rule(:avoir)   {   str("avoir") }
    rule(:lit)     {     str("lit") }
    rule(:regle)   {   str("regle") }
    rule(:bondoru) { str("bondoru") }

    # Adverbs
    rule(:vite)     {       "vite" }
    rule(:hente)    {      "hente" }
    rule(:mute)     {       "mute" }
    rule(:drole)    {      "drole" }
    rule(:pedecise) {   "pedecise" }
    rule(:vivemeje) {   "vivemeje" }
    rule(:keta)     { "ketasuzejo" }
    rule(:dusa)     {       "dusa" }

    # Punctuation Marks
    rule(:question)    { "?" }
    rule(:full_stop)   { "." }
  end
    
  class AhusacosLite
    def self.get_input
      begin
        print "Ahusacos("
        system("date")
        print ") >> "; input = gets.chomp # .split(" ")

        parser      = SearchParser.new
        transform   = SearchTransform.new

        tree        = parser.parse(input)
        ast         = transform.apply(tree)
        ast_output = "#{ast}".to_s

        $search_query = "#{ast_output}"

        # SmartSearch::SearchQuery.convert_query
        # SmartSearch::SearchQuery.is_present?
      rescue Parslet::ParseFailed => error
        puts error.parse_failure_cause.ascii_tree
      end
    end
  end
end
