#lang racket

(define StopWords (list "a" "about" "above" "across" "after" "afterwards" "again" "against" "all" "almost" "alone"
  "along" "already" "also" "although" "always" "am" "among" "amongst" "amoungst" "amount"
  "an" "and" "another" "any" "anyhow" "anyone" "anything" "anyway" "anywhere"
  "are" "around" "as" "at" "back" "be" "became" "because" "become" "becomes" "becoming"
  "been" "before" "beforehand" "behind" "being" "below" "beside" "between" "beyond" "bill" "both" "bottom" "but" "by"
  "call" "can" "cannot" "cant" "co" "computer" "con" "could" "couldnt" "cry" "de" "describe" "detail" "do" "done" "down" "due"
  "during" "each" "eg" "eight" "either" "eleven" "else" "elsewhere" "empty" "enough" "etc" "even" "ever" "every" "everyone"
  "everything" "everywhere" "except" "few" "fifteen" "fify" "fill" "find" "fire" "first" "five" "for" "former" "formerly" "forty" "found" "four"
  "from" "front" "full" "further" "get" "give" "go" "had" "has" "hasnt" "have" "he" "hence" "her" "here" "hereafter" "hereby" "herein" "hereupon" "hers" "herse" "him"
  "himself" "his" "how" "however" "hundred" "i" "ie" "if" "in" "Inc" "indeed" "interest" "into" "is" "it" "its" "itself" "keep" "last" "latter" "latterly" "least" "less" "ltd" "made"
  "many" "may" "me" "meanwhile" "might" "mill" "mine" "more" "moreover" "most" "mostly" "move" "much" "must" "my" "myself" "name"
  "namely" "neiher" "never" "nevertheless" "next" "nine" "no" "nobody" "none" "noone" "nor" "not" "nothing" "now" "nowhere" "of" "off" "often"
  "on" "once" "one" "only" "onto" "or" "other" "others" "otherwise" "our" "ours" "ourselves" "out" "over" "own" "part" "per" "perhaps" "please" "put" "rather" "re" "same" "see" "seem"
  "seemed" "seeming" "seems" "serious" "several" "she" "should" "show" "side" "since" "sincere" "six" "sixty" "so" "some" "somehow" "someone" "something" "sometime" "sometimes" "somewhere"
  "still" "such" "system" "take" "ten" "than" "that" "the" "their" "them" "themselves" "then" "thence" "there" "thereafter" "thereby" "therefore" "therein" "thereupon" "these" "they"
  "thick" "thin" "third" "this" "those" "though" "three" "through" "throughout" "thru" "thus" "to" "together" "too" "top" "toward" "towards" "twelve" "twenty" "two" "un" "under" "until"
  "up" "upon" "us" "very" "via" "was" "we" "well" "were" "what" "whatever" "when" "whence" "whenever" "where" "whereafter" "whereas" "whereby" "wherein" "whereupon" "wherever" "whether" "which" "while" "whither"
  "who" "whoever" "whole" "whom" "whose" "why" "will" "with" "within" "without" "would" "yet" "you" "your" "yours" "yourself" "yourselves"))

