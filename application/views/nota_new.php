

<div class="col-xs-12">
   <div class="box">
      <div class="box-header">
         <h3 class="box-title">Data Request</h3>
         <?php $level = $this->session->userdata('level'); ?>
         <?php if ($level==3): ?>
         <div class="pull-right"></div>
         <?php elseif($level==4): ?>
         <div class="pull-right"></div>
         <?php else: ?>
         <div class="pull-right"><?php echo anchor('Nota/add', 'Ajukan Request Data', array('class' => 'btn btn-danger')) ?></div>
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
                  <th>Status</th>
                  <th>Nama Seksi</th>
                  <th>Tanggal</th>
                  <th>Next Approval</th>
                  <th>Action</th>
               </tr>
            </thead>
            <tbody>
               <?php $level = $this->session->userdata('level'); ?>
               <?php $namanya = $this->session->userdata('username');?>
               <?php
                  $no = 1;
                  foreach ($nota as $p):
                      ?>
               <tr>
                  <td><?php echo $no ?></td>
                  <td><?php echo $p->nomor ?></td>
                  <td><?php echo $p->disposisi ?> By <?php echo $p->last_edit?></td>
                  <td><?php echo $p->nama_seksi ?></td>
                  <td><?php echo $p->tanggal ?></td>
                  

                     <!--USER -->
                  <?php if ($level == 1): ?>
                        <td><?php echo $p->tobeuser ?></td>
                        <td><?php echo anchor('echo base_url()' . $p->id_nota, 'LIHAT', array('class' => 'btn btn-info')) ?></td>

                     <!--DATA OWNER -->

                  <?php elseif ($level ==2): ?>
                    <?php if ($namanya==$p->last_edit || $p->tobeuser=='FINISH' ): ?>
                          <td><?php echo $p->tobeuser ?></td>
                          <td>EDITED by <?php echo $p->last_edit?></td>
                    <?php else:?>
                          <td><?php echo $p->tobeuser ?></td>
                          <?php if ($namanya!=$p->last_edit): ?>
                            <td><?php echo anchor('Nota/edit/' . $p->id_nota, 'EDIT', array('class' => 'btn btn-info')) ?></td>
                          <?php else:?>
                            <td>RESTRICTED</td>
                          <?php endif ?> 
                    <?php endif ?>

                     <!--DG Council-->

                  <?php elseif($level ==3): ?>
                    <?php if ($namanya==$p->last_edit): ?>
                          <td><?php echo $p->tobeuser ?></td>
                          <td>EDITED</td>
                    <?php else:?>
                          <td><?php echo $p->tobeuser ?></td>
                          <?php if ($namanya==$p->tobeuser): ?>
                            <td><?php echo anchor('Nota/edit/' . $p->id_nota, 'EDIT', array('class' => 'btn btn-info')) ?></td>
                          <?php else:?>
                            <td>RESTRICTED</td>
                          <?php endif ?>        
                    <?php endif ?>


                     <!--ADMIN-->

                  <?php elseif($level ==4): ?>
                          
                     <?php if ($namanya==$p->last_edit): ?>
                          <td><?php echo $p->tobeuser ?></td>
                          <td>EDITED</td>
                     <?php else:?>
                          <td><?php echo $p->tobeuser ?></td>
                          <?php if ($namanya==$p->tobeuser ): ?>
                            <td><?php echo anchor('Nota/edit/' . $p->id_nota, 'EDIT', array('class' => 'btn btn-info')) ?></td>
                          <?php else:?>
                            <td>RESTRICTED</td>
                          <?php endif ?> 
                          <?php endif ?>      
                  <?php endif; ?>
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

