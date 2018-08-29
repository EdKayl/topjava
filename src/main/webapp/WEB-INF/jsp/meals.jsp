<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://topjava.javawebinar.ru/functions" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<script type="text/javascript" src="resources/js/datatablesUtil.js" defer></script>
<script type="text/javascript" src="resources/js/mealsDatatables.js" defer></script>
<jsp:include page="fragments/bodyHeader.jsp"/>

<section>
    <h3><spring:message code="meal.title"/></h3>

    <form method="post" action="meals/filter">
        <dl>
            <dt><spring:message code="meal.startDate"/>:</dt>
            <dd><input type="date" name="startDate" value="${param.startDate}"></dd>
        </dl>
        <dl>
            <dt><spring:message code="meal.endDate"/>:</dt>
            <dd><input type="date" name="endDate" value="${param.endDate}"></dd>
        </dl>
        <dl>
            <dt><spring:message code="meal.startTime"/>:</dt>
            <dd><input type="time" name="startTime" value="${param.startTime}"></dd>
        </dl>
        <dl>
            <dt><spring:message code="meal.endTime"/>:</dt>
            <dd><input type="time" name="endTime" value="${param.endTime}"></dd>
        </dl>
        <button type="submit"><spring:message code="meal.filter"/></button>
    </form>
    <hr>
        <button class="btn btn-primary" onclick="add()">
            <span class="fa fa-plus"></span>
            <spring:message code="common.add"/>
        </button>
    <hr>
    <div class="jumbotron">
        <table class="table table-striped" id="datatable">
        <thead>
            <tr>
                <th><spring:message code="meal.dateTime"/></th>
                <th><spring:message code="meal.description"/></th>
                <th><spring:message code="meal.calories"/></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <c:forEach items="${meals}" var="meal">
                <jsp:useBean id="meal" scope="page" type="ru.javawebinar.topjava.to.MealWithExceed"/>
                <tr data-mealExceed="${meal.exceed}" id="${meal.id}">
                    <td>${fn:formatDateTime(meal.dateTime)}</td>
                    <td>${meal.description}</td>
                    <td>${meal.calories}</td>
                    <td><a class="edit"><span class="fa fa-pencil"></span></a></td>
                    <td><a class="delete"><span class="fa fa-remove"></span></a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="modal fade" tabindex="-1" id="editRow">
        <div class="modal-dialog">
            <div class="modal-content">
                <h4 class="modal-title"><spring:message code="user.add"/></h4>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form id="detailsForm">
                        <input type="hidden" id="id" name="id">

                        <div class="form-group">
                            <label for="dateTime" class="col-form-label"><spring:message code="meal.dateTime"/></label>
                            <input type="datetime-local" class="form-control" id="dateTime" name="dateTime"
                                   placeholder="<spring:message code="meal.dateTime"/>">
                        </div>

                        <div class="form-group">
                            <label for="description" class="col-form-label"><spring:message code="meal.description"/></label>
                            <input type="text" class="form-control" id="description" name="description"
                                   placeholder="<spring:message code="meal.description"/>">
                        </div>

                        <div class="form-group">
                            <label for="calories" class="col-form-label"><spring:message code="meal.calories"/></label>
                            <input type="number" class="form-control" id="calories" name="calories"
                            placeholder="<spring:message code="meal.calories"/>">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <span class="fa fa-close"></span>
                        <spring:message code="common.cancel"/>
                    </button>
                    <button type="button" class="btn btn-primary" onclick="save()">
                        <span class="fa fa-check"></span>
                        <spring:message code="common.save"/>
                    </button>
                </div>
            </div>
        </div>
    </div>

</section>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>