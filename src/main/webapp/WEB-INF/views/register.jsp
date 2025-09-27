<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #c9d6ff 0%, #e2e2e2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .register-box {
            width: 400px;
            background: #fff;
            border-radius: 16px;
            padding: 30px 35px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.6s ease-in-out;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 700;
            color: #333;
        }
        label {
            font-weight: 500;
            margin-top: 10px;
        }
        input {
            width: 100%;
            padding: 10px 12px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: 0.3s;
        }
        input:focus {
            border-color: #4e73df;
            box-shadow: 0 0 0 2px rgba(78,115,223,0.2);
        }
        button {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            border: none;
            background: linear-gradient(135deg, #4e73df, #1cc88a);
            color: #fff;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
            font-weight: 600;
        }
        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        p {
            text-align: center;
            margin-top: 15px;
            color: #555;
        }
        a {
            text-decoration: none;
            color: #4e73df;
            font-weight: 500;
        }
        a:hover {
            text-decoration: underline;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px);}
            to { opacity: 1; transform: translateY(0);}
        }
    </style>
</head>

<body>
<div class="register-box">
    <h2><i class="bi bi-person-plus"></i> Đăng ký</h2>

    <form method="post" action="${pageContext.request.contextPath}/register">
        <label><i class="bi bi-person"></i> Họ tên</label>
        <input name="fullname" required/>

        <label><i class="bi bi-envelope"></i> Email</label>
        <input name="email" type="email" required/>

        <label><i class="bi bi-lock"></i> Mật khẩu</label>
        <input name="password" type="password" required/>

        <label><i class="bi bi-telephone"></i> Số điện thoại</label>
        <input name="phone"/>

        <button type="submit"><i class="bi bi-check-circle"></i> Tạo tài khoản</button>
    </form>

    <p>Đã có tài khoản?
        <a href="${pageContext.request.contextPath}/login"><i class="bi bi-box-arrow-in-right"></i> Đăng nhập</a>
    </p>
</div>
</body>
</html>
