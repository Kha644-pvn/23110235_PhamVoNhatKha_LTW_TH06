<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>

    <!-- Bootstrap + Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <style>
        body {
            background: linear-gradient(135deg, #cfd9df, #e2ebf0);
            font-family: 'Roboto', sans-serif;
            min-height: 100vh;
        }
        .container {
            background: #fff;
            border-radius: 14px;
            padding: 30px 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            margin-top: 60px;
            margin-bottom: 60px;
            animation: fadeIn 0.6s ease-in-out;
        }
        h2 {
            text-align: center;
            font-weight: 700;
            margin-bottom: 1rem;
            color: #333;
        }
        h4 {
            color: #444;
            margin-top: 30px;
            font-weight: 600;
        }
        table th, table td {
            vertical-align: middle;
        }
        .btn {
            border-radius: 8px;
            font-weight: 500;
        }
        #catId {
            border-radius: 8px 0 0 8px;
        }
        #btnCat {
            border-radius: 0 8px 8px 0;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px);}
            to { opacity: 1; transform: translateY(0);}
        }
        .table thead {
            background: #f8f9fa;
        }
        .footer {
            margin-top: 2rem;
            text-align: center;
            color: #777;
        }
    </style>
</head>

<body>
<div class="container">

    <h2><i class="bi bi-bag-check"></i> Danh sách sản phẩm</h2>

    <!-- Bảng sản phẩm render từ Model (Spring Controller) -->
    <h4><i class="bi bi-database"></i> Từ Controller (JPA)</h4>
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-light">
            <tr>
                <th style="width:80px;">ID</th>
                <th>Tiêu đề</th>
                <th style="width:120px;">Giá</th>
                <th>Mô tả</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${products}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.title}</td>
                    <td>${p.price}</td>
                    <td>${p.description}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <hr class="my-4"/>

    <!-- AJAX fetch GraphQL để hiển thị danh sách -->
    <h4><i class="bi bi-graph-up"></i> Load sản phẩm qua GraphQL (AJAX)</h4>

    <!-- Nút load toàn bộ -->
    <div class="d-flex flex-wrap gap-2 mb-3">
        <button id="btnLoad" class="btn btn-primary">
            <i class="bi bi-arrow-up"></i> Tải sản phẩm (giá ↑)
        </button>
    </div>

    <!-- Lọc theo Category -->
    <div class="input-group mb-4" style="max-width: 400px;">
        <input id="catId" type="number" class="form-control" placeholder="Nhập Category ID">
        <button id="btnCat" class="btn btn-success">
            <i class="bi bi-funnel"></i> Lọc theo Category
        </button>
    </div>

    <div class="table-responsive">
        <table class="table table-striped align-middle" id="tblGraphql">
            <thead class="table-secondary">
            <tr>
                <th style="width:80px;">ID</th>
                <th>Tiêu đề</th>
                <th style="width:120px;">Giá</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

    <div class="footer">
        <a href="${pageContext.request.contextPath}/" class="text-decoration-none">
            <i class="bi bi-arrow-left-circle"></i> Quay lại trang chủ
        </a>
    </div>
</div>

<!-- ================= AJAX Script ================= -->
<script>
    $(document).ready(function () {

        // Load toàn bộ sản phẩm theo giá tăng dần
        $("#btnLoad").click(function () {
            const query = `
                query {
                    productsSortedByPrice {
                        id
                        title
                        price
                    }
                }
            `;
            $.ajax({
                url: '/graphql',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({query: query}),
                success: function (res) {
                    if (res.errors) {
                        alert("GraphQL Error: " + res.errors[0].message);
                        return;
                    }
                    let rows = "";
                    res.data.productsSortedByPrice.forEach(p => {
                        rows += `<tr>
                                    <td>${p.id}</td>
                                    <td>${p.title}</td>
                                    <td>${p.price}</td>
                                 </tr>`;
                    });
                    $("#tblGraphql tbody").html(rows);
                },
                error: function (xhr) {
                    alert("Lỗi khi load GraphQL: " + xhr.responseText);
                }
            });
        });

        // Lọc sản phẩm theo Category ID
        $("#btnCat").click(function () {
            const id = $("#catId").val();
            if (!id) {
                alert("⚠️ Vui lòng nhập Category ID!");
                return;
            }

            const query = `
              query($cid: ID!) {
                productsByCategory(categoryId: $cid) {
                  id
                  title
                  price
                }
              }
            `;
            $.ajax({
                url: '/graphql',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({query: query, variables: {cid: id}}),
                success: function (res) {
                    if (res.errors) {
                        alert("GraphQL Error: " + res.errors[0].message);
                        return;
                    }
                    let rows = "";
                    res.data.productsByCategory.forEach(p => {
                        rows += `<tr>
                                    <td>${p.id}</td>
                                    <td>${p.title}</td>
                                    <td>${p.price}</td>
                                 </tr>`;
                    });
                    $("#tblGraphql tbody").html(rows);
                },
                error: function (xhr) {
                    alert("Lỗi khi load GraphQL: " + xhr.responseText);
                }
            });
        });
    });
</script>

</body>
</html>
