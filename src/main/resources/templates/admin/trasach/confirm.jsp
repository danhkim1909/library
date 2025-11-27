<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">

<head>
    <title>Chụp Ảnh Webcam - Otika Admin</title>
    <style>
        #camera-stream, #canvas, #photo-preview {
            width: 100%;
            max-width: 640px;
            height: auto;
            border-radius: 8px;
            border: 2px solid #ddd;
        }
        .hidden { display: none; }
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
                        <div class="card-body text-center">
                            
                            <div class="mb-3">
                                <video id="camera-stream" autoplay playsinline></video>
                                <canvas id="canvas" class="hidden"></canvas>
                                <img id="photo-preview" class="hidden" alt="Ảnh vừa chụp">
                            </div>

                            <div class="mb-4">
                                <button type="button" id="btn-start" class="btn btn-primary">Bật Camera</button>
                                <button type="button" id="btn-capture" class="btn btn-warning hidden">Chụp Ảnh</button>
                                <button type="button" id="btn-retake" class="btn btn-secondary hidden">Chụp Lại</button>
                            </div>

                            <form method="POST" th:action="@{/admin/trasach/{id}(id=${muonSach.maMuonSach})}" id="upload-form">
                                
                                <input type="hidden" name="imageBase64" id="input-image-base64" required>
                                
                                <div class="form-group">
                                    <button type="submit" id="btn-submit" class="btn btn-success" disabled>Xác nhận</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function() {
                
                const video = document.getElementById('camera-stream');
                const canvas = document.getElementById('canvas');
                const photoPreview = document.getElementById('photo-preview');
                const inputBase64 = document.getElementById('input-image-base64');
                
                const btnStart = document.getElementById('btn-start');
                const btnCapture = document.getElementById('btn-capture');
                const btnRetake = document.getElementById('btn-retake');
                const btnSubmit = document.getElementById('btn-submit');
                
                let streamReference = null; 

                btnStart.addEventListener('click', async function() {
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

                btnCapture.addEventListener('click', function() {
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


                btnRetake.addEventListener('click', function() {
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