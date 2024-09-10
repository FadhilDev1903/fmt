<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdhocController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\ExpensesController;
use App\Http\Controllers\ProfileUserController;
use App\Http\Controllers\SetPeriodeUserController;
use App\Http\Controllers\FinancialDetailsController;
use App\Http\Controllers\ShopDetailChangeController;
use App\Http\Controllers\UsersApproveUserController;
use App\Http\Controllers\DataCollectionUserController;
use App\Http\Controllers\PanelServicingUserController;
use App\Http\Controllers\PanelRecruitmentUserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', [App\Http\Controllers\LoginController::class, 'index'])->name('login');
Route::post('/login', [App\Http\Controllers\LoginController::class, 'proses_login'])->name('proses_login');
Route::get('/register-next', [App\Http\Controllers\RegisterController::class, 'index'])->name('register2')->middleware('auth', 'verified');
Route::post('/register-next', [App\Http\Controllers\RegisterController::class, 'proses_register'])->name('proses_register')->middleware('auth', 'verified');
Route::get('/reload-captcha', [App\Http\Controllers\CaptchaController::class, 'reloadCaptcha'])->name('reload_captcha');

Route::get('/home', [App\Http\Controllers\HomeUserController::class, 'index'])->name('home_user')->middleware('auth', 'check.user', 'verified');

Route::controller(ProfileUserController::class)->group(function () {
    Route::get('profile', 'index')->name('profile')->middleware('auth', 'check.user', 'verified');
    Route::post('profile-create', 'createData')->name('profile_create')->middleware('auth', 'check.user', 'verified');
});
Route::controller(DataCollectionUserController::class)->group(function () {
    Route::get('data-collection', 'index')->name('data_collection')->middleware('auth', 'check.user', 'verified');
    Route::post('data-collection-create', 'createData')->name('data_collection_create')->middleware('auth', 'check.user', 'verified');
    Route::get('data-collection-get-gsnr', 'getGsnr')->name('data_collection_get_gsnr')->middleware('auth', 'check.user', 'verified');
});
Route::controller(PanelServicingUserController::class)->group(function () {
    Route::get('panel-servicing', 'index')->name('panel_servicing')->middleware('auth', 'check.user', 'verified');
    Route::post('panel-servicing-create', 'createData')->name('panel_servicing_create')->middleware('auth', 'check.user', 'verified');
});
Route::controller(PanelRecruitmentUserController::class)->group(function () {
    Route::get('panel-recruitment', 'index')->name('panel_recruitment')->middleware('auth', 'check.user', 'verified');
    Route::post('panel-recruitment-create', 'createData')->name('panel_recruitment_create')->middleware('auth', 'check.user', 'verified');
});
Route::controller(SetPeriodeUserController::class)->group(function () {
    Route::get('set-periode', 'index')->name('set_periode')->middleware('auth', 'check.user', 'verified');
    Route::get('set-periode-all', 'allData')->name('set_periode_all')->middleware('auth', 'check.user', 'verified');
    Route::post('set-periode-create', 'createData')->name('set_periode_create')->middleware('auth', 'check.user', 'verified');
    Route::get('set-periode-get', 'getData')->name('set_periode_get')->middleware('auth', 'check.user', 'verified');
    Route::post('set-periode-update', 'updateData')->name('set_periode_update')->middleware('auth', 'check.user', 'verified');
    Route::post('set-periode-delete', 'deleteData')->name('set_periode_delete')->middleware('auth', 'check.user', 'verified');
});
Route::controller(UsersApproveUserController::class)->group(function () {
    Route::get('users-approve', 'index')->name('users_approve')->middleware('auth', 'check.user', 'verified');
    Route::get('users-approve-all', 'allData')->name('users_approve_all')->middleware('auth', 'check.user', 'verified');
    Route::get('users-approve-get', 'getData')->name('users_approve_get')->middleware('auth', 'check.user', 'verified');
    Route::post('users-approve-update', 'updateData')->name('users_approve_update')->middleware('auth', 'check.user', 'verified');
});

Route::controller(MemberController::class)->group(function () {
    Route::get('member', 'index')->name('member')->middleware('auth', 'check.user', 'verified');
    Route::get('member-all', 'allData')->name('member_all')->middleware('auth', 'check.user', 'verified');
    Route::get('member-get', 'getData')->name('member_get')->middleware('auth', 'check.user', 'verified');
    Route::post('member-update', 'updateData')->name('member_update')->middleware('auth', 'check.user', 'verified');
});

