<?php
    class CartModel{
        //  lấy tất cả giỏ hàng của một người từ user_id
        public function select_all_carts($user_id) {
            $sql = "SELECT * FROM carts WHERE user_id = $user_id ORDER BY cart_id DESC";

            return pdo_query($sql);
        }
//lấy thông tin giỏ hàng của một sp
        public function select_cart_by_id($product_id, $user_id) {
            $sql = "SELECT * FROM carts WHERE product_id = $product_id AND user_id = $user_id";

            return pdo_query_one($sql);
        }
//lấy các giỏ hàng gần đây của một user với số lượng giới hạn, chỉ mua đc <= với số lượng sp có
        public function select_mini_carts($user_id, $limit) {
            $sql = "SELECT * FROM carts WHERE user_id = $user_id ORDER BY cart_id DESC LIMIT $limit";

            return pdo_query($sql);
        }
//đếm số lượng sp trong giỏ hàng
        public function count_cart($user_id) {
            $sql = "SELECT cart_id FROM carts WHERE user_id = $user_id";

            return pdo_query($sql);
        }
//thêm một sản phẩm mới vào giỏ hàng
        public function insert_cart($product_id, $user_id, $product_name, $product_price, $product_quantity, $product_image) {
            $sql = "INSERT INTO carts 
           (product_id, user_id, product_name, product_price, product_quantity, product_image)
            VALUES (?,?,?,?,?,?)";

            pdo_execute($sql, $product_id, $user_id, $product_name, $product_price, $product_quantity, $product_image);
        }

        public function update_cart($product_qty, $product_id, $user_id) {
            $sql = "UPDATE carts SET 
            product_quantity = $product_qty 
            WHERE product_id = $product_id AND user_id = $user_id";

            pdo_execute($sql);
        }
//  Xóa một sản phẩm cụ thể khỏi giỏ hàng của user
        public function delete_product_in_cart($product_id, $user_id) {
            $sql = "DELETE FROM carts WHERE product_id = ? AND user_id = ?";
            pdo_execute($sql, $product_id, $user_id);
        }
// Xóa toàn bộ giỏ hàng 
        public function delete_cart_by_id($cart_id) {
            $sql = "DELETE FROM carts WHERE cart_id = ?";
            pdo_execute($sql, $cart_id);
        }
    }

    $CartModel = new CartModel();
?>