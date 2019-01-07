<?php

Class Histori extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->Model('Model_nota');
    }

    function index() {
        $this->db->select('*');
        $this->db->from('tbl_transaksi');
        $this->db->join('tbl_nota', 'tbl_transaksi.id_nota=tbl_nota.id_nota');
        $this->db->where('tbl_transaksi.username="dataowner"');
        $data['histori'] = $this->db->get()->result();
        $this->template->load('template', 'histori', $data);
    }

}

?>