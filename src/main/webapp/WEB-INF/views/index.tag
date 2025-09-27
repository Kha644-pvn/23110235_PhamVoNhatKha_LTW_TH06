<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>GraphQL Shop - Trang chủ</title>

    <!-- Google Fonts + Bootstrap Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #a1c4fd, #c2e9fb);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .home-card {
            background: #fff;
            width: 420px;
            padding: 40px 30px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            animation: fadeIn 0.7s ease-in-out;
        }
        h2 {
            margin-bottom: 20px;
            font-weight: 700;
            color: #333;
        }
        p {
            color: #555;
            margin-bottom: 28px;
        }
        .btn-group a {
            display: inline-block;
            margin: 6px;
            padding: 12px 22px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 15px;
            text-decoration: none;
            color: #fff;
            transition: all 0.3s ease;
        }
        .btn-login {
            background: #6c63ff;
        }
        .btn-login:hover {
            background: #574bff;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(108,99,255,0.3);
        }
        .btn-register {
            background: #00c6ff;
        }
        .btn-register:hover {
            background: #00a8e8;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0,198,255,0.3);
        }
        .btn-products {
            background: #34c759;
        }
        .btn-products:hover {
            background: #28a745;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(52,199,89,0.3);
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .icon {
            font-size: 48px;
            color: #6c63ff;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
    <div class="home-card">
        <i class="bi bi-shop icon"></i>
        <h2>Chào mừng đến với GraphQL Shop</h2>
        <p>Khám phá sản phẩm, đăng ký tài khoản hoặc đăng nhập để quản lý giỏ hàng của bạn.</p>

        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/login" class="btn-login">
                <i class="bi bi-box-arrow-in-right"></i> Đăng nhập
            </a>
            <a href="${pageContext.request.contextPath}/register" class="btn-register">
                <i class="bi bi-person-plus"></i> Đăng ký
            </a>
            <a href="${pageContext.request.contextPath}/ui/products" class="btn-products">
                <i class="bi bi-bag-check"></i> Sản phẩm
            </a>
        </div>
    </div>
</body>
</html>