Route::controller(ProjectController::class)->group(function () {
    Route::get('project', 'index')->name('project')->middleware('auth', 'check.user', 'verified');
    Route::get('project-create', 'createProject')->name('project_create')->middleware('auth', 'check.user', 'verified');
    Route::post('project-add', 'createData')->name('project_add')->middleware('auth', 'check.user', 'verified');
    Route::get('project-all', 'allData')->name('project_all')->middleware('auth', 'check.user', 'verified');
    Route::get('project-detail/{encryptedId}', 'getData')->name('project_get')->middleware('auth', 'check.user', 'verified');
    Route::post('project-update', 'updateData')->name('project_update')->middleware('auth', 'check.user', 'verified');
});
Route::controller(AdhocController::class)->group(function () {
    // Route::get('adhocproject', 'index')->name('adhocproject')->middleware('auth', 'check.user', 'verified');
    // Route::get('adhocproject-create', 'createProject')->name('adhocproject_create')->middleware('auth', 'check.user', 'verified');
    // Route::post('adhocproject-add', 'createData')->name('adhocproject_add')->middleware('auth', 'check.user', 'verified');
    // Route::get('adhocproject-detail/{encryptedId}', 'getData')->name('adhocproject_get')->middleware('auth', 'check.user', 'verified');
    // Route::post('adhocproject-update', 'updateData')->name('adhocproject_update')->middleware('auth', 'check.user', 'verified');
    Route::get('adhocproject-all', 'allData')->name('adhocproject_all')->middleware('auth', 'check.user', 'verified');
});
Route::controller(ExpensesController::class)->group(function () {
    Route::get('claim', 'claim')->name('claim')->middleware('auth', 'check.user', 'verified');
    Route::post('claim-add', 'createClaimData')->name('claim_add')->middleware('auth', 'check.user', 'verified');
    Route::get('timesheet', 'timesheet')->name('timesheet')->middleware('auth', 'check.user', 'verified');
    Route::post('timesheet-add', 'createTimesheetData')->name('timesheet_add')->middleware('auth', 'check.user', 'verified');
    Route::get('my-expense', 'myExpenses')->name('my_expense')->middleware('auth', 'check.user', 'verified');
    Route::get('my-expense-all', 'allDataExpenses')->name('my_expense_all')->middleware('auth', 'check.user', 'verified');
    Route::post('expense-approve', 'expenseApprove')->name('expense_approve')->middleware('auth', 'check.user', 'verified');
    Route::post('expense-reject', 'expenseReject')->name('expense_reject')->middleware('auth', 'check.user', 'verified');
    Route::post('expense-approve-all', 'expenseApproveAll')->name('expense_approve_all')->middleware('auth', 'check.user', 'verified');
    Route::post('expense-reject-all', 'expenseRejectAll')->name('expense_reject_all')->middleware('auth', 'check.user', 'verified');
    Route::get('check-date-event', 'checkDateEvent')->name('check_date_event')->middleware('auth', 'check.user', 'verified');
    Route::get('my-expense-timesheet', 'dataTableTimesheet')->name('my_expense_timesheet')->middleware('auth', 'check.user', 'verified');
    Route::post('timesheet-submit', 'submitTimesheetData')->name('timesheet_submit')->middleware('auth', 'check.user', 'verified');
    Route::post('event-approve', 'eventApprove')->name('event_approve')->middleware('auth', 'check.user', 'verified');
    Route::post('event-reject', 'eventReject')->name('event_reject')->middleware('auth', 'check.user', 'verified');
});

Route::controller(ShopDetailChangeController::class)->group(function () {
    Route::get('shop-detail-change', 'index')->name('shop-detail-change')->middleware('auth', 'check.user', 'verified');
    Route::get('shop-detail-change-all', 'allData')->name('shop_detail_change_all')->middleware('auth', 'check.user', 'verified');
    Route::post('shop-detail-change', 'store')->name('shop-detail-change-store')->middleware('auth', 'check.user', 'verified');
    Route::get('shop-detail-change-get/{id}', 'show')->name('shop_detail_change_show')->middleware('auth', 'check.user', 'verified');
    Route::put('shop-detail-change-update/{id}', 'update')->name('shop_detail_change_update')->middleware('auth', 'check.user', 'verified');
});

Route::controller(ShopDetailChangeController::class)->group(function () {
    Route::get('shop-detail-change', 'index')->name('shop-detail-change')->middleware('auth', 'check.user', 'verified');
    Route::get('shop-detail-change-all', 'allData')->name('shop_detail_change_all')->middleware('auth', 'check.user', 'verified');
    Route::post('shop-detail-change', 'store')->name('shop-detail-change-store')->middleware('auth', 'check.user', 'verified');
    Route::get('shop-detail-change-get/{id}', 'show')->name('shop_detail_change_show')->middleware('auth', 'check.user', 'verified');
    Route::put('shop-detail-change-update/{id}', 'update')->name('shop_detail_change_update')->middleware('auth', 'check.user', 'verified');
});

Route::resource('financial_details', FinancialDetailsController::class);
Route::post('/financial_details/update-contract', [FinancialDetailsController::class,'update_contract'])->name('update_contract');

Route::get('/report', [App\Http\Controllers\ReportUserController::class, 'index'])->name('report');
Route::post('/export-report', [App\Http\Controllers\ReportUserController::class, 'export_report'])->name('export_report');
Route::get('/set-shoplist', [App\Http\Controllers\SetShoplistUserController::class, 'index'])->name('users_approve')->middleware('auth', 'check.user', 'verified');

Route::get('/dashboard-admin', [App\Http\Controllers\HomeAdminController::class, 'index'])->name('home_admin');
