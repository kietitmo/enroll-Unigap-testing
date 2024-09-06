-- Assuming your 2 tables contain a huge amount of data and each join will take about 30 hours,while you need to do daily report, what is your solution?

-- Đối với câu số 5, theo cách hiểu của tôi là dữ liệu mới hằng ngày trong 2 bảng sẽ mất khoảng 30 giờ để join, giải pháp đưa ra là gì?

-- trả lời câu 5:
    -- Phương án tôi đưa ra là:
    -- Đánh chỉ mục (index) cột khóa chính để tăng hiệu suất 
    -- nếu vẫn không đảm bảo thì có phương án khác là Denormalization dữ thiệu hằng ngày thành 1 bảng trong data warehouse  để tránh phải join.