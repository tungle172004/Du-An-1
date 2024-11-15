<?php
    class CustomerModel {

        public function select_users() {
            $sql = "SELECT username, full_name, email, phone FROM users";

            return pdo_query($sql);
        }

        public function select_all_users() {
            $sql = "SELECT * FROM users ORDER BY user_id DESC";

            return pdo_query($sql);
        }

        public function user_insert($username, $password, $full_name, $image, $email, $phone, $address, $role) {
            $sql = "INSERT INTO users(username, password, full_name, image, email, phone, address, role) VALUES(?,?,?,?,?,?,?,?)";

            pdo_execute($sql, $username, $password, $full_name, $image, $email, $phone, $address, $role);
        }

        public function get_user_admin($username) {
            $sql = "SELECT * FROM users WHERE username = '".$username."' AND role = 1";
            return pdo_query($sql);
        }

    }

    $CustomerModel = new CustomerModel();
    // $users = $CustomerModel->get_user_admin('tùng');
    // var_dump($users);
    // die;
?>