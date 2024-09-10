<div class="modal fade" id="modal-add-financialDetails">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Financial Detail</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" id="formFinancialDetail" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="user_id">Employe</label>
                                <select class="form-control select2" name="user_id" id="user_id">
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
                                <input type="text" class="form-control" id="location" name="location"
                                    placeholder="Location">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="dailyfee">Daily Fee</label>
                                <input type="number" class="form-control" id="dailyfee" name="dailyfee"
                                    placeholder="Daily Fee">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="joindate">Join Date</label>
                                <div class="input-group date">
                                    <input type="text" id="start_date" class="form-control" name="start_date" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="endcontract">End Of Contract</label>
                                <div class="input-group date">
                                    <input type="text" id="end_date" class="form-control" name="end_date"  />
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
                                <label for="status">Status</label>
                                <select class="form-control select2" name="status" id="status">
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
                <button type="button" class="btn btn-primary" id="btnSubmitFinancialDetails">Submit</button>
            </div>
        </div>
    </div>
</div>
