<?php
    class Log{
        public $ruta;
        public $metodo;
        public $hora;

        public function __construct($ruta, $metodo, $hora){
            $this->ruta = $ruta;
            $this->metodo = $metodo;
            $this->hora = $hora;
        }

        public function toJSON(){
            return json_encode($this);
        }

        public static function alta($objeto){
            Archivo::guardarUno('./../../../Archivos/info.log', $objeto);
        }
    }
?>