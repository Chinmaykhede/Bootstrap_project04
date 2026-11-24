<%@page import="in.co.rays.proj4.controller.MarksheetCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.proj4.bean.MarksheetBean"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Marksheet List</title>
<style type="text/css">
.btn-outline-teal {
    color: #0D9488 !important;
    border: 1px solid #0D9488 !important;
    background-color: transparent !important;
}

.btn-outline-teal:hover {
    color: #ffffff !important;
    background-color: #0D9488 !important;
    border-color: #0D9488 !important;
    color: white;
}
</style>
</head>
<body>

    <%
    String succ = ServletUtility.getSuccessMessage(request);
    String error = ServletUtility.getErrorMessage(request);
    List<MarksheetBean> list = ServletUtility.getList(request);
    int pageNo = ServletUtility.getPageNo(request);
    int pageSize = ServletUtility.getPageSize(request);
    int index = (pageNo - 1) * pageSize + 1;
    Iterator<MarksheetBean> it = list.iterator();
    %>

    <%@include file="Header.jsp"%>

    <!-- Main Container -->
    <div align="center" class="container-fluid px-3 pb-5 mb-5">

        <div class="row justify-content-center">
            <div class="col-12 col-lg-10 col-xl-9">

                <!-- Heading -->
                <h1 class="display-6 fw-bold  m-0 mb-3 text-start" style="color:#0D9488">
                    Marksheet List
                </h1>

                <!-- Success Message -->
                <%
                if (succ != null && !succ.trim().equals("")) {
                %>
                <div class="alert alert-success alert-dismissible fade show shadow-sm border-0 py-2 mb-3"
                    role="alert">
                    <div class="fw-medium"><%=succ%></div>
                </div>
                <%
                }
                %>

                <!-- Error Message -->
                <%
                if (error != null && !error.trim().equals("")) {
                %>
                <div class="alert alert-danger alert-dismissible fade show shadow-sm border-0 py-2 mb-3"
                    role="alert">
                    <div class="fw-medium"><%=error%></div>
                </div>
                <%
                }
                %>
                
                <div class="d-flex gap-2 justify-content-end">
			<a href="<%=ORSView.MARKSHEET_REPORT_CTL%>" target="_blank"
				class="btn btn-sm btn-warning fw-semibold"> <i
				class="bi bi-file-earmark-pdf me-1"></i> Print PDF
			</a> <a href="<%=ORSView.MARKSHEET_REPORT_CTL%>?type=doc" target="_blank"
				class="btn btn-sm btn-info fw-semibold"> <i
				class="bi bi-file-earmark-word me-1"></i> Print DOC
			</a>

		</div>
                

                <form action="<%=ORSView.MARKSHEET_LIST_CTL%>" method="post">

                    <!-- Compact Search Box -->
                    <div class="bg-white  rounded-3 p-3 shadow-sm mb-3" style="border:1px solid #0D9488">

                        <div class="row g-2 align-items-end">

                            <div class="col-12 col-md-6 col-lg-4 text-start">

                                <label class="form-label small fw-semibold  mb-1"style="color: #0D9488">
                                    Roll No.
                                </label>

                                <input type="number" name="rollNo"
                                    class="form-control"
                                    placeholder="search by roll no" value="">

                            </div>

                            <div class="col-12 col-md-6 col-lg-4 text-start">

                                <label class="form-label small fw-semibold  mb-1" style="color: #0D9488">
                                    Name
                                </label>

                                <input type="text" name="name" value=""
                                    class="form-control"
                                    placeholder="search by name">

                            </div>

                            <div class="col-12 col-md-auto">

                                <input type="submit" name="operation"
                                    value="<%=MarksheetCtl.OP_SEARCH%>"
                                    class="btn  px-4 shadow-sm text-white"
                                    style="background-color: #0D9488"
                                    >

                            </div>

                        </div>
                    </div>

                    <!-- Marksheet Table -->
                    <div class="bg-white border rounded-3 shadow-sm overflow-hidden mb-3 table-responsive">

                        <table class="table table-hover align-middle text-center mb-0">

                            <thead class="text-primary-emphasis border-bottom" style="background-color:#0cd8c6">

                                <tr>

                                    <th class="py-2" style="width: 130px;">

                                        <div class="form-check d-flex justify-content-center align-items-center gap-2 mb-0">

                                            <input class="form-check-input mt-0 shadow-none border-primary"
                                                type="checkbox"
                                                onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">

                                            <label class="form-check-label small fw-bold">
                                                Select All
                                            </label>

                                        </div>

                                    </th>

                                    <th class="py-2" style="width: 80px;">S No.</th>

                                    <th class="py-2">Roll No.</th>

                                   <!--  <th class="py-2">Student Id</th> -->

                                    <th class="py-2">Name</th>

                                    <th class="py-2">Physics</th>

                                    <th class="py-2">Chemistry</th>

                                    <th class="py-2">Maths</th>

                                    <th class="py-2" style="width: 90px;">Edit</th>

                                </tr>

                            </thead>

                            <%
                            while (it.hasNext()) {
                                MarksheetBean bean = it.next();
                            %>

                            <tr align="center">

                                <td>
                                    <input type="checkbox" name="ids"
                                        class="form-check-input shadow-none border-primary-subtle"
                                        value="<%=bean.getId()%>">
                                </td>

                                <td class="text-secondary fw-semibold">
                                    <%=index++%>
                                </td>

                                <td class="text-secondary fw-semibold">
                                    <%=bean.getRollNo()%>
                                </td>

                               <%--  <td class="text-secondary">
                                    <%=bean.getStudentId()%>
                                </td> --%>

                                <td class="fw-bold text-dark">
                                    <%=bean.getName()%>
                                </td>

                                <td class="text-secondary">
                                    <%=bean.getPhysics()%>
                                </td>

                                <td class="text-secondary">
                                    <%=bean.getChemistry()%>
                                </td>

                                <td class="text-secondary">
                                    <%=bean.getMaths()%>
                                </td>

                                <td>

                                    <a class="btn btn-outline-teal btn-sm px-3 rounded-pill fw-medium"
                                        href="<%=ORSView.MARKSHEET_CTL + "?id=" + bean.getId()%>">
                                        Edit
                                    </a>

                                </td>

                            </tr>

                            <%
                            }
                            %>


                        </table>
                            <%@include file="ListFooter.jsp"%>

                    </div>

                </form>

            </div>
        </div>

    </div>

    <%@include file="Footer.jsp"%>

</body>
</html>