<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Games extends REST_Controller{

    function __construct($config = "rest"){
        parent::__construct($config);
        $this->load->database();
    }

    public function index_get(){

        $id = $this->get('id');
        $games=[];
        if($id == ''){
            $data = $this->db->get('games')->result();
            foreach($data as $row=>$key):
                $games[]=["GamesId"=>$key->GamesId,
                            "GamesName"=>$key->GamesName,
                            "Year"=>$key->Year,
                            "_links"=>[(object)["href"=>"developer/{$key->DeveloperId}",
                                        "rel"=>"developer",
                                        "type"=>"GET"]]
                        ];
                    endforeach;
        }else{
            $this->db->where('GamesId', $id);
            $games = $this->db->get('games')->result();
        }
        $result=["took"=>$_SERVER["REQUEST_TIME_FLOAT"],
                 "code"=>200,
                 "message"=>"Response Successfully",
                 "data"=>$games];
        $this->response($result, 200);
    }

    public function index_post(){
        $data = array(
                    'GamesId' => $this->post('GamesId'),
                    'GamesName' => $this->post('GamesName'),
                    'Year' => $this->post('Year'),
                    'DeveloperId'=>$this->post('DeveloperId'));
        $insert = $this->db->insert('games', $data);
        if($insert){
            $result = ["took" => $_SERVER["REQUEST_TIME_FLOAT"],
                       "code"=>201,
                       "message"=>"Data has successfully added",
                       "data"=>$data];
            $this->response($result, 201);
        }else{
            $result = ["took"=>$_SERVER["REQUEST_TIME_FLOAT"],
                       "code"=>502,
                       "message"=>"Failed adding data",
                       "data"=>null];
            $this->response($result, 502);
        }
    }

    function index_put(){
        $id = $this->get('id');
        $data = array(
                    'GamesId' => $this->put('GamesId'),
                    'GamesName' => $this->put('GamesName'),
                    'Year' => $this->put('Year'),
                    'DeveloperId' => $this->put('DeveloperId'));
        $this->db->where('GamesId', $id);
        $update = $this->db->update('games', $data);
        if($update){
            $this->response($data, 200);
        } else{
            $this->response(array('status' => 'fail', 502));
        }
    }

    function index_delete() {
        $id = $this->get('id');
        $this->db->where('GamesId', $id);
        $delete = $this->db->delete('games');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else{
            $this->response(array('status' => 'fail', 502));
        }
    }
}

?>