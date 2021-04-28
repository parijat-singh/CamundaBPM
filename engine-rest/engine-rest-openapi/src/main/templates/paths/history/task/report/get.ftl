<#-- Generated From File: camunda-docs-manual/public/reference/rest/history/task/get-task-report/index.html -->
<#macro endpoint_macro docsUrl="">
{
  <#assign dateFormatDescription = "By [default](${docsUrl}/reference/rest/overview/date-format/),
                                    the date must have the format `yyyy-MM-dd'T'HH:mm:ss.SSSZ`,
                                    e.g., `2013-01-23T14:42:45.000+0200`." />
  <@lib.endpointInfo
      id = "getHistoricTaskInstanceReport"
      tag = "Historic Task Instance"
      summary = "Get Task Report (Historic)"
      desc = "Retrieves a report of completed tasks. When the report type is set to `count`, the
              report contains a list of completed task counts where an entry contains the task name, the
              definition key of the task, the process definition id, the process definition key, the process
              definition name and the count of how many tasks were completed for the specified key in a given
              period. When the report type is set to `duration`, the report contains a minimum, maximum and
              average duration value of all completed task instances in a given period."
  />

  "parameters" : [

      <@lib.parameter
          name = "reportType"
          location = "query"
          type = "string"
          desc = "**Mandatory.** Specifies the kind of the report to execute. To retrieve a report
                  about the duration of process instances the value must be set to `duration`. For a
                  report of the completed tasks in a specific timespan the value must be set to `count`."
      />

      <@lib.parameter
          name = "periodUnit"
          location = "query"
          type = "string"
          enumValues = [ "month", "quarter" ]
          desc = "When the report type is set to `duration`, this parameter is **mandatory**.
                  Specifies the granularity of the report. Valid values are `month` and `quarter`."
      />

      <@lib.parameter
          name = "completedBefore"
          location = "query"
          type = "string"
          format = "date-time"
          desc = "Restrict to tasks that were completed before the given date. ${dateFormatDescription}"
      />

      <@lib.parameter
          name = "completedAfter"
          location = "query"
          type = "string"
          format = "date-time"
          desc = "Restrict to tasks that were completed after the given date. ${dateFormatDescription}"
      />

      <@lib.parameter
          name = "groupBy"
          location = "query"
          type = "string"
          desc = "When the report type is set to `count`, this parameter is **mandatory**. Groups the
                  tasks report by a given criterion. Valid values are `taskName` and `processDefinition`."
          last = true
      />

  ],

  "responses": {

    <@lib.response
        code = "200"
        type = "array"
        dto = "HistoricTaskInstanceReportResultDto"
        desc = "Request successful."
    />

    <@lib.response
        code = "400"
        dto = "ExceptionDto"
        desc = "Returned if some of the query parameters are invalid, for example if a `completedAfter`
                parameter is supplied, but the date format is wrong. See the
                [Introduction](${docsUrl}/reference/rest/overview/#error-handling)
                for the error response format."
        last = true
    />

  }

}
</#macro>