(define listaDocumentos (list (list 1 "experimental investigation of the aerodynamics of a wing
in a slipstream" "brenckman,m" "j. ae. scs. 25, 1958, 324." "experimental investigation of the aerodynamics of a wing
in a slipstream. an experimental study of a wing in a propeller slipstream was made inf order to determine the spanwise
distribution of the lift increase due to slipstream at different angles of attack of the
wing and at different free stream to slipstream velocity ratios. the results were intended in part
as an evaluation basis for different theoretical treatments of this problem.
the comparative span loading curves, together with supporting evidence, showed that a substantial part
of the lift increment produced by the slipstream was due to a /destalling/ or boundary-layer-control effect.
the integrated remaining lift increment, after subtracting this destalling lift, was found to agree well with a potential
flor theory.
an empirical evaluation of the destalling effects was made for the specific configuration of the experiment."
                 ) (list 2 "simple shear flow past a flat plate in an incompressible fluid of small
viscosity ." "ting-yili” “department of aeronautical engineering, rensselaer polytechnic
institute
troy, n.y." "simple shear flow past a flat plate in an incompressible fluid of small
viscosity .
in the study of high-speed viscous flow past a two-dimensional body it
is usually necessary to consider a curved shock wave emitting from the
nose or leading edge of the body .  consequently, there exists an
inviscid rotational flow region between the shock wave and the boundary
layer .  such a situation arises, for instance, in the study of the
hypersonic viscous flow past a flat plate .  the situation is somewhat
different from prandtl's classical boundary-layer problem . in prandtl's
original problem the inviscid free stream outside the boundary layer is
irrotational while in a hypersonic boundary-layer problem the inviscid
free stream must be considered as rotational .  the possible effects of
vorticity have been recently discussed by ferri and libby .  in the
present paper, the simple shear flow past a flat plate in a fluid of small
viscosity is investigated .  it can be shown that this problem can again
be treated by the boundary-layer approximation, the only novel feature
being that the free stream has a constant vorticity .  the discussion
here is restricted to two-dimensional incompressible steady flow .") (list 3 "the boundary layer in simple shear flow past a flat plate ." "m. b. glauert" "department of mathematics, university of manchester, manchester,
england" "the boundary layer in simple shear flow past a flat plate .
the boundary-layer equations are presented for steady
incompressible flow with no pressure gradient .") (list 4 "approximate solutions of the incompressible laminar
boundary layer equations for a plate in shear flow ." "yen,k.t." "j. ae. scs. 22, 1955, 728." "approximate solutions of the incompressible laminar
boundary layer equations for a plate in shear flow .
  the two-dimensional steady boundary-layer
problem for a flat plate in a
shear flow of incompressible fluid is considered .
solutions for the boundary-
layer thickness, skin friction, and the velocity
distribution in the boundary
layer are obtained by the karman-pohlhausen
technique .  comparison with
the boundary layer of a uniform flow has also
been made to show the effect of
vorticity .") (list 5 "one-dimensional transient heat conduction into a double-layer
slab subjected to a linear heat input for a small time
internal ." "wasserman,b." "j. ae. scs. 24, 1957, 924." "one-dimensional transient heat conduction into a double-layer
slab subjected to a linear heat input for a small time
internal .
  analytic solutions are presented for the transient heat
conduction in composite slabs exposed at one surface to a
triangular heat rate .  this type of heating rate may occur, for
example, during aerodynamic heating .") (list 6 "one-dimensional transient heat flow in a multilayer
slab ." "campbell,w.f." "j. ae. scs. 25, 1958, 340." "one-dimensional transient heat flow in a multilayer
slab .
  in a recent contribution to the readers'
forum wassermann gave analytic
solutions for the temperature in a double
layer slab, with a triangular heat
rate input at one face, insulated at the other,
and with no thermal resistance
at the interface .  his solutions were for the
three particular cases..
i propose here to give the general solution
to this problem, to indicate
briefly how it is obtained using the method of
reference 2, and to point out
that the solutions given by wassermann are
incomplete for times longer
than the duration of the heat input .") (list 7 "the effect of controlled three-dimensional roughness
on boundary layer transition at supersonic speeds ." "van driest,e.r. and mccauley,w.d." "j. ae. scs. 27, 1960, 261." "the effect of controlled three-dimensional roughness
on boundary layer transition at supersonic speeds .
  experiments were performed in the 12-in. supersonic wind
tunnel of the jet propulsion laboratory of the california
institute of technology to investigate the effect of three-dimensional
roughness elements (spheres) on boundary-layer transition on a
tained at local mach numbers of 1.90, 2.71, and 3.67 by varying
trip size, position, spacing, and reynolds number per inch .
the results indicate that (1) transition from laminar to turbulent
flow induced by three-dimensional roughness elements begins
when the double row of spiral vortices trailing each element
contaminates and breaks down the surrounding field of vorticity, (2)
transition appears rather suddenly, becoming more violent with
increasing roughness height relative to the boundary-layer
thickness, (3) after the breakdown of the vorticity field, the strength
of the spiral vortices may still persist in the sublayer of the
ensuing turbulent flow, (4) lateral spacing of roughness elements has
little effect upon the initial breakdown (contamination) of the
laminar flow, and (5) the trip reynolds number where u
and v are the velocity and kinematic viscosity at the outer edge of
the boundary layer and k is roughness height, such that transition
occurs at the roughness position, varies as the position reynolds
number to the one-fourth power, viz., where x is
trip position .") (list 8 "measurements of the effect of two-dimensional and three-dimensional
roughness elements on boundary layer transition ." "klebanoff,p.s." "j. ae. scs. 22, 1955, 803." "measurements of the effect of two-dimensional and three-dimensional
roughness elements on boundary layer transition .
in his study of the effect of roughness on transition, h. l.
dryden found, on the basis of available data, that the effect
of a two-dimensional roughness element such as a /trip wire/
could be represented reasonably well in terms of a functional
relation between and, where is the reynolds number
of transition based on distance from the leading edge, is the
height of the roughness element, and is the boundary-layer
displacement thickness at the position of the element .  at his
suggestion some additional data were obtained, primarily to
extend the range to higher values of, during the course of an
investigation of transition on a flat plate conducted at the
national bureau of standards .  after the results on the two-
dimensional roughness elements were obtained, it appeared to be
desirable to see whether a row of three-dimensional roughness
elements would behave in the same way .") (list 9 "transition studies and skin friction measurements on
an insulated flat plate at a mach number of 5.8 ." "korkegi,r.h." "j. ae. scs. 23, 1956, 97." "transition studies and skin friction measurements on
an insulated flat plate at a mach number of 5.8 .
  an investigation of transition and skin friction on an insulated
flat plate, 5 by 26 in., was made in the galcit 5 by 5 in.
hypersonic wind tunnel at a nominal mach number of 5.8 .
  the phosphorescent lacquer technique was used for transition
detection and was found to be in good agreement with total-head
rake measurements along the plate surface and pitot boundary-
layer surveys .  it was found that the boundary layer was
laminar at reynolds numbers of at least 5 x 10 .  transverse
contamination caused by the turbulent boundary layer on the
tunnel sidewall originated far downstream of the flat plate leading
edge at reynolds numbers of 1.5 to 2 x 10, and spread at a
uniform angle of 5 compared to 9 degree in low-speed flow .
  the effect of two-dimensional and local disturbances was
investigated .  the technique of air injection into the boundary
layer as a means of hastening transition was extensively used .
although the onset of transition occurred at reynolds numbers
as low as 10, a fully developed turbulent boundary layer was
not obtained at reynolds numbers much below 2 x 10
regardless of the amount of air injected .
  a qualitative discussion of these results is given with emphasis
on the possibility of a greater stability of the laminar boundary
layer in hypersonic flow than at lower speeds .
  direct skin-friction measurements were made by means of the
floating element technique, over a range of reynolds numbers
verified as being laminar over the complete range .  with air
injection, turbulent shear was obtained only for reynolds
numbers greater than 2 x 10, this value being in good agreement with
earlier results of this investigation .  the turbulent skin-friction
coefficient was found to be approximately 0.40 of that for
incompressible flow for a constant value of r, and 0.46 for an effective
reynolds number between 5 and 6 x 10 .") (list 10 "the theory of the impact tube at low pressure ." "chambre,p.l. and schaaf,s.a." "j. ae. scs. 15, 1948, 735." "the theory of the impact tube at low pressure .
  a theoretical analysis has been made for an impact tube of the
relation between free-stream mach number and the impact and
free-stream pressures and densities for extremely low pressures .
it is shown that the results differ appreciably from the
corresponding continuum relations .")
                          )
  )

;0 - Representacion del indice lista de lista
;((id ("PalabraTitulo1" "PalabraTitulo2"... "PalabraTituloN") ("PalabraAutor1"..."PalabraAutorN").....("PalabraExtracto1"...."PalabraExtractoN"))
;Arriba es una lista con un solo documento, luego viene el segundo documento hasta el N documento)

;1 - Constructor

(define (createIndex documents StopWords) ;Funcion que crea el indice, recibe documents (lista de listas) y StopWords (lista) y retorna index (lista de lista)
  (define (createIndexAux l1 l2); Se define esta funcion para facilitar el trabajo con lista de listas. recibe una lista de documents y los stopwords y retorna una lista que formara parte del indice.
    (if (null? l1)
        null
        (if (string? (car l1))
            (cons (funcion (string-split (car l1)) l2) (createIndexAux (cdr l1) l2)) ;Llamado recursivo. Es recursion natural debido a que existe un estado pendiente (cons). Separa cada string de documents en lista de palabras.
            (cons (car l1) (createIndexAux (cdr l1) l2));Llamado recursivo. Recursion natural debido a que existe estado pendiente (cons). Crea la lista con el id del documento.
            )
  )
    );Aqui termina funcion auxiliar
  (if (null? documents)
      null
      (cons (createIndexAux (car documents) StopWords) (createIndex (cdr documents) StopWords));LLamado recursivo. Recursion natural debido a estado pendiente (cons). Crea la lista de lista llamando a la funcionAux y a la misma funcion.
  )
  )

;2 - Pertenencia

(define (index? i);Funcion que recibe un indice y retorna un bool dependiente si la entrada es un indice.
  (define (indexAux lista);Se crea funcion auxiliar que recibe una lista de la lista de listas.
    (if (and (list? lista) (= (length lista) 5) (not (string? (car lista)))
             (list? (car (cdr lista))) (list? (car (cdr (cdr lista))))
             (list? (car (cdr (cdr (cdr lista))))))
        #t
        #f
        )
    )
  (if (null? i)
      (index? (cdr i));LLamado recursivo. Recursion de cola, no hay estado pendiente.
      (indexAux (car i));LLamado recursivo. Recursion de cola, no hay estado pendiente.
      )
  )

;3 - Selectores

(define (getTitulo i n);Funcion recibe un indice y un numero que corresponde al numero de documento. retora una lista.
  (define (getLista i n)
    (if (null? (car i))
        null
        (if (= 0 n)
            (car i)
            (getLista (cdr i) (- 1 n))
            )
        )
    )
  (if (null? i)
      null
      (second (getLista i n))
  )
  )

(define (getAutor i n);Funcion recibe un indice y un numero que corresponde al numero de documento. retora una lista.
  (if (null? i)
      null
      (if (= 0 n)
          (car (cdr (cdr (car i))))
          (getAutor (cdr i) (- 1 n));Llamado recursivo. Recursion de cola, no hay estado pendiente.
          )
  )
  )

(define (getBibliografia i n);Funcion recibe un indice y un numero que corresponde al numero de documento. retora una lista.
  (if (null? i)
      null
  (if (= 0 n)
      (car (cdr (cdr (cdr (car i)))))
      (getAutor (cdr i) (- 1 n));Llamado recursivo. Recursion de cola, no hay estado pendiente.
      )
  )
  )

(define (getTexto i n);Funcion recibe un indice y un numero que corresponde al numero de documento. retora una lista.
  (if (null? i)
      null
  (if (= 0 n)
      (car (cdr (cdr (cdr (cdr (car i))))))
      (getTexto (cdr i) (- 1 n));Llamado recursivo. Recursion de cola, no hay estado pendiente.
      )
  )
  )

;4 - Modificadores


;5 - Otras Funciones

(define (esStopWord palabra ls);Funcion que valida si una palabra es stopword. recibe la palabra y la lista de stopword y retorna un bool.
  (if (null? ls)
      #t
      (if (equal? (car ls) palabra)
          #f
          (esStopWord palabra (cdr ls));Llamado recursivo. Recursion de cola, no hay estado pendiente.
          )
      )
  )

(define (funcion listaAux ls);Funcion que recibe una lista de palabras y la lista de stopword y retorna la lista sin los stopword.
  (if (null? listaAux)
      null
      (if (esStopWord (car listaAux) ls)
          (cons (car listaAux) (funcion (cdr listaAux) ls));Llamado recursivo. Recursion natural, estado pendiente (cons).
          (funcion (cdr listaAux) ls);Llamado recursivo. Recursion de cola, no hay estado pendiente.
          )
      )
  )

(define (estaEnLista l palabra);Funcion recibe una lista de string y un string y valida si el string esta en la lista.
  (if (null? l)
      #f
      (if (equal? (car l) palabra)
          #t
          (estaEnLista (cdr l) palabra);Llamado recursivo. Recursion natural, no hay estado pendiente.
          )
      )
  )

(define (termQuery index term documents);Funcion recibe un indice, una consulta en string, la lista de documentos y retorna una lista de listas.
  (define numero  (lambda (term indice numeroAux) (if (null? indice);Funcion recibe el termino, el indice y un numero y retorna un numero (RankValue).
                                                      numeroAux
                                                      (if (list? (car indice))
                                                          (if (estaEnLista (car indice) term)
                                                              (numero term (cdr indice) (+ 1 numeroAux));Llamado recursivo de cola, no hay estado pendiente. Si la palabra esta en la lista, se llama la recursion y se aumenta el numero
                                                              (numero term (cdr indice) numeroAux);Llamado recursivo de cola, no hay estado pendiente. Si no esta en la lista, recursion y NO se aumenta el numero
                                                              )
                                                          (numero term (cdr indice) numeroAux);Llamado recursivo de cola, no hay estado pendiente. SI no es una lista, se llama la funcion nuevamente pasandole la cola de la lista.
                                                          )
                                                      )
                    )
    );Aqui termina la funcion numero.
  (define listaUnida (lambda (indice) (if (null? indice);Funcion recibe una lista y devuelve la lista con el rankValue y las frases unidas.
                                          null
                                          (if (list? (car indice))
                                              (cons (string-join (car indice)) (listaUnida (cdr indice)));Llamado recursivo natural, estado pendiente (cons). Si es una lista de une los string con string-join
                                              (cons (car indice) (listaUnida (cdr indice)));Llamado recursivo natural, estado pendiente (cons). Si no es lista, simplemente se crea la lista.
                                              )
                                          )
                       )
    );Aqui termina la funcion listaUnida.
  (if (null? index)
      null
      (cons (cons (numero term (car index) 0) (listaUnida (car index))) (termQuery (cdr index) term documents));Llamado recursivo natural. estado pendiente (cons). Para cada lista del indice se hace llamado recursivo, creando la lista de listas con el rankValue.
      )
  )
                                            

(define (phraseQuery index stopwords phrase documents);Funcion recibe el indice la lista de stopwords, la consulta mediante una frase y la lista de documentos.
  (define frase (lambda (fraseAux stopwords) (if (null? fraseAux) fraseAux;Funcion recibe consulta y stopwords, quita los stopword de la consulta y retorna una lista con las palabras
                                              (if (esStopWord (car fraseAux) stopwords)
                                                  (cons (car fraseAux) (frase (cdr fraseAux) stopwords));Llamado recursivo natural, estado pendiente (cons). Si no es stopword se crea la lista.
                                                  (frase (cdr fraseAux) stopwords);Llamado recursivo de cola, no hay estado pendiente. Si es stopwords, se salta de la creacion de la lista.
                                                  )
                                              )
                  )
    );Aqui termina funcion frase.
  (define fraseFinal (frase (string-split phrase) stopwords));Se llama a la funcion frase para definir fraseFinal.
  (define numero (lambda (palabra indice numeroAux) (if (null? indice);Funcion recibe la lista de palabras, un indice y un numero y retorna un numero (rankValue).
                                                     numeroAux
                                                     (if (null? palabra)
                                                         (numero palabra (cdr indice) numeroAux);Llamado recursivo de cola, no hay estado pendiente. Si se llega al final de la lista de palabras, se entrega la cola del indice.
                                                         (if (list? (car indice))
                                                             (if (estaEnLista (car indice) (car palabra))
                                                                 (numero (cdr palabra) indice (+ 1 numeroAux));Llamado recursivo de cola, no hay estado pendiente. Si esta en la lista de aumenta el numero.
                                                                 (numero (cdr palabra) indice numeroAux);Llamado recursivo de cola, no hay estado pendiente. Si no esta en la lista no se aumenta.
                                                                 )
                                                             (numero palabra (cdr indice) numeroAux);Llamado recursivo de cola, no hay estado pendiente. Si no es lista se pasa la cola del indice.
                                                             )
                                                         )
                                                     )
                   )
    );Aqui termina funcion numero.
  (define listaUnida (lambda (indice) (if (null? indice);Funcion recibe una lista y retorna la lista con el rankValue y las listas de palabra unidas en string.
                                          null
                                          (if (list? (car indice))
                                              (cons (string-join (car indice)) (listaUnida (cdr indice)));Llamado recursivo natural, estado pendiente (cons). si es lista, la une como string y crea la lista mediante la recursion.
                                              (cons (car indice) (listaUnida (cdr indice)));Llamado recursivo natural, estado pendiente (cons). Si no es lista, simplemente crea la lista con el valor y a la recursion.
                                              )
                                          )
                       )
    );Aqui termina funcion listaUnida.
  (if (null? index)
      null
      (cons (cons (numero fraseFinal (car index) 0) (listaUnida (car index))) (phraseQuery (cdr index) stopwords phrase documents));Llamado recursivo de cola, estado pendiente (cons). va creando la lista de lista mediante llamados a funciones definidas y llamado recursivo.
  )
  )

(define (ranking results orderType);Funcion recibe una lista de resultados (mediante termQuery o phraseQuery), un numero y retorna la lista de resultados ordenada.
  (if (and (not (= 1 orderType)) (not (= 2 orderType)))
      null
  (if (null? (cdr results))
      results
      (if (= 1 orderType)
          (if (< (car (car results)) (car (cadr results)))   
              (cons (car results)
                    (ranking (cdr results) orderType));Llamado recursivo natural. Estado pendiente (cons). Va creando la lista de forma ascendente comparando el primer y segundo elemento de la lista recursivamente.
              (cons (cadr results)
                    (ranking (cons (car results) (cddr results)) orderType)));llamado recursivo natural. Estado pendiente (cons).
          (if (> (car (car results)) (car (cadr results)));Forma descendente   
              (cons (car results);Llamado recursivo natural. Estado pendiente (cons).
                    (ranking (cdr results) orderType))
              (cons (cadr results);Llamado recursivo natural. EStado pendiente (cons).
                    (ranking (cons (car results) (cddr results)) orderType)))
          )
  )
  )
  )

(define (Results->String results);Funcion que transforma los resultados en string de forma que sea mejor para la visualizacion del usuario.
  (define (Results->StringAux lista);Funcion auxiliar que recibe una lista del la lista de resultados
    (if (null? lista)
        "\n"
        (string-join (lista->string lista) "\n");Recursion natural, estado pendiente string-join. Une la lista de string en un solo string y le agrega un salto de linea
        )
    )
  (define (s results)
  (if (null? results)
      "\n"
      (string-append (Results->StringAux (car results)) (s (cdr results)));Llamado recursivo natural, estado pendiente string-append. Une mediante recursion las listas con string y saltos de linea.
  )
    )
  (display (s results));Se muestran los resultados al usuario.
  )
  

(define (lista->string lista);Funcion que recibe una lista con numeros y string y retorna la lista con solo strings.
  (if (null? lista)
      lista
      (if (not (string? (car lista)))
          (cons (number->string (car lista)) (lista->string (cdr lista)));LLamado recursivo natural, estado pendiente (cons).
          (cons (car lista) (lista->string (cdr lista)));LLamado recursivo natural, estado pendiente (cons).
          )
      )
  )
  
;CreateIndex

(define indice (createIndex listaDocumentos StopWords))
;(define indice2 (createIndex (list (list 1 "hola" "como" "estas" "bien")) StopWords))
;(define indice3 (createIndex (list (list 1 "Bajo la misma estrella" "Jhon Green" "Biblioteca Central" "Habia una vez...") (list 2 "Buscando a Alaska" "Jhon Green" "Biblioteca Central" "Erase una vez...")) StopWords))

;index?

;(index? indice); true
;(index? indice2); true
;(index? indice3); true
;(index? (list (list 1 2 3 4 5))) ; false, no cumple con el formato
;(index? (list 1 "hola" "como" "estas" "bien")) ;false, no cumple.

;getTitulo

;(getTitulo indice 0);Obtiene el titulo del primer documento
;(getTitulo indice 1);Obtiene el titulo del segundo documento

;getAutor

;(getAutor indice 0)
;(getAutor indice 1)

;getBibliografia

;(getBibliografia indice 0)
;(getBibliografia indice 1)

;getTexto

;(getTexto indice 0)

;esStopWord

;(esStopWord "of" StopWords);False (la funcion lanza false cuando es stopword)
;(esStopWord "yourselves" StopWords);False
;(esStopWord "Roberto" StopWords);True, no es stopword

;funcion

;(funcion (list "experimental" "of" "investigation") StopWords); retorna ("experimental" "investigation")
;(funcion (list "boundary" "myself" "layer") StopWords); retorna ("boundary" "layer")
;(funcion (list "Profesor" "Roberto") StopWords); retorna ("Profesor" "Roberto"), no hay stopwords.

;estaEnLista

;(estaEnLista (list "hola" "como" "estas") "estas");True si esta
;(estaEnLista (list "paradigmas" "programacion") "aprobado");False no esta
;(estaEnLista (list "ingenieria" "informatica") "informatica");True si esta

;termQuery

;(termQuery indice "experimental" listaDocumentos);Primer documento rankvalue = 2. En Titulo y en texto
;(termQuery indice "transient" listaDocumentos);sexto documento rankvalue = 2. Titulo y texto
;(termQuery indice "impact" listaDocumentos);decimo documento ranvalue = 2. Titulo y texto.

;PhraseQuery

;(phraseQuery indice StopWords "experimental investigation" listaDocumentos);primer documento rankvalue = 2. Titulo y texto
;(phraseQuery indice StopWords "boundary layer" listaDocumentos);multiples documentos
;(phraseQuery indice StopWords "theory impact" listaDocumentos);ultimo documento rankvalue = 2.

(define resultado (termQuery indice "experimental" listaDocumentos))
(define resultado2 (phraseQuery indice StopWords "experimental investigation" listaDocumentos))
(define resultado3 (phraseQuery indice StopWords "approximate solutions" listaDocumentos))

;ranking

;(ranking resultado 1) ordena ascendentemente
;(ranking resultado2 2) ordena descendentemente
;(ranking resultado3 1) ordena ascendentemente

;Results->String

;(Results->String resultado)
;(Results->String resultado2)
;(Results->String resultado3)
;3 resultados se muestran con saltos de linea incluidos

;lista->string

;(lista->string (list 1 2 "hola" "como" "estas" "bien"))
;(lista->string (list 3 4 "Clases" "de" "paradigmas" "programacion"))
;(lista->string (list 6 7 "viva" "chile" "%)8/$"))
;Devuelven las listas con los numeros como string