<?php

use Slim\App;
use Slim\Http\Request;
use Slim\Http\Response;
use App\Models\ORM\Usuario;
use App\Models\ORM\UsuarioController;

include_once __DIR__ . '/../../src/app/modelORM/usuario.php';
include_once __DIR__ . '/../../src/app/modelORM/usuarioControler.php';


return function (App $app) {
    $container = $app->getContainer();

    $app->group('/usuario', function () {   
        
        $this->get('[/]', UsuarioController::class . ':traerTodos');

        $this->post('/', UsuarioController::class . ':cargarUno');

    });

    $app->group('/login', function () {
      
      $this->post('/',UsuarioController::class . ':login');
   
    });

    $app->group('/ingreso', function () {
      
      $this->put('/',UsuarioController::class . ':ingresoUsuario');

      $this->get('/',UsuarioController::class . ':ingresosPorUsuario');
   
    });

    $app->group('/egreso', function () {
      
      $this->put('/',UsuarioController::class . ':egresoUsuario');
   
    });
};