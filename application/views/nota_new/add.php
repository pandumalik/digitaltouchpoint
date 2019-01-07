<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Silahkan Isi Nota Dinas</h3>
                </div>
                <!-- /.box-header -->
                <?php
                echo form_open_multipart('Nota/add');
                ?>
                <div class="box-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group" style="margin-top:10px">
                                <span class="col-xs-2" style="margin-left:10px; margin-bottom:15px; font-size:18px">Nomor Nota :</span>
                                <div class="col-xs-4">
                                    <input class="form-control" type="text" id="onlynumber"   name="nomor" maxlength="11" autofocus required />
                                </div>
                                <span class="col-xs-2" style="margin-left:10px; margin-bottom:15px; font-size:18px">Disposisi :</span>
                                <div class="col-xs-3">
                                    <input class="form-control" type="text" value="Pending" readonly="" id="user" name="disposisi" maxlength="50" autofocus required />

                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:10px">
                            <div class="form-group">
                                <span class="col-xs-2" style="margin-left:10px; margin-bottom:15px; font-size:18px">Nama Seksi :</span>
                                <div class="col-xs-4">
                                    <?php echo cmb_dinamis('id_seksi', 'tbl_seksi', 'nama_seksi', 'id_seksi') ?>
                                </div>

                            </div>
                        </div>
                        
                        <div class="col-xs-12" style="margin-top:10px">
                            <div class="form-group">
                                <span class="col-xs-2" style="margin-left:10px; margin-bottom:15px; font-size:18px">Approver :</span>
                                <div class="col-xs-3">
                                <input class="form-control" type="text"
                                    <?php if ($this->session->userdata('username')=="user"):?>
                                        value="dataowner"
                                    <?php elseif ($this->session->userdata('username')=="dataowner"):?>
                                        value="dgcouncil" 
                                    <?php elseif ($this->session->userdata('username')=="dgcouncil"):?>
                                        value="admin" 
                                    <?php endif ?>
                                    readonly="" id="user" name="namauser" maxlength="50" autofocus required />
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12" style="margin-top:15px">
                            <div class="form-group">
                                <span class="col-xs-2" style="margin-left:10px; margin-bottom:15px; font-size:18px">Isi Nota : </span>
                                <div class="col-xs-4">
                                    <textarea class="textarea" name="isi_nota" placeholder="isi nota"
                                              style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                </div>
                                <div class="col-xs-2 col-xs-push-1">
                                    <input type="submit" name="submit" class="btn btn-lg btn-block btn-success fa fa-save" value="Simpan" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12" style="margin-top:15px; margin-bottom: 10px">
                            <div class="form-group">
                                <span class="col-xs-4 col-xs-push-2" style="margin-left:20px; margin-top:-20px; font-size:14px; font-style:italic; color:#888">*Format file:jika di perlukan .jpg / .jpeg / .png/.docx</span>
                            </div>
                        </div>

                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- ./box-body -->
                <?php echo form_close(); ?>
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
</section>
<!-- /.content -->
</div>
