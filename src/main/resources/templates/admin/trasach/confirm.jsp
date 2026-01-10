<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">

<head>
    <title>Xác nhận trả sách</title>
    <style>
        #camera-stream,
        #canvas,
        #photo-preview {
            width: 100%;
            max-width: 640px;
            height: auto;
            border-radius: 8px;
            border: 2px solid #ddd;
        }

        .hidden {
            display: none;
        }
    </style>
</head>

<body>

    <section class="section" layout:fragment="content">
        <div class="section-body">
            <div class="row">
                <div class="col-12 col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header">
                            <h4>Chụp ảnh xác thực</h4>
                        </div>
                        <div class="card-body">

                            <div class="mb-3 d-flex justify-content-center">
                                <video id="camera-stream" autoplay playsinline></video>
                                <canvas id="canvas" class="hidden"></canvas>
                                <img id="photo-preview" class="hidden" alt="Ảnh vừa chụp">
                            </div>

                            <div class="mb-4">
                                <div class="d-flex justify-content-center">
                                    <button type="button" id="btn-start" class="btn btn-primary">Bật Camera</button>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <button type="button" id="btn-capture" class="btn btn-warning hidden">Chụp
                                        Ảnh</button>
                                    <button type="button" id="btn-retake" class="btn btn-secondary hidden">Chụp
                                        Lại</button>
                                </div>
                            </div>

                            <form method="POST" th:action="@{/admin/trasach/{id}(id=${muonSach.maMuonSach})}" novalidate
                                id="upload-form" th:object="${xacNhanTraSachDto}">

                                <input type="hidden" name="anh" id="input-image-base64" required>
                                <div class="form-group">
                                    <label>Tiền phạt</label>
                                    <input type="number" th:field="*{tienPhat}"
                                        placeholder="Đơn vị: nghìn VNĐ (Ví dụ, bạn nhập 12, hệ thống ghi nợ 12.000 VNĐ)"
                                        class="form-control">
                                </div>
                                <div th:if="${#fields.hasErrors('tienPhat')}" class="text-danger"
                                    th:errors="*{tienPhat}"></div>
                                <div class="form-group">
                                    <label>Lý do phạt</label>
                                    <input type="text" th:field="*{lyDoPhat}" class="form-control">
                                </div>
                                <div th:if="${#fields.hasErrors('lyDoPhat')}" class="text-danger"
                                    th:errors="*{lyDoPhat}"></div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="daNopPhat" id="daNopPhat">
                                    <label class="form-check-label" for="daNopPhat">
                                        Đã nộp phạt
                                    </label>
                                </div>
                                <div class="form-group">
                                    <button type="submit" id="btn-submit" class="btn btn-success" disabled>Xác
                                        nhận</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {

                const video = document.getElementById('camera-stream');
                const canvas = document.getElementById('canvas');
                const photoPreview = document.getElementById('photo-preview');
                const inputBase64 = document.getElementById('input-image-base64');

                const btnStart = document.getElementById('btn-start');
                const btnCapture = document.getElementById('btn-capture');
                const btnRetake = document.getElementById('btn-retake');
                const btnSubmit = document.getElementById('btn-submit');

                let streamReference = null;

                btnStart.addEventListener('click', async function () {
                    try {
                        streamReference = await navigator.mediaDevices.getUserMedia({ video: true, audio: false });
                        video.srcObject = streamReference;
                        video.classList.remove('hidden');
                        photoPreview.classList.add('hidden');

                        btnStart.classList.add('hidden');
                        btnCapture.classList.remove('hidden');
                        btnRetake.classList.add('hidden');

                    } catch (err) {
                        console.error("Lỗi truy cập camera: ", err);
                        alert("Không thể truy cập Camera. Vui lòng kiểm tra quyền truy cập hoặc kết nối HTTPS.");
                    }
                });

                btnCapture.addEventListener('click', function () {
                    canvas.width = video.videoWidth;
                    canvas.height = video.videoHeight;

                    const context = canvas.getContext('2d');
                    context.drawImage(video, 0, 0, canvas.width, canvas.height);

                    const dataUrl = canvas.toDataURL('image/png');

                    inputBase64.value = dataUrl;

                    photoPreview.src = dataUrl;
                    photoPreview.classList.remove('hidden');
                    video.classList.add('hidden');

                    btnCapture.classList.add('hidden');
                    btnRetake.classList.remove('hidden');
                    btnSubmit.disabled = false;
                });


                btnRetake.addEventListener('click', function () {
                    inputBase64.value = "";
                    photoPreview.classList.add('hidden');
                    video.classList.remove('hidden');

                    btnRetake.classList.add('hidden');
                    btnCapture.classList.remove('hidden');
                    btnSubmit.disabled = true;
                });
            });
        </script>
    </section>
</body>

</html>