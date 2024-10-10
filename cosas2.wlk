object knightRider {
    method peso() = 500
    method peligrosidad() = 10

    method bultos() = 1 

    method consecunciaDeCarga(){}
}

object bumblebee {
    var estaTransformado = false

    method transformar() {estaTransformado = not estaTransformado}

    method peso() = 800
    method peligrosidad() = if(estaTransformado) 30 else 15

    method bultos() = 2

    method consecunciaDeCarga(){self.transformar()}
}

object paqueteDeLadrillos {
  var cantDeLadrillos = 10

  method cambiarCantDeLadrillos(num) {cantDeLadrillos = num}

  method peso() = cantDeLadrillos *2

  method peligrosidad() = 2

  method bultos() = if(cantDeLadrillos <= 100) 1 else if( cantDeLadrillos <= 300) 2 else 3

  method consecunciaDeCarga(){cantDeLadrillos+=12}
}

object arena {
  var  property peso = 120

  method peligrosidad() = 1

  method bultos() = 1 

  method consecunciaDeCarga(){peso = peso-10.max(0)}
}

object bateriaAntiAerea {
  var tieneMisiles = false

  method cargarMisilles() {tieneMisiles = true}

  method peso() = if(tieneMisiles) 300 else 200

  method peligrosidad() = if(tieneMisiles) 100 else 0 

  method bultos() = if(tieneMisiles) 2 else 1 

  method consecunciaDeCarga(){self.cargarMisilles()}
}

object contenedor {
  const contenido = []

  method cargarAlgo(cosa) {contenido.add(cosa)}

  method estaVacio() = contenido.size() == 0

  method peso() = contenido.sum({x=>x.peso()}) +100

  method peligrosidad() =  if (self.estaVacio()) 0 else contenido.max({x=>x.peligrosidad()}).peligrosidad()

  method bultos() = 1 + contenido.sum({x=>x.bultos()})

  method consecunciaDeCarga(){contenido.forEach({x=>x.consecunciaDeCarga()})}
}

object residuosRadiactivos {
  var property peso = 140

  method peligrosidad() = 200

  method bultos() = 1 

  method consecunciaDeCarga(){peso+=10}
}

object embalaje {
  var cosaEmbalada = bumblebee

  method embalarAlgo(cosa) {cosaEmbalada = cosa}

  method peso() = cosaEmbalada.peso()

  method peligrosidad() =  cosaEmbalada.peligrosidad()/2

  method bultos() = 2

  method consecunciaDeCarga(){}
}