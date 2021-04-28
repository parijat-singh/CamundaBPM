<#-- Generated From File: camunda-docs-manual/public/reference/rest/history/task/get-task-query/index.html -->
<#macro endpoint_macro docsUrl="">
{
  <@lib.endpointInfo
      id = "getHistoricTaskInstances"
      tag = "Historic Task Instance"
      summary = "Get Tasks (Historic)"
      desc = "Queries for historic tasks that fulfill the given parameters. The size of the result
              set can be retrieved by using the
              [Get Task Count](${docsUrl}/reference/rest/history/task/get-task-query-count/)
              method."
  />

  "parameters" : [

    <#assign last = false >
    <#assign requestMethod="GET"/>
    <#include "/lib/commons/history-task-instance-query-params.ftl" >
    <@lib.parameters
        object = params
        last = last
    />
    <#include "/lib/commons/sort-params.ftl">
    <#assign last = true >
    <#include "/lib/commons/pagination-params.ftl">

  ],

  "responses": {

    <@lib.response
        code = "200"
        array = true
        dto = "HistoricTaskInstanceDto"
        desc = "Request successful."
    />

    <@lib.response
        code = "400"
        dto = "ExceptionDto"
        desc = "Returned if some of the query parameters are invalid, for example if a `sortOrder`
                parameter is supplied, but no `sortBy`. See the
                [Introduction](${docsUrl}/reference/rest/overview/#error-handling)
                for the error response format."
        last = true
    />

  }

}
</#macro>