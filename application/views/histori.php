

<div class="col-xs-12">
   <div class="box">
      <div class="box-header">
         <h3 class="box-title">History Data Request</h3>
         <?php $level = $this->session->userdata('level'); ?>
         <?php if ($level==3): ?>
         <div class="pull-right"></div>
         <?php elseif($level==4): ?>
         <div class="pull-right"></div>
         <?php else: ?>
         <div class="pull-right"></div>
         <?php endif; ?>
         <?php
            if ($this->session->flashdata('Berhasil')) {
                echo "<div class='alert alert-info'>";
                echo $this->session->flashdata('Berhasil');
                echo "</div>";
            } elseif ($this->session->flashdata('edit')) {
                echo "<div class='alert alert-warning'>";
                echo $this->session->flashdata('edit');
                echo "</div>";
            } elseif ($this->session->flashdata('hapus')) {
                echo "<div class='alert alert-warning bg-danger'>";
                echo $this->session->flashdata('hapus');
                echo "</div>";
            } elseif ($this->session->flashdata('file')) {
                echo "<div class='alert alert-warning bg-danger'>";
                echo $this->session->flashdata('file');
                echo "</div>";
            }
            ?>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
         <table id="example1" class="table table-bordered table-hover">
            <thead>
               <tr>
                  <th>No</th>
                  <th>Nomor Nota</th>
                  <th>Nama</th>
                  <th>Action</th>
                  <th>Tanggal</th>
                  <th>Catatan</th>
               </tr>
            </thead>
            <tbody>
               <?php $level = $this->session->userdata('level'); ?>
               <?php $namanya = $this->session->userdata('username');?>
               <?php
                  $no = 1;
                  foreach ($histori as $p):
                      ?>
               <tr>
                  <td><?php echo $no ?></td>
                  <td><?php echo $p->nomor ?></td>
                  <td><?php echo $p->username ?></td>
                  <td><?php echo $p->aksi ?></td>
                  <td><?php echo $p->tanggal ?></td>
                  <td><?php echo $p->catatan ?></td>
               </tr>
               <?php $no++; ?>
               <?php endforeach; ?>
            </tbody>
         </table>
      </div>
      <!-- /.box-body -->
   </div>
   <!-- /.box -->
</div>

