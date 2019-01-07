<?php
  Class Model_histori extends Ci_Model {
   
    function ambil() {
        $this->db->select('*');
        $this->db->from('tbl_transaksi');
        $this->db->join('tbl_nota', 'tbl_transaksi.id_nota=tbl_nota.id_nota');
        $this->db->where('tbl_transaksi.username=');
        $data['histori'] = $this->db->get()->result();
    }
   
  }
  
?>