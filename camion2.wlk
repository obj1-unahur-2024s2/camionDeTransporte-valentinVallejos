import cosas.*


object camion{
    const carga = []

    method cargar(algo) {
        carga.add(algo)
        algo.consecunciaDeCarga()
    }

    method pesoTotal() = carga.sum({x=>x.peso()}) + 1000

    method todosLosPesosSonInpares() = carga.all({x=>x.peso().odd()})

    method algunoDePeso(unPeso) = carga.any({x=>x.peso() == unPeso})

    method elDeMaximaPelogrosidad()= carga.max({x=>x.peligrosidad()})

    method elQueTengaNivelDePeligro(num) = carga.find({x=>x.peligrosidad() == num})  

    method losDePeligrosidadSuperiorA(num) = carga.filter({x=>x.peligrosidad() > num})

    method estaExedidoDePeso() = self.pesoTotal() > 2500 

    method puedeCircularPorRuta(num) = not self.estaExedidoDePeso() and  (self.elDeMaximaPelogrosidad().peligrosidad() < num )

    method algunoQuePeseEntre(numMin,numMax) = carga.any({x=>x.peso().between(numMin, numMax)}) 

    method elMasPesado() = carga.max({x=>x.peso()})

    method totalDeBultos() = carga.sum({x=>x.bultos()})

}