<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let marker_detail ={
        init:function (){
            $('#update_btn').click(function (){
                marker_detail.send();
            })
            $('#delete_btn').click(function (){
                var c = confirm("삭제하시겠습니까?")
                if(c == true){
                    location.href = "/marker/deleteimpl?id=${gmarker.id}";
                }
            })
        },
        send:function (){
            $('#update_form').attr({
                method: 'post',
                action: '/marker/updateimpl', //기존엔 텍스트형태로 전송했었는데
                enctype: 'multipart/form-data' //파일형태도 전송하겠다. : enctype
            });
            $('#update_form').submit();
        }
    };

    $(function(){
        marker_detail.init();
    });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker Detail</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">${gmarker.id}</h6>

        </div>
        <div class="card-body">
            <div id="container">

                <form id="update_form" class="form-horizontal well">

                    <div class="form-group">
                        <div class="col-sm-10">
                            <img src="/uimg/${gmarker.imgname}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="title">TITLE:</label>
                        <div class="col-sm-10">
                            <input type="text" name="title" class="form-control" id="title" value="${gmarker.title}">
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="target">TARGET:</label>
                        <div class="col-sm-10">
                            <input type="text" name="target" class="form-control" id="target" value="${gmarker.target}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lat">LAT:</label>
                        <div class="col-sm-10">
                            <input type="number" name="lat" class="form-control" id="lat" value="${gmarker.lat}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lng">LNG:</label>
                        <div class="col-sm-10">
                            <input type="number" name="lng" class="form-control" id="lng" value="${gmarker.lng}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="marker_img">IMAGE:</label>
                        <div class="col-sm-10">
                            <input type="file" name="marker_img" class="form-control" id="marker_img" value="${gmarker.img}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="loc">LOC:</label>
                        <div class="col-sm-10">
                            <input type="text" name="loc" class="form-control" id="loc" value="${gmarker.loc}">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="update_btn" type="button" class="btn btn-info">Update</button>
                            <button id="delete_btn" type="button" class="btn btn-info">Delete</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->