<?php
namespace App\Models\ORM;

use App\Models\AutentificadorJWT;
use App\Models\ORM\Usuario;
use App\Models\ORM\Ingreso;
use App\Models\ORM\Egreso;
use App\Models\IApiControler;

include_once __DIR__ . '/usuario.php';
include_once __DIR__ . '/ingreso.php';
include_once __DIR__ . '/egreso.php';
include_once __DIR__ . '../../modelAPI/IApiControler.php';
include_once __DIR__ . '../../modelAPI/AutentificadorJWT.php';


use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class UsuarioController implements IApiControler 
{
 	public function Beinvenida($request, $response, $args) {
      $response->getBody()->write("GET => Bienvenido!!! ,a UTN FRA SlimFramework");
    
    return $response;
    }

    public function TraerTodos($request, $response, $args) {
        //return cd::all()->toJson();
        //addLog($request->getMethod(), $request->getUri()->getPath());
        $todosLosUsuarios=usuario::all();
        $newResponse = $response->withJson($todosLosUsuarios, 200);  
        return $newResponse;
    }
    public function TraerUno($request, $response, $args) {
        $id = $args['id'];
        $usuario = usuario::find($id);
        $newResponse = $response->withJson($usuario, 200);  
        return $newResponse;
    }
   
    public function CargarUno($request, $response, $args) {
        //addLog($request->getMethod(), $request->getUri()->getPath());
        $arry_params = $request->getParsedBody();
        $arrayFotos = $request->getUploadedFiles();
        if(array_key_exists("email", $arry_params) && array_key_exists("clave", $arry_params)
        && array_key_exists("legajo", $arry_params) && array_key_exists("foto1", $arrayFotos)
        && array_key_exists("foto2", $arrayFotos)&& !usuario::where('legajo', '=', $arry_params["legajo"])->exists())
        {
            
            $usuario= new usuario;
            $legajo = $arry_params['legajo'];
            $usuario->email = $arry_params['email'];
            $usuario->clave = crypt($arry_params['clave'],'st');
            $usuario->legajo = $legajo;//rand(10000, 99999);
            $arrayFotos = $request->getUploadedFiles();
            
            //foto1
            $extension = $arrayFotos['foto1']->getClientFilename();
            $extension = explode(".", $extension);
            $filenameUno = "./images/users/" . $usuario->email . "1." . $extension[1];
            $arrayFotos["foto1"]->moveTo($filenameUno);
            $usuario->foto1 =  $filenameUno;

            //Foto2
            $extension = $arrayFotos["foto2"]->getClientFilename();
            $extension = explode(".", $extension);
            $filenameDos = "./images/users/" . $usuario->email . "2." . $extension[1];
            $arrayFotos["foto2"]->moveTo($filenameDos);
            $usuario->foto2 =  $filenameDos;
            
            $usuario->save();
            $newResponse = $response->withJson($usuario, 200);  
        
        }
        else {
            $newResponse = $response->withJson("Faltan datos o el usuario ya existe, vuelva a intentarlo", 200);
        }
        return $newResponse;
        
    }

      public function BorrarUno($request, $response, $args) {
  		//complete el codigo
     	$newResponse = $response->withJson("sin completar", 200);  
      	return $newResponse;
    }
     
     public function ModificarUno($request, $response, $args) {
       
    }

    public function Login($request,$response,$args){
      $datos = $request->getParsedBody();
      $clave = $datos['clave'];
      $email = $datos['email'];
      $legajo = $datos['legajo'];
      $usuario = Usuario::where('legajo','=',$datos['legajo'])
        ->select('id','email','clave','legajo')
        ->get()
        ->toArray();
      $emailValido = strcasecmp($usuario[0]["email"],$email);
      $claveValida = strcasecmp($usuario[0]["clave"],crypt($clave,'st'));
      if (count($usuario) == 1 && $claveValida == 0 && $emailValido == 0) {
        unset($usuario[0]['clave']);
        if($legajo < 100 && $legajo > 0){
          $usuario[0]['rol'] = "admin";
        }else{
          $usuario[0]['rol'] = "usuario";
        }
        $token = AutentificadorJWT::CrearToken($usuario[0]);
        $newResponse = $response->withJson($token, 200);
        //$newResponse = "Logueo correcto. Su token es: " . $response->withJson($token, 200);
      }
      else {
        $newResponse = $response->withJson("No se pudo iniciar sesion, error al generar el token, vuelva a intentarlo", 200);
      }
      return $newResponse;
    }

    public function IngresoUsuario($request,$response,$args){
      $token = $request->getHeader("token")[0];
      $data = AutentificadorJWT::ObtenerData($token);
      $ingreso = new Ingreso;
      $ingreso->usuario = $data->email;
      $ingreso->legajo = $data->legajo;

      $contIngresos = Ingreso::where('usuario','=',$data->email)->select('created_at')->get()->toArray();
      $contEgresos = Egreso::where('usuario','=',$data->email)->select('created_at')->get()->toArray();

      if(count($contIngresos) == count($contEgresos))
      {
        $ingreso->save();
        $newResponse = $response->withJson("Ingreso correcto", 200);
      }
      else
      {
        $newResponse = $response->withJson("El usuario ya tiene una sesion iniciada", 200);
      }
      return $newResponse;
    }

    public function EgresoUsuario($request,$response,$args){
      $token = $request->getHeader("token")[0];
      $data = AutentificadorJWT::ObtenerData($token);
      $egreso = new Egreso;
      $egreso->usuario = $data->email;
      $egreso->legajo = $data->legajo;
      
      $contIngresos = Ingreso::where('usuario','=',$data->email)->select('created_at')->get()->toArray();
      $contEgresos = Egreso::where('usuario','=',$data->email)->select('created_at')->get()->toArray();
      
      if(count($contIngresos) == 0 || (count($contIngresos) <= count($contEgresos))){
        $newResponse = $response->withJson("No se puede egresar, el usuario no estaba ingresado", 200);
      }
      else{
        $egreso->save();
        $newResponse = $response->withJson("Usuario egresado correctamente",200);
      }
      return $newResponse;
    }

    public function IngresosPorUsuario($request,$response,$args){
      $token = $request->getHeader("token")[0];
      $data = AutentificadorJWT::ObtenerData($token);
      $rol = $data->rol;
      if($rol == "admin")
      {
        $ingresos = Ingreso::select("usuario","legajo","created_at")->get()->toArray();
        $newResponse = $response->withJson($ingresos,200);
      }
      else
      {
        $ingresos = Ingreso::where("legajo","=",$data->legajo)->select("usuario","legajo","created_at")->get();
        if(count($ingresos)!=0)
        {
          $newResponse = $response->withJson($ingresos,200);
        }
        else
        {
          $newResponse = $response->withJson("El usuario no tiene ingresos");
        }
        //$newResponse = $response->withJson("Acceso denegado. Solo administradores", 200);
      }
      return $newResponse;
    }

}