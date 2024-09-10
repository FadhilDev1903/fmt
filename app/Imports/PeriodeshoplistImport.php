<?php

namespace App\Imports;

use App\Models\Periodeshoplist;
use Maatwebsite\Excel\Concerns\ToModel;

class PeriodeshoplistImport implements ToModel
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        return new Periodeshoplist([
            //
        ]);
    }
}
