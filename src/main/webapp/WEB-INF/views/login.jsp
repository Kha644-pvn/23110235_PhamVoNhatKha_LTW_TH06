<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - GraphQL Shop</title>

    <!-- Bootstrap Icons & Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .login-box {
            background: #fff;
            width: 380px;
            padding: 40px 35px;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            animation: fadeIn 0.6s ease-in-out;
        }
        .login-box h2 {
            text-align: center;
            margin-bottom: 24px;
            color: #333;
            font-weight: 700;
        }
        .form-group {
            margin-bottom: 18px;
        }
        label {
            font-weight: 500;
            color: #555;
            display: block;
            margin-bottom: 6px;
        }
        input {
            width: 100%;
            padding: 10px 12px;
            border: 1.5px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.2s, box-shadow 0.2s;
        }
        input:focus {
            outline: none;
            border-color: #6c63ff;
            box-shadow: 0 0 0 2px rgba(108,99,255,0.2);
        }
        button {
            width: 100%;
            background: #6c63ff;
            color: #fff;
            font-size: 15px;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        button:hover {
            background: #574bff;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(108,99,255,0.3);
        }
        .links {
            text-align: center;
            margin-top: 16px;
            font-size: 14px;
        }
        .links a {
            color: #6c63ff;
            text-decoration: none;
            font-weight: 500;
        }
        .links a:hover {
            text-decoration: underline;
        }
        .error {
            color: #ff3b3b;
            background: #ffeaea;
            border-radius: 6px;
            padding: 10px;
            text-align: center;
            font-size: 14px;
            margin-top: 10px;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="login-box">
    <h2><i class="bi bi-box-arrow-in-right"></i> Đăng nhập</h2>

    <form method="post" action="${pageContext.request.contextPath}/login">
        <div class="form-group">
            <label for="email"><i class="bi bi-envelope-fill"></i> Email</label>
            <input id="email" name="email" type="email" required placeholder="Nhập email của bạn">
        </div>

        <div class="form-group">
            <label for="password"><i class="bi bi-lock-fill"></i> Mật khẩu</label>
            <input id="password" name="password" type="password" required placeholder="Nhập mật khẩu">
        </div>

        <button type="submit"><i class="bi bi-arrow-right-circle"></i> Đăng nhập</button>

        <div class="links">
            <p>Chưa có tài khoản?
                <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a>
            </p>
        </div>

        <c:if test="${not empty error}">
            <p class="error"><i class="bi bi-exclamation-triangle-fill"></i> ${error}</p>
        </c:if>
    </form>
</div>

</body>
</html>
