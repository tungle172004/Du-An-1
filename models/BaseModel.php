<?php
    class BaseModel{
        public function alert_error_success($error, $success) {
            $html = '';
            if($error != '') {
                $html = '
                    <div class="alert alert-danger p-2"> 
                        '.$error.'
                    </div> 
                ';
            }
            elseif($success != '') {
                $html = '
                <div class="alert alert-success p-2"> 
                    '.$success.'
                </div> 
            ';
            }
        
            return $html;
        }

        public function date_format($date, $plus_day) {
            $datetime = new DateTime($date);
 // Nếu có số ngày được chỉ định để cộng thêm
            if($plus_day != '') {
                $datetime->modify('+' . $plus_day . ' days'); //Thêm số ngày vào ngày tháng
            }
            return $formatted_date = $datetime->format('H:i d-m-Y');
        }

        public function is_image_valid($image)
        {
            // chỉ dùng vs ảnh jpg,.....
            $allowedExtensions = ['jpg', 'jpeg', 'png'];

            // Lấy thông tin về file
            $pathInfo = pathinfo($image);

            // Kiểm tra phần mở rộng của file
            $extension = strtolower($pathInfo['extension']);

            return in_array($extension, $allowedExtensions);
        }
    }
//tạo đối tượng basemodel
    $BaseModel = new BaseModel();
?>