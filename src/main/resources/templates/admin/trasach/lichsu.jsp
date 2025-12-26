<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử sách đã trả</title>
</head>

<body>
    <section class="section" layout:fragment="content">
        <div class="section-body">
            <div class="row">
                <div class="col-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Những cuốn sách đã trả</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th style="text-align: center;" scope="col">STT</th>
                                        <th style="text-align: center;" scope="col">Tên sách</th>
                                        <th style="text-align: center;" scope="col">Ảnh sách</th>
                                        <th style="text-align: center;" scope="col">Người mượn</th>
                                        <th style="text-align: center;" scope="col">Số lượng mượn</th>
                                        <th style="text-align: center;" scope="col">Ảnh xác nhận</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr th:each="traSach,  i: ${traSachs}">
                                        <th style="text-align: center;" scope="row" th:text="${i.count}">1</th>
                                        <td style="text-align: center;" th:text="${traSach.muonSach.sach.tenSach}">Mark
                                        </td>
                                        <td style="text-align: center;"><img th:src="${traSach.muonSach.sach.anhBia}"
                                                width="80" /></td>
                                        <td style="text-align: center;" th:text="${traSach.muonSach.docGia.tenDocGia}">
                                            @mdo</td>
                                        <td style="text-align: center;" th:text="${traSach.muonSach.soLuong}"></td>
                                        <td style="text-align: center;"> <img th:src="${traSach.anh}" width="100px"
                                                height="200px" style="margin-bottom: 10px;"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

</html>