
<style>

label {
    margin-top: 5px;
}
</style>
<div class="container my-5">
    <div class="row d-flex justify-content-center align-items-center m-0">
        <div class="login_oueter">

            <form action="" method="post" id="login" autocomplete="off" class="p-3">
                <h4 class="my-3 text-center">Quên mật khẩu</h4>
                
                <div class="form-row">
                    <div class="col-12">
                        <div class="input-group my-0">
                            <label class="w-100 text-dark" for="email_forgot">Email đăng ký</label>
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-envelope"></i></span>
                            </div>
                            <input name="email_forgot" type="email" value="" class="input form-control" id="email_forgot" placeholder="Email" required="true" />
                            <span class="w-100 text-danger"></span>
                        </div>
                    </div>
                    

                    <div class="col-12 mt-4">
                        <button class="btn btn-primary w-100" type="submit" name="forgot_password">Lấy lại mật khẩu</button>
                    </div>
                </div>
                <div class="col-12 line"></div>
                <div class="col-12 text-center">
                    <a href="index.php?url=dang-ky" class="btn btn-success w-50">Tạo tài khoản</a>
                </div>
            </form>
        </div>
    </div>

</div>
