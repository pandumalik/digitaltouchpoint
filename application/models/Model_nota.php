<?php
   Class Model_nota extends Ci_Model {
   
       var $username1 = "";
       var $ambil = "";
   
       function add() {
        
           $data = array(
               'nomor' => $this->input->post('nomor'),
               'disposisi' => $this->input->post('disposisi'),
               'id_seksi' => $this->input->post('id_seksi'),
               'isi_nota' => $this->input->post('isi_nota'),
               'last_edit' => $this->session->userdata('username'),
               'tobeuser'=> $this->input->post('namauser')
                   //     'file' => $uploads
           );

           $this->db->insert('tbl_nota', $data);
           
           $id_nota = $this->input->post('id_nota');
           $ambil =  $this->Model_nota->addapruval($id_nota);
   
           $data1 = array(
               'id_nota' => $ambil,
               'level' => '1',
               'username' => 'user',
           );
           $data2 = array(
               'id_nota' => $ambil,
               'level' => '2',
               'username' => 'dataowner',
           );
           $data3 = array(
               'id_nota' => $ambil,
               'level' => '3',
               'username' => 'dgcouncil',
           );
           $data4 = array(
               'id_nota' => $ambil,
               'level' => '4',
               'username' => 'admin',
                   //     'file' => $uploads
           );
              $data5 = array(
                  'id_nota' => $ambil,
                  'level' => '5',
                  'username' => 'FINISH',
                      //     'file' => $uploads
              );
              $this->db->insert('apruval',$data1);
              $this->db->insert('apruval',$data2);
              $this->db->insert('apruval',$data3);
              $this->db->insert('apruval',$data4);
              $this->db->insert('apruval',$data5);
      
              $data6 = array(
                  'id_nota' => $ambil,
                  'username' => $this->session->userdata('username'),
              );
              $this->db->insert('tbl_transaksi',$data6);

            $hasil = $this->db->query("SELECT level FROM apruval WHERE id_nota = '$id_nota' and username = '$username' ")->row_array();
            $l = $hasil['level']+1;
            $hasil2 = $this->db->query("SELECT username FROM apruval WHERE id_nota = '$id_nota' and level = '$l' ")->row_array();
       
            $username1 = $hasil2['username'];       
            $data = array(
               'tobeuser' => $namauser1
            );
            return $hasil2['username'];
   
       }
   
        function addapruval($id_nota){
           
           $hasil = $this->db->query("SELECT id_nota FROM tbl_nota  ORDER BY id_nota DESC LIMIT 1 ")->row_array();
           $n = $hasil['id_nota'];
   
           return $hasil['id_nota'];
        }
   
       function getapruval($id_nota, $username, $status){
           // $hasil3 = "Hello";

            switch ($status) {
                
                case "Return":
                $hasil = $this->db->query("SELECT level FROM apruval WHERE id_nota = '$id_nota' and username = '$username' ")->row_array();
                $l = $hasil['level']-1;
                $hasil2 = $this->db->query("SELECT username FROM apruval WHERE id_nota = '$id_nota' and level = '$l' ")->row_array();
       
                $username1 = $hasil2['username'];       
                $data = array(
                   'namauser' => $hasil2['username'],
                   'level' => $l
                );
                return $hasil2['username'];
                break;
                
                case "Approved":
                $hasil = $this->db->query("SELECT level FROM apruval WHERE id_nota = '$id_nota' and username = '$username' ")->row_array();
                $l = $hasil['level']+1;
                $hasil2 = $this->db->query("SELECT username FROM apruval WHERE id_nota = '$id_nota' and level = '$l' ")->row_array();
       
                $username1 = $hasil2['username'];       
                $data = array(
                   'namauser' => $hasil2['username'],
                   'level' => $l
                );
                return $hasil2['username'];
                break;

                case "Rejected":
       
                $hasil = $this->db->query("SELECT level FROM apruval WHERE id_nota = '$id_nota' and username = '$username' ")->row_array();
                $l = $hasil['level']=0;
                $hasil2 = $this->db->query("SELECT username FROM apruval WHERE id_nota = '$id_nota' and level = '$l' ")->row_array();
       
                $username1 = $hasil2['username'];       
                $data = array(
                   'namauser' => $hasil2['username'],
                   'level' => $l
                );
                return "FINISH";
                break;
                default:
                
                $hasil = $this->db->query("SELECT level FROM apruval WHERE id_nota = '$id_nota' and username = '$username' ")->row_array();
                $l = $hasil['level']=0;
                $hasil2 = $this->db->query("SELECT username FROM apruval WHERE id_nota = '$id_nota' and level = '$l' ")->row_array();
           
                   $username1 = $hasil2['username'];       
                   $data = array(
                       'namauser' => $hasil2['username'],
                       'level' => $l
                );
                return $hasil2['username'];
            }
           
        }
   
   
       function edit() {
           $id_nota = $this->input->post('id_nota');
           $username = $this->input->post('namauser');
           $namauser1 =  $this->Model_nota->getapruval($id_nota, $username, $this->input->post('status'));
   
   
           $data = array(
               'nomor' => $this->input->post('nomor'),
               'disposisi' => $this->input->post('status'),
               'id_seksi' => $this->input->post('id_seksi'),
               'isi_nota' => $this->input->post('isi_nota'),
               'status'=>1,
               'last_edit' => $this->input->post('namauser'),
               'tobeuser' => $namauser1
           );
           
           $this->db->where('id_nota', $id_nota);
           $this->db->update('tbl_nota', $data);
   
           $ambil =  $this->Model_nota->addapruval($id_nota);
           $data5 = array(
               'id_nota' => $ambil,
               'username' => $this->session->userdata('username'),
               'aksi' => $this->input->post('status'),
               'catatan' => $this->input->post('isi_catatan'),
           );
           $this->db->insert('tbl_transaksi',$data5);
       }
   
       function update() {
   
           $data = array(
               'kepada' => $this->input->post('kepada'),
               'tembusan' => $this->input->post('tembusan'),
               'dari' => $this->input->post('dari'),
               'tanggal' => $this->input->post('tanggal'),
               'no_surat' => $this->input->post('no_surat'),
               'id_prihal' => $this->input->post('id_prihal'),
               'isi_nota' => $this->input->post('isi_nota'),
               'status' => 1,
               'id_login' => $this->input->post('id_login')
           );
           $id_surat = $this->input->post('id_surat');
           $this->db->where('id_surat', $id_surat);
           $this->db->update('tbl_surat', $data);
       }
   
   }
   
   ?>

