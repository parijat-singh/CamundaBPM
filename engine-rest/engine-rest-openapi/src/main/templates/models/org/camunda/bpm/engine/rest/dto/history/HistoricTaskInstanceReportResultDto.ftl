<#macro dto_macro docsUrl="">
<@lib.dto >

  protected Long count;
  protected String processDefinitionKey;
  protected String processDefinitionId;
  protected String processDefinitionName;
  protected String taskName;
  protected String tenantId;
  <@lib.property
    name = "taskName"
    type = "string"
    desc = "The process instance id of the root process instance that initiated the process
              containing this task."
    last = true
  />

</@lib.dto>
</#macro>