<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/layout}">

<head>
    <title>Otika - Admin Dashboard Template</title>
</head>

<body>

    <section class="section" layout:fragment="content">
        <div class="section-body">
            <div class="row">
                <div class="col-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Thể Loại</h4>
                        </div>
                        <div class="card-body">
                            <a th:href="@{/admin/theloai/create}" class="section-title mt-0 btn btn-outline-success">Thêm thể loại</a>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">STT</th>
                                        <th scope="col">Tên Thể Loại</th>
                                        <th class="col-6" scope="col">Mô Tả</th>
                                        <th scope="col">Bí Danh</th>
                                        <th scope="col">Hành Động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr th:each="theloai, i : ${theLoais}">
                                        <th scope="row" th:text="${i.count}">1</th>
                                        <td th:text="${theloai.tenTheLoai}">Mark</td>
                                        <td th:text="${theloai.moTa}">Otto</td>
                                        <td th:text="${theloai.biDanh}">@mdo</td>
                                        <td>
                                            <a th:href="@{/admin/theloai/update/{id}(id = ${theloai.maTheLoai})}" class="btn btn-outline-info">Sửa</a>
                                            <a th:href="@{/admin/theloai/show/{id}(id = ${theloai.maTheLoai})}" th:class="${theloai.hien ? 'btn btn-outline-warning' : 'btn btn-outline-danger'}">
                                                <i th:class="${theloai.hien ? 'fa fa-eye' : 'fa fa-eye-slash'}" aria-hidden="true"></i>
                                                <span th:text="${theloai.hien ? 'Đang hiện' : 'Đã ẩn'}">Ẩn</span>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <div class="settingSidebar">
        <a href="javascript:void(0)" class="settingPanelToggle"> 
            <i class="fa fa-spin fa-cog"></i>
        </a>
        <div class="settingSidebar-body ps-container ps-theme-default">
            <div class=" fade show active">
                <div class="setting-panel-header">Setting Panel</div>
                <div class="p-15 border-bottom">
                    <h6 class="font-medium m-b-10">Select Layout</h6>
                    <div class="selectgroup layout-color w-50">
                        <label class="selectgroup-item"> 
                            <input type="radio" name="value" value="1" class="selectgroup-input-radio select-layout" checked> 
                            <span class="selectgroup-button">Light</span>
                        </label> 
                        <label class="selectgroup-item"> 
                            <input type="radio" name="value" value="2" class="selectgroup-input-radio select-layout"> 
                            <span class="selectgroup-button">Dark</span>
                        </label>
                    </div>
                </div>
                <div class="p-15 border-bottom">
                    <h6 class="font-medium m-b-10">Sidebar Color</h6>
                    <div class="selectgroup selectgroup-pills sidebar-color">
                        <label class="selectgroup-item"> 
                            <input type="radio" name="icon-input" value="1" class="selectgroup-input select-sidebar"> 
                            <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip" data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                        </label> 
                        <label class="selectgroup-item"> 
                            <input type="radio" name="icon-input" value="2" class="selectgroup-input select-sidebar" checked> 
                            <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip" data-original-title="Dark Sidebar"><i class="fas fa-moon"></i></span>
                        </label>
                    </div>
                </div>
                <div class="p-15 border-bottom">
                    <h6 class="font-medium m-b-10">Color Theme</h6>
                    <div class="theme-setting-options">
                        <ul class="choose-theme list-unstyled mb-0">
                            <li title="white" class="active">
                                <div class="white"></div>
                            </li>
                            <li title="cyan">
                                <div class="cyan"></div>
                            </li>
                            <li title="black">
                                <div class="black"></div>
                            </li>
                            <li title="purple">
                                <div class="purple"></div>
                            </li>
                            <li title="orange">
                                <div class="orange"></div>
                            </li>
                            <li title="green">
                                <div class="green"></div>
                            </li>
                            <li title="red">
                                <div class="red"></div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="p-15 border-bottom">
                    <div class="theme-setting-options">
                        <label class="m-b-0"> 
                            <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input" id="mini_sidebar_setting"> 
                            <span class="custom-switch-indicator"></span> 
                            <span class="control-label p-l-10">Mini Sidebar</span>
                        </label>
                    </div>
                </div>
                <div class="p-15 border-bottom">
                    <div class="theme-setting-options">
                        <label class="m-b-0"> 
                            <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input" id="sticky_header_setting"> 
                            <span class="custom-switch-indicator"></span> 
                            <span class="control-label p-l-10">Sticky Header</span>
                        </label>
                    </div>
                </div>
                <div class="mt-4 mb-4 p-3 align-center rt-sidebar-last-ele">
                    <a href="#" class="btn btn-icon icon-left btn-primary btn-restore-theme">
                        <i class="fas fa-undo"></i> Restore Default
                    </a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>