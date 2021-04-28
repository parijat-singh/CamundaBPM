<#macro endpoint_macro docsUrl="">
{
  <@lib.endpointInfo
      id = "queryHistoricTaskInstances"
      tag = "Historic Task Instance"
      summary = "Get Tasks (Historic) (POST)"
      desc = "Queries for historic tasks that fulfill the given parameters. This method is slightly more powerful
              than the [Get Tasks (Historic)](${docsUrl}/reference/rest/history/task/get-task-query/) method because
              it allows filtering by multiple process or task variables of types `String`, `Number` or `Boolean`.
              The size of the result set can be retrieved by using the
              [Get Task Count (POST)](${docsUrl}/reference/rest/history/task/post-task-query-count/)
              method."
  />

  "parameters" : [

    <#assign last = true >
    <#include "/lib/commons/pagination-params.ftl">

  ],

  <@lib.requestBody
      mediaType = "application/json"
      dto = "HistoricTaskInstanceQueryDto"
      examples = ['"example-1": {
                     "summary": "POST `/history/task`",
                     "value": {
                       "taskVariables": [
                         {
                           "name": "varName",
                           "value": "varValue",
                           "operator": "eq"
                         },
                         {
                           "name": "anotherVarName",
                           "value": 30,
                           "operator": "neq"
                         }
                       ],
                       "priority": 10,
                       "sorting": [
                         {
                           "sortBy": "priority",
                           "sortOrder": "asc"
                         },
                         {
                           "sortBy": "duration",
                           "sortOrder": "desc"
                         }
                       ]
                     }
                   }']
  />

  "responses": {

    <@lib.response
        code = "200"
        type = "array"
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