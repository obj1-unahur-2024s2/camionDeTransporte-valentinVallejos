object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    var estaTransformado = false

    method transformar() {estaTransformado = not estaTransformado}

    method peso() = 800
    method peligrosidad() = if(estaTransformado) 30 else 15
}

object paqueteDeLadrillos {
  var cantDeLadrillos = 10

  method cambiarCantDeLadrillos(num) {cantDeLadrillos = num}

  method peso() = cantDeLadrillos *2

  method peligrosidad() = 2
}

object arena {
  var  property peso = 120

  method peligrosidad() = 1
}

object bateriaAntiAerea {
  var tieneMisiles = false

  method cargarMisilles() {tieneMisiles = true}

  method peso() = if(tieneMisiles) 300 else 200

  method peligrosidad() = if(tieneMisiles) 100 else 0 
}

object contenedor {
  const contenido = []

  method cargarAlgo(cosa) {contenido.add(cosa)}

  method estaVacio() = contenido.size() == 0

  method peso() = contenido.sum({x=>x.peso()}) +100

  method peligrosidad() =  if (self.estaVacio()) 0 else contenido.max({x=>x.peligrosidad()}).peligrosidad()
}

object residuosRadiactivos {
  var property peso = 140

  method peligrosidad() = 200
}

object embalaje {
  var cosaEmbalada = bumblebee

  method embalarAlgo(cosa) {cosaEmbalada = cosa}

  method peso() = cosaEmbalada.peso()

  method peligrosidad() =  cosaEmbalada.peligrosidad()/2
}