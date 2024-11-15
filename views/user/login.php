<?php
    $username_tmp = '';
    $password_tmp = '';
    $error ='';

    if(isset($_SESSION['user_register'])) {
        $username_tmp = $_SESSION['user_register']['username'];
        $password_tmp = $_SESSION['user_register']['password'];
    }


    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["signin"])) {
        $username = trim($_POST["username_login"]);
        $password = trim($_POST["password_login"]);

        $password_hash = password_hash($password, PASSWORD_DEFAULT);

        if (!empty($username) && !empty($password_hash)) {
            $users = $CustomerModel->get_user_by_username($username);

            for ($i = 0; $i < count($users); $i++) {
                $user = $users[$i];
            
                if (isset($user['password'])) {
                    if ($user['active'] != 1) {
                        $error = 'Tài khoản đã bị khóa';
                    } else {
                        if (password_verify($password, $user['password'])) {
                            // Lưu thông tin đăng nhập vào Session
                            $_SESSION['user']['id'] = $user['user_id'];
                            $_SESSION['user']['username'] = $user['username'];
                            $_SESSION['user']['full_name'] = $user['full_name'];
                            $_SESSION['user']['image'] = $user['image'];
                            $_SESSION['user']['email'] = $user['email'];
                            $_SESSION['user']['phone'] = $user['phone'];
                            $_SESSION['user']['address'] = $user['address'];
                            $_SESSION['user']['password'] = $user['password'];
            
                            // Xóa session lưu trữ tạm
                            if (isset($_SESSION['user_register'])) {
                                unset($_SESSION['user_register']);
                            }
            
                            header("Location: index.php");
                            exit; // Dừng việc thực thi tiếp sau khi chuyển hướng
                        } else {
                            $error = 'Sai tên tài khoản hoặc mật khẩu';
                        }
                    }
                } else {
                    $error = 'Sai tên tài khoản hoặc mật khẩu';
                    $username_tmp = $username;
                    $password_tmp = $password;
                }
            }
            
        } else {
            $error = 'Vui lòng nhập đầy đủ thông tin';
        }   

    }

    $html_alert = $BaseModel->alert_error_success($error, '');

?>
<style>

label {
    margin-top: 5px;
}
</style>
<div class="container my-5">
    <div class="row d-flex justify-content-center align-items-center m-0">
        <div class="login_oueter">

            <form action="" method="post" id="login" autocomplete="off" class="p-3">
                <h4 class="my-3 text-center">ĐĂNG NHẬP</h4>
                <div class="form-row">

                    <div class="col-12">
                        <div class="input-group my-0">
                            <span class="w-100" style="margin-bottom: -10px;">
                                <?=$html_alert?>
                            </span>
                            <label class="w-100 text-dark" for="username">Tên đăng nhập</label>
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                            </div>
                            <input name="username_login" type="text" value="<?=$username_tmp?>" class="input form-control" id="username" placeholder="Tên đăng nhập" required="true" />
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="input-group mb-3 mt-0">
                            <label class="w-100 text-dark" for="password">Mật khẩu</label>
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-lock"></i></span>
                            </div>
                            <input name="password_login" type="password" value="<?=$password_tmp?>" class="input form-control" id="password" placeholder="Mật khẩu" required="true" />
                            <div class="input-group-append">
                                <span class="input-group-text" onclick="password_show_hide();">
                                    <i class="fas fa-eye" id="show_eye"></i>
                                    <i class="fas fa-eye-slash d-none" id="hide_eye"></i>
                                </span>
                            </div>
                            

                        </div>
                    </div>

                    <div class="col-12">
                        <button class="btn btn-primary w-100" type="submit" name="signin">Đăng nhập</button>
                    </div>
                    <div class="col-12 pt-3 text-center">
                        <p class="mb-0"><a href="quen-mat-khau">Quên mật khẩu?</a></p>
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

<script>
    function password_show_hide() {
        var x = document.getElementById("password");
        var show_eye = document.getElementById("show_eye");
        var hide_eye = document.getElementById("hide_eye");
        hide_eye.classList.remove("d-none");
        if (x.type === "password") {
            x.type = "text";
            show_eye.style.display = "none";
            hide_eye.style.display = "block";
        } else {
            x.type = "password";
            show_eye.style.display = "block";
            hide_eye.style.display = "none";
        }
    }
</script>