<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .medium_img{
        width:80px;
    }
    .large_img{
        width: 300px;
    }
</style>

<script>
    let item_search = {
        init: function (){
            $('#search_btn').click(function (){
                $('#search_form').attr({
                    method:'get',
                    action:'/item/search'
                });
                $('#search_form').submit();
            });
        }
    };
    $(function (){
        item_search.init();
    })
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Item ALL</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Item ALL</h6>

            <form id="search_form" class="form-inline well">
<%--                <div class="form-group">--%>
<%--                    <label class="control-label col-sm-2" for="price">PRICE</label>--%>
<%--                    <div class="col-sm-10">--%>
<%--                        <input type="number" name="price" class="form-control" id="price" placeholder="Enter price" value="${ms.title}">--%>
<%--                    </div>--%>
<%--                </div>--%>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">NAME:</label>
                    <div class="col-sm-10">
                        <input type="text" name="name" class="form-control" id="name" placeholder="Enter name" value="${is.name}">
                    </div>
                </div>
                &nbsp;&nbsp;
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button id="search_btn" type="button" class="btn btn-info">Search</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>IMGNAME</th>
                        <th>NAME</th>
                        <th>PRICE</th>
                        <th>RDATE</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>IMGNAME</th>
                        <th>NAME</th>
                        <th>PRICE</th>
                        <th>RDATE</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${ilist}">
                        <tr>
                            <td><a href="/item/detail?id=${obj.id}">${obj.id}</a></td>
                            <td>
                                <a href="#" data-toggle="modal" data-target="#target${obj.id}">
                                    <img id="item_img" class="medium_img" src="/uimg/${obj.imgname}">
                                </a>
                            </td>

                            <td>${obj.name}</td>
                            <td><fmt:formatNumber value="${obj.price}" type="currency" pattern="###,###��"/></td>
                            <td><fmt:formatDate value="${obj.rdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                        </tr>

                        <!-- Modal -->
                        <div class="modal fade" id="target${obj.id}" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Detail Image</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${obj.name}</p>
                                        <img src="/uimg/${obj.imgname}" class="large_img" >
                                    </div>

                                    <div class="modal-footer">
                                        <a href="/item/detail?id=${obj.id}" class="btn btn-info" role="button">Detail</a>
                                        <a href="#" class="btn btn-info" data-dismiss="modal" role="button">Close</a>
                                        <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                    </div>
                                </div>
                            </div>
                        </div> <!-- Modal end-->

                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

