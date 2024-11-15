<?php
    // Kiểm tra xem có tồn tại tham số 'id' trong URL và có lớn hơn 0 không
    if(isset($_GET['id']) && $_GET['id'] > 0) {
        // Lấy giá trị của 'id' từ URL
        $comment_id = $_GET['id'];
        // Lấy chi tiết bình luận dựa trên id từ Model
        $comment_details = $CommentModel->select_comment_by_id($comment_id);
        // Trích xuất các giá trị từ chi tiết bình luận
        extract($comment_details);
        // Định dạng lại ngày tháng
        $date_formated = $BaseModel->date_format($comment_date, '');
    }

    // Cập nhật trạng thái bình luận khi có yêu cầu POST từ form
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["update_status_comment"])) {
        // Lấy giá trị trạng thái từ form
        $status = $_POST["status"];
        // Lấy id bình luận từ form
        $comment_id = $_POST["comment_id"];
        // Cập nhật trạng thái bình luận trong cơ sở dữ liệu
        $CommentModel->update_status_comment($status, $comment_id);
        // Chuyển hướng về trang chi tiết bình luận sau khi cập nhật
        header("Location: chi-tiet-binh-luan&id=$comment_id");
    }

    // Xóa bình luận khi có yêu cầu từ URL
    if(isset($_GET['xoa']) && $_GET['xoa'] > 0) {
        // Lấy id bình luận từ URL
        $id_comment = $_GET['xoa'];
        // Xóa bình luận trong cơ sở dữ liệu
        $CommentModel->delete_comment($id_comment);
        // Chuyển hướng về trang quản lí bình luận sau khi xóa
        header("Location: index.php?quanli=binh-luan");
    }
?>

<div class="container pt-4">
    <article class="card">
        <header class="card-header text-dark">
            <h6> 
                <!-- Liên kết quay lại trang quản lý bình luận -->
                <a href="index.php?quanli=binh-luan" class="link-not-hover">Bình luận</a> 
                / Chi tiết bình luận
            </h6>
        </header>
        <div class="card-body mt-2">
            <div class="row">
                <div class="col-lg-12">
                    <h6 class="mb-1">
                        Nội dung bình luận: <span class="text-danger"></span>
                    </h6> 
                    <div class="rounded border" style="background-color: #ffff;">
                        <!-- Hiển thị nội dung bình luận -->
                        <p class="p-2 pt-4 text-dark"><?=$content?></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body mt-2">
            <div class="row">
                <div class="col-lg-6">
                    <div class="bg-custom rounded border" style="background-color: #ffff;">
                        <div class="p-4">
                            <?php
                                // Khởi tạo biến để lưu trạng thái bình luận
                                $trangThai = '';
                                // Xác định trạng thái bình luận và gán vào biến
                                if($status == 0) {
                                    $trangThai = 'Tạm ẩn';
                                }if($status == 1) {
                                    $trangThai = 'Hiển thị';
                                }
                            ?>
                            <h6 class="mb-1">
                                Trạng thái bình luận: <span class="text-danger"><?=$trangThai?></span>
                            </h6>  
                            <?php
                                // Hàm trả về tên tương ứng với trạng thái bình luận
                                function getStatusComment($status) {
                                    switch ($status) {
                                        case 0:
                                            return 'Tạm ẩn';
                                        case 1:
                                            return 'Hiển thị';
                                    }
                                }
                            ?>      
                            <form action="" method="post">
                                <div class="form-floating mb-3">
                                    <!-- Dropdown chọn trạng thái bình luận -->
                                    <select name="status" class="form-select" >
                                    <?php
                                        $status_options = [0, 1];
                                        // Hiển thị các lựa chọn trạng thái
                                        foreach ($status_options as $option_value) {
                                            $selected = ($option_value == $status) ? 'selected' : '';
                                            echo "<option value='$option_value' $selected>";
                                            // Đặt tên hoặc giá trị của option tại đây
                                            echo getStatusComment($option_value); // Thay thế hàm này bằng hàm trả về tên tương ứng
                                            echo "</option>";
                                        }
                                    ?>
                                    </select>                                  
                                </div>
                                <!-- Trường ẩn chứa id bình luận -->
                                <input type="hidden" name="comment_id" value="<?=$comment_id ?>">
                                <h6 class="mb-4">
                                    <!-- Nút cập nhật trạng thái bình luận -->
                                    <input type="submit" name="update_status_comment" value="Cập nhật" class="btn btn-custom">
                                    <!-- Liên kết xóa bình luận -->
                                    <a href="chi-tiet-binh-luan&id=<?=$comment_id ?>&xoa=<?=$comment_id ?>" onclick="return confirm('Bạn có chắc chắn muốn xóa bình luận\nSau khi xóa sẽ không thể khôi phục!')" class="btn btn-custom">Xóa bình luận</a>
                                </h6>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card mb-4 bg-custom" style="background-color: #ffff;">
                        <div class="card-body text-dark">                          
                            <div class="row mb-3">
                                <div class="col-sm-4">
                                    <p class="mb-0 text-right">Tên sản phẩm</p>
                                </div>
                                <div class="col-sm-8">
                                    <!-- Hiển thị tên sản phẩm -->
                                    <p class="mb-0 text-right text-danger"><?=$product_name?></p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">
                                    <p class="mb-0 text-right">Họ tên</p>
                                </div>
                                <div class="col-sm-8">
                                    <!-- Hiển thị họ tên người bình luận -->
                                    <p class="mb-0 text-right"><?=$full_name?></p>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-sm-4">
                                    <p class="mb-0 text-right">Thời gian</p>
                                </div>
                                <div class="col-sm-8">
                                    <!-- Hiển thị thời gian bình luận đã định dạng -->
                                    <p class="mb-0 text-right"><?=$date_formated?></p>
                                </div>
                            </div>                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </article>
</div>
