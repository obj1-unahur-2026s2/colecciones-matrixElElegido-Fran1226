object neo {
    var energia = 100

    method esElElegido() = true

    method saltar(){
        energia = energia/ 2
    }

    method vitalidad() = energia/10
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method saltar() {
        estaCansado = not estaCansado
        vitalidad = (vitalidad-1).max(0)
    }
    method vitalidad() = vitalidad
}

object trinity {
    method vitalidad() = 0
    method esElElegido() = false
    method saltar() {}
}

object nave {
    const pasajeros = []

    method subirPasajero(unPasajero) {
        pasajeros.add(unPasajero)
    }
    method bajarPasajeros(unPasajero) {
        pasajeros.remove(unPasajero)
    }

    method cantPasajeros() {
        return pasajeros.size()
    }

    method pasajeroConMayorVitalidad() {
        return pasajeros.max({p => p.vitalidad()}).vitalidad()
    }

    method estaEquilibrada() {
        return // self.pasajeroConMayorVitalidad() <= min*2
    }

    method estaElElegido() {
        return pasajeros.any({p => p.esElElegido()})
    }

    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }

    method acelerar() {
        pasajeros.filter({p => not p.esElElegido()}).forEach({p => p.saltar()})
    }
}