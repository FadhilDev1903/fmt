<div class="modal fade" id="modal-edit-financialDetails">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Financial Detail</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" id="formEditFinancialDetail" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" id="idEdt" name="id">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="user_idEdt">Employe</label>
                                <select class="form-control select2" name="user_id" id="user_idEdt">
                                    <option value=""></option>
                                    @foreach ($user as $item)
                                        <option value="{{ $item->id }}">{{ $item->name }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="location">Location</label>
                                <input type="text" class="form-control" id="locationEdt" name="location"
                                    placeholder="Location">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="dailyfeeEdt">Daily Fee</label>
                                <input type="number" class="form-control" id="dailyfeeEdt" name="dailyfee"
                                    placeholder="Daily Fee">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="joindateEdt">Join Date</label>
                                <div class="input-group date">
                                    <input type="text" id="start_dateEdt" class="form-control" name="start_date" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="endcontractEdt">End Of Contract</label>
                                <div class="input-group date">
                                    <input type="text" id="end_dateEdt" class="form-control" name="end_date"  />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="contract">Contract</label>
                                <input type="file" class="form-control" id="contract" name="contract"
                                    placeholder="Contract" accept="pdf/docx/">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="statusEdt">Status</label>
                                <select class="form-control select2" name="status" id="statusEdt">
                                    <option value=""></option>
                                    <option value="0">Non-Active</option>
                                    <option value="1">Active</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btnUpdateFinancialDetails">Update</button>
            </div>
        </div>
    </div>
</div>
